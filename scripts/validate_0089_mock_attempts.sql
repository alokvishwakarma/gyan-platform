SELECT
  ma.id,
  ma.student_id,
  mt.test_name,
  mt.exam_level,
  ma.attempt_number,
  ma.score,
  ma.maximum_marks,
  ma.correct_count,
  ma.incorrect_count,
  ma.unanswered_count,
  ma.elapsed_seconds,
  ma.save_count,
  ma.submitted_at
FROM education_mock_attempts ma
JOIN education_mock_tests mt
  ON mt.id = ma.mock_test_id
ORDER BY ma.id DESC
LIMIT 20;

SELECT
  attempt_id,
  COUNT(*) AS answer_rows,
  SUM(correct) AS correct_rows,
  SUM(
    CASE
      WHEN selected_answer IS NULL
        OR selected_answer = ''
      THEN 1
      ELSE 0
    END
  ) AS unanswered_rows
FROM education_mock_attempt_answers
GROUP BY attempt_id
ORDER BY attempt_id DESC
LIMIT 20;
