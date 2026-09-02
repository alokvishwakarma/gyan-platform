-- Publish only the fixed JEE Mini A Main v1 pilot after the API/UI runner is installed.
-- It is safe because 0077 already assigned the fixed 15-question set.

UPDATE education_mock_tests
SET
  access_mode = 'OPEN',
  published = 1,
  updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'JEE'
  AND test_kind = 'MINI'
  AND test_code = 'MINI_A'
  AND exam_level = 'MAIN'
  AND version = 1
  AND (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    WHERE mtq.mock_test_id = education_mock_tests.id
  ) = 15;
