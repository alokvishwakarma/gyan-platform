-- 0118_neet_quality_test_1.sql
-- GYAN NEET Quality Test 1
--
-- NEET structure:
--   Physics   : 45 questions
--   Chemistry : 45 questions
--   Biology   : 90 questions
--   Total     : 180 questions / 720 marks
--
-- Marking:
--   +4 correct, -1 incorrect, 0 unanswered
--
-- Quality strategy:
--   * Reuse all 70 existing active NEET_2026 starter questions.
--   * Add 110 dedicated Quality Test 1 questions.
--   * Difficulty balance: 45 easy / 90 medium / 45 challenge.
--   * All questions are single-choice MCQ.
--   * Existing practice-bank questions remain untouched.
--
-- Order:
--   1-45   Physics
--   46-90  Chemistry
--   91-180 Biology

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('NEET','FULL','TEST_1','Test 1','NEET',1,'OPEN',1);

UPDATE education_mock_tests
SET test_name='Test 1',
    access_mode='OPEN',
    published=0,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='NEET'
  AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='NEET'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='NEET'
    AND version=1
);


-- 001. PHYSICS dedicated | medium | PHYSICS_AND_MEASUREMENT
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_001',
  'medium',
  'The dimensional formula of force is:',
  '[MLT^-2]',
  '[ML^2T^-2]',
  '[ML^-1T^-2]',
  '[M^0LT^-1]',
  'A',
  'Force = mass × acceleration.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_1',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_001';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  1,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 002. PHYSICS existing reviewed | easy | KINEMATICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  2,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 003. PHYSICS dedicated | medium | PHYSICS_AND_MEASUREMENT
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_002',
  'medium',
  'If the percentage errors in length and breadth are 2% and 3%, the maximum percentage error in area is:',
  '1%',
  '5%',
  '6%',
  '8%',
  'B',
  'For a product, percentage errors add: 2%+3%=5%.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_3',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_002';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  3,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 004. PHYSICS existing reviewed | easy | KINEMATICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  4,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 005. PHYSICS dedicated | easy | KINEMATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_003',
  'easy',
  'A particle moving with constant velocity has acceleration:',
  'zero',
  'constant non-zero',
  'increasing',
  'decreasing',
  'A',
  'Constant velocity means no change in velocity.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_5',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_003';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  5,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 006. PHYSICS existing reviewed | medium | KINEMATICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  6,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 007. PHYSICS dedicated | challenge | KINEMATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_004',
  'challenge',
  'A body is projected vertically upward with speed 20 m/s. Taking g=10 m/s², its maximum height is:',
  '10 m',
  '20 m',
  '30 m',
  '40 m',
  'B',
  'H=u²/(2g)=400/20=20 m.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_7',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_004';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  7,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 008. PHYSICS existing reviewed | medium | KINEMATICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  8,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 009. PHYSICS dedicated | medium | LAWS_OF_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_005',
  'medium',
  'A 10 kg block on a frictionless surface is pulled by a 50 N force. Its acceleration is:',
  '2 m/s²',
  '5 m/s²',
  '10 m/s²',
  '50 m/s²',
  'B',
  'a=F/m=50/10=5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_9',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_005';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  9,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 010. PHYSICS existing reviewed | medium | KINEMATICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  10,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 011. PHYSICS dedicated | challenge | LAWS_OF_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_006',
  'challenge',
  'A 2 kg block rests on a rough horizontal surface with coefficient of friction 0.5. Taking g=10 m/s², the limiting friction is:',
  '5 N',
  '10 N',
  '15 N',
  '20 N',
  'B',
  'f=μN=0.5×20=10 N.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_11',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_006';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  11,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_006'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 012. PHYSICS dedicated | medium | WORK_ENERGY_POWER
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_007',
  'medium',
  'The kinetic energy of a 2 kg body moving at 3 m/s is:',
  '3 J',
  '6 J',
  '9 J',
  '18 J',
  'C',
  'K=½mv²=½×2×9=9 J.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_12',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_007';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  12,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_007'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 013. PHYSICS dedicated | challenge | WORK_ENERGY_POWER
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_008',
  'challenge',
  'A machine does 600 J of work in 3 s. Its power is:',
  '100 W',
  '200 W',
  '300 W',
  '600 W',
  'B',
  'P=W/t=600/3=200 W.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_13',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_008';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  13,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_008'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 014. PHYSICS dedicated | medium | ROTATIONAL_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_009',
  'medium',
  'The moment of inertia of a point mass m at distance r from an axis is:',
  'mr',
  'mr²',
  'm/r',
  'm/r²',
  'B',
  'For a point mass, I=mr².',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_14',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_009';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  14,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_009'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 015. PHYSICS dedicated | challenge | ROTATIONAL_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_010',
  'challenge',
  'For pure rolling without slipping, the relation between linear speed v and angular speed ω is:',
  'v=ω/R',
  'v=ωR',
  'v=ωR²',
  'v=R/ω',
  'B',
  'Pure rolling gives v=ωR.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_15',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_010';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  15,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_010'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 016. PHYSICS dedicated | medium | GRAVITATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_011',
  'medium',
  'The value of g at the centre of Earth is approximately:',
  '0',
  'g/2',
  'g',
  '2g',
  'A',
  'By symmetry, gravitational field is zero at the centre.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_16',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_011';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  16,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_011'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 017. PHYSICS dedicated | challenge | GRAVITATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_012',
  'challenge',
  'Escape speed from a planet is proportional to:',
  '√(GM/R)',
  'GM/R',
  'GM/R²',
  '√(GM/R²)',
  'A',
  've=√(2GM/R), so proportional to √(GM/R).',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_17',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_012';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  17,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_012'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 018. PHYSICS dedicated | medium | PROPERTIES_OF_SOLIDS_LIQUIDS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_013',
  'medium',
  'The SI unit of surface tension is:',
  'N/m',
  'N·m',
  'Pa·s',
  'J/m',
  'A',
  'Surface tension is force per unit length.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_18',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_013';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  18,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_013'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 019. PHYSICS dedicated | challenge | PROPERTIES_OF_SOLIDS_LIQUIDS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_014',
  'challenge',
  'For a liquid flowing steadily through a narrower pipe, its speed generally:',
  'decreases',
  'increases',
  'becomes zero',
  'remains fixed',
  'B',
  'Continuity requires higher speed for smaller area.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_19',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_014';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  19,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_014'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 020. PHYSICS dedicated | easy | THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_015',
  'easy',
  'For an ideal gas in an isothermal process, change in internal energy is:',
  'zero',
  'positive',
  'negative',
  'infinite',
  'A',
  'Ideal-gas internal energy depends only on temperature.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_20',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_015';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  20,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_015'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 021. PHYSICS dedicated | challenge | THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_016',
  'challenge',
  'In an adiabatic process for an ideal gas:',
  'Q=0',
  'W=0',
  'ΔU=0 always',
  'P is constant',
  'A',
  'Adiabatic means no heat exchange.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_21',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_016';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  21,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_016'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 022. PHYSICS dedicated | medium | KINETIC_THEORY_OF_GASES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_017',
  'medium',
  'The rms speed of gas molecules is proportional to:',
  '√T',
  'T',
  '1/T',
  'T²',
  'A',
  'vrms ∝ √T for fixed molar mass.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_22',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_017';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  22,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_017'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 023. PHYSICS dedicated | challenge | KINETIC_THEORY_OF_GASES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_018',
  'challenge',
  'At the same temperature, which gas has the greatest rms speed?',
  'H₂',
  'N₂',
  'O₂',
  'CO₂',
  'A',
  'vrms ∝ 1/√M; H₂ has smallest molar mass.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_23',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_018';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  23,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_018'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 024. PHYSICS dedicated | medium | OSCILLATIONS_AND_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_019',
  'medium',
  'The time period of a simple pendulum is proportional to:',
  '√l',
  'l',
  '1/√l',
  'l²',
  'A',
  'T=2π√(l/g).',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_24',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_019';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  24,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_019'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 025. PHYSICS dedicated | challenge | OSCILLATIONS_AND_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_020',
  'challenge',
  'A wave has frequency 50 Hz and wavelength 2 m. Its speed is:',
  '25 m/s',
  '50 m/s',
  '100 m/s',
  '200 m/s',
  'C',
  'v=fλ=50×2=100 m/s.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_25',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_020';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  25,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_020'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 026. PHYSICS dedicated | easy | ELECTROSTATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_021',
  'easy',
  'The SI unit of electric charge is:',
  'coulomb',
  'volt',
  'ampere',
  'farad',
  'A',
  'Charge is measured in coulombs.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_26',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_021';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  26,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_021'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 027. PHYSICS dedicated | challenge | ELECTROSTATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_022',
  'challenge',
  'Two identical positive charges are moved to twice their separation. The electrostatic force becomes:',
  'four times',
  'twice',
  'half',
  'one-fourth',
  'D',
  'Coulomb force varies as 1/r².',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_27',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_022';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  27,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_022'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 028. PHYSICS dedicated | challenge | CURRENT_ELECTRICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_023',
  'challenge',
  'A 12 V battery is connected across a 6 Ω resistor. Current is:',
  '0.5 A',
  '2 A',
  '6 A',
  '72 A',
  'B',
  'I=V/R=12/6=2 A.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_28',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_023';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  28,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_023'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 029. PHYSICS dedicated | challenge | CURRENT_ELECTRICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_024',
  'challenge',
  'Two 6 Ω resistors in parallel have equivalent resistance:',
  '3 Ω',
  '6 Ω',
  '12 Ω',
  '18 Ω',
  'A',
  'Equal resistors R in parallel give R/2=3 Ω.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_29',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_024';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  29,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_024'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 030. PHYSICS dedicated | medium | MAGNETIC_EFFECTS_AND_MAGNETISM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_025',
  'medium',
  'The magnetic force on a charge moving parallel to a magnetic field is:',
  'zero',
  'maximum',
  'qvB',
  'qB/v',
  'A',
  'F=qvB sinθ and θ=0.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_30',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_025';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  30,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_025'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 031. PHYSICS dedicated | challenge | MAGNETIC_EFFECTS_AND_MAGNETISM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_026',
  'challenge',
  'A charged particle moving perpendicular to a uniform magnetic field follows a:',
  'straight line',
  'circle',
  'parabola',
  'hyperbola',
  'B',
  'Magnetic force acts as centripetal force.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_31',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_026';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  31,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_026'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 032. PHYSICS dedicated | medium | ELECTROMAGNETIC_INDUCTION_AC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_027',
  'medium',
  'According to Faraday''s law, induced emf is related to the rate of change of:',
  'electric charge',
  'magnetic flux',
  'resistance',
  'capacitance',
  'B',
  'Induced emf equals negative rate of change of flux.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_32',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_027';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  32,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_027'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 033. PHYSICS dedicated | challenge | ELECTROMAGNETIC_INDUCTION_AC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_028',
  'challenge',
  'For a pure resistor in AC, current and voltage are:',
  'in phase',
  '90° out of phase',
  '180° out of phase',
  'unrelated',
  'A',
  'In a resistor, current and voltage are in phase.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_33',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_028';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  33,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_028'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 034. PHYSICS dedicated | medium | ELECTROMAGNETIC_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_029',
  'medium',
  'Electromagnetic waves in vacuum travel at approximately:',
  '3×10^8 m/s',
  '3×10^6 m/s',
  '3×10^4 m/s',
  '300 m/s',
  'A',
  'EM waves travel at c≈3×10^8 m/s.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_34',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_029';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  34,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_029'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 035. PHYSICS dedicated | medium | ELECTROMAGNETIC_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_030',
  'medium',
  'Which has the highest frequency?',
  'radio waves',
  'microwaves',
  'visible light',
  'gamma rays',
  'D',
  'Gamma rays occupy the highest-frequency end.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_35',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_030';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  35,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_030'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 036. PHYSICS dedicated | medium | OPTICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_031',
  'medium',
  'The power of a convex lens of focal length 0.5 m is:',
  '+2 D',
  '-2 D',
  '+0.5 D',
  '-0.5 D',
  'A',
  'P=1/f=1/0.5=+2 D.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_36',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_031';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  36,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_031'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 037. PHYSICS dedicated | challenge | OPTICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_032',
  'challenge',
  'In Young''s double-slit experiment, fringe width increases when:',
  'wavelength increases',
  'slit separation increases',
  'screen distance decreases',
  'wavelength decreases',
  'A',
  'β=λD/d.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_37',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_032';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  37,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_032'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 038. PHYSICS dedicated | medium | DUAL_NATURE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_033',
  'medium',
  'Photoelectric emission occurs only if incident light frequency is:',
  'below threshold',
  'at least threshold',
  'zero',
  'independent of threshold',
  'B',
  'Photon energy must meet or exceed work function.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_38',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_033';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  38,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_033'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 039. PHYSICS dedicated | challenge | DUAL_NATURE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_034',
  'challenge',
  'The de Broglie wavelength of a particle is inversely proportional to its:',
  'momentum',
  'charge',
  'mass only',
  'kinetic energy only',
  'A',
  'λ=h/p.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_39',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_034';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  39,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_034'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 040. PHYSICS dedicated | easy | ATOMS_AND_NUCLEI
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_035',
  'easy',
  'Radioactive decay is generally unaffected by:',
  'temperature and pressure',
  'nuclear composition',
  'decay constant',
  'isotope identity',
  'A',
  'Ordinary physical conditions have negligible effect on nuclear decay.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_40',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_035';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  40,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_035'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 041. PHYSICS dedicated | challenge | ATOMS_AND_NUCLEI
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_036',
  'challenge',
  'After three half-lives, the undecayed fraction of a radioactive sample is:',
  '1/2',
  '1/4',
  '1/8',
  '1/16',
  'C',
  'Remaining fraction=(1/2)^3=1/8.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_41',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_036';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  41,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_036'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 042. PHYSICS dedicated | medium | ELECTRONIC_DEVICES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_037',
  'medium',
  'A p-n junction diode conducts strongly in:',
  'forward bias',
  'reverse bias',
  'zero bias only',
  'both biases equally',
  'A',
  'Forward bias lowers the barrier.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_42',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_037';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  42,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_037'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 043. PHYSICS dedicated | challenge | ELECTRONIC_DEVICES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_038',
  'challenge',
  'In an intrinsic semiconductor, electron concentration is:',
  'equal to hole concentration',
  'greater than hole concentration',
  'less than hole concentration',
  'zero',
  'A',
  'Intrinsic carriers are generated in electron-hole pairs.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_43',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_038';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  43,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_038'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 044. PHYSICS dedicated | medium | EXPERIMENTAL_SKILLS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_039',
  'medium',
  'A vernier caliper is especially useful for measuring:',
  'small lengths accurately',
  'temperature',
  'electric current',
  'mass',
  'A',
  'It provides fine length measurement.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_44',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_039';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  44,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_039'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 045. PHYSICS dedicated | challenge | EXPERIMENTAL_SKILLS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_QT1_040',
  'challenge',
  'To reduce random error in repeated measurements, one should generally:',
  'take several readings and average them',
  'use only the first reading',
  'round before measuring',
  'ignore instrument zero error',
  'A',
  'Averaging repeated measurements reduces random fluctuations.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_PHYSICS_45',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_040';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  45,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_QT1_040'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 046. CHEMISTRY dedicated | medium | SOME_BASIC_CONCEPTS_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_001',
  'medium',
  'One mole contains approximately:',
  '6.022×10^23 entities',
  '3.011×10^23 entities',
  '1.0×10^3 entities',
  '22.4 entities',
  'A',
  'Avogadro constant is about 6.022×10^23 mol^-1.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOME_BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code='SOME_BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_1',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_001';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  46,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 047. CHEMISTRY existing reviewed | easy | SOME_BASIC_CONCEPTS_CHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  47,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 048. CHEMISTRY dedicated | medium | SOME_BASIC_CONCEPTS_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_002',
  'medium',
  'The number of moles in 44 g of CO₂ is:',
  '0.5',
  '1',
  '2',
  '44',
  'B',
  'Molar mass of CO₂ is 44 g/mol.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOME_BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code='SOME_BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_3',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_002';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  48,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 049. CHEMISTRY existing reviewed | easy | SOME_BASIC_CONCEPTS_CHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  49,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 050. CHEMISTRY dedicated | medium | ATOMIC_STRUCTURE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_003',
  'medium',
  'Maximum number of electrons in a p subshell is:',
  '2',
  '4',
  '6',
  '10',
  'C',
  'Three p orbitals ×2 electrons each =6.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_5',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_003';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  50,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 051. CHEMISTRY existing reviewed | medium | SOME_BASIC_CONCEPTS_CHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  51,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 052. CHEMISTRY dedicated | challenge | ATOMIC_STRUCTURE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_004',
  'challenge',
  'For n=3, allowed l values are:',
  '0,1,2',
  '1,2,3',
  '0,1,2,3',
  '2 only',
  'A',
  'l ranges from 0 to n-1.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_7',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_004';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  52,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 053. CHEMISTRY existing reviewed | medium | SOME_BASIC_CONCEPTS_CHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  53,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 054. CHEMISTRY dedicated | easy | CHEMICAL_BONDING
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_005',
  'easy',
  'The bond in NaCl is predominantly:',
  'ionic',
  'covalent',
  'metallic',
  'hydrogen',
  'A',
  'Na transfers an electron to Cl.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_9',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_005';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  54,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 055. CHEMISTRY existing reviewed | medium | SOME_BASIC_CONCEPTS_CHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  55,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 056. CHEMISTRY dedicated | challenge | CHEMICAL_BONDING
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_006',
  'challenge',
  'The shape of NH₃ is:',
  'trigonal planar',
  'trigonal pyramidal',
  'tetrahedral',
  'linear',
  'B',
  'One lone pair on nitrogen gives trigonal pyramidal molecular geometry.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_11',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_006';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  56,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_006'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 057. CHEMISTRY existing reviewed | easy | PURIFICATION_ORGANIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  57,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 058. CHEMISTRY dedicated | medium | CHEMICAL_THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_007',
  'medium',
  'For an exothermic reaction, ΔH is generally:',
  'negative',
  'positive',
  'zero always',
  'undefined',
  'A',
  'Heat release corresponds to negative enthalpy change.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_13',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_007';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  58,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_007'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 059. CHEMISTRY existing reviewed | easy | PURIFICATION_ORGANIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  59,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 060. CHEMISTRY dedicated | challenge | CHEMICAL_THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_008',
  'challenge',
  'At constant temperature and pressure, a process is spontaneous when ΔG is:',
  'negative',
  'positive',
  'zero only',
  'equal to ΔH always',
  'A',
  'Spontaneity criterion is ΔG<0.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_15',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_008';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  60,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_008'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 061. CHEMISTRY existing reviewed | medium | PURIFICATION_ORGANIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  61,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 062. CHEMISTRY dedicated | easy | SOLUTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_009',
  'easy',
  'Molarity is moles of solute per:',
  'litre of solution',
  'kg of solvent',
  'litre of solvent',
  'mole of solvent',
  'A',
  'Molarity=Moles/L solution.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_17',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_009';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  62,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_009'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 063. CHEMISTRY existing reviewed | medium | PURIFICATION_ORGANIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  63,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 064. CHEMISTRY dedicated | medium | SOLUTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_010',
  'medium',
  'Adding a nonvolatile solute to a solvent generally causes its vapour pressure to:',
  'decrease',
  'increase',
  'remain unchanged',
  'become zero always',
  'A',
  'Raoult''s law predicts lowering of solvent vapour pressure.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_19',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_010';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  64,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_010'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 065. CHEMISTRY existing reviewed | medium | PURIFICATION_ORGANIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  65,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 066. CHEMISTRY dedicated | medium | EQUILIBRIUM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_011',
  'medium',
  'At equilibrium, forward and reverse reaction rates are:',
  'equal',
  'both zero',
  'forward only',
  'reverse only',
  'A',
  'Dynamic equilibrium has equal rates.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_21',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_011';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  66,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_011'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 067. CHEMISTRY dedicated | challenge | EQUILIBRIUM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_012',
  'challenge',
  'For an acidic solution at 25°C, pH is generally:',
  'less than 7',
  'equal to 7',
  'greater than 7',
  'always zero',
  'A',
  'Acidic aqueous solutions have pH below 7 at 25°C.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_22',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_012';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  67,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_012'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 068. CHEMISTRY dedicated | medium | REDOX_ELECTROCHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_013',
  'medium',
  'Oxidation involves:',
  'loss of electrons',
  'gain of electrons',
  'no electron transfer',
  'only proton gain',
  'A',
  'Oxidation is electron loss.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_23',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_013';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  68,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_013'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 069. CHEMISTRY dedicated | challenge | REDOX_ELECTROCHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_014',
  'challenge',
  'In a galvanic cell, oxidation occurs at the:',
  'anode',
  'cathode',
  'salt bridge',
  'electrolyte only',
  'A',
  'Anode is the site of oxidation.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_24',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_014';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  69,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_014'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 070. CHEMISTRY dedicated | medium | CHEMICAL_KINETICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_015',
  'medium',
  'Increasing temperature usually increases reaction rate because:',
  'more molecules exceed activation energy',
  'activation energy always becomes zero',
  'concentration becomes zero',
  'equilibrium disappears',
  'A',
  'Higher T raises the fraction of molecules with sufficient energy.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_25',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_015';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  70,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_015'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 071. CHEMISTRY dedicated | challenge | CHEMICAL_KINETICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_016',
  'challenge',
  'For a first-order reaction, half-life is:',
  'independent of initial concentration',
  'directly proportional to initial concentration',
  'inversely proportional to square of concentration',
  'zero',
  'A',
  't1/2=0.693/k.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_26',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_016';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  71,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_016'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 072. CHEMISTRY dedicated | easy | CLASSIFICATION_PERIODICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_017',
  'easy',
  'Across a period, atomic radius generally:',
  'decreases',
  'increases',
  'remains constant',
  'first doubles',
  'A',
  'Increasing effective nuclear charge pulls electrons closer.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CLASSIFICATION_PERIODICITY'
  AND st.subtopic_code='CLASSIFICATION_PERIODICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_27',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_017';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  72,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_017'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 073. CHEMISTRY dedicated | medium | CLASSIFICATION_PERIODICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_018',
  'medium',
  'The most electronegative element is:',
  'F',
  'Cl',
  'O',
  'N',
  'A',
  'Fluorine has the highest electronegativity.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CLASSIFICATION_PERIODICITY'
  AND st.subtopic_code='CLASSIFICATION_PERIODICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_28',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_018';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  73,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_018'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 074. CHEMISTRY dedicated | medium | P_BLOCK_ELEMENTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_019',
  'medium',
  'NH₃ acts as a Lewis base because nitrogen has:',
  'a lone pair',
  'a positive charge',
  'an empty p orbital only',
  'no valence electrons',
  'A',
  'The lone pair can be donated.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK_ELEMENTS'
  AND st.subtopic_code='P_BLOCK_ELEMENTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_29',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_019';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  74,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_019'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 075. CHEMISTRY dedicated | challenge | P_BLOCK_ELEMENTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_020',
  'challenge',
  'Which oxide is strongly acidic?',
  'SO₃',
  'Na₂O',
  'MgO',
  'CaO',
  'A',
  'SO₃ is an acidic nonmetal oxide.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK_ELEMENTS'
  AND st.subtopic_code='P_BLOCK_ELEMENTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_30',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_020';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  75,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_020'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 076. CHEMISTRY dedicated | medium | D_F_BLOCK_ELEMENTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_021',
  'medium',
  'Transition metals commonly show variable oxidation states because:',
  'ns and (n-1)d energies are comparable',
  'they have no d electrons',
  'all electrons are paired',
  'they are noble gases',
  'A',
  'Both ns and d electrons can participate in bonding.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK_ELEMENTS'
  AND st.subtopic_code='D_F_BLOCK_ELEMENTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_31',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_021';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  76,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_021'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 077. CHEMISTRY dedicated | challenge | D_F_BLOCK_ELEMENTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_022',
  'challenge',
  'The colour of many transition-metal ions is commonly associated with:',
  'd-d electronic transitions',
  'nuclear transitions only',
  'proton transfer',
  'ionic size alone',
  'A',
  'Partially filled d orbitals permit visible-light electronic transitions.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK_ELEMENTS'
  AND st.subtopic_code='D_F_BLOCK_ELEMENTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_32',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_022';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  77,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_022'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 078. CHEMISTRY dedicated | medium | COORDINATION_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_023',
  'challenge',
  'The coordination number of Co in [Co(NH₃)₆]³⁺ is:',
  '3',
  '4',
  '6',
  '9',
  'C',
  'Six NH₃ ligands coordinate to Co.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION_COMPOUNDS'
  AND st.subtopic_code='COORDINATION_COMPOUNDS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_33',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_023';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  78,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_023'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 079. CHEMISTRY dedicated | challenge | COORDINATION_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_024',
  'challenge',
  'In [Fe(CN)₆]⁴⁻, oxidation state of Fe is:',
  '+2',
  '+3',
  '+4',
  '-2',
  'A',
  'x+6(-1)=-4 gives x=+2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION_COMPOUNDS'
  AND st.subtopic_code='COORDINATION_COMPOUNDS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_34',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_024';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  79,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_024'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 080. CHEMISTRY dedicated | easy | PURIFICATION_ORGANIC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_025',
  'easy',
  'Distillation is commonly used to separate liquids based mainly on differences in:',
  'boiling point',
  'colour',
  'density only',
  'magnetic property',
  'A',
  'Distillation exploits volatility/boiling-point differences.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PURIFICATION_ORGANIC'
  AND st.subtopic_code='PURIFICATION_ORGANIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_35',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_025';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  80,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_025'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 081. CHEMISTRY dedicated | medium | PURIFICATION_ORGANIC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_026',
  'medium',
  'Chromatography separates components primarily because of different:',
  'interactions with stationary and mobile phases',
  'atomic numbers only',
  'melting points only',
  'nuclear spins only',
  'A',
  'Differential partition/adsorption causes separation.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PURIFICATION_ORGANIC'
  AND st.subtopic_code='PURIFICATION_ORGANIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_36',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_026';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  81,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_026'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 082. CHEMISTRY dedicated | medium | BASIC_PRINCIPLES_ORGANIC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_027',
  'medium',
  'A carbocation is generally:',
  'electron-deficient',
  'electron-rich anion',
  'neutral radical only',
  'noble gas',
  'A',
  'Carbocations have a positively charged, electron-deficient carbon.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_PRINCIPLES_ORGANIC'
  AND st.subtopic_code='BASIC_PRINCIPLES_ORGANIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_37',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_027';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  82,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_027'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 083. CHEMISTRY dedicated | challenge | BASIC_PRINCIPLES_ORGANIC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_028',
  'challenge',
  'The +I effect of alkyl groups generally:',
  'stabilizes carbocations',
  'destabilizes carbocations',
  'removes all sigma bonds',
  'creates anions only',
  'A',
  'Electron donation by +I groups stabilizes positive charge.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_PRINCIPLES_ORGANIC'
  AND st.subtopic_code='BASIC_PRINCIPLES_ORGANIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_38',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_028';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  83,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_028'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 084. CHEMISTRY dedicated | medium | HYDROCARBONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_029',
  'medium',
  'Ethene decolourises bromine water because it undergoes:',
  'addition',
  'substitution only',
  'elimination',
  'neutralisation',
  'A',
  'Bromine adds across the C=C bond.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_39',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_029';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  84,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_029'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 085. CHEMISTRY dedicated | challenge | HYDROCARBONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_030',
  'challenge',
  'Benzene preferentially undergoes electrophilic substitution rather than addition because substitution:',
  'preserves aromaticity',
  'destroys all π electrons',
  'requires no catalyst ever',
  'forms only alkanes',
  'A',
  'Addition would disrupt aromatic stabilization.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_40',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_030';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  85,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_030'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 086. CHEMISTRY dedicated | medium | ORGANIC_HALOGENS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_031',
  'medium',
  'A common reaction of haloalkanes with aqueous KOH is:',
  'nucleophilic substitution',
  'electrophilic addition',
  'polymerisation only',
  'combustion only',
  'A',
  'OH⁻ substitutes halide.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_HALOGENS'
  AND st.subtopic_code='ORGANIC_HALOGENS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_41',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_031';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  86,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_031'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 087. CHEMISTRY dedicated | challenge | ORGANIC_OXYGEN
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_032',
  'challenge',
  'Oxidation of a primary alcohol can first produce a:',
  'aldehyde',
  'ketone only',
  'alkane',
  'amine',
  'A',
  'Primary alcohols oxidize first to aldehydes.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_OXYGEN'
  AND st.subtopic_code='ORGANIC_OXYGEN_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_42',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_032';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  87,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_032'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 088. CHEMISTRY dedicated | medium | ORGANIC_NITROGEN
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_033',
  'medium',
  'Amines are generally basic because nitrogen has:',
  'a lone pair',
  'no valence electrons',
  'a full positive charge always',
  'an empty s orbital only',
  'A',
  'The lone pair can accept a proton.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_NITROGEN'
  AND st.subtopic_code='ORGANIC_NITROGEN_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_43',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_033';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  88,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_033'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 089. CHEMISTRY dedicated | easy | BIOMOLECULES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_034',
  'easy',
  'Proteins are polymers of:',
  'amino acids',
  'monosaccharides',
  'nucleotides',
  'fatty acids only',
  'A',
  'Peptide bonds link amino acids.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BIOMOLECULES'
  AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_44',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_034';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  89,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_034'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 090. CHEMISTRY dedicated | challenge | PRACTICAL_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_QT1_035',
  'challenge',
  'In a titration, the endpoint is commonly detected using:',
  'an indicator colour change',
  'a balance only',
  'a magnet',
  'a thermometer only',
  'A',
  'Indicators signal completion near equivalence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PRACTICAL_CHEMISTRY'
  AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_CHEMISTRY_45',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_035';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  90,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_QT1_035'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 091. BIOLOGY dedicated | medium | DIVERSITY_IN_LIVING_WORLD
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_001',
  'medium',
  'The basic unit of biological classification is:',
  'species',
  'family',
  'order',
  'class',
  'A',
  'Species is the fundamental taxonomic unit.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_1',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_001';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  91,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 092. BIOLOGY existing reviewed | easy | CELL_STRUCTURE_FUNCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  92,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 093. BIOLOGY dedicated | medium | DIVERSITY_IN_LIVING_WORLD
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_002',
  'medium',
  'Members of kingdom Monera are typically:',
  'prokaryotic',
  'multicellular eukaryotic only',
  'acellular',
  'all photosynthetic',
  'A',
  'Monerans are prokaryotes.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_3',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_002';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  93,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 094. BIOLOGY existing reviewed | easy | CELL_STRUCTURE_FUNCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  94,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 095. BIOLOGY dedicated | challenge | DIVERSITY_IN_LIVING_WORLD
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_003',
  'challenge',
  'A defining feature of archaea compared with typical bacteria is that archaeal cell walls:',
  'lack peptidoglycan',
  'always contain cellulose',
  'contain chitin only',
  'are absent in all archaea',
  'A',
  'Archaeal walls do not contain bacterial peptidoglycan.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_5',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_003';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  95,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 096. BIOLOGY existing reviewed | medium | CELL_STRUCTURE_FUNCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  96,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 097. BIOLOGY dedicated | easy | STRUCTURAL_ORGANISATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_004',
  'easy',
  'The tissue that transports water in plants is:',
  'xylem',
  'phloem',
  'epidermis',
  'cambium only',
  'A',
  'Xylem conducts water and minerals.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_7',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_004';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  97,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 098. BIOLOGY existing reviewed | medium | CELL_STRUCTURE_FUNCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  98,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 099. BIOLOGY dedicated | medium | STRUCTURAL_ORGANISATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_005',
  'medium',
  'Cardiac muscle fibres are characteristically:',
  'striated and involuntary',
  'non-striated and voluntary',
  'striated and voluntary',
  'without nuclei',
  'A',
  'Cardiac muscle is striated but involuntary.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_9',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_005';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  99,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 100. BIOLOGY existing reviewed | medium | CELL_STRUCTURE_FUNCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  100,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 101. BIOLOGY dedicated | challenge | STRUCTURAL_ORGANISATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_006',
  'challenge',
  'Companion cells are closely associated with:',
  'sieve tube elements',
  'xylem vessels',
  'guard cells',
  'trichomes',
  'A',
  'Companion cells support sieve tube elements in phloem.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_11',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_006';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  101,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_006'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 102. BIOLOGY existing reviewed | easy | DIVERSITY_IN_LIVING_WORLD
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  102,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 103. BIOLOGY dedicated | easy | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_007',
  'easy',
  'The organelle primarily responsible for ATP production in aerobic eukaryotic cells is:',
  'mitochondrion',
  'lysosome',
  'Golgi body',
  'ribosome',
  'A',
  'Mitochondria host oxidative phosphorylation.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_13',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_007';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  103,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_007'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 104. BIOLOGY existing reviewed | easy | DIVERSITY_IN_LIVING_WORLD
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  104,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 105. BIOLOGY dedicated | medium | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_008',
  'medium',
  'Ribosomes are directly involved in:',
  'protein synthesis',
  'DNA replication only',
  'lipid storage',
  'photosynthetic light capture only',
  'A',
  'Ribosomes translate mRNA into protein.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_15',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_008';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  105,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_008'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 106. BIOLOGY existing reviewed | medium | DIVERSITY_IN_LIVING_WORLD
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  106,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 107. BIOLOGY dedicated | challenge | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_009',
  'challenge',
  'During the cell cycle, DNA replication occurs in:',
  'S phase',
  'G1 only',
  'G2 only',
  'M phase only',
  'A',
  'S phase is the DNA synthesis phase.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_17',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_009';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  107,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_009'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 108. BIOLOGY existing reviewed | medium | DIVERSITY_IN_LIVING_WORLD
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  108,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 109. BIOLOGY dedicated | medium | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_010',
  'medium',
  'The fluid mosaic model describes the structure of the:',
  'plasma membrane',
  'cell wall',
  'chromosome',
  'nucleolus',
  'A',
  'The plasma membrane is a lipid bilayer with mobile proteins.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_19',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_010';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  109,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_010'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 110. BIOLOGY existing reviewed | medium | DIVERSITY_IN_LIVING_WORLD
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  110,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 111. BIOLOGY dedicated | easy | PLANT_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_011',
  'easy',
  'The primary photosynthetic pigment in higher plants is:',
  'chlorophyll a',
  'chlorophyll b only',
  'carotene only',
  'xanthophyll only',
  'A',
  'Chlorophyll a is the primary reaction-centre pigment.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_21',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_011';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  111,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_011'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 112. BIOLOGY existing reviewed | easy | STRUCTURAL_ORGANISATION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  112,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 113. BIOLOGY dedicated | medium | PLANT_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_012',
  'medium',
  'Stomatal opening is directly associated with:',
  'increased guard-cell turgor',
  'complete loss of guard-cell water',
  'xylem collapse',
  'loss of all potassium',
  'A',
  'Turgid guard cells open the pore.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_23',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_012';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  113,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_012'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 114. BIOLOGY existing reviewed | easy | STRUCTURAL_ORGANISATION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  114,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 115. BIOLOGY dedicated | challenge | PLANT_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_013',
  'challenge',
  'The first stable product of C4 carbon fixation is generally:',
  'oxaloacetate',
  '3-phosphoglycerate',
  'RuBP',
  'glucose',
  'A',
  'PEP carboxylase initially forms oxaloacetate.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_25',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_013';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  115,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_013'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 116. BIOLOGY existing reviewed | medium | STRUCTURAL_ORGANISATION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  116,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 117. BIOLOGY dedicated | challenge | PLANT_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_014',
  'challenge',
  'Photolysis of water during photosynthesis occurs in association with:',
  'photosystem II',
  'photosystem I only',
  'Calvin cycle enzymes',
  'mitochondrial matrix',
  'A',
  'Water splitting complex is linked to PSII.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_27',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_014';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  117,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_014'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 118. BIOLOGY existing reviewed | medium | STRUCTURAL_ORGANISATION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  118,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 119. BIOLOGY dedicated | medium | HUMAN_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_015',
  'medium',
  'The functional unit of kidney is the:',
  'nephron',
  'neuron',
  'alveolus',
  'sarcomere',
  'A',
  'Nephrons filter and process blood.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_29',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_015';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  119,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_015'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 120. BIOLOGY existing reviewed | medium | STRUCTURAL_ORGANISATION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  120,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 121. BIOLOGY dedicated | medium | HUMAN_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_016',
  'medium',
  'The oxygen-carrying pigment in human red blood cells is:',
  'haemoglobin',
  'myoglobin only',
  'chlorophyll',
  'melanin',
  'A',
  'Haemoglobin binds oxygen.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_31',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_016';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  121,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_016'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 122. BIOLOGY dedicated unique replacement | easy | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_036',
  'easy',
  'The organelle that modifies, sorts, and packages many proteins for secretion is the:',
  'Golgi apparatus',
  'ribosome',
  'centrosome',
  'nucleolus',
  'A',
  'The Golgi apparatus modifies and packages proteins received from the endoplasmic reticulum.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_UNIQUE_122',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_036';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  122,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_036'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;

-- 123. BIOLOGY dedicated | challenge | HUMAN_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_017',
  'challenge',
  'The pacemaker of the human heart is normally the:',
  'SA node',
  'AV node',
  'Purkinje fibre',
  'bundle of His',
  'A',
  'The sinoatrial node initiates normal cardiac rhythm.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_33',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_017';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  123,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_017'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 124. BIOLOGY dedicated unique replacement | easy | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_037',
  'easy',
  'The selectively permeable boundary surrounding the cell is the:',
  'plasma membrane',
  'nucleolus',
  'centromere',
  'ribosome',
  'A',
  'The plasma membrane controls movement of substances into and out of the cell.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_UNIQUE_124',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_037';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  124,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_037'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;

-- 125. BIOLOGY dedicated | medium | HUMAN_PHYSIOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_018',
  'medium',
  'Insulin lowers blood glucose primarily by promoting:',
  'cellular uptake and storage of glucose',
  'glycogen breakdown',
  'glucagon secretion',
  'intestinal protein digestion',
  'A',
  'Insulin promotes uptake and glycogenesis.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_35',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_018';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  125,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_018'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 126. BIOLOGY dedicated unique replacement | medium | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_038',
  'medium',
  'Which cell organelle contains hydrolytic enzymes and is involved in intracellular digestion?',
  'lysosome',
  'ribosome',
  'centriole',
  'chloroplast',
  'A',
  'Lysosomes contain acid hydrolases that digest macromolecules and cellular material.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_UNIQUE_126',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_038';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  126,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_038'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;

-- 127. BIOLOGY dedicated | easy | REPRODUCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_019',
  'easy',
  'In flowering plants, double fertilization is characteristic of:',
  'angiosperms',
  'gymnosperms',
  'bryophytes',
  'pteridophytes',
  'A',
  'Angiosperms undergo syngamy and triple fusion.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_37',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_019';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  127,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_019'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 128. BIOLOGY dedicated unique replacement | medium | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_039',
  'medium',
  'The main site of lipid synthesis in a eukaryotic cell is the:',
  'smooth endoplasmic reticulum',
  'rough endoplasmic reticulum',
  'nucleolus',
  'ribosome',
  'A',
  'Smooth endoplasmic reticulum is important in synthesis of lipids and related molecules.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_UNIQUE_128',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_039';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  128,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_039'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;

-- 129. BIOLOGY dedicated | medium | REPRODUCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_020',
  'medium',
  'In humans, ovulation is triggered by a surge of:',
  'LH',
  'FSH only',
  'prolactin',
  'oxytocin',
  'A',
  'The mid-cycle LH surge triggers ovulation.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_39',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_020';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  129,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_020'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 130. BIOLOGY dedicated unique replacement | medium | CELL_STRUCTURE_FUNCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_040',
  'medium',
  'During mitosis, sister chromatids separate and move toward opposite poles during:',
  'anaphase',
  'prophase',
  'metaphase',
  'telophase',
  'A',
  'Centromeres divide and sister chromatids move toward opposite poles during anaphase.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_UNIQUE_130',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_040';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  130,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_040'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;

-- 131. BIOLOGY dedicated | challenge | REPRODUCTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_021',
  'challenge',
  'The acrosome of a sperm is derived from the:',
  'Golgi apparatus',
  'mitochondrion',
  'nucleus',
  'centriole only',
  'A',
  'Golgi-derived vesicle forms the acrosome.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_41',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_021';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  131,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_021'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 132. BIOLOGY existing reviewed | easy | PLANT_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  132,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 133. BIOLOGY dedicated | easy | GENETICS_AND_EVOLUTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_022',
  'easy',
  'A test cross is performed by crossing an individual with a:',
  'homozygous recessive individual',
  'homozygous dominant individual',
  'heterozygote only',
  'different species',
  'A',
  'A recessive tester reveals unknown genotype.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_43',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_022';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  133,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_022'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 134. BIOLOGY existing reviewed | easy | PLANT_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  134,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 135. BIOLOGY dedicated | medium | GENETICS_AND_EVOLUTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_023',
  'medium',
  'According to Mendel''s law of segregation, alleles of a gene:',
  'separate during gamete formation',
  'remain permanently paired in every gamete',
  'blend irreversibly',
  'are always dominant',
  'A',
  'Allele pairs segregate into different gametes.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_45',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_023';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  135,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_023'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 136. BIOLOGY existing reviewed | medium | PLANT_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  136,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 137. BIOLOGY dedicated | challenge | GENETICS_AND_EVOLUTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_024',
  'challenge',
  'In a Hardy-Weinberg population with p=0.7 and q=0.3, expected heterozygote frequency is:',
  '0.21',
  '0.42',
  '0.49',
  '0.09',
  'B',
  '2pq=2×0.7×0.3=0.42.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_47',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_024';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  137,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_024'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 138. BIOLOGY existing reviewed | medium | PLANT_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  138,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 139. BIOLOGY dedicated | challenge | GENETICS_AND_EVOLUTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_025',
  'challenge',
  'Homologous structures are evidence of:',
  'divergent evolution',
  'convergent evolution only',
  'no common ancestry',
  'spontaneous generation',
  'A',
  'Homology reflects common ancestry with divergence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_49',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_025';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  139,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_025'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 140. BIOLOGY existing reviewed | medium | PLANT_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  140,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 141. BIOLOGY dedicated | easy | BIOLOGY_HUMAN_WELFARE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_026',
  'easy',
  'Antibiotics are generally ineffective against:',
  'viruses',
  'many bacteria',
  'some fungi',
  'some protozoa',
  'A',
  'Viruses lack the cellular targets of antibacterial drugs.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_51',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_026';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  141,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_026'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 142. BIOLOGY existing reviewed | easy | HUMAN_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  142,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 143. BIOLOGY dedicated | medium | BIOLOGY_HUMAN_WELFARE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_027',
  'medium',
  'Vaccination commonly protects by generating:',
  'immunological memory',
  'immediate permanent fever',
  'antibiotic resistance',
  'loss of lymphocytes',
  'A',
  'Memory cells enable faster secondary responses.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_53',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_027';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  143,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_027'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 144. BIOLOGY existing reviewed | easy | HUMAN_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  144,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 145. BIOLOGY dedicated | challenge | BIOLOGY_HUMAN_WELFARE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_028',
  'challenge',
  'HIV primarily infects cells expressing:',
  'CD4',
  'haemoglobin',
  'insulin receptor only',
  'chlorophyll',
  'A',
  'HIV targets CD4+ cells, especially helper T cells.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_55',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_028';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  145,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_028'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 146. BIOLOGY existing reviewed | medium | HUMAN_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  146,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 147. BIOLOGY dedicated | easy | BIOTECHNOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_029',
  'easy',
  'Restriction endonucleases are used to:',
  'cut DNA at specific sequences',
  'translate mRNA',
  'synthesize ATP',
  'digest proteins only',
  'A',
  'Restriction enzymes cleave DNA at recognition sites.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_57',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_029';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  147,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_029'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 148. BIOLOGY existing reviewed | medium | HUMAN_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  148,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 149. BIOLOGY dedicated | medium | BIOTECHNOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_030',
  'medium',
  'PCR is used primarily to:',
  'amplify DNA',
  'separate proteins',
  'translate RNA',
  'measure blood pressure',
  'A',
  'PCR exponentially amplifies target DNA.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_59',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_030';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  149,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_030'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 150. BIOLOGY existing reviewed | medium | HUMAN_PHYSIOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  150,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 151. BIOLOGY dedicated | challenge | BIOTECHNOLOGY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_031',
  'challenge',
  'A selectable marker in a cloning vector helps identify cells that:',
  'have taken up the vector',
  'lack all DNA',
  'cannot divide',
  'contain no ribosomes',
  'A',
  'Markers allow selection of transformants.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_61',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_031';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  151,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_031'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 152. BIOLOGY existing reviewed | easy | REPRODUCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  152,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 153. BIOLOGY dedicated | easy | ECOLOGY_ENVIRONMENT
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_032',
  'easy',
  'Primary consumers are organisms that feed mainly on:',
  'producers',
  'secondary consumers',
  'decomposers only',
  'abiotic factors',
  'A',
  'Herbivores consume producers.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_63',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_032';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  153,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_032'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 154. BIOLOGY existing reviewed | easy | REPRODUCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  154,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 155. BIOLOGY dedicated | medium | ECOLOGY_ENVIRONMENT
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_033',
  'medium',
  'Net primary productivity equals gross primary productivity minus:',
  'respiration losses',
  'solar radiation',
  'secondary productivity',
  'decomposition only',
  'A',
  'NPP=GPP-R.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_65',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_033';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  155,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_033'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 156. BIOLOGY existing reviewed | medium | REPRODUCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  156,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 157. BIOLOGY dedicated | challenge | ECOLOGY_ENVIRONMENT
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_034',
  'challenge',
  'The 10% law of energy transfer in ecosystems is associated with:',
  'Lindeman',
  'Darwin',
  'Mendel',
  'Watson',
  'A',
  'Lindeman proposed the trophic transfer approximation.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_67',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_034';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  157,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_034'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 158. BIOLOGY existing reviewed | medium | REPRODUCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  158,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 159. BIOLOGY dedicated | medium | ECOLOGY_ENVIRONMENT
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_QT1_035',
  'medium',
  'The relationship between cattle and cattle egrets is commonly cited as:',
  'commensalism',
  'mutualism obligatory',
  'parasitism',
  'predation',
  'A',
  'Egrets benefit while cattle are largely unaffected.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'BOTH',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'QUALITY_TEST1_BIOLOGY_69',
  'GYAN NEET Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_035';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  159,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_QT1_035'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1;


-- 160. BIOLOGY existing reviewed | medium | REPRODUCTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  160,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 161. BIOLOGY existing reviewed | easy | GENETICS_AND_EVOLUTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  161,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 162. BIOLOGY existing reviewed | easy | GENETICS_AND_EVOLUTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  162,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 163. BIOLOGY existing reviewed | medium | GENETICS_AND_EVOLUTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  163,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 164. BIOLOGY existing reviewed | medium | GENETICS_AND_EVOLUTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  164,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 165. BIOLOGY existing reviewed | medium | GENETICS_AND_EVOLUTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  165,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 166. BIOLOGY existing reviewed | easy | BIOLOGY_HUMAN_WELFARE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  166,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 167. BIOLOGY existing reviewed | easy | BIOLOGY_HUMAN_WELFARE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  167,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 168. BIOLOGY existing reviewed | medium | BIOLOGY_HUMAN_WELFARE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  168,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 169. BIOLOGY existing reviewed | medium | BIOLOGY_HUMAN_WELFARE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  169,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 170. BIOLOGY existing reviewed | medium | BIOLOGY_HUMAN_WELFARE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  170,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 171. BIOLOGY existing reviewed | easy | BIOTECHNOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  171,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 172. BIOLOGY existing reviewed | easy | BIOTECHNOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  172,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 173. BIOLOGY existing reviewed | medium | BIOTECHNOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  173,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 174. BIOLOGY existing reviewed | medium | BIOTECHNOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  174,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 175. BIOLOGY existing reviewed | medium | BIOTECHNOLOGY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  175,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 176. BIOLOGY existing reviewed | easy | ECOLOGY_ENVIRONMENT
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  176,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_001'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 177. BIOLOGY existing reviewed | easy | ECOLOGY_ENVIRONMENT
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  177,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_002'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 178. BIOLOGY existing reviewed | medium | ECOLOGY_ENVIRONMENT
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  178,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_003'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 179. BIOLOGY existing reviewed | medium | ECOLOGY_ENVIRONMENT
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  179,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_004'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- 180. BIOLOGY existing reviewed | medium | ECOLOGY_ENVIRONMENT
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  180,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_005'
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
;

-- Publish only when the entire fixed test exists.
UPDATE education_mock_tests
SET access_mode='OPEN',
    published=CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      )=180 THEN 1
      ELSE 0
    END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='NEET'
  AND version=1;

-- ------------------------------------------------------------
-- Audits
-- ------------------------------------------------------------

SELECT
  mt.id,
  mt.program_code,
  mt.test_code,
  mt.version,
  mt.published,
  COUNT(mtq.question_id) AS question_count,
  SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
GROUP BY mt.id,mt.program_code,mt.test_code,mt.version,mt.published;

SELECT
  mtq.section_code,
  COUNT(*) AS questions,
  SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
GROUP BY mtq.section_code
ORDER BY MIN(mtq.question_order);

SELECT
  q.difficulty,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
GROUP BY q.difficulty
ORDER BY CASE q.difficulty
  WHEN 'easy' THEN 1
  WHEN 'medium' THEN 2
  WHEN 'challenge' THEN 3
  ELSE 4
END;

SELECT
  s.subject_code,
  COUNT(*) AS questions,
  COUNT(DISTINCT t.id) AS topics_covered
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE mt.program_code='NEET'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='NEET'
  AND mt.version=1
GROUP BY s.subject_code
ORDER BY MIN(mtq.question_order);
