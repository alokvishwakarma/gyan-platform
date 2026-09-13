-- 0142b_live_schedule_catalog_audit.sql
--
-- Read-only whole-cycle audit helper.
--
-- Run after 0142. Paste class labels from the schedule into the VALUES
-- block as we expand the mapping. It deliberately separates:
--   EXACT_TOPIC
--   EXACT_SUBTOPIC
--   MISSING
--
-- This prevents fuzzy mappings from silently becoming curriculum truth.

WITH schedule_labels(
  program_code,
  subject_code,
  class_label
) AS (
  VALUES
    ('JEE','MATH','Straight Lines'),
    ('JEE','PHYSICS','Center of Mass'),
    ('JEE','CHEMISTRY','Chemical Equilibrium'),
    ('NEET','PHYSICS','Center of Mass'),
    ('NEET','CHEMISTRY','Chemical Equilibrium'),
    ('NEET','BIOLOGY','Cell: The Unit of Life')
),

matches AS (
  SELECT
    sl.program_code,
    sl.subject_code,
    sl.class_label,

    s.grade_code,

    t.topic_code,
    t.topic_name,

    st.subtopic_code,
    st.subtopic_name,

    CASE
      WHEN lower(trim(t.topic_name)) =
           lower(trim(sl.class_label))
      THEN 'EXACT_TOPIC'

      WHEN lower(trim(st.subtopic_name)) =
           lower(trim(sl.class_label))
      THEN 'EXACT_SUBTOPIC'

      ELSE NULL
    END AS match_kind

  FROM schedule_labels sl

  LEFT JOIN education_subjects s
    ON s.country_code = 'IN'
   AND s.subject_code = sl.subject_code
   AND s.grade_code =
     CASE
       WHEN sl.program_code = 'JEE'
       THEN 'PROGRAM_JEE'
       WHEN sl.program_code = 'NEET'
       THEN 'PROGRAM_NEET'
       ELSE ''
     END

  LEFT JOIN education_topics t
    ON t.subject_id = s.id
   AND t.enabled = 1

  LEFT JOIN education_subtopics st
    ON st.topic_id = t.id
   AND st.enabled = 1
)

SELECT
  program_code,
  subject_code,
  class_label,

  COALESCE(
    MAX(match_kind),
    'MISSING'
  ) AS mapping_status,

  MAX(
    CASE
      WHEN match_kind IS NOT NULL
      THEN topic_code
    END
  ) AS topic_code,

  MAX(
    CASE
      WHEN match_kind IS NOT NULL
      THEN subtopic_code
    END
  ) AS subtopic_code

FROM matches

GROUP BY
  program_code,
  subject_code,
  class_label

ORDER BY
  program_code,
  subject_code,
  class_label;
