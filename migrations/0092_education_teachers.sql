-- 0092_education_teachers.sql
-- GYAN Education teacher directory + assignment workflow.

CREATE TABLE IF NOT EXISTS education_teachers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gyan_account_id INTEGER,
  teacher_name TEXT NOT NULL,
  email TEXT NOT NULL COLLATE NOCASE,
  subjects TEXT NOT NULL DEFAULT '',
  location TEXT,
  bio TEXT,
  status TEXT NOT NULL DEFAULT 'PENDING'
    CHECK (status IN ('PENDING','APPROVED','INACTIVE')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(email),
  FOREIGN KEY (gyan_account_id)
    REFERENCES gyan_accounts(id)
    ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_education_teachers_status
  ON education_teachers(status, teacher_name);

CREATE TABLE IF NOT EXISTS education_teacher_assignments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INTEGER NOT NULL,
  teacher_id INTEGER,
  status TEXT NOT NULL DEFAULT 'REQUESTED'
    CHECK (status IN ('REQUESTED','ASSIGNED','CLOSED')),
  requested_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  assigned_at TEXT,
  assigned_by_email TEXT,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE,
  FOREIGN KEY (teacher_id)
    REFERENCES education_teachers(id)
    ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_teacher_assignments_student
  ON education_teacher_assignments(student_id, status);

CREATE INDEX IF NOT EXISTS idx_teacher_assignments_status
  ON education_teacher_assignments(status, requested_at);
