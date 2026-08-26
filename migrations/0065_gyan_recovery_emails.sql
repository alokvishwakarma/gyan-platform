-- 0065_gyan_recovery_emails.sql
-- Recovery email is stored even before verification.
-- Unverified addresses MUST NOT be used for authentication or Access Code recovery.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS gyan_recovery_emails (
  calendar_access_id INTEGER PRIMARY KEY,

  email TEXT NOT NULL,

  verified INTEGER NOT NULL
    DEFAULT 0
    CHECK (verified IN (0, 1)),

  verification_token_hash TEXT,

  verification_expires_at TEXT,

  verified_at TEXT,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (calendar_access_id)
    REFERENCES calendar_access_codes(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
idx_gyan_recovery_emails_email
ON gyan_recovery_emails (
  email
);
