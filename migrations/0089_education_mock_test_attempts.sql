-- 0089_education_mock_test_attempts.sql

CREATE TABLE IF NOT EXISTS education_mock_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INTEGER NOT NULL,
  mock_test_id INTEGER NOT NULL,
  attempt_number INTEGER NOT NULL,
  elapsed_seconds INTEGER NOT NULL DEFAULT 0,
  save_count INTEGER NOT NULL DEFAULT 0,
  score INTEGER NOT NULL DEFAULT 0,
  maximum_marks INTEGER NOT NULL DEFAULT 0,
  correct_count INTEGER NOT NULL DEFAULT 0,
  incorrect_count INTEGER NOT NULL DEFAULT 0,
  unanswered_count INTEGER NOT NULL DEFAULT 0,
  submitted_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(student_id) REFERENCES education_students(id) ON DELETE CASCADE,
  FOREIGN KEY(mock_test_id) REFERENCES education_mock_tests(id) ON DELETE CASCADE,
  UNIQUE(student_id, mock_test_id, attempt_number)
);

CREATE INDEX IF NOT EXISTS idx_education_mock_attempts_student
ON education_mock_attempts(student_id, submitted_at DESC, id DESC);

CREATE TABLE IF NOT EXISTS education_mock_attempt_answers (
  attempt_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  selected_answer TEXT,
  marked_for_review INTEGER NOT NULL DEFAULT 0 CHECK(marked_for_review IN (0,1)),
  correct INTEGER NOT NULL DEFAULT 0 CHECK(correct IN (0,1)),
  marks_awarded INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY(attempt_id, question_id),
  FOREIGN KEY(attempt_id) REFERENCES education_mock_attempts(id) ON DELETE CASCADE,
  FOREIGN KEY(question_id) REFERENCES education_questions(id) ON DELETE CASCADE
) WITHOUT ROWID;

CREATE INDEX IF NOT EXISTS idx_education_mock_attempt_answers_question
ON education_mock_attempt_answers(question_id);
