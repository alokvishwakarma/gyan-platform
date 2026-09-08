-- audit_neet_physics_25_target.sql
-- Exact post-rebuild Physics inventory before expanding to 25/topic.

SELECT
  t.sort_order,
  t.topic_code,
  t.topic_name,
  st.subtopic_code,
  COUNT(q.id) AS active_questions,
  SUM(
    CASE
      WHEN qm.quality_status IN ('REVIEWED','PUBLISHED')
       AND qm.syllabus_version='NEET_2026'
      THEN 1 ELSE 0
    END
  ) AS reviewed_neet_2026,
  SUM(CASE WHEN q.source_type='neet-starter-v1' THEN 1 ELSE 0 END) AS starter_questions,
  SUM(CASE WHEN q.source_type='gyan-quality-test1' THEN 1 ELSE 0 END) AS test1_quality_questions,
  SUM(CASE WHEN q.source_type='neet-2026-quality-v2' THEN 1 ELSE 0 END) AS expansion_v2_questions,
  CASE
    WHEN COUNT(q.id) >= 25 THEN 0
    ELSE 25 - COUNT(q.id)
  END AS questions_needed_for_25
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
  AND t.topic_code <> 'PHYSICS'
GROUP BY
  t.id,
  t.sort_order,
  t.topic_code,
  t.topic_name,
  st.id,
  st.subtopic_code
ORDER BY
  t.sort_order,
  st.sort_order;

SELECT
  COUNT(DISTINCT t.id) AS physics_topics,
  COUNT(q.id) AS active_physics_questions,
  SUM(
    CASE
      WHEN qm.quality_status IN ('REVIEWED','PUBLISHED')
       AND qm.syllabus_version='NEET_2026'
      THEN 1 ELSE 0
    END
  ) AS reviewed_physics_questions
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
  AND t.topic_code <> 'PHYSICS';
