-- 0141_audit_first_live_topics.sql
--
-- Audit the Sep 9 Live Test source topics before freezing question IDs.
-- Read-only. Safe on local or remote.
--
-- JEE #237J:
--   Straight Lines
--   Center of Mass
--   Chemical Equilibrium
--
-- NEET #237N:
--   Center of Mass
--   Chemical Equilibrium
--   Cell: The Unit of Life

WITH wanted(program_code, subject_code, topic_name) AS (
  VALUES
    ('JEE',  'MATH',      'Straight Lines'),
    ('JEE',  'PHYSICS',   'Center of Mass'),
    ('JEE',  'CHEMISTRY', 'Chemical Equilibrium'),

    ('NEET', 'PHYSICS',   'Center of Mass'),
    ('NEET', 'CHEMISTRY', 'Chemical Equilibrium'),
    ('NEET', 'BIOLOGY',   'Cell: The Unit of Life')
)
SELECT
  w.program_code,
  w.subject_code,
  w.topic_name AS wanted_topic_name,

  s.country_code,
  s.grade_code,
  s.subject_code AS db_subject_code,

  t.id AS topic_id,
  t.topic_code,
  t.topic_name AS db_topic_name,
  t.enabled AS topic_enabled,

  COUNT(
    CASE
      WHEN q.active = 1
      THEN q.id
    END
  ) AS active_questions

FROM wanted w

LEFT JOIN education_subjects s
  ON s.subject_code = w.subject_code
 AND (
      (w.program_code = 'JEE'  AND s.grade_code = 'PROGRAM_JEE')
   OR (w.program_code = 'NEET' AND s.grade_code = 'PROGRAM_NEET')
 )

LEFT JOIN education_topics t
  ON t.subject_id = s.id
 AND lower(trim(t.topic_name)) =
     lower(trim(w.topic_name))

LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
 AND st.enabled = 1

LEFT JOIN education_questions q
  ON q.subtopic_id = st.id

GROUP BY
  w.program_code,
  w.subject_code,
  w.topic_name,
  s.country_code,
  s.grade_code,
  s.subject_code,
  t.id,
  t.topic_code,
  t.topic_name,
  t.enabled

ORDER BY
  w.program_code,
  CASE w.subject_code
    WHEN 'MATH' THEN 1
    WHEN 'PHYSICS' THEN 2
    WHEN 'CHEMISTRY' THEN 3
    WHEN 'BIOLOGY' THEN 4
    ELSE 9
  END;
