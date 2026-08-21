-- 0055_education_student_progress.sql
-- Student cards, saved 5-question attempts, and topic mastery.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  student_code TEXT NOT NULL UNIQUE,
  student_name TEXT NOT NULL,

  email TEXT NOT NULL,
  user_id INTEGER,

  country_code TEXT NOT NULL,
  grade_code TEXT NOT NULL,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(user_id)
    REFERENCES users(id)
    ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_education_students_email
  ON education_students(email);

CREATE INDEX IF NOT EXISTS idx_education_students_user
  ON education_students(user_id);

CREATE TABLE IF NOT EXISTS education_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  student_id INTEGER NOT NULL,
  subject_code TEXT NOT NULL,
  topic_code TEXT NOT NULL,

  question_count INTEGER NOT NULL,
  correct_count INTEGER NOT NULL,

  score_percent INTEGER NOT NULL,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_education_attempts_student_topic
  ON education_attempts(
    student_id,
    topic_code,
    created_at
  );

CREATE TABLE IF NOT EXISTS education_attempt_answers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  attempt_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  selected_choice TEXT NOT NULL
    CHECK (selected_choice IN ('A','B','C','D')),

  correct INTEGER NOT NULL
    CHECK (correct IN (0,1)),

  FOREIGN KEY(attempt_id)
    REFERENCES education_attempts(id)
    ON DELETE CASCADE,

  FOREIGN KEY(question_id)
    REFERENCES education_questions(id)
    ON DELETE RESTRICT,

  UNIQUE(attempt_id, question_id)
);

CREATE TABLE IF NOT EXISTS education_topic_mastery (
  student_id INTEGER NOT NULL,
  subject_code TEXT NOT NULL,
  topic_code TEXT NOT NULL,

  attempts INTEGER NOT NULL DEFAULT 0,
  questions_answered INTEGER NOT NULL DEFAULT 0,
  correct_answers INTEGER NOT NULL DEFAULT 0,

  score_percent INTEGER NOT NULL DEFAULT 0,

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY(
    student_id,
    subject_code,
    topic_code
  ),

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_education_topic_mastery_student
  ON education_topic_mastery(student_id, subject_code);
