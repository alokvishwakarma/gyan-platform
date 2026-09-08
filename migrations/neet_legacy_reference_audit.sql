SELECT 'attempt_answers' AS source, COUNT(*) AS refs
FROM education_attempt_answers aa
WHERE aa.question_id IN (
  SELECT q.id
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND t.topic_code=s.subject_code
)

UNION ALL

SELECT 'mock_attempt_answers', COUNT(*)
FROM education_mock_attempt_answers maa
WHERE maa.question_id IN (
  SELECT q.id
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND t.topic_code=s.subject_code
)

UNION ALL

SELECT 'mock_test_questions', COUNT(*)
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
)

UNION ALL

SELECT 'question_metadata', COUNT(*)
FROM education_question_metadata qm
WHERE qm.question_id IN (
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
