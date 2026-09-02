-- Publish JEE Mini A Advanced v1 only when complete.
-- 0087_publish_jee_mini_a_advanced.sql
UPDATE education_mock_tests
SET access_mode='OPEN', published=1, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='MINI'
  AND test_code='MINI_A'
  AND exam_level='ADVANCED'
  AND version=1
  AND (
    SELECT COUNT(*) FROM education_mock_test_questions mtq
    WHERE mtq.mock_test_id=education_mock_tests.id
  )=15
  AND (
    SELECT COUNT(*) FROM education_mock_test_questions mtq
    JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
    WHERE mtq.mock_test_id=education_mock_tests.id
      AND qm.question_format='SINGLE_CHOICE'
  )=6
  AND (
    SELECT COUNT(*) FROM education_mock_test_questions mtq
    JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
    WHERE mtq.mock_test_id=education_mock_tests.id
      AND qm.question_format='MULTI_SELECT'
  )=6
  AND (
    SELECT COUNT(*) FROM education_mock_test_questions mtq
    JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
    WHERE mtq.mock_test_id=education_mock_tests.id
      AND qm.question_format='NUMERICAL'
  )=3;
