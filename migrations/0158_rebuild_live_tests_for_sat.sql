-- 0158_rebuild_live_tests_for_sat.sql
--
-- Purpose:
--   Allow SAT live tests by expanding the old CHECK constraints:
--     series_suffix: N,J,G -> N,J,G,S
--     program_code : NEET,JEE,GRE -> NEET,JEE,GRE,SAT
--
-- IMPORTANT:
--   We intentionally clear ALL current Live Test rows first because the
--   current generated tests have not been used and the user plans to
--   regenerate JEE, NEET and SAT under the current rules.
--
--   Clearing the parent first lets ON DELETE CASCADE safely remove:
--     education_live_test_questions
--     education_live_entries
--     education_live_attempts
--     education_live_synthetic_runs
--
--   Then the empty parent table can be rebuilt without preserving stale
--   generated test state.
--
-- Cloudflare D1 keeps foreign keys enabled. defer_foreign_keys allows the
-- schema replacement to finish within the migration transaction.

PRAGMA defer_foreign_keys = ON;

-- Remove any Live-Test gem ledger rows before their source tests disappear.
DELETE FROM gem_transactions
WHERE reason LIKE 'LIVE_TEST_ENTRY:%'
   OR reason LIKE 'LIVE_TEST_REPORT:%'
   OR reason LIKE 'LIVE_TEST_QUESTIONS:%'
   OR reason LIKE 'LIVE_TEST_QUESTION_PAPER:%';

-- Old generation history is no longer meaningful after full regeneration.
DELETE FROM education_live_generation_runs;

-- Cascades clear frozen questions, entries, attempts and synthetic runs.
DELETE FROM education_live_tests;

DROP TABLE education_live_tests;

CREATE TABLE education_live_tests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  series_number INTEGER NOT NULL,

  series_suffix TEXT NOT NULL
    CHECK (series_suffix IN ('N','J','G','S')),

  public_code TEXT NOT NULL UNIQUE,

  program_code TEXT NOT NULL
    CHECK (program_code IN ('NEET','JEE','GRE','SAT')),

  mock_test_id INTEGER NOT NULL,

  starts_at_utc TEXT NOT NULL,

  schedule_timezone TEXT NOT NULL
    DEFAULT 'Asia/Kolkata',

  duration_minutes INTEGER NOT NULL
    DEFAULT 20
    CHECK (duration_minutes > 0),

  entry_gem_cost INTEGER NOT NULL
    DEFAULT 5
    CHECK (entry_gem_cost >= 0),

  report_gem_cost INTEGER NOT NULL
    DEFAULT 15
    CHECK (report_gem_cost >= 0),

  status TEXT NOT NULL
    DEFAULT 'SCHEDULED'
    CHECK (status IN ('SCHEDULED','CANCELLED')),

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  test_fraction_percent INTEGER NOT NULL
    DEFAULT 10,

  event_kind TEXT NOT NULL
    DEFAULT 'WEEKDAY',

  source_schedule_date TEXT,

  visible INTEGER NOT NULL
    DEFAULT 1
    CHECK (visible IN (0,1)),

  visibility_mode TEXT NOT NULL
    DEFAULT 'AUTO'
    CHECK (
      visibility_mode IN (
        'AUTO',
        'SHOW',
        'HIDE'
      )
    ),

  batch_code TEXT,

  question_paper_gem_cost INTEGER NOT NULL
    DEFAULT 3
    CHECK (question_paper_gem_cost >= 0),

  UNIQUE (series_number, series_suffix)
);

CREATE INDEX idx_education_live_tests_program_start
ON education_live_tests (
  program_code,
  starts_at_utc
);

CREATE INDEX idx_education_live_tests_start
ON education_live_tests (
  starts_at_utc,
  status
);

CREATE INDEX idx_education_live_tests_visible_start
ON education_live_tests (
  visible,
  starts_at_utc,
  status
);

CREATE INDEX idx_live_tests_admin_schedule
ON education_live_tests (
  program_code,
  source_schedule_date,
  visibility_mode,
  visible
);

CREATE INDEX idx_live_tests_batch_program_date
ON education_live_tests (
  batch_code,
  program_code,
  source_schedule_date
);

PRAGMA defer_foreign_keys = OFF;
