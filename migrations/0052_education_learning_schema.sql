-- 0052_education_learning_schema.sql
-- Reusable learning hierarchy + question bank.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_subjects (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  country_code TEXT NOT NULL,
  grade_code TEXT NOT NULL,
  subject_code TEXT NOT NULL,
  subject_name TEXT NOT NULL,
  enabled INTEGER NOT NULL DEFAULT 1 CHECK (enabled IN (0,1)),
  sort_order INTEGER NOT NULL DEFAULT 100,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(country_code, grade_code, subject_code)
);

CREATE TABLE IF NOT EXISTS education_topics (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  subject_id INTEGER NOT NULL,
  topic_code TEXT NOT NULL,
  topic_name TEXT NOT NULL,
  enabled INTEGER NOT NULL DEFAULT 1 CHECK (enabled IN (0,1)),
  sort_order INTEGER NOT NULL DEFAULT 100,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(subject_id, topic_code),
  FOREIGN KEY(subject_id)
    REFERENCES education_subjects(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS education_subtopics (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  topic_id INTEGER NOT NULL,
  subtopic_code TEXT NOT NULL,
  subtopic_name TEXT NOT NULL,
  enabled INTEGER NOT NULL DEFAULT 1 CHECK (enabled IN (0,1)),
  sort_order INTEGER NOT NULL DEFAULT 100,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(topic_id, subtopic_code),
  FOREIGN KEY(topic_id)
    REFERENCES education_topics(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS education_questions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  subtopic_id INTEGER NOT NULL,
  question_key TEXT NOT NULL UNIQUE,
  difficulty TEXT NOT NULL
    CHECK (difficulty IN ('easy','medium','challenge')),
  question_text TEXT NOT NULL,
  choice_a TEXT NOT NULL,
  choice_b TEXT NOT NULL,
  choice_c TEXT NOT NULL,
  choice_d TEXT NOT NULL,
  correct_choice TEXT NOT NULL
    CHECK (correct_choice IN ('A','B','C','D')),
  explanation TEXT NOT NULL DEFAULT '',
  active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0,1)),
  source_type TEXT NOT NULL DEFAULT 'generated',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(subtopic_id)
    REFERENCES education_subtopics(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_education_subjects_grade
  ON education_subjects(country_code, grade_code, sort_order);

CREATE INDEX IF NOT EXISTS idx_education_topics_subject
  ON education_topics(subject_id, sort_order);

CREATE INDEX IF NOT EXISTS idx_education_subtopics_topic
  ON education_subtopics(topic_id, sort_order);

CREATE INDEX IF NOT EXISTS idx_education_questions_subtopic
  ON education_questions(subtopic_id, active, difficulty, id);
