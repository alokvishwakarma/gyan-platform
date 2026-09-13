-- 0141b_discover_live_topic_codes.sql
--
-- Read-only discovery pass.
-- The class-schedule labels do not exactly match the database topic names,
-- so search the existing JEE/NEET catalogs by subject + useful name fragments.
--
-- No data changes.

SELECT
  s.grade_code,
  s.subject_code,
  t.id AS topic_id,
  t.topic_code,
  t.topic_name,
  t.enabled,
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
 AND st.enabled = 1

LEFT JOIN education_questions q
  ON q.subtopic_id = st.id

WHERE
  s.country_code = 'IN'
  AND s.grade_code IN (
    'PROGRAM_JEE',
    'PROGRAM_NEET'
  )
  AND (
       (
         s.subject_code = 'MATH'
         AND (
           lower(t.topic_name) LIKE '%straight%'
           OR lower(t.topic_code) LIKE '%straight%'
           OR lower(t.topic_name) LIKE '%line%'
           OR lower(t.topic_code) LIKE '%line%'
         )
       )

    OR (
         s.subject_code = 'PHYSICS'
         AND (
           lower(t.topic_name) LIKE '%center%'
           OR lower(t.topic_name) LIKE '%centre%'
           OR lower(t.topic_code) LIKE '%center%'
           OR lower(t.topic_code) LIKE '%centre%'
           OR lower(t.topic_name) LIKE '%mass%'
           OR lower(t.topic_code) LIKE '%mass%'
         )
       )

    OR (
         s.subject_code = 'CHEMISTRY'
         AND (
           lower(t.topic_name) LIKE '%equilibrium%'
           OR lower(t.topic_code) LIKE '%equilibrium%'
         )
       )

    OR (
         s.subject_code = 'BIOLOGY'
         AND (
           lower(t.topic_name) LIKE '%cell%'
           OR lower(t.topic_code) LIKE '%cell%'
         )
       )
  )

GROUP BY
  s.grade_code,
  s.subject_code,
  t.id,
  t.topic_code,
  t.topic_name,
  t.enabled

ORDER BY
  s.grade_code,
  s.subject_code,
  t.sort_order,
  t.topic_name;
