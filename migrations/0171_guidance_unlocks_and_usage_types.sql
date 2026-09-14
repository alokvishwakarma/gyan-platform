-- 0171_guidance_unlocks_and_usage_types.sql
-- Server-side ownership / pricing support for GYAN Tip + 50/50.
-- Apply AFTER 0167 and 0170.

PRAGMA foreign_keys = ON;

-- The original usage table only represented a Tip.
-- Extend it so one question may record both TIP and FIFTY_FIFTY.

ALTER TABLE education_ai_tip_attempt_usage
ADD COLUMN assistance_type TEXT NOT NULL DEFAULT 'TIP'
CHECK (assistance_type IN ('TIP','FIFTY_FIFTY'));

DROP INDEX IF EXISTS idx_education_ai_tip_usage_mock;
DROP INDEX IF EXISTS idx_education_ai_tip_usage_live;

CREATE UNIQUE INDEX IF NOT EXISTS idx_education_ai_tip_usage_mock
ON education_ai_tip_attempt_usage (
  mock_attempt_id,
  question_id,
  assistance_type
)
WHERE mock_attempt_id IS NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS idx_education_ai_tip_usage_live
ON education_ai_tip_attempt_usage (
  live_attempt_id,
  question_id,
  assistance_type
)
WHERE live_attempt_id IS NOT NULL;

-- Global ownership:
-- once a GYAN account has paid for a question's Tip or 50/50,
-- that exact assistance is free on future openings.
CREATE TABLE IF NOT EXISTS education_guidance_unlocks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gyan_account_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  assistance_type TEXT NOT NULL
    CHECK (assistance_type IN ('TIP','FIFTY_FIFTY')),
  context_type TEXT NOT NULL
    CHECK (context_type IN ('MOCK','LIVE')),
  context_id INTEGER NOT NULL,
  gem_cost INTEGER NOT NULL DEFAULT 0
    CHECK (gem_cost >= 0),
  unlocked_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (gyan_account_id)
    REFERENCES gyan_accounts(id)
    ON DELETE CASCADE,
  FOREIGN KEY (question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE,
  UNIQUE (
    gyan_account_id,
    question_id,
    assistance_type
  )
);

CREATE INDEX IF NOT EXISTS idx_guidance_unlocks_context
ON education_guidance_unlocks (
  gyan_account_id,
  context_type,
  context_id,
  unlocked_at
);

CREATE INDEX IF NOT EXISTS idx_guidance_unlocks_question
ON education_guidance_unlocks (
  question_id,
  assistance_type
);

SELECT
  name
FROM sqlite_master
WHERE name IN (
  'education_guidance_unlocks',
  'idx_guidance_unlocks_context',
  'idx_education_ai_tip_usage_mock',
  'idx_education_ai_tip_usage_live'
)
ORDER BY name;
