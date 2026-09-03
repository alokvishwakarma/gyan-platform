-- validate_0090_mock_attempts_compatibility.sql

PRAGMA table_info(education_mock_attempts);

PRAGMA table_info(education_mock_attempt_answers);

SELECT
  id,
  student_id,
  mock_test_id,
  attempt_number,
  elapsed_seconds,
  save_count,
  score,
  max_score,
  correct_count,
  incorrect_count,
  unanswered_count,
  submitted_at
FROM education_mock_attempts
ORDER BY id DESC
LIMIT 20;

SELECT
  attempt_id,
  COUNT(*) AS answer_rows,
  SUM(CASE WHEN correct = 1 THEN 1 ELSE 0 END) AS correct_rows,
  SUM(
    CASE
      WHEN selected_answer IS NULL
        OR selected_answer = ''
      THEN 1 ELSE 0
    END
  ) AS unanswered_rows,
  SUM(CASE WHEN marked_for_review = 1 THEN 1 ELSE 0 END) AS review_rows
FROM education_mock_attempt_answers
GROUP BY attempt_id
ORDER BY attempt_id DESC
LIMIT 20;
