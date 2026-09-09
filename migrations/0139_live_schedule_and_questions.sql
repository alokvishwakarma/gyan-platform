-- 0139_live_schedule_and_questions.sql
ALTER TABLE education_live_tests ADD COLUMN test_fraction_percent INTEGER NOT NULL DEFAULT 10;
ALTER TABLE education_live_tests ADD COLUMN event_kind TEXT NOT NULL DEFAULT 'WEEKDAY';
ALTER TABLE education_live_tests ADD COLUMN source_schedule_date TEXT;

CREATE TABLE IF NOT EXISTS education_live_class_schedule (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  schedule_date TEXT NOT NULL,
  program_code TEXT NOT NULL CHECK (program_code IN ('JEE','NEET','GRE','IELTS')),
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

CREATE INDEX IF NOT EXISTS idx_education_live_class_schedule_date
ON education_live_class_schedule (schedule_date, program_code, active);

CREATE INDEX IF NOT EXISTS idx_education_live_class_schedule_topic
ON education_live_class_schedule (program_code, subject_code, topic_code, schedule_date);

CREATE TABLE IF NOT EXISTS education_live_test_questions (
  live_test_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  question_order INTEGER NOT NULL,
  section_code TEXT,
  source_subject_code TEXT,
  source_topic_code TEXT,
  selection_reason TEXT NOT NULL DEFAULT 'TOPIC'
    CHECK (selection_reason IN ('TOPIC','WEEKLY','REVISION','MANUAL')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (live_test_id) REFERENCES education_live_tests(id) ON DELETE CASCADE,
  PRIMARY KEY (live_test_id, question_order),
  UNIQUE (live_test_id, question_id)
);

CREATE INDEX IF NOT EXISTS idx_education_live_test_questions_history
ON education_live_test_questions (question_id, live_test_id);

CREATE INDEX IF NOT EXISTS idx_education_live_test_questions_topic
ON education_live_test_questions (source_topic_code, live_test_id);

CREATE INDEX IF NOT EXISTS idx_education_live_test_questions_subject
ON education_live_test_questions (source_subject_code, live_test_id);
