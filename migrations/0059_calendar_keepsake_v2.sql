-- 0059_calendar_keepsake_v2.sql
-- Portrait A5/A6/A7/A8 keepsake print model.
-- Adds 6-month access, QR-only guest token, selected artwork, and welcome Gems.

PRAGMA foreign_keys = OFF;

ALTER TABLE calendar_guest_sessions
RENAME TO calendar_guest_sessions_old;

ALTER TABLE calendar_access_codes
RENAME TO calendar_access_codes_old;

CREATE TABLE calendar_access_codes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  slug TEXT NOT NULL UNIQUE,
  gyan_name TEXT NOT NULL UNIQUE,
  access_code TEXT NOT NULL UNIQUE,

  qr_token_hash TEXT UNIQUE,

  duration_months INTEGER NOT NULL
    CHECK (
      duration_months IN (
        1,
        3,
        6,
        12
      )
    ),

  welcome_gems INTEGER NOT NULL DEFAULT 0,

  artwork_key TEXT NOT NULL DEFAULT 'GODDESS'
    CHECK (
      artwork_key IN (
        'GODDESS',
        'EDUCATION',
        'SCENIC'
      )
    ),

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

INSERT INTO calendar_access_codes (
  id,
  slug,
  gyan_name,
  access_code,
  duration_months,
  welcome_gems,
  artwork_key,
  status,
  email,
  generated_at,
  printed_at,
  guest_started_at,
  guest_expires_at,
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
  CASE duration_months
    WHEN 12 THEN 12
    WHEN 6 THEN 6
    ELSE 3
  END,
  'GODDESS',
  status,
  email,
  generated_at,
  printed_at,
  guest_started_at,
  guest_expires_at,
  claimed_at,
  expires_at,
  source,
  created_by_email
FROM calendar_access_codes_old;

DROP TABLE calendar_access_codes_old;

CREATE INDEX idx_calendar_access_status
  ON calendar_access_codes(status);

CREATE INDEX idx_calendar_access_email
  ON calendar_access_codes(email);

CREATE INDEX idx_calendar_access_generated
  ON calendar_access_codes(generated_at DESC);

CREATE INDEX idx_calendar_access_qr_token
  ON calendar_access_codes(qr_token_hash);

CREATE TABLE calendar_guest_sessions (
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

INSERT INTO calendar_guest_sessions (
  id,
  calendar_access_id,
  token_hash,
  created_at,
  last_seen_at,
  expires_at
)
SELECT
  id,
  calendar_access_id,
  token_hash,
  created_at,
  last_seen_at,
  expires_at
FROM calendar_guest_sessions_old;

DROP TABLE calendar_guest_sessions_old;

CREATE INDEX idx_calendar_guest_session_access
  ON calendar_guest_sessions(calendar_access_id);

CREATE INDEX idx_calendar_guest_session_expires
  ON calendar_guest_sessions(expires_at);

CREATE TABLE IF NOT EXISTS gem_transactions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  calendar_access_id INTEGER NOT NULL,

  amount INTEGER NOT NULL,

  reason TEXT NOT NULL,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (calendar_access_id)
    REFERENCES calendar_access_codes(id)
    ON DELETE CASCADE,

  UNIQUE (
    calendar_access_id,
    reason
  )
);

CREATE INDEX IF NOT EXISTS idx_gem_transactions_access
  ON gem_transactions(calendar_access_id);

PRAGMA foreign_keys = ON;
