-- validate_0091_education_protection.sql

SELECT
  s.id AS student_id,
  s.student_code,
  epm.milestone_25_shown,
  epm.milestone_50_shown,
  epm.updated_at
FROM education_students s
LEFT JOIN education_protection_milestones epm
  ON epm.student_id = s.id
ORDER BY s.id DESC
LIMIT 20;

SELECT
  s.student_code,
  (
    SELECT COUNT(*)
    FROM education_attempt_answers aa
    JOIN education_attempts a
      ON a.id = aa.attempt_id
    WHERE a.student_id = s.id
      AND aa.selected_choice IS NOT NULL
      AND TRIM(aa.selected_choice) <> ''
  ) AS practice_answers,
  (
    SELECT COUNT(*)
    FROM education_mock_attempt_answers maa
    JOIN education_mock_attempts ma
      ON ma.id = maa.attempt_id
    WHERE ma.student_id = s.id
      AND maa.selected_answer IS NOT NULL
      AND TRIM(maa.selected_answer) <> ''
  ) AS mock_answers
FROM education_students s
ORDER BY s.id DESC
LIMIT 20;
