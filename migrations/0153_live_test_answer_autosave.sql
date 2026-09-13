-- migrations/0153_live_test_answer_autosave.sql
--
-- Draft answer persistence for CBT-style Live Tests.
-- Final grading remains in education_live_attempt_answers.

CREATE TABLE IF NOT EXISTS education_live_entry_answers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  live_entry_id INTEGER NOT NULL,

  question_id INTEGER NOT NULL,

  selected_choice TEXT NOT NULL
    CHECK (
      selected_choice IN (
        'A',
        'B',
        'C',
        'D'
      )
    ),

  saved_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  UNIQUE (
    live_entry_id,
    question_id
  )
);

CREATE INDEX IF NOT EXISTS idx_live_entry_answers_entry
ON education_live_entry_answers (
  live_entry_id
);

CREATE INDEX IF NOT EXISTS idx_live_entry_answers_question
ON education_live_entry_answers (
  question_id
);
