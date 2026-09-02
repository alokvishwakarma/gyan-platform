-- GYAN IIT-JEE rebuild Phase 2B
-- 0075_jee_physics_topic_starters.sql
-- Exactly 5 distinct starter questions for each of the 20 new JEE Physics topics.
-- Topic practice may randomize among these. Named Mock/Mini Tests must use fixed mappings.

PRAGMA foreign_keys = ON;

-- UNITS_MEASUREMENTS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_001',
'easy',
'Which SI unit is used for force?',
'joule',
'newton',
'watt',
'pascal',
'B',
'Force is measured in newtons (N).',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='UNITS_MEASUREMENTS'
  AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'UNITS_MEASUREMENTS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_002',
'medium',
'A length is measured as 2.50 m. How many significant figures does it have?',
'2',
'3',
'4',
'5',
'B',
'Trailing zero after a decimal is significant, so 2.50 has 3 significant figures.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='UNITS_MEASUREMENTS'
  AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'UNITS_MEASUREMENTS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_003',
'medium',
'If x = (4.0 ± 0.1) cm, the approximate percentage error is:',
'0.4%',
'2.5%',
'4%',
'10%',
'B',
'Percentage error ≈ (0.1/4.0)×100 = 2.5%.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='UNITS_MEASUREMENTS'
  AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'UNITS_MEASUREMENTS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_004',
'medium',
'The dimensional formula of energy is:',
'MLT^-2',
'ML^2T^-2',
'ML^-1T^-2',
'M^0L^2T^-1',
'B',
'Energy = force × distance, so dimensions are ML^2T^-2.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='UNITS_MEASUREMENTS'
  AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'UNITS_MEASUREMENTS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_005',
'challenge',
'If T = 2π√(l/g), which quantity has dimensions of time?',
'l/g',
'√(l/g)',
'g/l',
'lg',
'B',
'l/g has dimensions T^2, so its square root has dimensions T.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='UNITS_MEASUREMENTS'
  AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'UNITS_MEASUREMENTS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_005';

-- KINEMATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_001',
'easy',
'A car moves at constant speed 20 m/s for 5 s. How far does it travel?',
'4 m',
'25 m',
'100 m',
'400 m',
'C',
'Distance = speed × time = 20×5 = 100 m.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINEMATICS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_002',
'medium',
'A body starts from rest with acceleration 2 m/s² for 4 s. Its final speed is:',
'4 m/s',
'6 m/s',
'8 m/s',
'16 m/s',
'C',
'v = u + at = 0 + 2×4 = 8 m/s.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINEMATICS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_003',
'medium',
'For uniform acceleration, displacement is given by:',
's=ut',
's=ut+1/2 at²',
's=vt',
's=a/t',
'B',
'This is the standard equation of uniformly accelerated motion.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINEMATICS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_004',
'medium',
'A projectile is launched horizontally. Ignoring air resistance, its horizontal acceleration is:',
'g',
'g/2',
'0',
'depends on speed',
'C',
'Gravity acts vertically, so horizontal acceleration is zero.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINEMATICS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_005',
'challenge',
'A particle moves with x=t²+2t (SI units). Its velocity at t=3 s is:',
'6 m/s',
'8 m/s',
'10 m/s',
'12 m/s',
'B',
'v=dx/dt=2t+2, so at t=3, v=8 m/s.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINEMATICS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_005';

-- LAWS_OF_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_001',
'easy',
'Newton''s first law is also called the law of:',
'gravitation',
'inertia',
'momentum',
'energy',
'B',
'Newton''s first law expresses inertia.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'LAWS_OF_MOTION_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_002',
'medium',
'A 5 kg block has acceleration 3 m/s². Net force is:',
'8 N',
'15 N',
'20 N',
'30 N',
'B',
'F=ma=5×3=15 N.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'LAWS_OF_MOTION_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_003',
'medium',
'Action and reaction forces act on:',
'the same body',
'different bodies',
'only moving bodies',
'only rigid bodies',
'B',
'Newton''s third-law pair acts on two different interacting bodies.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'LAWS_OF_MOTION_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_004',
'medium',
'A 10 kg block on a horizontal surface has coefficient of friction 0.2. Taking g=10 m/s², limiting friction is:',
'2 N',
'20 N',
'50 N',
'100 N',
'B',
'f=μN=0.2×100=20 N.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'LAWS_OF_MOTION_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_005',
'challenge',
'Two blocks of 2 kg and 3 kg are pulled together by 10 N on a frictionless surface. Their common acceleration is:',
'1 m/s²',
'2 m/s²',
'3 m/s²',
'5 m/s²',
'B',
'Total mass=5 kg, so a=10/5=2 m/s².',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'LAWS_OF_MOTION_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_005';

-- WORK_ENERGY_POWER
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_001',
'easy',
'Work done by a constant force F along displacement s in the same direction is:',
'F/s',
'Fs',
'F+s',
's/F',
'B',
'W=Fs cos0°=Fs.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'WORK_ENERGY_POWER_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_002',
'medium',
'The kinetic energy of a 2 kg body moving at 3 m/s is:',
'3 J',
'6 J',
'9 J',
'18 J',
'C',
'K=1/2 mv²=1/2×2×9=9 J.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'WORK_ENERGY_POWER_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_003',
'medium',
'A 10 N force moves an object 5 m in its direction. Work done is:',
'2 J',
'15 J',
'50 J',
'500 J',
'C',
'W=Fs=10×5=50 J.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'WORK_ENERGY_POWER_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_004',
'medium',
'Power is defined as:',
'work × time',
'work/time',
'force/time',
'energy × distance',
'B',
'Power is the rate of doing work.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'WORK_ENERGY_POWER_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_005',
'challenge',
'A spring of constant 200 N/m is compressed by 0.10 m. Stored energy is:',
'0.5 J',
'1 J',
'2 J',
'10 J',
'B',
'U=1/2 kx²=0.5×200×0.01=1 J.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'WORK_ENERGY_POWER_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_005';

-- ROTATIONAL_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_001',
'easy',
'The rotational analogue of mass is:',
'torque',
'moment of inertia',
'angular momentum',
'angular speed',
'B',
'Moment of inertia measures resistance to angular acceleration.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ROTATIONAL_MOTION_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_002',
'medium',
'Torque magnitude is given by:',
'rF cosθ',
'rF sinθ',
'F/r',
'r/F',
'B',
'τ=r×F has magnitude rF sinθ.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ROTATIONAL_MOTION_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_003',
'medium',
'For a rigid body rotating about a fixed axis, angular momentum is:',
'I/ω',
'Iω',
'τ/ω',
'mω',
'B',
'L=Iω.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ROTATIONAL_MOTION_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_004',
'medium',
'The moment of inertia of a point mass m at distance r from the axis is:',
'mr',
'mr²',
'm/r',
'm/r²',
'B',
'For a point mass, I=mr².',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ROTATIONAL_MOTION_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_005',
'challenge',
'A disc and ring of equal mass and radius roll without slipping with the same speed. Which has greater total kinetic energy?',
'disc',
'ring',
'same',
'cannot be determined',
'B',
'The ring has larger rotational inertia, so at the same translational speed it has greater total kinetic energy.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ROTATIONAL_MOTION_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_005';

-- GRAVITATION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_001',
'easy',
'The gravitational force between two masses varies inversely as:',
'distance',
'square of distance',
'cube of distance',
'mass product',
'B',
'Newton''s law gives F∝1/r².',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'GRAVITATION_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_002',
'medium',
'Acceleration due to gravity near Earth''s surface is approximately:',
'1 m/s²',
'4.9 m/s²',
'9.8 m/s²',
'98 m/s²',
'C',
'Near Earth''s surface g≈9.8 m/s².',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'GRAVITATION_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_003',
'medium',
'Escape speed from a planet depends on its:',
'mass and radius',
'rotation only',
'atmosphere only',
'temperature only',
'A',
'v_e=√(2GM/R).',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'GRAVITATION_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_004',
'medium',
'For a satellite in circular orbit, gravity provides the:',
'tangential force',
'centripetal force',
'frictional force',
'buoyant force',
'B',
'Gravity acts as the centripetal force.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'GRAVITATION_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_005',
'challenge',
'If Earth''s mass stayed the same but its radius doubled, surface g would become:',
'2g',
'g',
'g/2',
'g/4',
'D',
'g=GM/R², so doubling R makes g one-fourth.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'GRAVITATION_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_005';

-- PROPERTIES_SOLIDS_LIQUIDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_001',
'easy',
'Pressure is force divided by:',
'volume',
'area',
'mass',
'density',
'B',
'P=F/A.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PROPERTIES_SOLIDS_LIQUIDS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_002',
'medium',
'The SI unit of pressure is:',
'newton',
'joule',
'pascal',
'watt',
'C',
'Pressure is measured in pascals (Pa).',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PROPERTIES_SOLIDS_LIQUIDS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_003',
'medium',
'According to Bernoulli''s principle, where fluid speed is higher, pressure is generally:',
'higher',
'lower',
'unchanged',
'zero',
'B',
'Along a streamline at equal height, higher speed corresponds to lower static pressure.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PROPERTIES_SOLIDS_LIQUIDS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_004',
'medium',
'Young''s modulus is the ratio of:',
'strain/stress',
'stress/strain',
'force/area only',
'pressure/volume',
'B',
'Young''s modulus = longitudinal stress / longitudinal strain.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PROPERTIES_SOLIDS_LIQUIDS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_005',
'challenge',
'A liquid rises in a narrow capillary mainly because of:',
'viscosity',
'surface tension',
'gravity alone',
'density alone',
'B',
'Capillary rise results from surface tension and wetting.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PROPERTIES_SOLIDS_LIQUIDS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_005';

-- THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_001',
'easy',
'The zeroth law of thermodynamics establishes the concept of:',
'heat',
'temperature',
'work',
'entropy',
'B',
'Thermal equilibrium defines temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'THERMODYNAMICS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_002',
'medium',
'For an ideal gas, internal energy depends only on:',
'pressure',
'volume',
'temperature',
'density',
'C',
'Ideal-gas internal energy is a function of temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'THERMODYNAMICS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_003',
'medium',
'In an isothermal process for an ideal gas, change in internal energy is:',
'positive',
'negative',
'zero',
'infinite',
'C',
'Temperature is constant, so ideal-gas internal energy does not change.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'THERMODYNAMICS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_004',
'medium',
'The first law of thermodynamics can be written as:',
'ΔQ=ΔU+W',
'ΔQ=W-ΔU',
'ΔU=QW',
'Q=U/W',
'A',
'Heat supplied equals increase in internal energy plus work done by the system.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'THERMODYNAMICS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_005',
'challenge',
'For an adiabatic process of an ideal gas, which quantity is zero?',
'work',
'heat exchanged',
'temperature change',
'pressure change',
'B',
'Adiabatic means no heat exchange, so Q=0.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'THERMODYNAMICS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_005';

-- KINETIC_THEORY_GASES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_001',
'easy',
'Gas pressure in kinetic theory arises from molecular:',
'attraction only',
'collisions with container walls',
'weight only',
'rotation only',
'B',
'Pressure results from molecular impacts on the walls.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_GASES'
  AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINETIC_THEORY_GASES_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_002',
'medium',
'Average translational kinetic energy of an ideal gas molecule is proportional to:',
'pressure only',
'absolute temperature',
'volume only',
'molar mass',
'B',
'Average translational KE is (3/2)kT.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_GASES'
  AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINETIC_THEORY_GASES_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_003',
'medium',
'At the same temperature, H2 and O2 molecules have the same average:',
'speed',
'momentum',
'translational kinetic energy',
'mass',
'C',
'Average translational kinetic energy depends only on temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_GASES'
  AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINETIC_THEORY_GASES_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_004',
'medium',
'Root-mean-square speed varies as:',
'T',
'1/T',
'√T',
'T²',
'C',
'v_rms∝√T.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_GASES'
  AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINETIC_THEORY_GASES_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_005',
'challenge',
'At the same temperature, which gas has greater rms speed?',
'O2',
'N2',
'H2',
'all same',
'C',
'v_rms∝1/√M, so the lightest gas H2 is fastest.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_GASES'
  AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'KINETIC_THEORY_GASES_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_005';

-- OSCILLATIONS_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_001',
'easy',
'In simple harmonic motion, acceleration is proportional to:',
'velocity',
'displacement and opposite in direction',
'time',
'energy',
'B',
'SHM obeys a=-ω²x.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_WAVES'
  AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OSCILLATIONS_WAVES_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_002',
'medium',
'The time period of a simple pendulum for small oscillations is proportional to:',
'√l',
'l',
'1/l',
'l²',
'A',
'T=2π√(l/g).',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_WAVES'
  AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OSCILLATIONS_WAVES_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_003',
'medium',
'Wave speed is equal to:',
'frequency/wavelength',
'frequency × wavelength',
'wavelength/time period squared',
'amplitude × frequency',
'B',
'v=fλ.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_WAVES'
  AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OSCILLATIONS_WAVES_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_004',
'medium',
'If frequency doubles while wave speed stays constant, wavelength becomes:',
'double',
'half',
'four times',
'unchanged',
'B',
'Since v=fλ, doubling f halves λ.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_WAVES'
  AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OSCILLATIONS_WAVES_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_005',
'challenge',
'A mass-spring system has k=100 N/m and m=1 kg. Its angular frequency is:',
'5 rad/s',
'10 rad/s',
'50 rad/s',
'100 rad/s',
'B',
'ω=√(k/m)=√100=10 rad/s.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_WAVES'
  AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OSCILLATIONS_WAVES_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_005';

-- ELECTROSTATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_001',
'easy',
'Coulomb''s force between two point charges varies inversely as:',
'r',
'r²',
'r³',
'√r',
'B',
'Coulomb''s law gives F∝1/r².',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROSTATICS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_002',
'medium',
'Electric field has SI unit:',
'N/C',
'C/N',
'J/C²',
'V·C',
'A',
'Electric field is force per unit positive charge.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROSTATICS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_003',
'medium',
'Electric potential due to a point charge q at distance r is proportional to:',
'q/r',
'qr',
'q/r²',
'q²/r',
'A',
'V=kq/r.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROSTATICS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_004',
'medium',
'Inside a conductor in electrostatic equilibrium, electric field is:',
'maximum',
'zero',
'uniform nonzero',
'infinite',
'B',
'Free charges rearrange until the internal field vanishes.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROSTATICS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_005',
'challenge',
'Two equal positive charges are placed symmetrically about the origin. The electric field at the origin is:',
'zero',
'toward one charge',
'away from both',
'infinite',
'A',
'The two equal and opposite field vectors cancel.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROSTATICS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_005';

-- CURRENT_ELECTRICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_001',
'easy',
'Ohm''s law is:',
'V=IR',
'P=VI',
'Q=It',
'R=ρL',
'A',
'Ohm''s law relates voltage, current and resistance: V=IR.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CURRENT_ELECTRICITY_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_002',
'medium',
'Two resistors 2 Ω and 3 Ω in series have equivalent resistance:',
'1.2 Ω',
'5 Ω',
'6 Ω',
'2.5 Ω',
'B',
'Series resistances add: 2+3=5 Ω.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CURRENT_ELECTRICITY_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_003',
'medium',
'Two 6 Ω resistors in parallel have equivalent resistance:',
'3 Ω',
'6 Ω',
'12 Ω',
'36 Ω',
'A',
'For equal resistors in parallel, R_eq=R/2=3 Ω.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CURRENT_ELECTRICITY_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_004',
'medium',
'Electrical power can be written as:',
'VI',
'V/I',
'I/V',
'Q/t only',
'A',
'Power delivered electrically is P=VI.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CURRENT_ELECTRICITY_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_005',
'challenge',
'A 12 V battery is connected across 4 Ω. Current is:',
'2 A',
'3 A',
'4 A',
'48 A',
'B',
'I=V/R=12/4=3 A.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CURRENT_ELECTRICITY_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_005';

-- MAGNETIC_EFFECTS_MAGNETISM
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_001',
'easy',
'The SI unit of magnetic field is:',
'tesla',
'weber',
'henry',
'ampere',
'A',
'Magnetic field B is measured in tesla.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'MAGNETIC_EFFECTS_MAGNETISM_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_002',
'medium',
'Magnetic force on a charge q moving with velocity v in field B is maximum when v is:',
'parallel to B',
'antiparallel to B',
'perpendicular to B',
'zero only',
'C',
'F=qvB sinθ is maximum at 90°.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'MAGNETIC_EFFECTS_MAGNETISM_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_003',
'medium',
'A current-carrying straight wire produces magnetic field lines that are:',
'radial',
'circular around the wire',
'parallel to the wire',
'elliptical only',
'B',
'The field forms concentric circles around the wire.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'MAGNETIC_EFFECTS_MAGNETISM_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_004',
'medium',
'The magnetic force on a stationary charge is:',
'qB',
'zero',
'qB²',
'infinite',
'B',
'Magnetic force q(v×B) vanishes when v=0.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'MAGNETIC_EFFECTS_MAGNETISM_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_005',
'challenge',
'A charged particle moving perpendicular to a uniform magnetic field follows a:',
'straight line',
'circle',
'parabola',
'hyperbola',
'B',
'The magnetic force is always perpendicular to velocity and acts as centripetal force.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'MAGNETIC_EFFECTS_MAGNETISM_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_005';

-- EMI_AC
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_001',
'easy',
'Faraday''s law relates induced emf to change in:',
'resistance',
'magnetic flux',
'charge only',
'temperature',
'B',
'Induced emf is proportional to the rate of change of magnetic flux.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EMI_AC'
  AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EMI_AC_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_002',
'medium',
'Lenz''s law determines the:',
'magnitude only',
'direction of induced current',
'resistance',
'capacitance',
'B',
'Lenz''s law gives the direction opposing the change in flux.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EMI_AC'
  AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EMI_AC_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_003',
'medium',
'For sinusoidal AC with peak voltage V0, rms voltage is:',
'V0',
'V0/2',
'V0/√2',
'√2 V0',
'C',
'V_rms=V0/√2.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EMI_AC'
  AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EMI_AC_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_004',
'medium',
'A transformer works on the principle of:',
'electrostatic induction',
'mutual induction',
'self-capacitance',
'photoelectric effect',
'B',
'Transformers operate through mutual induction.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EMI_AC'
  AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EMI_AC_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_005',
'challenge',
'An ideal step-up transformer increases voltage while current:',
'also increases',
'decreases',
'remains same',
'becomes zero',
'B',
'For ideal power conservation, increasing voltage requires decreasing current.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EMI_AC'
  AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EMI_AC_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_005';

-- ELECTROMAGNETIC_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_001',
'easy',
'Electromagnetic waves can travel through:',
'vacuum',
'only solids',
'only liquids',
'only gases',
'A',
'EM waves do not require a material medium.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROMAGNETIC_WAVES_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_002',
'medium',
'In an electromagnetic wave, electric and magnetic fields are:',
'parallel',
'perpendicular to each other',
'opposite but collinear',
'random',
'B',
'E and B are mutually perpendicular and also perpendicular to propagation.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROMAGNETIC_WAVES_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_003',
'medium',
'The speed of electromagnetic waves in vacuum is approximately:',
'3×10^6 m/s',
'3×10^8 m/s',
'3×10^10 m/s',
'9.8 m/s',
'B',
'All EM waves travel in vacuum at c≈3×10^8 m/s.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROMAGNETIC_WAVES_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_004',
'medium',
'Which has the highest frequency?',
'radio waves',
'microwaves',
'visible light',
'gamma rays',
'D',
'Gamma rays have the highest frequency among these.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROMAGNETIC_WAVES_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_005',
'challenge',
'If an EM wave has frequency 6×10^14 Hz in vacuum, its wavelength is about:',
'5×10^-7 m',
'5×10^-5 m',
'2×10^6 m',
'2×10^-7 m',
'A',
'λ=c/f=(3×10^8)/(6×10^14)=5×10^-7 m.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTROMAGNETIC_WAVES_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_005';

-- OPTICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_001',
'easy',
'The law of reflection states angle of incidence equals angle of:',
'refraction',
'reflection',
'deviation',
'dispersion',
'B',
'For reflection, i=r.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OPTICS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_002',
'medium',
'A convex lens is generally:',
'diverging',
'converging',
'plane',
'opaque',
'B',
'A convex lens converges parallel rays.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OPTICS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_003',
'medium',
'Refractive index n is given by:',
'v/c',
'c/v',
'cv',
'c+v',
'B',
'n=c/v.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OPTICS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_004',
'medium',
'A real image formed by a convex lens is usually:',
'always erect',
'inverted',
'always virtual',
'same size only',
'B',
'Real images formed by a convex lens are inverted.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OPTICS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_005',
'challenge',
'For a lens with focal length 20 cm, power is:',
'2 D',
'5 D',
'20 D',
'0.2 D',
'B',
'P=1/f(m)=1/0.20=5 D.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OPTICS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_005';

-- DUAL_NATURE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_001',
'easy',
'The photoelectric effect supports the particle nature of:',
'electrons only',
'light',
'protons',
'sound',
'B',
'Photoelectric emission is explained using photons.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'DUAL_NATURE_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_002',
'medium',
'Photon energy is given by:',
'E=mc²',
'E=hν',
'E=qV only',
'E=pv',
'B',
'Photon energy is h times frequency.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'DUAL_NATURE_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_003',
'medium',
'Increasing light intensity above threshold mainly increases the photoelectric:',
'maximum kinetic energy',
'number of emitted electrons',
'work function',
'threshold frequency',
'B',
'Higher intensity means more photons per second, hence more emitted electrons.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'DUAL_NATURE_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_004',
'medium',
'de Broglie wavelength is inversely proportional to:',
'momentum',
'mass only',
'charge',
'time',
'A',
'λ=h/p.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'DUAL_NATURE_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_005',
'challenge',
'If the momentum of a particle doubles, its de Broglie wavelength becomes:',
'double',
'half',
'four times',
'unchanged',
'B',
'Since λ=h/p, doubling p halves λ.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'DUAL_NATURE_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_005';

-- ATOMS_NUCLEI
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_001',
'easy',
'In Bohr''s model of hydrogen, electrons occupy:',
'arbitrary radii',
'quantized orbits',
'the nucleus',
'continuous energy levels',
'B',
'Bohr proposed allowed stationary orbits with quantized energies.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_NUCLEI'
  AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMS_NUCLEI_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_002',
'medium',
'Atomic number equals the number of:',
'neutrons',
'protons',
'nucleons',
'electrons plus neutrons',
'B',
'Atomic number Z is the proton count.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_NUCLEI'
  AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMS_NUCLEI_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_003',
'medium',
'Radioactive decay is characterized by a constant:',
'half-life for a given nuclide',
'mass always',
'temperature only',
'pressure only',
'A',
'Each radioactive nuclide has a characteristic decay constant and half-life.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_NUCLEI'
  AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMS_NUCLEI_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_004',
'medium',
'An alpha particle is a:',
'proton',
'electron',
'helium nucleus',
'photon',
'C',
'An alpha particle contains two protons and two neutrons.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_NUCLEI'
  AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMS_NUCLEI_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_005',
'challenge',
'After two half-lives, the fraction of an undecayed radioactive sample remaining is:',
'1/2',
'1/3',
'1/4',
'1/8',
'C',
'After each half-life the amount halves: (1/2)^2=1/4.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_NUCLEI'
  AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMS_NUCLEI_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_005';

-- ELECTRONIC_DEVICES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_001',
'easy',
'A semiconductor diode primarily allows current to flow:',
'equally both ways',
'mainly in one direction',
'only at zero voltage',
'only through vacuum',
'B',
'A p-n junction diode conducts strongly in forward bias and weakly in reverse bias.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTRONIC_DEVICES_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_002',
'medium',
'In forward bias of a p-n diode, the depletion region generally:',
'widens',
'narrows',
'stays infinite',
'disappears regardless of voltage',
'B',
'Forward bias lowers the barrier and narrows the depletion region.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTRONIC_DEVICES_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_003',
'medium',
'An LED emits light when it is:',
'reverse biased strongly',
'forward biased',
'unbiased only',
'cooled to 0 K',
'B',
'LEDs emit light during forward-biased carrier recombination.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTRONIC_DEVICES_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_004',
'medium',
'A transistor can be used as an:',
'amplifier',
'insulator only',
'mechanical switch only',
'capacitor only',
'A',
'Transistors are widely used for amplification and switching.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTRONIC_DEVICES_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_005',
'challenge',
'For an ideal NOT gate, if input is 1, output is:',
'0',
'1',
'2',
'undefined',
'A',
'A NOT gate outputs the logical complement of its input.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ELECTRONIC_DEVICES_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_005';

-- EXPERIMENTAL_SKILLS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_001',
'easy',
'A vernier caliper is commonly used to measure:',
'electric current',
'small lengths and diameters',
'temperature only',
'mass only',
'B',
'Vernier calipers measure small lengths, diameters and depths.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EXPERIMENTAL_SKILLS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_002',
'medium',
'The least count of an instrument is the:',
'largest measurable value',
'smallest reliably measurable increment',
'average reading',
'zero error',
'B',
'Least count is the smallest division/resolution the instrument can measure.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EXPERIMENTAL_SKILLS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_003',
'medium',
'To reduce random error, one should generally:',
'take repeated readings and average them',
'use one reading only',
'ignore units',
'round before measuring',
'A',
'Repeated measurements and averaging reduce random fluctuations.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EXPERIMENTAL_SKILLS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_004',
'medium',
'A graph of measured y versus x is linear. The slope is found from:',
'Δx/Δy',
'Δy/Δx',
'xy',
'x+y',
'B',
'Slope is change in y divided by change in x.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EXPERIMENTAL_SKILLS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_005',
'challenge',
'If a screw gauge has pitch 1 mm and 100 circular-scale divisions, its least count is:',
'1 mm',
'0.1 mm',
'0.01 mm',
'0.001 mm',
'C',
'Least count=pitch/divisions=1/100 mm=0.01 mm.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EXPERIMENTAL_SKILLS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_005';
