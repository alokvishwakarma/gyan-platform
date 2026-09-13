-- 0126_education_reporting_summaries.sql
-- Keep detailed attempt/history data, but use compact summaries for
-- routine topic/subtopic progress reporting.

ALTER TABLE education_topic_mastery
ADD COLUMN unique_questions_attempted INTEGER NOT NULL DEFAULT 0;

UPDATE education_topic_mastery
SET unique_questions_attempted = (
  SELECT COUNT(*)
  FROM education_student_question_history h
  JOIN education_questions q
    ON q.id = h.question_id
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    h.student_id =
      education_topic_mastery.student_id
    AND s.subject_code =
      education_topic_mastery.subject_code
    AND t.topic_code =
      education_topic_mastery.topic_code
    AND q.active = 1
);

CREATE TABLE education_subtopic_mastery (
  student_id INTEGER NOT NULL,
  subject_code TEXT NOT NULL,
  topic_code TEXT NOT NULL,
  subtopic_code TEXT NOT NULL,

  attempts INTEGER NOT NULL DEFAULT 0,
  questions_answered INTEGER NOT NULL DEFAULT 0,
  correct_answers INTEGER NOT NULL DEFAULT 0,
  unique_questions_attempted INTEGER NOT NULL DEFAULT 0,
  score_percent INTEGER NOT NULL DEFAULT 0,

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (
    student_id,
    subject_code,
    topic_code,
    subtopic_code
  ),

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE
);

CREATE INDEX idx_education_subtopic_mastery_student
ON education_subtopic_mastery(
  student_id,
  subject_code,
  topic_code
);

INSERT INTO education_subtopic_mastery (
  student_id,
  subject_code,
  topic_code,
  subtopic_code,
  attempts,
  questions_answered,
  correct_answers,
  unique_questions_attempted,
  score_percent,
  updated_at
)
SELECT
  a.student_id,
  s.subject_code,
  t.topic_code,
  st.subtopic_code,
  COUNT(DISTINCT a.id),
  COUNT(*),
  SUM(
    CASE
      WHEN aa.correct = 1
        THEN 1
      ELSE 0
    END
  ),
  COUNT(DISTINCT aa.question_id),
  ROUND(
    SUM(
      CASE
        WHEN aa.correct = 1
          THEN 1
        ELSE 0
      END
    ) *
    100.0 /
    COUNT(*)
  ),
  MAX(a.created_at)

FROM education_attempt_answers aa
JOIN education_attempts a
  ON a.id = aa.attempt_id
JOIN education_questions q
  ON q.id = aa.question_id
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id

WHERE q.active = 1

GROUP BY
  a.student_id,
  s.subject_code,
  t.topic_code,
  st.subtopic_code;
