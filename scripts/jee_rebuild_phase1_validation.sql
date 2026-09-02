-- READ-ONLY validation for GYAN IIT-JEE Phase 1.

-- 1) Subject existence
SELECT id, country_code, grade_code, subject_code, subject_name, enabled
FROM education_subjects
WHERE country_code='IN'
  AND grade_code='PROGRAM_JEE'
ORDER BY subject_code;

-- 2) New topic catalog and question counts
SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  t.enabled,
  COUNT(DISTINCT st.id) AS subtopics,
  COUNT(q.id) AS questions
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
LEFT JOIN education_subtopics st ON st.topic_id=t.id
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
GROUP BY s.subject_code,t.id,t.topic_code,t.topic_name,t.enabled
ORDER BY s.subject_code,t.sort_order,t.topic_name;

-- 3) Catalog totals
SELECT
  s.subject_code,
  COUNT(DISTINCT t.id) AS topic_count,
  COUNT(DISTINCT st.id) AS subtopic_count,
  COUNT(q.id) AS active_question_count
FROM education_subjects s
LEFT JOIN education_topics t
  ON t.subject_id=s.id AND t.enabled=1
LEFT JOIN education_subtopics st
  ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
GROUP BY s.subject_code
ORDER BY s.subject_code;

-- 4) Fixed test shells: no random question selection is permitted here.
SELECT
  program_code,
  test_kind,
  test_code,
  test_name,
  exam_level,
  version,
  access_mode,
  published,
  (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    WHERE mtq.mock_test_id=mt.id
  ) AS assigned_questions
FROM education_mock_tests mt
WHERE program_code='JEE'
ORDER BY
  CASE test_kind WHEN 'FULL' THEN 1 ELSE 2 END,
  test_code,
  exam_level;

-- 5) Critical invariant: a published test must have assigned fixed questions.
SELECT
  mt.id,
  mt.test_name,
  mt.exam_level,
  mt.published,
  COUNT(mtq.question_id) AS assigned_questions
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='JEE'
GROUP BY mt.id
HAVING mt.published=1
   AND COUNT(mtq.question_id)=0;
