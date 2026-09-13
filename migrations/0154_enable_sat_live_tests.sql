-- 0154_enable_sat_live_tests.sql
-- Enable SAT Live Tests safely while preserving existing Live Test data.
--
-- education_live_tests has ON DELETE CASCADE children. A simple parent
-- DROP/recreate can erase child data in D1. This migration therefore:
--   1. copies dependent rows to temporary backup tables,
--   2. removes child tables child-first,
--   3. rebuilds education_live_tests with SAT/S allowed,
--   4. recreates/restores all dependent tables and indexes,
--   5. enables SAT at 10 questions: 5 RW + 5 Math,
--   6. runs foreign-key verification.

PRAGMA defer_foreign_keys = ON;

-- ------------------------------------------------------------
-- Preserve descendants/direct children.
-- ------------------------------------------------------------

CREATE TABLE __sat_live_backup_attempt_answers AS
SELECT *
FROM education_live_attempt_answers;

CREATE TABLE __sat_live_backup_attempts AS
SELECT *
FROM education_live_attempts;

CREATE TABLE __sat_live_backup_entries AS
SELECT *
FROM education_live_entries;

CREATE TABLE __sat_live_backup_synthetic_runs AS
SELECT *
FROM education_live_synthetic_runs;

CREATE TABLE __sat_live_backup_test_questions AS
SELECT *
FROM education_live_test_questions;

-- ------------------------------------------------------------
-- Remove dependents child-first.
-- ------------------------------------------------------------

DROP TABLE education_live_attempt_answers;
DROP TABLE education_live_attempts;
DROP TABLE education_live_synthetic_runs;
DROP TABLE education_live_test_questions;
DROP TABLE education_live_entries;

-- ------------------------------------------------------------
-- Rebuild education_live_tests with SAT + S.
-- Current columns from 0137 + 0139 + 0149 + 0151 are preserved.
-- ------------------------------------------------------------

CREATE TABLE education_live_tests_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  series_number INTEGER NOT NULL,
  series_suffix TEXT NOT NULL
    CHECK (series_suffix IN ('N','J','G','S')),
  public_code TEXT NOT NULL UNIQUE,
  program_code TEXT NOT NULL
    CHECK (program_code IN ('NEET','JEE','GRE','SAT')),
  mock_test_id INTEGER NOT NULL,
  starts_at_utc TEXT NOT NULL,
  schedule_timezone TEXT NOT NULL DEFAULT 'Asia/Kolkata',
  duration_minutes INTEGER NOT NULL DEFAULT 20
    CHECK (duration_minutes > 0),
  entry_gem_cost INTEGER NOT NULL DEFAULT 5
    CHECK (entry_gem_cost >= 0),
  report_gem_cost INTEGER NOT NULL DEFAULT 15
    CHECK (report_gem_cost >= 0),
  status TEXT NOT NULL DEFAULT 'SCHEDULED'
    CHECK (status IN ('SCHEDULED','CANCELLED')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  test_fraction_percent INTEGER NOT NULL DEFAULT 10,
  event_kind TEXT NOT NULL DEFAULT 'WEEKDAY',
  source_schedule_date TEXT,
  visible INTEGER NOT NULL DEFAULT 1
    CHECK (visible IN (0,1)),
  visibility_mode TEXT NOT NULL DEFAULT 'AUTO'
    CHECK (
      visibility_mode IN (
        'AUTO',
        'SHOW',
        'HIDE'
      )
    ),
  UNIQUE (series_number, series_suffix)
);

INSERT INTO education_live_tests_new (
  id,
  series_number,
  series_suffix,
  public_code,
  program_code,
  mock_test_id,
  starts_at_utc,
  schedule_timezone,
  duration_minutes,
  entry_gem_cost,
  report_gem_cost,
  status,
  created_at,
  updated_at,
  test_fraction_percent,
  event_kind,
  source_schedule_date,
  visible,
  visibility_mode
)
SELECT
  id,
  series_number,
  series_suffix,
  public_code,
  program_code,
  mock_test_id,
  starts_at_utc,
  schedule_timezone,
  duration_minutes,
  entry_gem_cost,
  report_gem_cost,
  status,
  created_at,
  updated_at,
  test_fraction_percent,
  event_kind,
  source_schedule_date,
  visible,
  visibility_mode
FROM education_live_tests;

DROP TABLE education_live_tests;

ALTER TABLE education_live_tests_new
RENAME TO education_live_tests;

CREATE INDEX idx_education_live_tests_start
ON education_live_tests (
  starts_at_utc,
  status
);

CREATE INDEX idx_education_live_tests_program_start
ON education_live_tests (
  program_code,
  starts_at_utc
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

-- ------------------------------------------------------------
-- Recreate dependent tables.
-- ------------------------------------------------------------

CREATE TABLE education_live_entries (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  live_test_id INTEGER NOT NULL,
  participant_type TEXT NOT NULL
    CHECK (participant_type IN ('GYAN','SYNTHETIC')),
  participant_key TEXT NOT NULL,
  entered_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  submitted_at TEXT,
  attempt_id INTEGER,
  entry_gem_transaction_key TEXT,
  report_unlocked_at TEXT,
  report_gem_transaction_key TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (live_test_id)
    REFERENCES education_live_tests(id)
    ON DELETE CASCADE,
  UNIQUE (live_test_id, participant_type, participant_key),
  UNIQUE (entry_gem_transaction_key),
  UNIQUE (report_gem_transaction_key)
);

CREATE TABLE education_live_test_questions (
  live_test_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  question_order INTEGER NOT NULL,
  section_code TEXT,
  source_subject_code TEXT,
  source_topic_code TEXT,
  selection_reason TEXT NOT NULL DEFAULT 'TOPIC'
    CHECK (
      selection_reason IN (
        'TOPIC',
        'WEEKLY',
        'REVISION',
        'MANUAL'
      )
    ),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (live_test_id)
    REFERENCES education_live_tests(id)
    ON DELETE CASCADE,
  PRIMARY KEY (live_test_id, question_order),
  UNIQUE (live_test_id, question_id)
);

CREATE TABLE education_live_synthetic_runs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  live_test_id INTEGER NOT NULL,
  synthetic_participant_id INTEGER NOT NULL,
  scheduled_join_offset_seconds INTEGER NOT NULL DEFAULT 0,
  behavior_seed INTEGER NOT NULL,
  completion_profile TEXT NOT NULL
    CHECK (
      completion_profile IN (
        'EARLY',
        'NORMAL',
        'LATE',
        'ABANDON'
      )
    ),
  run_status TEXT NOT NULL DEFAULT 'PLANNED'
    CHECK (
      run_status IN (
        'PLANNED',
        'ENTERED',
        'SUBMITTED',
        'ABANDONED',
        'FAILED',
        'SKIPPED'
      )
    ),
  entered_at TEXT,
  submitted_at TEXT,
  error_message TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (live_test_id)
    REFERENCES education_live_tests(id)
    ON DELETE CASCADE,
  FOREIGN KEY (synthetic_participant_id)
    REFERENCES education_synthetic_participants(id)
    ON DELETE CASCADE,
  UNIQUE (live_test_id, synthetic_participant_id)
);

CREATE TABLE education_live_attempts (
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
  UNIQUE (live_test_id, participant_type, participant_key)
);

CREATE TABLE education_live_attempt_answers (
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
  PRIMARY KEY (attempt_id, question_id)
);

-- ------------------------------------------------------------
-- Restore preserved rows.
-- ------------------------------------------------------------

INSERT INTO education_live_entries
SELECT *
FROM __sat_live_backup_entries;

INSERT INTO education_live_test_questions
SELECT *
FROM __sat_live_backup_test_questions;

INSERT INTO education_live_synthetic_runs
SELECT *
FROM __sat_live_backup_synthetic_runs;

INSERT INTO education_live_attempts
SELECT *
FROM __sat_live_backup_attempts;

INSERT INTO education_live_attempt_answers
SELECT *
FROM __sat_live_backup_attempt_answers;

DROP TABLE __sat_live_backup_attempt_answers;
DROP TABLE __sat_live_backup_attempts;
DROP TABLE __sat_live_backup_entries;
DROP TABLE __sat_live_backup_synthetic_runs;
DROP TABLE __sat_live_backup_test_questions;

-- ------------------------------------------------------------
-- Recreate child indexes.
-- ------------------------------------------------------------

CREATE INDEX idx_education_live_entries_test
ON education_live_entries (
  live_test_id,
  entered_at
);

CREATE INDEX idx_education_live_entries_participant
ON education_live_entries (
  participant_type,
  participant_key,
  entered_at
);

CREATE INDEX idx_education_live_entries_submitted
ON education_live_entries (
  live_test_id,
  submitted_at
);

CREATE INDEX idx_education_live_test_questions_history
ON education_live_test_questions (
  question_id,
  live_test_id
);

CREATE INDEX idx_education_live_test_questions_topic
ON education_live_test_questions (
  source_topic_code,
  live_test_id
);

CREATE INDEX idx_education_live_test_questions_subject
ON education_live_test_questions (
  source_subject_code,
  live_test_id
);

CREATE INDEX idx_education_live_runs_test_status
ON education_live_synthetic_runs (
  live_test_id,
  run_status,
  scheduled_join_offset_seconds
);

CREATE INDEX idx_education_live_runs_participant
ON education_live_synthetic_runs (
  synthetic_participant_id,
  live_test_id
);

CREATE INDEX idx_education_live_attempts_test
ON education_live_attempts (
  live_test_id,
  submitted_at
);

CREATE INDEX idx_education_live_attempts_participant
ON education_live_attempts (
  participant_type,
  participant_key,
  submitted_at
);

CREATE INDEX idx_education_live_attempt_answers_attempt_order
ON education_live_attempt_answers (
  attempt_id,
  question_order
);

CREATE INDEX idx_education_live_attempt_answers_question
ON education_live_attempt_answers (
  question_id,
  is_correct
);

-- ------------------------------------------------------------
-- Enable SAT policy.
-- ------------------------------------------------------------

UPDATE education_live_test_policy
SET
  series_suffix = 'S',
  schedule_timezone = 'America/New_York',
  test_start_local = '19:30',
  duration_minutes = 60,
  question_count = 10,
  entry_gem_cost = 5,
  report_gem_cost = 15,
  test_fraction_percent = 10,
  series_epoch_date = '2026-09-09',
  series_epoch_number = 237,
  active = 1,
  country_code = 'US',
  updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'SAT';

INSERT INTO education_live_test_policy_subjects (
  program_code,
  subject_code,
  question_count,
  sort_order
)
VALUES
  ('SAT','RW',5,1),
  ('SAT','MATH',5,2)
ON CONFLICT(program_code, subject_code)
DO UPDATE SET
  question_count = excluded.question_count,
  sort_order = excluded.sort_order;

-- ------------------------------------------------------------
-- Verify integrity and SAT policy.
-- ------------------------------------------------------------

PRAGMA defer_foreign_keys = OFF;

PRAGMA foreign_key_check;

SELECT
  program_code,
  series_suffix,
  schedule_timezone,
  test_start_local,
  duration_minutes,
  question_count,
  test_fraction_percent,
  active,
  country_code
FROM education_live_test_policy
WHERE program_code = 'SAT';

SELECT
  program_code,
  subject_code,
  question_count,
  sort_order
FROM education_live_test_policy_subjects
WHERE program_code = 'SAT'
ORDER BY sort_order;

SELECT
  (SELECT COUNT(*) FROM education_live_tests)
    AS live_tests,
  (SELECT COUNT(*) FROM education_live_entries)
    AS live_entries,
  (SELECT COUNT(*) FROM education_live_test_questions)
    AS live_questions,
  (SELECT COUNT(*) FROM education_live_synthetic_runs)
    AS synthetic_runs,
  (SELECT COUNT(*) FROM education_live_attempts)
    AS live_attempts,
  (SELECT COUNT(*) FROM education_live_attempt_answers)
    AS attempt_answers;
