-- gre_prod_audit.sql
-- Read-only audit for GRE production data.

-- 1) GRE question bank by subject
SELECT
  s.country_code,
  s.subject_code,
  COUNT(q.id) AS active_questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.grade_code='PROGRAM_GRE'
  AND q.active=1
GROUP BY s.country_code,s.subject_code
ORDER BY s.country_code,s.subject_code;

-- 2) GRE mock definitions
SELECT
  id,
  program_code,
  test_kind,
  test_code,
  exam_level,
  version,
  access_mode,
  published
FROM education_mock_tests
WHERE program_code='GRE'
ORDER BY test_kind,test_code;

-- 3) GRE mock question mappings
SELECT
  mt.id AS mock_test_id,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  COUNT(mtq.question_id) AS question_count
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='GRE'
GROUP BY mt.id,mt.test_kind,mt.test_code,mt.exam_level
ORDER BY mt.test_kind,mt.test_code;

-- 4) GRE extension rows
SELECT
  gd.section_kind,
  gd.response_type,
  COUNT(*) AS detail_rows
FROM education_gre_question_details gd
GROUP BY gd.section_kind,gd.response_type
ORDER BY gd.section_kind,gd.response_type;
