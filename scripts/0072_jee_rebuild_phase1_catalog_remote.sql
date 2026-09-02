-- GYAN IIT-JEE rebuild, Phase 1
-- Catalog only: creates a clean syllabus taxonomy beside the legacy question bank.
-- IMPORTANT: run locally first, then remote only after validation.
-- Assumes existing education_subjects / education_topics / education_subtopics schema.

PRAGMA foreign_keys = ON;


-- Hide only the old broad JEE topic buckets if they exist.
-- Existing question rows are NOT deleted.
UPDATE education_topics
SET enabled = 0
WHERE subject_id IN (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
)
AND topic_code IN (
  'MATH',
  'MATHEMATICS',
  'PHYSICS',
  'CHEMISTRY'
);


-- MATH

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'SETS_RELATIONS_FUNCTIONS',
  'Sets, Relations & Functions',
  1,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Sets, Relations & Functions',
  sort_order = 1,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'SETS_RELATIONS_FUNCTIONS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'SETS_RELATIONS_FUNCTIONS_CORE',
  'Sets, Relations & Functions',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'SETS_RELATIONS_FUNCTIONS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'COMPLEX_QUADRATIC',
  'Complex Numbers & Quadratic Equations',
  2,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Complex Numbers & Quadratic Equations',
  sort_order = 2,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'COMPLEX_QUADRATIC';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'COMPLEX_QUADRATIC_CORE',
  'Complex Numbers & Quadratic Equations',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'COMPLEX_QUADRATIC';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'MATRICES_DETERMINANTS',
  'Matrices & Determinants',
  3,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Matrices & Determinants',
  sort_order = 3,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'MATRICES_DETERMINANTS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'MATRICES_DETERMINANTS_CORE',
  'Matrices & Determinants',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'MATRICES_DETERMINANTS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'PERMUTATIONS_COMBINATIONS',
  'Permutations & Combinations',
  4,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Permutations & Combinations',
  sort_order = 4,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'PERMUTATIONS_COMBINATIONS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PERMUTATIONS_COMBINATIONS_CORE',
  'Permutations & Combinations',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'PERMUTATIONS_COMBINATIONS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'BINOMIAL_THEOREM',
  'Binomial Theorem',
  5,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Binomial Theorem',
  sort_order = 5,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'BINOMIAL_THEOREM';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'BINOMIAL_THEOREM_CORE',
  'Binomial Theorem',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'BINOMIAL_THEOREM';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'SEQUENCES_SERIES',
  'Sequences & Series',
  6,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Sequences & Series',
  sort_order = 6,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'SEQUENCES_SERIES';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'SEQUENCES_SERIES_CORE',
  'Sequences & Series',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'SEQUENCES_SERIES';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'LIMITS_CONTINUITY_DIFFERENTIABILITY',
  'Limits, Continuity & Differentiability',
  7,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Limits, Continuity & Differentiability',
  sort_order = 7,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'LIMITS_CONTINUITY_DIFFERENTIABILITY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE',
  'Limits, Continuity & Differentiability',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'LIMITS_CONTINUITY_DIFFERENTIABILITY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'INTEGRAL_CALCULUS',
  'Integral Calculus',
  8,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Integral Calculus',
  sort_order = 8,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'INTEGRAL_CALCULUS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'INTEGRAL_CALCULUS_CORE',
  'Integral Calculus',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'INTEGRAL_CALCULUS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'DIFFERENTIAL_EQUATIONS',
  'Differential Equations',
  9,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Differential Equations',
  sort_order = 9,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'DIFFERENTIAL_EQUATIONS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'DIFFERENTIAL_EQUATIONS_CORE',
  'Differential Equations',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'DIFFERENTIAL_EQUATIONS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'COORDINATE_GEOMETRY',
  'Coordinate Geometry',
  10,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Coordinate Geometry',
  sort_order = 10,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'COORDINATE_GEOMETRY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'COORDINATE_GEOMETRY_CORE',
  'Coordinate Geometry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'COORDINATE_GEOMETRY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'THREE_D_GEOMETRY',
  '3D Geometry',
  11,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = '3D Geometry',
  sort_order = 11,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'THREE_D_GEOMETRY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'THREE_D_GEOMETRY_CORE',
  '3D Geometry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'THREE_D_GEOMETRY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'VECTOR_ALGEBRA',
  'Vector Algebra',
  12,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Vector Algebra',
  sort_order = 12,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'VECTOR_ALGEBRA';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'VECTOR_ALGEBRA_CORE',
  'Vector Algebra',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'VECTOR_ALGEBRA';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'STATISTICS_PROBABILITY',
  'Statistics & Probability',
  13,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Statistics & Probability',
  sort_order = 13,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'STATISTICS_PROBABILITY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'STATISTICS_PROBABILITY_CORE',
  'Statistics & Probability',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'STATISTICS_PROBABILITY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'TRIGONOMETRY',
  'Trigonometry',
  14,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Trigonometry',
  sort_order = 14,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
  LIMIT 1
)
AND topic_code = 'TRIGONOMETRY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'TRIGONOMETRY_CORE',
  'Trigonometry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'TRIGONOMETRY';


-- PHYSICS

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'UNITS_MEASUREMENTS',
  'Units & Measurements',
  1,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Units & Measurements',
  sort_order = 1,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'UNITS_MEASUREMENTS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'UNITS_MEASUREMENTS_CORE',
  'Units & Measurements',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'UNITS_MEASUREMENTS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'KINEMATICS',
  'Kinematics',
  2,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Kinematics',
  sort_order = 2,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'KINEMATICS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'KINEMATICS_CORE',
  'Kinematics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINEMATICS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'LAWS_OF_MOTION',
  'Laws of Motion',
  3,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Laws of Motion',
  sort_order = 3,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'LAWS_OF_MOTION';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'LAWS_OF_MOTION_CORE',
  'Laws of Motion',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'LAWS_OF_MOTION';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'WORK_ENERGY_POWER',
  'Work, Energy & Power',
  4,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Work, Energy & Power',
  sort_order = 4,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'WORK_ENERGY_POWER';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'WORK_ENERGY_POWER_CORE',
  'Work, Energy & Power',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'WORK_ENERGY_POWER';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ROTATIONAL_MOTION',
  'Rotational Motion',
  5,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Rotational Motion',
  sort_order = 5,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'ROTATIONAL_MOTION';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ROTATIONAL_MOTION_CORE',
  'Rotational Motion',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ROTATIONAL_MOTION';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'GRAVITATION',
  'Gravitation',
  6,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Gravitation',
  sort_order = 6,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'GRAVITATION';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'GRAVITATION_CORE',
  'Gravitation',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'GRAVITATION';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'PROPERTIES_SOLIDS_LIQUIDS',
  'Properties of Solids & Liquids',
  7,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Properties of Solids & Liquids',
  sort_order = 7,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'PROPERTIES_SOLIDS_LIQUIDS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PROPERTIES_SOLIDS_LIQUIDS_CORE',
  'Properties of Solids & Liquids',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'PROPERTIES_SOLIDS_LIQUIDS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'THERMODYNAMICS',
  'Thermodynamics',
  8,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Thermodynamics',
  sort_order = 8,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'THERMODYNAMICS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'THERMODYNAMICS_CORE',
  'Thermodynamics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'THERMODYNAMICS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'KINETIC_THEORY_GASES',
  'Kinetic Theory of Gases',
  9,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Kinetic Theory of Gases',
  sort_order = 9,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'KINETIC_THEORY_GASES';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'KINETIC_THEORY_GASES_CORE',
  'Kinetic Theory of Gases',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINETIC_THEORY_GASES';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'OSCILLATIONS_WAVES',
  'Oscillations & Waves',
  10,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Oscillations & Waves',
  sort_order = 10,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'OSCILLATIONS_WAVES';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'OSCILLATIONS_WAVES_CORE',
  'Oscillations & Waves',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'OSCILLATIONS_WAVES';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ELECTROSTATICS',
  'Electrostatics',
  11,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Electrostatics',
  sort_order = 11,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'ELECTROSTATICS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ELECTROSTATICS_CORE',
  'Electrostatics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ELECTROSTATICS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'CURRENT_ELECTRICITY',
  'Current Electricity',
  12,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Current Electricity',
  sort_order = 12,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'CURRENT_ELECTRICITY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CURRENT_ELECTRICITY_CORE',
  'Current Electricity',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'CURRENT_ELECTRICITY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'MAGNETIC_EFFECTS_MAGNETISM',
  'Magnetic Effects & Magnetism',
  13,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Magnetic Effects & Magnetism',
  sort_order = 13,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'MAGNETIC_EFFECTS_MAGNETISM';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'MAGNETIC_EFFECTS_MAGNETISM_CORE',
  'Magnetic Effects & Magnetism',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'MAGNETIC_EFFECTS_MAGNETISM';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'EMI_AC',
  'Electromagnetic Induction & AC',
  14,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Electromagnetic Induction & AC',
  sort_order = 14,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'EMI_AC';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'EMI_AC_CORE',
  'Electromagnetic Induction & AC',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'EMI_AC';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ELECTROMAGNETIC_WAVES',
  'Electromagnetic Waves',
  15,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Electromagnetic Waves',
  sort_order = 15,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'ELECTROMAGNETIC_WAVES';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ELECTROMAGNETIC_WAVES_CORE',
  'Electromagnetic Waves',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ELECTROMAGNETIC_WAVES';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'OPTICS',
  'Optics',
  16,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Optics',
  sort_order = 16,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'OPTICS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'OPTICS_CORE',
  'Optics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'OPTICS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'DUAL_NATURE',
  'Dual Nature of Matter & Radiation',
  17,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Dual Nature of Matter & Radiation',
  sort_order = 17,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'DUAL_NATURE';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'DUAL_NATURE_CORE',
  'Dual Nature of Matter & Radiation',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'DUAL_NATURE';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ATOMS_NUCLEI',
  'Atoms & Nuclei',
  18,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Atoms & Nuclei',
  sort_order = 18,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'ATOMS_NUCLEI';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ATOMS_NUCLEI_CORE',
  'Atoms & Nuclei',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ATOMS_NUCLEI';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ELECTRONIC_DEVICES',
  'Electronic Devices',
  19,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Electronic Devices',
  sort_order = 19,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'ELECTRONIC_DEVICES';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ELECTRONIC_DEVICES_CORE',
  'Electronic Devices',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ELECTRONIC_DEVICES';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'EXPERIMENTAL_SKILLS',
  'Experimental Skills',
  20,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Experimental Skills',
  sort_order = 20,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
  LIMIT 1
)
AND topic_code = 'EXPERIMENTAL_SKILLS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'EXPERIMENTAL_SKILLS_CORE',
  'Experimental Skills',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'EXPERIMENTAL_SKILLS';


-- CHEMISTRY

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'BASIC_CONCEPTS',
  'Basic Concepts & Stoichiometry',
  1,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Basic Concepts & Stoichiometry',
  sort_order = 1,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'BASIC_CONCEPTS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'BASIC_CONCEPTS_CORE',
  'Basic Concepts & Stoichiometry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'BASIC_CONCEPTS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'STATES_OF_MATTER',
  'States of Matter',
  2,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'States of Matter',
  sort_order = 2,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'STATES_OF_MATTER';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'STATES_OF_MATTER_CORE',
  'States of Matter',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'STATES_OF_MATTER';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ATOMIC_STRUCTURE',
  'Atomic Structure',
  3,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Atomic Structure',
  sort_order = 3,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'ATOMIC_STRUCTURE';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ATOMIC_STRUCTURE_CORE',
  'Atomic Structure',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'ATOMIC_STRUCTURE';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'CHEMICAL_BONDING',
  'Chemical Bonding & Molecular Structure',
  4,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Chemical Bonding & Molecular Structure',
  sort_order = 4,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'CHEMICAL_BONDING';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CHEMICAL_BONDING_CORE',
  'Chemical Bonding & Molecular Structure',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'CHEMICAL_BONDING';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'CHEMICAL_THERMODYNAMICS',
  'Chemical Thermodynamics',
  5,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Chemical Thermodynamics',
  sort_order = 5,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'CHEMICAL_THERMODYNAMICS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CHEMICAL_THERMODYNAMICS_CORE',
  'Chemical Thermodynamics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'CHEMICAL_THERMODYNAMICS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'EQUILIBRIUM',
  'Chemical & Ionic Equilibrium',
  6,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Chemical & Ionic Equilibrium',
  sort_order = 6,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'EQUILIBRIUM';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'EQUILIBRIUM_CORE',
  'Chemical & Ionic Equilibrium',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'EQUILIBRIUM';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'REDOX_ELECTROCHEMISTRY',
  'Redox Reactions & Electrochemistry',
  7,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Redox Reactions & Electrochemistry',
  sort_order = 7,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'REDOX_ELECTROCHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'REDOX_ELECTROCHEMISTRY_CORE',
  'Redox Reactions & Electrochemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'REDOX_ELECTROCHEMISTRY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'CHEMICAL_KINETICS',
  'Chemical Kinetics',
  8,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Chemical Kinetics',
  sort_order = 8,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'CHEMICAL_KINETICS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CHEMICAL_KINETICS_CORE',
  'Chemical Kinetics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'CHEMICAL_KINETICS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'SOLID_STATE',
  'Solid State',
  9,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Solid State',
  sort_order = 9,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'SOLID_STATE';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'SOLID_STATE_CORE',
  'Solid State',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOLID_STATE';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'SOLUTIONS',
  'Solutions',
  10,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Solutions',
  sort_order = 10,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'SOLUTIONS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'SOLUTIONS_CORE',
  'Solutions',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOLUTIONS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'SURFACE_CHEMISTRY',
  'Surface Chemistry',
  11,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Surface Chemistry',
  sort_order = 11,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'SURFACE_CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'SURFACE_CHEMISTRY_CORE',
  'Surface Chemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SURFACE_CHEMISTRY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'PERIODICITY',
  'Classification & Periodicity',
  12,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Classification & Periodicity',
  sort_order = 12,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'PERIODICITY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PERIODICITY_CORE',
  'Classification & Periodicity',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PERIODICITY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'HYDROGEN_S_BLOCK',
  'Hydrogen & s-Block Elements',
  13,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Hydrogen & s-Block Elements',
  sort_order = 13,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'HYDROGEN_S_BLOCK';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'HYDROGEN_S_BLOCK_CORE',
  'Hydrogen & s-Block Elements',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'HYDROGEN_S_BLOCK';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'P_BLOCK',
  'p-Block Elements',
  14,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'p-Block Elements',
  sort_order = 14,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'P_BLOCK';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'P_BLOCK_CORE',
  'p-Block Elements',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'P_BLOCK';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'D_F_BLOCK',
  'd- & f-Block Elements',
  15,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'd- & f-Block Elements',
  sort_order = 15,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'D_F_BLOCK';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'D_F_BLOCK_CORE',
  'd- & f-Block Elements',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'D_F_BLOCK';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'COORDINATION',
  'Coordination Compounds',
  16,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Coordination Compounds',
  sort_order = 16,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'COORDINATION';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'COORDINATION_CORE',
  'Coordination Compounds',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'COORDINATION';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'METALLURGY_QUALITATIVE',
  'Metallurgy & Qualitative Analysis',
  17,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Metallurgy & Qualitative Analysis',
  sort_order = 17,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'METALLURGY_QUALITATIVE';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'METALLURGY_QUALITATIVE_CORE',
  'Metallurgy & Qualitative Analysis',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'METALLURGY_QUALITATIVE';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ENVIRONMENTAL_CHEMISTRY',
  'Environmental Chemistry',
  18,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Environmental Chemistry',
  sort_order = 18,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'ENVIRONMENTAL_CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ENVIRONMENTAL_CHEMISTRY_CORE',
  'Environmental Chemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'ENVIRONMENTAL_CHEMISTRY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'ORGANIC_PRINCIPLES',
  'Basic Principles of Organic Chemistry',
  19,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Basic Principles of Organic Chemistry',
  sort_order = 19,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'ORGANIC_PRINCIPLES';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ORGANIC_PRINCIPLES_CORE',
  'Basic Principles of Organic Chemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'ORGANIC_PRINCIPLES';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'HYDROCARBONS',
  'Hydrocarbons',
  20,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Hydrocarbons',
  sort_order = 20,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'HYDROCARBONS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'HYDROCARBONS_CORE',
  'Hydrocarbons',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'HYDROCARBONS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'HALOGEN_COMPOUNDS',
  'Halogen Compounds',
  21,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Halogen Compounds',
  sort_order = 21,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'HALOGEN_COMPOUNDS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'HALOGEN_COMPOUNDS_CORE',
  'Halogen Compounds',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'HALOGEN_COMPOUNDS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'OXYGEN_COMPOUNDS',
  'Oxygen-Containing Organic Compounds',
  22,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Oxygen-Containing Organic Compounds',
  sort_order = 22,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'OXYGEN_COMPOUNDS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'OXYGEN_COMPOUNDS_CORE',
  'Oxygen-Containing Organic Compounds',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'OXYGEN_COMPOUNDS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'NITROGEN_COMPOUNDS',
  'Nitrogen-Containing Organic Compounds',
  23,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Nitrogen-Containing Organic Compounds',
  sort_order = 23,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'NITROGEN_COMPOUNDS';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'NITROGEN_COMPOUNDS_CORE',
  'Nitrogen-Containing Organic Compounds',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'NITROGEN_COMPOUNDS';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'BIOMOLECULES',
  'Biomolecules',
  24,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Biomolecules',
  sort_order = 24,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'BIOMOLECULES';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'BIOMOLECULES_CORE',
  'Biomolecules',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'BIOMOLECULES';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'POLYMERS_EVERYDAY',
  'Polymers & Chemistry in Everyday Life',
  25,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Polymers & Chemistry in Everyday Life',
  sort_order = 25,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'POLYMERS_EVERYDAY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'POLYMERS_EVERYDAY_CORE',
  'Polymers & Chemistry in Everyday Life',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'POLYMERS_EVERYDAY';

INSERT OR IGNORE INTO education_topics
  (subject_id, topic_code, topic_name, sort_order, enabled)
SELECT
  s.id,
  'PRACTICAL_CHEMISTRY',
  'Practical Chemistry',
  26,
  1
FROM education_subjects s
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY';

UPDATE education_topics
SET
  topic_name = 'Practical Chemistry',
  sort_order = 26,
  enabled = 1
WHERE subject_id = (
  SELECT id
  FROM education_subjects
  WHERE country_code = 'IN'
    AND grade_code = 'PROGRAM_JEE'
    AND subject_code = 'CHEMISTRY'
  LIMIT 1
)
AND topic_code = 'PRACTICAL_CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
  (topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PRACTICAL_CHEMISTRY_CORE',
  'Practical Chemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PRACTICAL_CHEMISTRY';


