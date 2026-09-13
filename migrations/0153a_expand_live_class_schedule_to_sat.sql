-- 0153a_expand_live_class_schedule_to_sat.sql
-- Expand education_live_class_schedule to allow SAT while preserving existing rows.
-- SQLite CHECK constraints require a table rebuild.

CREATE TABLE education_live_class_schedule_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  schedule_date TEXT NOT NULL,
  program_code TEXT NOT NULL CHECK (program_code IN ('JEE','NEET','GRE','IELTS','SAT')),
  subject_code TEXT NOT NULL,
  topic_code TEXT,
  topic_name TEXT NOT NULL,
  class_start_local TEXT NOT NULL,
  class_end_local TEXT NOT NULL,
  schedule_timezone TEXT NOT NULL DEFAULT 'Asia/Kolkata',
  sequence_number INTEGER NOT NULL DEFAULT 1,
  active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0,1)),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (schedule_date, program_code, subject_code, sequence_number)
);

INSERT INTO education_live_class_schedule_new (
  id,
  schedule_date,
  program_code,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone,
  sequence_number,
  active,
  created_at,
  updated_at
)
SELECT
  id,
  schedule_date,
  program_code,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone,
  sequence_number,
  active,
  created_at,
  updated_at
FROM education_live_class_schedule;

DROP TABLE education_live_class_schedule;
ALTER TABLE education_live_class_schedule_new RENAME TO education_live_class_schedule;

CREATE INDEX IF NOT EXISTS idx_education_live_class_schedule_date
ON education_live_class_schedule (schedule_date, program_code, active);

CREATE INDEX IF NOT EXISTS idx_education_live_class_schedule_topic
ON education_live_class_schedule (program_code, subject_code, topic_code, schedule_date);

-- Verify the rebuilt schema and preserved row count/content.
SELECT sql
FROM sqlite_master
WHERE type = 'table'
  AND name = 'education_live_class_schedule';

SELECT program_code, COUNT(*) AS rows
FROM education_live_class_schedule
GROUP BY program_code
ORDER BY program_code;
