-- validate_0088_education_unique_question_history.sql

SELECT
  name,
  sql
FROM sqlite_master
WHERE type = 'table'
  AND name = 'education_student_question_history';

SELECT
  COUNT(*) AS unique_question_rows
FROM education_student_question_history;

SELECT
  student_id,
  COUNT(*) AS unique_questions
FROM education_student_question_history
GROUP BY student_id
ORDER BY unique_questions DESC
LIMIT 10;
