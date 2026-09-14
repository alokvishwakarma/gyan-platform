-- 0167_education_ai_tips_foundation.sql
-- GYAN question guidance + unlock/usage foundation.
-- V1 product rule:
--   Guided attempt: Tip may be unlocked during the attempt.
--   Challenge attempt: Tip withheld until results.
--   Results: Tip/explanation may be shown without affecting score.
--   "Solved without Tips" is derived from per-attempt tip usage.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_question_guidance (
  question_id INTEGER PRIMARY KEY,
  tip_text TEXT,
  tip_status TEXT NOT NULL DEFAULT 'READY'
    CHECK (tip_status IN ('READY','NO_TIP','REVIEW')),
  tip_version INTEGER NOT NULL DEFAULT 1,
  source_note TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (question_id) REFERENCES education_questions(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS education_ai_tip_unlocks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gyan_account_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  gem_cost INTEGER NOT NULL DEFAULT 1,
  unlocked_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (gyan_account_id) REFERENCES gyan_accounts(id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES education_questions(id) ON DELETE CASCADE,
  UNIQUE (gyan_account_id, question_id)
);

CREATE INDEX IF NOT EXISTS idx_education_ai_tip_unlocks_account
ON education_ai_tip_unlocks (gyan_account_id, unlocked_at);

CREATE TABLE IF NOT EXISTS education_ai_tip_attempt_usage (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  question_id INTEGER NOT NULL,
  mock_attempt_id INTEGER,
  live_attempt_id INTEGER,
  used_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (question_id) REFERENCES education_questions(id) ON DELETE CASCADE,
  FOREIGN KEY (mock_attempt_id) REFERENCES education_mock_attempts(id) ON DELETE CASCADE,
  FOREIGN KEY (live_attempt_id) REFERENCES education_live_attempts(id) ON DELETE CASCADE,
  CHECK (
    (mock_attempt_id IS NOT NULL AND live_attempt_id IS NULL)
    OR
    (mock_attempt_id IS NULL AND live_attempt_id IS NOT NULL)
  )
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_education_ai_tip_usage_mock
ON education_ai_tip_attempt_usage (mock_attempt_id, question_id)
WHERE mock_attempt_id IS NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS idx_education_ai_tip_usage_live
ON education_ai_tip_attempt_usage (live_attempt_id, question_id)
WHERE live_attempt_id IS NOT NULL;

SELECT name
FROM sqlite_master
WHERE name IN (
  'education_question_guidance',
  'education_ai_tip_unlocks',
  'education_ai_tip_attempt_usage'
)
ORDER BY name;
