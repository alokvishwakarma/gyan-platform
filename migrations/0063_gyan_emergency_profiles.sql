-- 0063_gyan_emergency_profiles.sql
-- Owner-controlled public emergency information.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS gyan_emergency_profiles (
  safety_resource_id INTEGER PRIMARY KEY,

  emergency_message TEXT,
  primary_contact TEXT,
  secondary_contact TEXT,
  medical_notes TEXT,
  meeting_place TEXT,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (
    safety_resource_id
  )
    REFERENCES gyan_safety_resources(id)
    ON DELETE CASCADE
);
