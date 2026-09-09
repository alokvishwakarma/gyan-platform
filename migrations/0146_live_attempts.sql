-- 0146_live_attempts.sql
--
-- Durable real/synthetic Live Test answer storage.
-- Scores are stored server-side, but are NOT automatically exposed to
-- learners until the report unlock flow is completed.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_live_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  live_test_id INTEGER NOT NULL,
  live_entry_id INTEGER NOT NULL UNIQUE,

  participant_type TEXT NOT NULL
    CHECK (participant_type IN ('GYAN','SYNTHETIC')),

  participant_key TEXT NOT NULL,

  question_count INTEGER NOT NULL DEFAULT 0,
  answered_count INTEGER NOT NULL DEFAULT 0,
  correct_count INTEGER NOT NULL DEFAULT 0,
  incorrect_count INTEGER NOT NULL DEFAULT 0,
  unanswered_count INTEGER NOT NULL DEFAULT 0,

  raw_score REAL NOT NULL DEFAULT 0,

  started_at TEXT,
  submitted_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (live_test_id)
    REFERENCES education_live_tests(id)
    ON DELETE CASCADE,

  FOREIGN KEY (live_entry_id)
    REFERENCES education_live_entries(id)
    ON DELETE CASCADE,

  UNIQUE (
    live_test_id,
    participant_type,
    participant_key
  )
);

CREATE INDEX IF NOT EXISTS idx_education_live_attempts_test
ON education_live_attempts (
  live_test_id,
  submitted_at
);

CREATE INDEX IF NOT EXISTS idx_education_live_attempts_participant
ON education_live_attempts (
  participant_type,
  participant_key,
  submitted_at
);


CREATE TABLE IF NOT EXISTS education_live_attempt_answers (
  attempt_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  question_order INTEGER NOT NULL,

  selected_choice TEXT
    CHECK (
      selected_choice IS NULL
      OR selected_choice IN ('A','B','C','D')
    ),

  correct_choice TEXT NOT NULL
    CHECK (correct_choice IN ('A','B','C','D')),

  is_correct INTEGER NOT NULL
    CHECK (is_correct IN (0,1)),

  section_code TEXT,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (attempt_id)
    REFERENCES education_live_attempts(id)
    ON DELETE CASCADE,

  PRIMARY KEY (
    attempt_id,
    question_id
  )
);

CREATE INDEX IF NOT EXISTS idx_education_live_attempt_answers_attempt_order
ON education_live_attempt_answers (
  attempt_id,
  question_order
);

CREATE INDEX IF NOT EXISTS idx_education_live_attempt_answers_question
ON education_live_attempt_answers (
  question_id,
  is_correct
);
