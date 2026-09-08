-- 0126_clean_education_practice_reporting.sql
-- Clean reset of ORDINARY education practice history/progress.
-- Mock-test history and all curriculum/question catalog data are untouched.
--
-- New progress identity:
--   student + grade/program + subject + topic [+ subtopic]
--
-- Existing ordinary practice history is intentionally discarded so the
-- new schema starts without JEE/NEET/grade collisions or legacy ambiguity.

PRAGMA foreign_keys = OFF;

-- ------------------------------------------------------------
-- 1. Remove ordinary practice history/mastery.
-- ------------------------------------------------------------

DROP TABLE IF EXISTS education_subtopic_mastery;
DROP TABLE IF EXISTS education_attempt_answers;
DROP TABLE IF EXISTS education_attempts;
DROP TABLE IF EXISTS education_topic_mastery;

DELETE FROM education_student_question_history;
DELETE FROM education_practice_cursors;

-- ------------------------------------------------------------
-- 2. Recreate ordinary practice attempts with grade_code.
-- ------------------------------------------------------------

CREATE TABLE education_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  student_id INTEGER NOT NULL,
  grade_code TEXT NOT NULL,
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

CREATE INDEX idx_education_attempts_student_grade_topic
ON education_attempts(
  student_id,
  grade_code,
  subject_code,
  topic_code,
  created_at
);

CREATE INDEX idx_education_attempts_student_created
ON education_attempts(
  student_id,
  created_at
);

CREATE TABLE education_attempt_answers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  attempt_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  selected_choice TEXT NOT NULL
    CHECK (
      selected_choice IN (
        'A','B','C','D'
      )
    ),

  correct INTEGER NOT NULL
    CHECK (
      correct IN (
        0,1
      )
    ),

  FOREIGN KEY(attempt_id)
    REFERENCES education_attempts(id)
    ON DELETE CASCADE,

  FOREIGN KEY(question_id)
    REFERENCES education_questions(id)
    ON DELETE RESTRICT,

  UNIQUE(
    attempt_id,
    question_id
  )
);

-- ------------------------------------------------------------
-- 3. Topic summary, separated by grade/program.
-- ------------------------------------------------------------

CREATE TABLE education_topic_mastery (
  student_id INTEGER NOT NULL,
  grade_code TEXT NOT NULL,
  subject_code TEXT NOT NULL,
  topic_code TEXT NOT NULL,

  attempts INTEGER NOT NULL DEFAULT 0,
  questions_answered INTEGER NOT NULL DEFAULT 0,
  correct_answers INTEGER NOT NULL DEFAULT 0,
  unique_questions_attempted INTEGER NOT NULL DEFAULT 0,
  score_percent INTEGER NOT NULL DEFAULT 0,

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY(
    student_id,
    grade_code,
    subject_code,
    topic_code
  ),

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE
);

CREATE INDEX idx_education_topic_mastery_student_grade
ON education_topic_mastery(
  student_id,
  grade_code,
  subject_code
);

-- ------------------------------------------------------------
-- 4. Subtopic summary, separated by grade/program.
-- ------------------------------------------------------------

CREATE TABLE education_subtopic_mastery (
  student_id INTEGER NOT NULL,
  grade_code TEXT NOT NULL,
  subject_code TEXT NOT NULL,
  topic_code TEXT NOT NULL,
  subtopic_code TEXT NOT NULL,

  attempts INTEGER NOT NULL DEFAULT 0,
  questions_answered INTEGER NOT NULL DEFAULT 0,
  correct_answers INTEGER NOT NULL DEFAULT 0,
  unique_questions_attempted INTEGER NOT NULL DEFAULT 0,
  score_percent INTEGER NOT NULL DEFAULT 0,

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY(
    student_id,
    grade_code,
    subject_code,
    topic_code,
    subtopic_code
  ),

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE
);

CREATE INDEX idx_education_subtopic_mastery_student_grade
ON education_subtopic_mastery(
  student_id,
  grade_code,
  subject_code,
  topic_code
);

PRAGMA foreign_keys = ON;
