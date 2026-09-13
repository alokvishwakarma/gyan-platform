-- 0142_live_schedule_topic_taxonomy_expansion.sql
--
-- Phase 1 taxonomy expansion for class-linked Live Tests.
--
-- Adds educationally meaningful class topics that are currently hidden
-- inside broader JEE/NEET catalog buckets. Existing topics/questions are
-- NOT moved or deleted in this migration.
--
-- Initial owned-question targets (next migration):
--   JEE  MATH     STRAIGHT_LINES    30
--   JEE  PHYSICS  CENTER_OF_MASS    30
--   NEET PHYSICS  CENTER_OF_MASS    25
--
-- Safe to rerun: INSERT OR IGNORE + deterministic UPDATE.

PRAGMA foreign_keys = ON;



-- ============================================================
-- JEE MATH — Straight Lines
-- Existing catalog has broad COORDINATE_GEOMETRY.
-- The class cycle separately teaches Straight Lines, Circles,
-- Parabola, Ellipse & Hyperbola, so Straight Lines deserves its
-- own canonical learning unit.
-- ============================================================

INSERT OR IGNORE INTO education_topics (
  subject_id,
  topic_code,
  topic_name,
  sort_order,
  enabled
)
SELECT
  s.id,
  'STRAIGHT_LINES',
  'Straight Lines',
  101,
  1
FROM education_subjects s
WHERE
  s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH';

UPDATE education_topics
SET
  topic_name = 'Straight Lines',
  enabled = 1
WHERE
  subject_id = (
    SELECT id
    FROM education_subjects
    WHERE
      country_code = 'IN'
      AND grade_code = 'PROGRAM_JEE'
      AND subject_code = 'MATH'
    LIMIT 1
  )
  AND topic_code = 'STRAIGHT_LINES';

INSERT OR IGNORE INTO education_subtopics (
  topic_id,
  subtopic_code,
  subtopic_name,
  sort_order,
  enabled
)
SELECT
  t.id,
  'STRAIGHT_LINES_CORE',
  'Straight Lines',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE
  s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'MATH'
  AND t.topic_code = 'STRAIGHT_LINES';


-- ============================================================
-- JEE PHYSICS — Center of Mass
-- ============================================================

INSERT OR IGNORE INTO education_topics (
  subject_id,
  topic_code,
  topic_name,
  sort_order,
  enabled
)
SELECT
  s.id,
  'CENTER_OF_MASS',
  'Center of Mass',
  101,
  1
FROM education_subjects s
WHERE
  s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Center of Mass',
  enabled = 1
WHERE
  subject_id = (
    SELECT id
    FROM education_subjects
    WHERE
      country_code = 'IN'
      AND grade_code = 'PROGRAM_JEE'
      AND subject_code = 'PHYSICS'
    LIMIT 1
  )
  AND topic_code = 'CENTER_OF_MASS';

INSERT OR IGNORE INTO education_subtopics (
  topic_id,
  subtopic_code,
  subtopic_name,
  sort_order,
  enabled
)
SELECT
  t.id,
  'CENTER_OF_MASS_CORE',
  'Center of Mass',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE
  s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'CENTER_OF_MASS';


-- ============================================================
-- NEET PHYSICS — Center of Mass
-- ============================================================

INSERT OR IGNORE INTO education_topics (
  subject_id,
  topic_code,
  topic_name,
  sort_order,
  enabled
)
SELECT
  s.id,
  'CENTER_OF_MASS',
  'Center of Mass',
  101,
  1
FROM education_subjects s
WHERE
  s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS';

UPDATE education_topics
SET
  topic_name = 'Center of Mass',
  enabled = 1
WHERE
  subject_id = (
    SELECT id
    FROM education_subjects
    WHERE
      country_code = 'IN'
      AND grade_code = 'PROGRAM_NEET'
      AND subject_code = 'PHYSICS'
    LIMIT 1
  )
  AND topic_code = 'CENTER_OF_MASS';

INSERT OR IGNORE INTO education_subtopics (
  topic_id,
  subtopic_code,
  subtopic_name,
  sort_order,
  enabled
)
SELECT
  t.id,
  'CENTER_OF_MASS_CORE',
  'Center of Mass',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE
  s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'CENTER_OF_MASS';




-- ============================================================
-- Verification
-- ============================================================

SELECT
  s.grade_code,
  s.subject_code,
  t.topic_code,
  t.topic_name,
  st.subtopic_code,
  COUNT(
    CASE
      WHEN q.active = 1
      THEN q.id
    END
  ) AS active_questions
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
WHERE
  (
    s.grade_code = 'PROGRAM_JEE'
    AND s.subject_code = 'MATH'
    AND t.topic_code = 'STRAIGHT_LINES'
  )
  OR (
    s.grade_code = 'PROGRAM_JEE'
    AND s.subject_code = 'PHYSICS'
    AND t.topic_code = 'CENTER_OF_MASS'
  )
  OR (
    s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code = 'PHYSICS'
    AND t.topic_code = 'CENTER_OF_MASS'
  )
GROUP BY
  s.grade_code,
  s.subject_code,
  t.id,
  t.topic_code,
  t.topic_name,
  st.id,
  st.subtopic_code
ORDER BY
  s.grade_code,
  s.subject_code;
