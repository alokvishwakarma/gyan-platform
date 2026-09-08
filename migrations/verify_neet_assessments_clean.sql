-- verify_neet_assessments_clean.sql
SELECT
  mt.test_kind,
  mt.test_code,
  mt.test_name,
  mt.published,
  COUNT(mtq.question_id) AS question_count,
  SUM(CASE WHEN mtq.section_code='PHYSICS' THEN 1 ELSE 0 END) AS physics,
  SUM(CASE WHEN mtq.section_code='CHEMISTRY' THEN 1 ELSE 0 END) AS chemistry,
  SUM(CASE WHEN mtq.section_code='BIOLOGY' THEN 1 ELSE 0 END) AS biology
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='NEET'
  AND mt.version=1
  AND (
    (mt.test_kind='MINI' AND mt.test_code='MINI_A')
    OR
    (mt.test_kind='FULL' AND mt.test_code='TEST_1')
  )
GROUP BY mt.id
ORDER BY CASE mt.test_kind WHEN 'FULL' THEN 1 ELSE 2 END;

SELECT COUNT(*) AS legacy_mock_refs
FROM education_mock_test_questions mtq
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
  AND t.topic_code=s.subject_code;
