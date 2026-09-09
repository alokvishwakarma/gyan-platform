-- 0137_live_tests.sql
-- GYAN Live Tests durable schema.
-- No duplicate questions, rankings, timezone analytics, friendships,
-- country curriculum filtering, or second gem ledger.

CREATE TABLE IF NOT EXISTS education_live_tests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  series_number INTEGER NOT NULL,
  series_suffix TEXT NOT NULL CHECK (series_suffix IN ('N','J','G')),
  public_code TEXT NOT NULL UNIQUE,
  program_code TEXT NOT NULL CHECK (program_code IN ('NEET','JEE','GRE')),
  mock_test_id INTEGER NOT NULL,
  starts_at_utc TEXT NOT NULL,
  schedule_timezone TEXT NOT NULL DEFAULT 'Asia/Kolkata',
  duration_minutes INTEGER NOT NULL DEFAULT 20 CHECK (duration_minutes > 0),
  entry_gem_cost INTEGER NOT NULL DEFAULT 5 CHECK (entry_gem_cost >= 0),
  report_gem_cost INTEGER NOT NULL DEFAULT 15 CHECK (report_gem_cost >= 0),
  status TEXT NOT NULL DEFAULT 'SCHEDULED'
    CHECK (status IN ('SCHEDULED','CANCELLED')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (series_number, series_suffix)
);

CREATE INDEX IF NOT EXISTS idx_education_live_tests_start
ON education_live_tests (starts_at_utc, status);

CREATE INDEX IF NOT EXISTS idx_education_live_tests_program_start
ON education_live_tests (program_code, starts_at_utc);

CREATE TABLE IF NOT EXISTS education_live_entries (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  live_test_id INTEGER NOT NULL,
  participant_type TEXT NOT NULL CHECK (participant_type IN ('GYAN','SYNTHETIC')),
  participant_key TEXT NOT NULL,
  entered_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  submitted_at TEXT,
  attempt_id INTEGER,
  entry_gem_transaction_key TEXT,
  report_unlocked_at TEXT,
  report_gem_transaction_key TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (live_test_id) REFERENCES education_live_tests(id) ON DELETE CASCADE,
  UNIQUE (live_test_id, participant_type, participant_key),
  UNIQUE (entry_gem_transaction_key),
  UNIQUE (report_gem_transaction_key)
);

CREATE INDEX IF NOT EXISTS idx_education_live_entries_test
ON education_live_entries (live_test_id, entered_at);

CREATE INDEX IF NOT EXISTS idx_education_live_entries_participant
ON education_live_entries (participant_type, participant_key, entered_at);

CREATE INDEX IF NOT EXISTS idx_education_live_entries_submitted
ON education_live_entries (live_test_id, submitted_at);

CREATE TABLE IF NOT EXISTS education_synthetic_participants (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  synthetic_code TEXT NOT NULL UNIQUE,
  ability_band INTEGER NOT NULL CHECK (ability_band IN (4,5,6,7)),
  program_pool TEXT NOT NULL CHECK (program_pool IN ('JEE','NEET','GRE','RESERVE')),
  initial_timezone TEXT NOT NULL,
  starting_gems INTEGER NOT NULL CHECK (starting_gems >= 0),
  active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0,1)),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_education_synthetic_pool
ON education_synthetic_participants (program_pool, active, ability_band);

CREATE INDEX IF NOT EXISTS idx_education_synthetic_timezone
ON education_synthetic_participants (initial_timezone, active);

CREATE TABLE IF NOT EXISTS education_live_synthetic_runs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  live_test_id INTEGER NOT NULL,
  synthetic_participant_id INTEGER NOT NULL,
  scheduled_join_offset_seconds INTEGER NOT NULL DEFAULT 0,
  behavior_seed INTEGER NOT NULL,
  completion_profile TEXT NOT NULL
    CHECK (completion_profile IN ('EARLY','NORMAL','LATE','ABANDON')),
  run_status TEXT NOT NULL DEFAULT 'PLANNED'
    CHECK (run_status IN ('PLANNED','ENTERED','SUBMITTED','ABANDONED','FAILED','SKIPPED')),
  entered_at TEXT,
  submitted_at TEXT,
  error_message TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (live_test_id) REFERENCES education_live_tests(id) ON DELETE CASCADE,
  FOREIGN KEY (synthetic_participant_id) REFERENCES education_synthetic_participants(id) ON DELETE CASCADE,
  UNIQUE (live_test_id, synthetic_participant_id)
);

CREATE INDEX IF NOT EXISTS idx_education_live_runs_test_status
ON education_live_synthetic_runs (live_test_id, run_status, scheduled_join_offset_seconds);

CREATE INDEX IF NOT EXISTS idx_education_live_runs_participant
ON education_live_synthetic_runs (synthetic_participant_id, live_test_id);
