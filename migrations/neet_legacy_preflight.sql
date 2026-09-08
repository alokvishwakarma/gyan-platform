-- NEET legacy mega-bank preflight.
-- Expect mock_refs = 0 before permanent deletion.

SELECT
  s.subject_code,
  t.topic_code,
  COUNT(DISTINCT q.id) AS questions,
  COUNT(DISTINCT mtq.mock_test_id) AS mock_tests_using_questions
FROM education_questions q
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
LEFT JOIN education_mock_test_questions mtq
  ON mtq.question_id = q.id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
  AND t.topic_code = s.subject_code
GROUP BY s.subject_code, t.topic_code
ORDER BY s.subject_code;

SELECT COUNT(*) AS total_mock_refs
FROM education_mock_test_questions mtq
WHERE mtq.question_id IN (
  SELECT q.id
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND t.topic_code=s.subject_code
);
