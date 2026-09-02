-- 0088_education_unique_question_history.sql
-- Exact cumulative unique-question exposure.
-- Repeating a question does not add another row.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_student_question_history (
  student_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  first_attempted_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (
    student_id,
    question_id
  ),

  FOREIGN KEY (student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE,

  FOREIGN KEY (question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE
) WITHOUT ROWID;
