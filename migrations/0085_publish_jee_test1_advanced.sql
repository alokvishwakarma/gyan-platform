-- Publish JEE Test 1 Advanced v1 only when the complete fixed bank exists.
-- 0085_publish_jee_test1_advanced.sql

UPDATE education_mock_tests
SET access_mode='OPEN', published=1, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='ADVANCED'
  AND version=1
  AND (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    WHERE mtq.mock_test_id=education_mock_tests.id
  )=54
  AND (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
    WHERE mtq.mock_test_id=education_mock_tests.id
      AND qm.question_format='SINGLE_CHOICE'
  )=18
  AND (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
    WHERE mtq.mock_test_id=education_mock_tests.id
      AND qm.question_format='MULTI_SELECT'
  )=18
  AND (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
    WHERE mtq.mock_test_id=education_mock_tests.id
      AND qm.question_format='NUMERICAL'
  )=18;
