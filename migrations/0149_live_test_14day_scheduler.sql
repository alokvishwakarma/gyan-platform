-- 0149_live_test_14day_scheduler.sql
PRAGMA foreign_keys = ON;

ALTER TABLE education_live_tests
ADD COLUMN visible INTEGER NOT NULL DEFAULT 1
CHECK (visible IN (0,1));

CREATE INDEX IF NOT EXISTS idx_education_live_tests_visible_start
ON education_live_tests (visible, starts_at_utc, status);

CREATE TABLE IF NOT EXISTS education_live_test_policy (
  program_code TEXT PRIMARY KEY,
  series_suffix TEXT NOT NULL,
  schedule_timezone TEXT NOT NULL,
  test_start_local TEXT NOT NULL,
  duration_minutes INTEGER NOT NULL,
  question_count INTEGER NOT NULL,
  entry_gem_cost INTEGER NOT NULL DEFAULT 5,
  report_gem_cost INTEGER NOT NULL DEFAULT 15,
  test_fraction_percent INTEGER NOT NULL DEFAULT 10,
  series_epoch_date TEXT NOT NULL,
  series_epoch_number INTEGER NOT NULL,
  active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0,1)),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS education_live_test_policy_subjects (
  program_code TEXT NOT NULL,
  subject_code TEXT NOT NULL,
  question_count INTEGER NOT NULL CHECK (question_count > 0),
  sort_order INTEGER NOT NULL DEFAULT 1,
  PRIMARY KEY (program_code, subject_code),
  FOREIGN KEY (program_code)
    REFERENCES education_live_test_policy(program_code)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS education_live_generation_runs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  schedule_date TEXT NOT NULL,
  program_code TEXT NOT NULL,
  public_code TEXT,
  status TEXT NOT NULL
    CHECK (status IN ('READY','INCOMPLETE','ERROR','SKIPPED')),
  frozen_question_count INTEGER NOT NULL DEFAULT 0,
  message TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_education_live_generation_runs_lookup
ON education_live_generation_runs (
  schedule_date,
  program_code,
  created_at
);

INSERT INTO education_live_test_policy (
  program_code,
  series_suffix,
  schedule_timezone,
  test_start_local,
  duration_minutes,
  question_count,
  entry_gem_cost,
  report_gem_cost,
  test_fraction_percent,
  series_epoch_date,
  series_epoch_number,
  active
)
VALUES
  ('JEE','J','Asia/Kolkata','21:15',60,8,5,15,10,'2026-09-09',237,1),
  ('NEET','N','Asia/Kolkata','20:30',60,18,5,15,10,'2026-09-09',237,1)
ON CONFLICT(program_code) DO UPDATE SET
  series_suffix = excluded.series_suffix,
  schedule_timezone = excluded.schedule_timezone,
  test_start_local = excluded.test_start_local,
  duration_minutes = excluded.duration_minutes,
  question_count = excluded.question_count,
  entry_gem_cost = excluded.entry_gem_cost,
  report_gem_cost = excluded.report_gem_cost,
  test_fraction_percent = excluded.test_fraction_percent,
  series_epoch_date = excluded.series_epoch_date,
  series_epoch_number = excluded.series_epoch_number,
  active = excluded.active,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO education_live_test_policy_subjects (
  program_code,
  subject_code,
  question_count,
  sort_order
)
VALUES
  ('JEE','MATH',3,1),
  ('JEE','PHYSICS',3,2),
  ('JEE','CHEMISTRY',2,3),
  ('NEET','PHYSICS',4,1),
  ('NEET','CHEMISTRY',5,2),
  ('NEET','BIOLOGY',9,3)
ON CONFLICT(program_code, subject_code) DO UPDATE SET
  question_count = excluded.question_count,
  sort_order = excluded.sort_order;

SELECT
  p.program_code,
  p.schedule_timezone,
  p.test_start_local,
  p.question_count,
  p.series_epoch_date,
  p.series_epoch_number,
  p.active,
  GROUP_CONCAT(ps.subject_code || ':' || ps.question_count, ', ') AS subject_mix
FROM education_live_test_policy p
LEFT JOIN education_live_test_policy_subjects ps
  ON ps.program_code = p.program_code
GROUP BY p.program_code
ORDER BY p.program_code;
