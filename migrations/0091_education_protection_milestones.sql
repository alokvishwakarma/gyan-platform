-- 0091_education_protection_milestones.sql
-- Account-wide Education progress protection reminders.
-- Keeps 25/50-question prompts from repeating on every topic/test.

CREATE TABLE IF NOT EXISTS education_protection_milestones (
  student_id INTEGER PRIMARY KEY,

  milestone_25_shown INTEGER NOT NULL DEFAULT 0
    CHECK (milestone_25_shown IN (0,1)),

  milestone_50_shown INTEGER NOT NULL DEFAULT 0
    CHECK (milestone_50_shown IN (0,1)),

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE
);
