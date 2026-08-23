-- 0056_calendar_access_codes.sql

CREATE TABLE IF NOT EXISTS calendar_access_codes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  -- Root-level short URL: https://gyan.cc/7kq2m
  slug TEXT NOT NULL UNIQUE,

  -- Friendly display name shown on the calendar.
  gyan_name TEXT NOT NULL UNIQUE,

  -- Reusable low-trust access code. Sensitive actions still require email.
  access_code TEXT NOT NULL UNIQUE,

  duration_months INTEGER NOT NULL
    CHECK (duration_months IN (1, 3, 12)),

  status TEXT NOT NULL DEFAULT 'GENERATED'
    CHECK (status IN ('GENERATED', 'PRINTED', 'CLAIMED', 'EXPIRED')),

  email TEXT,

  generated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  printed_at TEXT,
  claimed_at TEXT,
  expires_at TEXT,

  source TEXT NOT NULL DEFAULT 'CALENDAR',
  created_by_email TEXT
);

CREATE INDEX IF NOT EXISTS idx_calendar_access_status
  ON calendar_access_codes(status);

CREATE INDEX IF NOT EXISTS idx_calendar_access_email
  ON calendar_access_codes(email);

CREATE INDEX IF NOT EXISTS idx_calendar_access_generated
  ON calendar_access_codes(generated_at DESC);
