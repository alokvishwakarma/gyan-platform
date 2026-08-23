-- 0058_calendar_guest_access.sql
-- Adds 30-day guest access + recoverable protected GYAN flow.

PRAGMA foreign_keys = OFF;

CREATE TABLE calendar_access_codes_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  slug TEXT NOT NULL UNIQUE,
  gyan_name TEXT NOT NULL UNIQUE,
  access_code TEXT NOT NULL UNIQUE,

  duration_months INTEGER NOT NULL
    CHECK (duration_months IN (1, 3, 12)),

  status TEXT NOT NULL DEFAULT 'GENERATED'
    CHECK (
      status IN (
        'GENERATED',
        'PRINTED',
        'GUEST_ACTIVE',
        'CLAIMED',
        'EXPIRED'
      )
    ),

  email TEXT,

  generated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  printed_at TEXT,

  guest_started_at TEXT,
  guest_expires_at TEXT,

  claimed_at TEXT,
  expires_at TEXT,

  source TEXT NOT NULL DEFAULT 'CALENDAR',
  created_by_email TEXT
);

INSERT INTO calendar_access_codes_new (
  id,
  slug,
  gyan_name,
  access_code,
  duration_months,
  status,
  email,
  generated_at,
  printed_at,
  claimed_at,
  expires_at,
  source,
  created_by_email
)
SELECT
  id,
  slug,
  gyan_name,
  access_code,
  duration_months,
  status,
  email,
  generated_at,
  printed_at,
  claimed_at,
  expires_at,
  source,
  created_by_email
FROM calendar_access_codes;

DROP TABLE calendar_access_codes;

ALTER TABLE calendar_access_codes_new
RENAME TO calendar_access_codes;

CREATE INDEX IF NOT EXISTS idx_calendar_access_status
  ON calendar_access_codes(status);

CREATE INDEX IF NOT EXISTS idx_calendar_access_email
  ON calendar_access_codes(email);

CREATE INDEX IF NOT EXISTS idx_calendar_access_generated
  ON calendar_access_codes(generated_at DESC);

CREATE TABLE IF NOT EXISTS calendar_guest_sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  calendar_access_id INTEGER NOT NULL,

  token_hash TEXT NOT NULL UNIQUE,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_seen_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  expires_at TEXT NOT NULL,

  FOREIGN KEY (calendar_access_id)
    REFERENCES calendar_access_codes(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_calendar_guest_session_access
  ON calendar_guest_sessions(calendar_access_id);

CREATE INDEX IF NOT EXISTS idx_calendar_guest_session_expires
  ON calendar_guest_sessions(expires_at);

PRAGMA foreign_keys = ON;
