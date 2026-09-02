-- GYAN IIT-JEE rebuild
-- Whole-JEE read-only audit after 0074/0075/0076
-- Safe to run locally. No writes.

-- 1) Enabled new-topic counts by subject.
SELECT
  s.subject_code,
  COUNT(DISTINCT t.id) AS enabled_topics
FROM education_subjects s
JOIN education_topics t
  ON t.subject_id = s.id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code IN ('MATH','PHYSICS','CHEMISTRY')
  AND t.enabled = 1
GROUP BY s.subject_code
ORDER BY s.subject_code;

-- 2) Every enabled JEE topic should have at least 5 active rebuild questions.
SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS rebuild_questions,
  COUNT(DISTINCT q.question_text) AS unique_question_texts
FROM education_subjects s
JOIN education_topics t
  ON t.subject_id = s.id
LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
 AND st.enabled = 1
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
 AND q.active = 1
 AND q.source_type = 'jee-rebuild-v1'
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code IN ('MATH','PHYSICS','CHEMISTRY')
  AND t.enabled = 1
GROUP BY s.subject_code, t.id, t.topic_code, t.topic_name
ORDER BY
  CASE s.subject_code
    WHEN 'MATH' THEN 1
    WHEN 'PHYSICS' THEN 2
    WHEN 'CHEMISTRY' THEN 3
    ELSE 4
  END,
  t.sort_order,
  t.topic_name;

-- 3) Expected starter totals by subject.
SELECT
  s.subject_code,
  COUNT(q.id) AS rebuild_questions,
  COUNT(DISTINCT q.question_key) AS unique_question_keys,
  COUNT(DISTINCT q.question_text) AS unique_question_texts
FROM education_questions q
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code IN ('MATH','PHYSICS','CHEMISTRY')
  AND q.active = 1
  AND q.source_type = 'jee-rebuild-v1'
GROUP BY s.subject_code
ORDER BY s.subject_code;

-- 4) Whole starter bank totals.
SELECT
  COUNT(q.id) AS total_rebuild_questions,
  COUNT(DISTINCT q.question_key) AS unique_question_keys,
  COUNT(DISTINCT q.question_text) AS unique_question_texts
FROM education_questions q
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code IN ('MATH','PHYSICS','CHEMISTRY')
  AND q.active = 1
  AND q.source_type = 'jee-rebuild-v1';

-- 5) Any enabled topic below the UI threshold of 5 questions?
-- Expected: ZERO rows.
SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS rebuild_questions
FROM education_subjects s
JOIN education_topics t
  ON t.subject_id = s.id
LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
 AND st.enabled = 1
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
 AND q.active = 1
 AND q.source_type = 'jee-rebuild-v1'
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND s.subject_code IN ('MATH','PHYSICS','CHEMISTRY')
  AND t.enabled = 1
GROUP BY s.subject_code, t.id, t.topic_code, t.topic_name
HAVING COUNT(q.id) < 5
ORDER BY s.subject_code, t.sort_order;

-- 6) Duplicate question keys in the rebuild bank?
-- Expected: ZERO rows.
SELECT
  q.question_key,
  COUNT(*) AS copies
FROM education_questions q
WHERE q.source_type = 'jee-rebuild-v1'
  AND q.question_key LIKE 'IN_PROGRAM_JEE_%'
GROUP BY q.question_key
HAVING COUNT(*) > 1
ORDER BY copies DESC, q.question_key;

-- 7) Duplicate question text inside the rebuild bank?
-- Expected: ZERO rows for the starter bank.
SELECT
  q.question_text,
  COUNT(*) AS copies
FROM education_questions q
WHERE q.source_type = 'jee-rebuild-v1'
  AND q.question_key LIKE 'IN_PROGRAM_JEE_%'
GROUP BY q.question_text
HAVING COUNT(*) > 1
ORDER BY copies DESC, q.question_text;

-- 8) Metadata coverage.
-- Expected: 300 rows, all REVIEWED / SINGLE_CHOICE, no missing metadata.
SELECT
  qm.exam_level,
  qm.question_format,
  qm.quality_status,
  COUNT(*) AS questions
FROM education_question_metadata qm
JOIN education_questions q
  ON q.id = qm.question_id
WHERE q.source_type = 'jee-rebuild-v1'
  AND q.question_key LIKE 'IN_PROGRAM_JEE_%'
GROUP BY qm.exam_level, qm.question_format, qm.quality_status
ORDER BY qm.exam_level, qm.question_format, qm.quality_status;

-- 9) Rebuild questions without metadata?
-- Expected: ZERO rows.
SELECT
  q.id,
  q.question_key
FROM education_questions q
LEFT JOIN education_question_metadata qm
  ON qm.question_id = q.id
WHERE q.source_type = 'jee-rebuild-v1'
  AND q.question_key LIKE 'IN_PROGRAM_JEE_%'
  AND qm.question_id IS NULL
ORDER BY q.question_key;

-- 10) Confirm old broad legacy JEE topic buckets are disabled.
SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  t.enabled
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_JEE'
  AND t.topic_code IN ('MATH','MATHEMATICS','PHYSICS','CHEMISTRY')
ORDER BY s.subject_code, t.topic_code;

-- 11) Confirm fixed test shells remain unpopulated/unpublished for now.
SELECT
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mt.access_mode,
  mt.published,
  COUNT(mtq.question_id) AS assigned_questions
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
WHERE mt.program_code = 'JEE'
GROUP BY
  mt.id,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mt.access_mode,
  mt.published
ORDER BY
  CASE mt.test_kind WHEN 'FULL' THEN 1 ELSE 2 END,
  mt.test_code,
  mt.exam_level;

-- 12) Critical invariant: no published JEE test without fixed questions.
-- Expected: ZERO rows.
SELECT
  mt.id,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mt.published,
  COUNT(mtq.question_id) AS assigned_questions
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
WHERE mt.program_code = 'JEE'
GROUP BY mt.id
HAVING mt.published = 1
   AND COUNT(mtq.question_id) = 0;
