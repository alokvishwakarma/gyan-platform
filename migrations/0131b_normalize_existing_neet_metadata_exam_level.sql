-- 0131b_normalize_existing_neet_metadata_exam_level.sql
-- Normalize pre-existing NEET_2026 metadata rows that existed before
-- exam_level='NEET' was allowed by the schema.
--
-- Scope is strictly questions physically belonging to PROGRAM_NEET
-- proper named topics. JEE and other programs are untouched.

PRAGMA foreign_keys = ON;

UPDATE education_question_metadata
SET
  exam_level = 'NEET',
  updated_at = CURRENT_TIMESTAMP
WHERE syllabus_version = 'NEET_2026'
  AND question_id IN (
    SELECT q.id
    FROM education_questions q
    JOIN education_subtopics st
      ON st.id = q.subtopic_id
    JOIN education_topics t
      ON t.id = st.topic_id
    JOIN education_subjects s
      ON s.id = t.subject_id
    WHERE s.country_code = 'IN'
      AND s.grade_code = 'PROGRAM_NEET'
      AND s.subject_code IN (
        'PHYSICS',
        'CHEMISTRY',
        'BIOLOGY'
      )
      AND t.topic_code <> s.subject_code
  );

-- Verify the first five Physics topics.
SELECT
  t.sort_order,
  t.topic_code,
  COUNT(q.id) AS active_questions,

  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
      THEN 1 ELSE 0
    END
  ) AS tracked_neet_2026,

  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
       AND qm.quality_status='REVIEWED'
      THEN 1 ELSE 0
    END
  ) AS reviewed,

  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
       AND qm.quality_status='DRAFT'
      THEN 1 ELSE 0
    END
  ) AS draft

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
  AND t.enabled=1
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
