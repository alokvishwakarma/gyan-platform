CREATE TABLE IF NOT EXISTS _foundation_attempt_cleanup (
  attempt_id INTEGER PRIMARY KEY
);

DELETE FROM _foundation_attempt_cleanup;

INSERT OR IGNORE INTO _foundation_attempt_cleanup (
  attempt_id
)
SELECT DISTINCT
  aa.attempt_id
FROM education_attempt_answers aa
JOIN education_questions q
  ON q.id = aa.question_id
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE
  s.grade_code NOT LIKE 'PROGRAM_%';


DELETE FROM education_attempt_answers
WHERE attempt_id IN (
  SELECT attempt_id
  FROM _foundation_attempt_cleanup
);


DELETE FROM education_attempts
WHERE id IN (
  SELECT attempt_id
  FROM _foundation_attempt_cleanup
);


DELETE FROM education_student_question_history
WHERE question_id IN (
  SELECT q.id
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE s.grade_code NOT LIKE 'PROGRAM_%'
);


DELETE FROM education_topic_mastery
WHERE student_id IN (
  SELECT id
  FROM education_students
  WHERE grade_code NOT LIKE 'PROGRAM_%'
);


DROP TABLE _foundation_attempt_cleanup;


SELECT
  COUNT(*) AS attempts
FROM education_attempts;


SELECT
  COUNT(*) AS answer_rows
FROM education_attempt_answers;


SELECT
  COUNT(*) AS history_rows
FROM education_student_question_history;


SELECT
  COUNT(*) AS mastery_rows
FROM education_topic_mastery;