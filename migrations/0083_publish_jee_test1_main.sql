-- Publish JEE Test 1 Main v1 only when its fixed structure is complete.
UPDATE education_mock_tests
SET access_mode='OPEN', published=1, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1
  AND (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    WHERE mtq.mock_test_id=education_mock_tests.id
  )=75
  AND (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    JOIN education_questions q ON q.id=mtq.question_id
    JOIN education_question_metadata qm ON qm.question_id=q.id
    WHERE mtq.mock_test_id=education_mock_tests.id
      AND qm.question_format='NUMERICAL'
  )=15;
