-- 0141c_discover_live_subtopics.sql
--
-- Read-only discovery pass across BOTH topic and subtopic names/codes.
-- This is needed because class labels such as "Straight Lines" and
-- "Center of Mass" may live as subtopics under broader catalog topics.
--
-- No data changes.

WITH candidates AS (
  SELECT
    s.grade_code,
    s.subject_code,

    t.id AS topic_id,
    t.topic_code,
    t.topic_name,
    t.enabled AS topic_enabled,

    st.id AS subtopic_id,
    st.subtopic_code,
    st.subtopic_name,
    st.enabled AS subtopic_enabled,

    COUNT(
      CASE
        WHEN q.active = 1
        THEN q.id
      END
    ) AS active_questions

  FROM education_subjects s

  JOIN education_topics t
    ON t.subject_id = s.id

  LEFT JOIN education_subtopics st
    ON st.topic_id = t.id

  LEFT JOIN education_questions q
    ON q.subtopic_id = st.id

  WHERE
    s.country_code = 'IN'
    AND s.grade_code IN (
      'PROGRAM_JEE',
      'PROGRAM_NEET'
    )

  GROUP BY
    s.grade_code,
    s.subject_code,
    t.id,
    t.topic_code,
    t.topic_name,
    t.enabled,
    st.id,
    st.subtopic_code,
    st.subtopic_name,
    st.enabled
)

SELECT *
FROM candidates

WHERE
  (
    grade_code = 'PROGRAM_JEE'
    AND subject_code = 'MATH'
    AND (
      lower(topic_name) LIKE '%straight%'
      OR lower(topic_code) LIKE '%straight%'
      OR lower(topic_name) LIKE '%coordinate%'
      OR lower(topic_code) LIKE '%coordinate%'
      OR lower(subtopic_name) LIKE '%straight%'
      OR lower(subtopic_code) LIKE '%straight%'
      OR lower(subtopic_name) LIKE '%line%'
      OR lower(subtopic_code) LIKE '%line%'
    )
  )

  OR

  (
    grade_code = 'PROGRAM_JEE'
    AND subject_code = 'PHYSICS'
    AND (
      lower(topic_name) LIKE '%center%'
      OR lower(topic_name) LIKE '%centre%'
      OR lower(topic_name) LIKE '%mass%'
      OR lower(topic_code) LIKE '%center%'
      OR lower(topic_code) LIKE '%centre%'
      OR lower(topic_code) LIKE '%mass%'
      OR lower(subtopic_name) LIKE '%center%'
      OR lower(subtopic_name) LIKE '%centre%'
      OR lower(subtopic_name) LIKE '%mass%'
      OR lower(subtopic_code) LIKE '%center%'
      OR lower(subtopic_code) LIKE '%centre%'
      OR lower(subtopic_code) LIKE '%mass%'
    )
  )

  OR

  (
    grade_code = 'PROGRAM_NEET'
    AND subject_code = 'PHYSICS'
    AND (
      lower(topic_name) LIKE '%center%'
      OR lower(topic_name) LIKE '%centre%'
      OR lower(topic_name) LIKE '%mass%'
      OR lower(topic_code) LIKE '%center%'
      OR lower(topic_code) LIKE '%centre%'
      OR lower(topic_code) LIKE '%mass%'
      OR lower(subtopic_name) LIKE '%center%'
      OR lower(subtopic_name) LIKE '%centre%'
      OR lower(subtopic_name) LIKE '%mass%'
      OR lower(subtopic_code) LIKE '%center%'
      OR lower(subtopic_code) LIKE '%centre%'
      OR lower(subtopic_code) LIKE '%mass%'
    )
  )

ORDER BY
  grade_code,
  subject_code,
  topic_id,
  subtopic_id;
