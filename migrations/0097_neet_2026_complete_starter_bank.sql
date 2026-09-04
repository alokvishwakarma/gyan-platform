-- 0097_neet_2026_complete_starter_bank.sql
-- Completes the NEET starter bank to at least 5 questions per topic.
-- Physics and overlapping Chemistry concepts reuse reviewed GYAN JEE questions.
-- Biology and NEET-specific purification questions are authored directly for NEET.
PRAGMA foreign_keys = ON;

-- PHYSICS: PHYSICS_AND_MEASUREMENT <- JEE UNITS_MEASUREMENTS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'UNITS_MEASUREMENTS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'PHYSICS_AND_MEASUREMENT_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'PHYSICS_AND_MEASUREMENT';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PHYSICS_AND_MEASUREMENT_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_')) = 'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: KINEMATICS <- JEE KINEMATICS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'KINEMATICS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'KINEMATICS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'KINEMATICS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'KINEMATICS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_KINEMATICS_')) = 'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: LAWS_OF_MOTION <- JEE LAWS_OF_MOTION
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'LAWS_OF_MOTION'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'LAWS_OF_MOTION_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'LAWS_OF_MOTION';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'LAWS_OF_MOTION_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_')) = 'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: WORK_ENERGY_POWER <- JEE WORK_ENERGY_POWER
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'WORK_ENERGY_POWER'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'WORK_ENERGY_POWER_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'WORK_ENERGY_POWER';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'WORK_ENERGY_POWER_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_')) = 'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: ROTATIONAL_MOTION <- JEE ROTATIONAL_MOTION
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'ROTATIONAL_MOTION'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ROTATIONAL_MOTION_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'ROTATIONAL_MOTION';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ROTATIONAL_MOTION_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_')) = 'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: GRAVITATION <- JEE GRAVITATION
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'GRAVITATION'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'GRAVITATION_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'GRAVITATION';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'GRAVITATION_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_GRAVITATION_')) = 'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: PROPERTIES_OF_SOLIDS_LIQUIDS <- JEE PROPERTIES_SOLIDS_LIQUIDS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'PROPERTIES_SOLIDS_LIQUIDS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'PROPERTIES_OF_SOLIDS_LIQUIDS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'PROPERTIES_OF_SOLIDS_LIQUIDS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_')) = 'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: THERMODYNAMICS <- JEE THERMODYNAMICS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'THERMODYNAMICS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'THERMODYNAMICS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'THERMODYNAMICS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'THERMODYNAMICS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_')) = 'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: KINETIC_THEORY_OF_GASES <- JEE KINETIC_THEORY_GASES
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'KINETIC_THEORY_GASES'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'KINETIC_THEORY_OF_GASES_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'KINETIC_THEORY_OF_GASES';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'KINETIC_THEORY_OF_GASES_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_')) = 'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: OSCILLATIONS_AND_WAVES <- JEE OSCILLATIONS_WAVES
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'OSCILLATIONS_WAVES'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'OSCILLATIONS_AND_WAVES_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'OSCILLATIONS_AND_WAVES';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'OSCILLATIONS_AND_WAVES_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_')) = 'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: ELECTROSTATICS <- JEE ELECTROSTATICS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'ELECTROSTATICS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ELECTROSTATICS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'ELECTROSTATICS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ELECTROSTATICS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_')) = 'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: CURRENT_ELECTRICITY <- JEE CURRENT_ELECTRICITY
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'CURRENT_ELECTRICITY'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'CURRENT_ELECTRICITY_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'CURRENT_ELECTRICITY';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CURRENT_ELECTRICITY_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_')) = 'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: MAGNETIC_EFFECTS_AND_MAGNETISM <- JEE MAGNETIC_EFFECTS_MAGNETISM
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'MAGNETIC_EFFECTS_MAGNETISM'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'MAGNETIC_EFFECTS_AND_MAGNETISM_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'MAGNETIC_EFFECTS_AND_MAGNETISM';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_')) = 'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: ELECTROMAGNETIC_INDUCTION_AC <- JEE EMI_AC
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'EMI_AC'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ELECTROMAGNETIC_INDUCTION_AC_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'ELECTROMAGNETIC_INDUCTION_AC';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ELECTROMAGNETIC_INDUCTION_AC_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_')) = 'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: ELECTROMAGNETIC_WAVES <- JEE ELECTROMAGNETIC_WAVES
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'ELECTROMAGNETIC_WAVES'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ELECTROMAGNETIC_WAVES_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'ELECTROMAGNETIC_WAVES';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ELECTROMAGNETIC_WAVES_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_')) = 'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: OPTICS <- JEE OPTICS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'OPTICS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'OPTICS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'OPTICS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'OPTICS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_OPTICS_')) = 'IN_PROGRAM_NEET_PHYSICS_OPTICS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: DUAL_NATURE <- JEE DUAL_NATURE
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'DUAL_NATURE'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'DUAL_NATURE_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'DUAL_NATURE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'DUAL_NATURE_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_')) = 'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: ATOMS_AND_NUCLEI <- JEE ATOMS_NUCLEI
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'ATOMS_NUCLEI'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ATOMS_AND_NUCLEI_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'ATOMS_AND_NUCLEI';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ATOMS_AND_NUCLEI_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_')) = 'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: ELECTRONIC_DEVICES <- JEE ELECTRONIC_DEVICES
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'ELECTRONIC_DEVICES'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ELECTRONIC_DEVICES_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'ELECTRONIC_DEVICES';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ELECTRONIC_DEVICES_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_')) = 'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- PHYSICS: EXPERIMENTAL_SKILLS <- JEE EXPERIMENTAL_SKILLS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'PHYSICS'
    AND jt.topic_code = 'EXPERIMENTAL_SKILLS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'EXPERIMENTAL_SKILLS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'PHYSICS'
  AND nt.topic_code = 'EXPERIMENTAL_SKILLS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'EXPERIMENTAL_SKILLS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_')) = 'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: SOME_BASIC_CONCEPTS_CHEMISTRY <- JEE BASIC_CONCEPTS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'BASIC_CONCEPTS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'SOME_BASIC_CONCEPTS_CHEMISTRY_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_')) = 'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: ATOMIC_STRUCTURE <- JEE ATOMIC_STRUCTURE
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'ATOMIC_STRUCTURE'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_ATOMIC_STRUCTURE_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ATOMIC_STRUCTURE_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'ATOMIC_STRUCTURE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ATOMIC_STRUCTURE_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_ATOMIC_STRUCTURE_')) = 'IN_PROGRAM_NEET_CHEMISTRY_ATOMIC_STRUCTURE_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: CHEMICAL_BONDING <- JEE CHEMICAL_BONDING
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'CHEMICAL_BONDING'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_BONDING_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'CHEMICAL_BONDING_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'CHEMICAL_BONDING';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CHEMICAL_BONDING_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_BONDING_')) = 'IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_BONDING_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: CHEMICAL_THERMODYNAMICS <- JEE CHEMICAL_THERMODYNAMICS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'CHEMICAL_THERMODYNAMICS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_THERMODYNAMICS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'CHEMICAL_THERMODYNAMICS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'CHEMICAL_THERMODYNAMICS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CHEMICAL_THERMODYNAMICS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_THERMODYNAMICS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_THERMODYNAMICS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: SOLUTIONS <- JEE SOLUTIONS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'SOLUTIONS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_SOLUTIONS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'SOLUTIONS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'SOLUTIONS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'SOLUTIONS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_SOLUTIONS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_SOLUTIONS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: EQUILIBRIUM <- JEE EQUILIBRIUM
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'EQUILIBRIUM'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_EQUILIBRIUM_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'EQUILIBRIUM_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'EQUILIBRIUM';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'EQUILIBRIUM_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_EQUILIBRIUM_')) = 'IN_PROGRAM_NEET_CHEMISTRY_EQUILIBRIUM_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: REDOX_ELECTROCHEMISTRY <- JEE REDOX_ELECTROCHEMISTRY
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'REDOX_ELECTROCHEMISTRY'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_REDOX_ELECTROCHEMISTRY_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'REDOX_ELECTROCHEMISTRY_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'REDOX_ELECTROCHEMISTRY';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'REDOX_ELECTROCHEMISTRY_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_REDOX_ELECTROCHEMISTRY_')) = 'IN_PROGRAM_NEET_CHEMISTRY_REDOX_ELECTROCHEMISTRY_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: CHEMICAL_KINETICS <- JEE CHEMICAL_KINETICS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'CHEMICAL_KINETICS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_KINETICS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'CHEMICAL_KINETICS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'CHEMICAL_KINETICS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CHEMICAL_KINETICS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_KINETICS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_KINETICS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: CLASSIFICATION_PERIODICITY <- JEE PERIODICITY
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'PERIODICITY'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_CLASSIFICATION_PERIODICITY_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'CLASSIFICATION_PERIODICITY_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'CLASSIFICATION_PERIODICITY';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CLASSIFICATION_PERIODICITY_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_CLASSIFICATION_PERIODICITY_')) = 'IN_PROGRAM_NEET_CHEMISTRY_CLASSIFICATION_PERIODICITY_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: P_BLOCK_ELEMENTS <- JEE P_BLOCK
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'P_BLOCK'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_P_BLOCK_ELEMENTS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'P_BLOCK_ELEMENTS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'P_BLOCK_ELEMENTS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'P_BLOCK_ELEMENTS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_P_BLOCK_ELEMENTS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_P_BLOCK_ELEMENTS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: D_F_BLOCK_ELEMENTS <- JEE D_F_BLOCK
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'D_F_BLOCK'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_D_F_BLOCK_ELEMENTS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'D_F_BLOCK_ELEMENTS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'D_F_BLOCK_ELEMENTS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'D_F_BLOCK_ELEMENTS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_D_F_BLOCK_ELEMENTS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_D_F_BLOCK_ELEMENTS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: COORDINATION_COMPOUNDS <- JEE COORDINATION
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'COORDINATION'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_COORDINATION_COMPOUNDS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'COORDINATION_COMPOUNDS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'COORDINATION_COMPOUNDS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'COORDINATION_COMPOUNDS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_COORDINATION_COMPOUNDS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_COORDINATION_COMPOUNDS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: BASIC_PRINCIPLES_ORGANIC <- JEE ORGANIC_PRINCIPLES
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'ORGANIC_PRINCIPLES'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_BASIC_PRINCIPLES_ORGANIC_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'BASIC_PRINCIPLES_ORGANIC_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'BASIC_PRINCIPLES_ORGANIC';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BASIC_PRINCIPLES_ORGANIC_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_BASIC_PRINCIPLES_ORGANIC_')) = 'IN_PROGRAM_NEET_CHEMISTRY_BASIC_PRINCIPLES_ORGANIC_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: HYDROCARBONS <- JEE HYDROCARBONS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'HYDROCARBONS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_HYDROCARBONS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'HYDROCARBONS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'HYDROCARBONS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'HYDROCARBONS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_HYDROCARBONS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_HYDROCARBONS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: ORGANIC_HALOGENS <- JEE HALOGEN_COMPOUNDS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'HALOGEN_COMPOUNDS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_HALOGENS_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ORGANIC_HALOGENS_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'ORGANIC_HALOGENS';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ORGANIC_HALOGENS_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_HALOGENS_')) = 'IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_HALOGENS_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: ORGANIC_OXYGEN <- JEE OXYGEN_COMPOUNDS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'OXYGEN_COMPOUNDS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_OXYGEN_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ORGANIC_OXYGEN_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'ORGANIC_OXYGEN';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ORGANIC_OXYGEN_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_OXYGEN_')) = 'IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_OXYGEN_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: ORGANIC_NITROGEN <- JEE NITROGEN_COMPOUNDS
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'NITROGEN_COMPOUNDS'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_NITROGEN_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'ORGANIC_NITROGEN_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'ORGANIC_NITROGEN';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ORGANIC_NITROGEN_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_NITROGEN_')) = 'IN_PROGRAM_NEET_CHEMISTRY_ORGANIC_NITROGEN_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: BIOMOLECULES <- JEE BIOMOLECULES
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'BIOMOLECULES'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_BIOMOLECULES_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'BIOMOLECULES_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'BIOMOLECULES';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOMOLECULES_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_BIOMOLECULES_')) = 'IN_PROGRAM_NEET_CHEMISTRY_BIOMOLECULES_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

-- CHEMISTRY: PRACTICAL_CHEMISTRY <- JEE PRACTICAL_CHEMISTRY
WITH source_questions AS (
  SELECT
    q.difficulty,
    q.question_text,
    q.choice_a,
    q.choice_b,
    q.choice_c,
    q.choice_d,
    q.correct_choice,
    q.explanation,
    ROW_NUMBER() OVER (ORDER BY q.id) AS rn
  FROM education_questions q
  JOIN education_subtopics jst
    ON jst.id = q.subtopic_id
  JOIN education_topics jt
    ON jt.id = jst.topic_id
  JOIN education_subjects js
    ON js.id = jt.subject_id
  WHERE js.country_code = 'IN'
    AND js.grade_code = 'PROGRAM_JEE'
    AND js.subject_code = 'CHEMISTRY'
    AND jt.topic_code = 'PRACTICAL_CHEMISTRY'
    AND q.active = 1
  ORDER BY q.id
  LIMIT 5
)
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  nst.id,
  'IN_PROGRAM_NEET_CHEMISTRY_PRACTICAL_CHEMISTRY_' || printf('%03d', sq.rn),
  sq.difficulty,
  sq.question_text,
  sq.choice_a,
  sq.choice_b,
  sq.choice_c,
  sq.choice_d,
  sq.correct_choice,
  sq.explanation,
  1,
  'neet-shared-concept-v1'
FROM source_questions sq
JOIN education_subtopics nst
  ON nst.subtopic_code = 'PRACTICAL_CHEMISTRY_CORE'
JOIN education_topics nt
  ON nt.id = nst.topic_id
JOIN education_subjects ns
  ON ns.id = nt.subject_id
WHERE ns.country_code = 'IN'
  AND ns.grade_code = 'PROGRAM_NEET'
  AND ns.subject_code = 'CHEMISTRY'
  AND nt.topic_code = 'PRACTICAL_CHEMISTRY';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PRACTICAL_CHEMISTRY_STARTER_' || substr(q.question_key, -3),
  'GYAN NEET starter adapted from reviewed shared JEE concept bank'
FROM education_questions q
WHERE substr(q.question_key, 1, length('IN_PROGRAM_NEET_CHEMISTRY_PRACTICAL_CHEMISTRY_')) = 'IN_PROGRAM_NEET_CHEMISTRY_PRACTICAL_CHEMISTRY_'
  AND q.source_type IN ('neet-starter-v1','neet-shared-concept-v1');

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_001',
  'easy',
  'A common method used to purify a solid organic compound based on solubility differences is:',
  'Crystallization',
  'Filtration of gases',
  'Electrolysis only',
  'Magnetization',
  'A',
  'Crystallization purifies solids using differences in solubility, commonly with temperature.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PURIFICATION_ORGANIC'
  AND st.subtopic_code = 'PURIFICATION_ORGANIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PURIFICATION_ORGANIC_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_002',
  'easy',
  'Distillation is especially useful for separating liquids that differ in:',
  'Boiling point',
  'Atomic number',
  'Colour only',
  'Magnetic moment only',
  'A',
  'Distillation separates volatile components based mainly on differences in boiling points.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PURIFICATION_ORGANIC'
  AND st.subtopic_code = 'PURIFICATION_ORGANIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PURIFICATION_ORGANIC_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_003',
  'medium',
  'Chromatography separates components because they differ in their:',
  'Distribution between stationary and mobile phases',
  'Nuclear charge only',
  'Mass number only',
  'Ability to emit sound',
  'A',
  'Chromatographic separation depends on differential interaction with stationary and mobile phases.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PURIFICATION_ORGANIC'
  AND st.subtopic_code = 'PURIFICATION_ORGANIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PURIFICATION_ORGANIC_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_004',
  'medium',
  'A pure organic compound generally shows a:',
  'Sharp melting point',
  'Very broad melting range always',
  'Random boiling point',
  'Zero vapour pressure always',
  'A',
  'Purity is often indicated by a relatively sharp and characteristic melting point.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PURIFICATION_ORGANIC'
  AND st.subtopic_code = 'PURIFICATION_ORGANIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PURIFICATION_ORGANIC_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_005',
  'medium',
  'In qualitative organic analysis, the presence of nitrogen can be tested after sodium fusion using the principle of:',
  'Lassaigne''s test',
  'Tyndall effect',
  'Brownian motion',
  'Friedel-Crafts reaction',
  'A',
  'Lassaigne''s test converts covalently bound heteroatoms into ionic sodium salts for detection.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PURIFICATION_ORGANIC'
  AND st.subtopic_code = 'PURIFICATION_ORGANIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PURIFICATION_ORGANIC_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_PURIFICATION_ORGANIC_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_001',
  'easy',
  'The basic unit of biological classification is:',
  'Species',
  'Genus',
  'Family',
  'Order',
  'A',
  'Species is the basic unit of classification.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code = 'DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'DIVERSITY_IN_LIVING_WORLD_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_002',
  'easy',
  'Binomial nomenclature uses two names representing:',
  'Family and order',
  'Genus and species',
  'Class and phylum',
  'Kingdom and genus',
  'B',
  'A scientific name contains the genus name followed by the specific epithet.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code = 'DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'DIVERSITY_IN_LIVING_WORLD_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_003',
  'medium',
  'Organisms that lack a membrane-bound nucleus are classified as:',
  'Eukaryotes',
  'Prokaryotes',
  'Fungi only',
  'Protists only',
  'B',
  'Prokaryotes do not have a membrane-bound nucleus.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code = 'DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'DIVERSITY_IN_LIVING_WORLD_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_004',
  'medium',
  'Which kingdom includes multicellular organisms that ingest food and generally lack cell walls?',
  'Plantae',
  'Fungi',
  'Animalia',
  'Monera',
  'C',
  'Animals are multicellular heterotrophs that generally lack cell walls.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code = 'DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'DIVERSITY_IN_LIVING_WORLD_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_005',
  'medium',
  'A taxonomic category immediately above genus is:',
  'Species',
  'Family',
  'Order',
  'Class',
  'B',
  'The hierarchy includes species, genus, family, order, class, phylum/division and kingdom.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code = 'DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'DIVERSITY_IN_LIVING_WORLD_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_001',
  'easy',
  'The tissue that covers body surfaces and lines cavities is:',
  'Connective tissue',
  'Epithelial tissue',
  'Muscular tissue',
  'Nervous tissue',
  'B',
  'Epithelial tissue forms protective coverings and linings.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'STRUCTURAL_ORGANISATION'
  AND st.subtopic_code = 'STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'STRUCTURAL_ORGANISATION_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_002',
  'easy',
  'Xylem primarily transports:',
  'Food',
  'Water and minerals',
  'Hormones only',
  'Oxygen',
  'B',
  'Xylem conducts water and dissolved minerals from roots upward.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'STRUCTURAL_ORGANISATION'
  AND st.subtopic_code = 'STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'STRUCTURAL_ORGANISATION_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_003',
  'medium',
  'Phloem primarily transports:',
  'Organic food',
  'Water only',
  'Mineral salts only',
  'Oxygen',
  'A',
  'Phloem translocates sugars and other organic solutes.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'STRUCTURAL_ORGANISATION'
  AND st.subtopic_code = 'STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'STRUCTURAL_ORGANISATION_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_004',
  'medium',
  'The contractile proteins of skeletal muscle include:',
  'Actin and myosin',
  'Keratin and collagen',
  'Tubulin and dynein',
  'Elastin and fibrin',
  'A',
  'Actin and myosin interact to produce muscle contraction.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'STRUCTURAL_ORGANISATION'
  AND st.subtopic_code = 'STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'STRUCTURAL_ORGANISATION_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_005',
  'medium',
  'Which tissue has abundant extracellular matrix?',
  'Epithelial tissue',
  'Connective tissue',
  'Nervous tissue',
  'Meristematic tissue',
  'B',
  'Connective tissues characteristically contain abundant extracellular matrix.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'STRUCTURAL_ORGANISATION'
  AND st.subtopic_code = 'STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'STRUCTURAL_ORGANISATION_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_001',
  'easy',
  'Which organelle is commonly called the powerhouse of the cell?',
  'Golgi apparatus',
  'Mitochondrion',
  'Lysosome',
  'Ribosome',
  'B',
  'Mitochondria generate most cellular ATP through aerobic respiration.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_002',
  'easy',
  'Ribosomes are primarily involved in:',
  'Lipid storage',
  'Protein synthesis',
  'DNA replication only',
  'Cell movement',
  'B',
  'Ribosomes translate messenger RNA to synthesize proteins.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_003',
  'medium',
  'Which structure is present in plant cells but absent in typical animal cells?',
  'Plasma membrane',
  'Ribosome',
  'Cell wall',
  'Mitochondrion',
  'C',
  'Plant cells have a cellulose cell wall outside the plasma membrane.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_004',
  'medium',
  'The fluid mosaic model describes the structure of the:',
  'Cell wall',
  'Plasma membrane',
  'Nucleolus',
  'Chromosome',
  'B',
  'The fluid mosaic model describes proteins embedded in a dynamic phospholipid bilayer.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_005',
  'medium',
  'Which organelle contains hydrolytic enzymes used in intracellular digestion?',
  'Lysosome',
  'Centrosome',
  'Nucleolus',
  'Smooth ER',
  'A',
  'Lysosomes contain hydrolytic enzymes used in intracellular digestion.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_001',
  'easy',
  'The primary photosynthetic pigment in higher plants is:',
  'Chlorophyll a',
  'Carotene only',
  'Xanthophyll only',
  'Anthocyanin',
  'A',
  'Chlorophyll a is the primary pigment participating directly in photosynthesis.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'PLANT_PHYSIOLOGY'
  AND st.subtopic_code = 'PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PLANT_PHYSIOLOGY_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_002',
  'easy',
  'Opening and closing of stomata is mainly controlled by:',
  'Guard cells',
  'Xylem vessels',
  'Companion cells',
  'Root hairs',
  'A',
  'Guard cells regulate the stomatal pore.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'PLANT_PHYSIOLOGY'
  AND st.subtopic_code = 'PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PLANT_PHYSIOLOGY_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_003',
  'medium',
  'The light-dependent reactions of photosynthesis occur mainly in the:',
  'Stroma',
  'Thylakoid membranes',
  'Nucleus',
  'Cytosol',
  'B',
  'Photosystems and electron transport components are located in thylakoid membranes.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'PLANT_PHYSIOLOGY'
  AND st.subtopic_code = 'PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PLANT_PHYSIOLOGY_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_004',
  'medium',
  'Transpiration is the loss of water mainly as:',
  'Liquid droplets from roots',
  'Water vapour from aerial parts',
  'Ice from leaves',
  'Bound water from seeds',
  'B',
  'Transpiration is primarily loss of water vapour from aerial parts through stomata.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'PLANT_PHYSIOLOGY'
  AND st.subtopic_code = 'PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PLANT_PHYSIOLOGY_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_005',
  'medium',
  'Auxin is most directly associated with:',
  'Cell elongation',
  'Blood clotting',
  'Antibody formation',
  'Nitrogen fixation by itself',
  'A',
  'Auxins promote cell elongation and regulate several growth responses.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'PLANT_PHYSIOLOGY'
  AND st.subtopic_code = 'PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'PLANT_PHYSIOLOGY_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_001',
  'easy',
  'The functional unit of the kidney is the:',
  'Neuron',
  'Nephron',
  'Alveolus',
  'Sarcomere',
  'B',
  'The nephron is the structural and functional unit of the kidney.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'HUMAN_PHYSIOLOGY'
  AND st.subtopic_code = 'HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'HUMAN_PHYSIOLOGY_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_002',
  'easy',
  'Oxygen is transported in human blood mainly by:',
  'Plasma glucose',
  'Haemoglobin',
  'Platelets',
  'Lymphocytes',
  'B',
  'Most oxygen is carried bound to haemoglobin in red blood cells.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'HUMAN_PHYSIOLOGY'
  AND st.subtopic_code = 'HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'HUMAN_PHYSIOLOGY_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_003',
  'medium',
  'The pacemaker of the human heart is the:',
  'AV node',
  'SA node',
  'Purkinje fibre',
  'Bundle of His',
  'B',
  'The sinoatrial node normally initiates the heartbeat.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'HUMAN_PHYSIOLOGY'
  AND st.subtopic_code = 'HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'HUMAN_PHYSIOLOGY_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_004',
  'medium',
  'Most absorption of digested nutrients occurs in the:',
  'Stomach',
  'Small intestine',
  'Large intestine',
  'Oesophagus',
  'B',
  'The small intestine provides a large absorptive surface through villi and microvilli.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'HUMAN_PHYSIOLOGY'
  AND st.subtopic_code = 'HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'HUMAN_PHYSIOLOGY_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_005',
  'medium',
  'Insulin primarily lowers blood glucose by promoting:',
  'Glucose uptake and storage',
  'Glycogen breakdown only',
  'Adrenaline release',
  'Water loss',
  'A',
  'Insulin promotes cellular glucose uptake and glycogen synthesis.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'HUMAN_PHYSIOLOGY'
  AND st.subtopic_code = 'HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'HUMAN_PHYSIOLOGY_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_001',
  'easy',
  'In humans, fertilization normally occurs in the:',
  'Uterus',
  'Fallopian tube',
  'Cervix',
  'Vagina',
  'B',
  'Human fertilization usually occurs in the ampullary region of the oviduct.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'REPRODUCTION'
  AND st.subtopic_code = 'REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'REPRODUCTION_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_002',
  'easy',
  'The male gamete in flowering plants is delivered to the embryo sac through the:',
  'Root hair',
  'Pollen tube',
  'Xylem vessel',
  'Stoma',
  'B',
  'The pollen tube carries male gametes to the embryo sac.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'REPRODUCTION'
  AND st.subtopic_code = 'REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'REPRODUCTION_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_003',
  'medium',
  'Double fertilization is characteristic of:',
  'Gymnosperms',
  'Angiosperms',
  'Bryophytes',
  'Pteridophytes',
  'B',
  'Angiosperms show syngamy and triple fusion, together called double fertilization.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'REPRODUCTION'
  AND st.subtopic_code = 'REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'REPRODUCTION_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_004',
  'medium',
  'The hormone that triggers ovulation in humans is a surge of:',
  'LH',
  'Insulin',
  'Thyroxine',
  'Prolactin only',
  'A',
  'A mid-cycle surge of luteinizing hormone triggers ovulation.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'REPRODUCTION'
  AND st.subtopic_code = 'REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'REPRODUCTION_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_005',
  'medium',
  'The placenta primarily functions in exchange between:',
  'Two fetal organs',
  'Maternal and fetal circulations',
  'Two maternal organs',
  'Ovary and oviduct only',
  'B',
  'The placenta permits exchange of gases, nutrients and wastes between mother and fetus.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'REPRODUCTION'
  AND st.subtopic_code = 'REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'REPRODUCTION_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_001',
  'easy',
  'Mendel''s law of segregation refers to separation of:',
  'Alleles during gamete formation',
  'Chromosomes during transcription',
  'Proteins during translation',
  'Lipids during digestion',
  'A',
  'The two alleles of a gene separate during gamete formation.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'GENETICS_AND_EVOLUTION'
  AND st.subtopic_code = 'GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'GENETICS_AND_EVOLUTION_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_002',
  'easy',
  'DNA replication is described as:',
  'Conservative',
  'Semiconservative',
  'Dispersive only',
  'Random',
  'B',
  'Each daughter DNA molecule contains one parental strand and one newly synthesized strand.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'GENETICS_AND_EVOLUTION'
  AND st.subtopic_code = 'GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'GENETICS_AND_EVOLUTION_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_003',
  'medium',
  'A change in the nucleotide sequence of DNA is called a:',
  'Mutation',
  'Translation',
  'Translocation of proteins',
  'Transpiration',
  'A',
  'A mutation is an alteration in genetic material.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'GENETICS_AND_EVOLUTION'
  AND st.subtopic_code = 'GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'GENETICS_AND_EVOLUTION_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_004',
  'medium',
  'Natural selection acts directly on differences in:',
  'Phenotype affecting reproductive success',
  'Future intentions',
  'Acquired need alone',
  'Chromosome number only',
  'A',
  'Selection favors heritable phenotypic differences that influence survival and reproduction.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'GENETICS_AND_EVOLUTION'
  AND st.subtopic_code = 'GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'GENETICS_AND_EVOLUTION_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_005',
  'medium',
  'Homologous organs are evidence for:',
  'Convergent evolution only',
  'Divergent evolution',
  'No common ancestry',
  'Artificial selection only',
  'B',
  'Homologous structures share basic origin and indicate divergent evolution from common ancestry.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'GENETICS_AND_EVOLUTION'
  AND st.subtopic_code = 'GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'GENETICS_AND_EVOLUTION_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_001',
  'easy',
  'Vaccination primarily provides:',
  'Passive nutrition',
  'Active acquired immunity',
  'Immediate oxygenation',
  'Genetic mutation',
  'B',
  'Vaccination stimulates the immune system to develop active acquired immunity.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code = 'BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOLOGY_HUMAN_WELFARE_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_002',
  'easy',
  'Penicillin is an example of a/an:',
  'Antibiotic',
  'Vitamin',
  'Hormone',
  'Antacid',
  'A',
  'Penicillin is an antibiotic originally derived from Penicillium.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code = 'BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOLOGY_HUMAN_WELFARE_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_003',
  'medium',
  'AIDS is caused by:',
  'HIV',
  'Plasmodium',
  'Salmonella',
  'Rhizobium',
  'A',
  'Human immunodeficiency virus causes AIDS.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code = 'BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOLOGY_HUMAN_WELFARE_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_004',
  'medium',
  'Malaria is transmitted by the bite of an infected female:',
  'Aedes mosquito',
  'Anopheles mosquito',
  'Housefly',
  'Sandfly',
  'B',
  'Female Anopheles mosquitoes transmit Plasmodium parasites.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code = 'BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOLOGY_HUMAN_WELFARE_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_005',
  'medium',
  'Lactic acid bacteria are useful in curd formation because they:',
  'Produce lactic acid',
  'Produce methane only',
  'Destroy all proteins',
  'Remove all water',
  'A',
  'Lactic acid bacteria ferment lactose to lactic acid, helping set curd.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code = 'BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOLOGY_HUMAN_WELFARE_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_001',
  'easy',
  'Restriction endonucleases are used to:',
  'Cut DNA at specific sequences',
  'Translate mRNA',
  'Synthesize lipids',
  'Destroy ribosomes',
  'A',
  'Restriction enzymes cleave DNA at specific recognition sequences.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOTECHNOLOGY'
  AND st.subtopic_code = 'BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOTECHNOLOGY_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_002',
  'easy',
  'PCR is used primarily to:',
  'Amplify DNA',
  'Separate proteins by size',
  'Measure blood pressure',
  'Grow whole plants directly',
  'A',
  'Polymerase chain reaction amplifies selected DNA sequences.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOTECHNOLOGY'
  AND st.subtopic_code = 'BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOTECHNOLOGY_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_003',
  'medium',
  'A plasmid used to carry foreign DNA into a host cell acts as a:',
  'Vector',
  'Hormone',
  'Ribosome',
  'Antibody',
  'A',
  'Plasmids are commonly used as cloning vectors.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOTECHNOLOGY'
  AND st.subtopic_code = 'BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOTECHNOLOGY_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_004',
  'medium',
  'Bt cotton contains genes derived from:',
  'Bacillus thuringiensis',
  'Escherichia coli only',
  'Rhizobium',
  'Saccharomyces only',
  'A',
  'Bt genes from Bacillus thuringiensis encode insecticidal proteins.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOTECHNOLOGY'
  AND st.subtopic_code = 'BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOTECHNOLOGY_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_005',
  'medium',
  'Recombinant human insulin is produced using:',
  'Genetically engineered microorganisms',
  'Only plant chloroplasts in fields',
  'Mechanical filtration',
  'Mineral extraction',
  'A',
  'Recombinant DNA technology enables microorganisms to produce human insulin.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOTECHNOLOGY'
  AND st.subtopic_code = 'BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'BIOTECHNOLOGY_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_001',
  'easy',
  'A group of individuals of the same species living in an area is a:',
  'Community',
  'Population',
  'Biome',
  'Ecosystem',
  'B',
  'A population consists of individuals of the same species in a defined area.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code = 'ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ECOLOGY_ENVIRONMENT_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_002',
  'easy',
  'Primary producers occupy the:',
  'First trophic level',
  'Second trophic level',
  'Third trophic level',
  'Last trophic level only',
  'A',
  'Producers form the first trophic level.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code = 'ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ECOLOGY_ENVIRONMENT_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_003',
  'medium',
  'Energy flow through an ecosystem is generally:',
  'Unidirectional',
  'Perfectly cyclic',
  'Absent',
  'Independent of producers',
  'A',
  'Energy enters ecosystems and flows through trophic levels, with losses as heat.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code = 'ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ECOLOGY_ENVIRONMENT_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_004',
  'medium',
  'The gradual, orderly change in species composition of a community over time is:',
  'Ecological succession',
  'Mutation',
  'Osmosis',
  'Respiration',
  'A',
  'Ecological succession is the directional change in community composition over time.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code = 'ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ECOLOGY_ENVIRONMENT_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_005',
  'medium',
  'Biomagnification refers to increasing concentration of certain pollutants at:',
  'Higher trophic levels',
  'Lower atmospheric pressure only',
  'The soil surface only',
  'Producer level exclusively',
  'A',
  'Persistent pollutants can become increasingly concentrated at successive trophic levels.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code = 'ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'ECOLOGY_ENVIRONMENT_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_005';

-- End of migration.
-- Expected after 0096 + 0097: each enabled NEET topic has at least 5 active questions.
