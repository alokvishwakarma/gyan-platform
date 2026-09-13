-- 0156_class_interest_email.sql

CREATE TABLE IF NOT EXISTS education_class_interests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL,
  program_code TEXT NOT NULL
    CHECK (program_code IN ('JEE','NEET','SAT')),
  schedule_date TEXT NOT NULL,
  subject_code TEXT NOT NULL,
  topic_code TEXT,
  topic_name TEXT NOT NULL,
  class_start_local TEXT NOT NULL,
  class_end_local TEXT NOT NULL,
  schedule_timezone TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'NEW'
    CHECK (status IN ('NEW','CONTACTED','REGISTERED','CLOSED')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (email, program_code, schedule_date, subject_code)
);

CREATE INDEX IF NOT EXISTS idx_class_interests_status_created
ON education_class_interests (status, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_class_interests_program_date
ON education_class_interests (program_code, schedule_date);

SELECT name, sql
FROM sqlite_master
WHERE type='table'
  AND name='education_class_interests';
