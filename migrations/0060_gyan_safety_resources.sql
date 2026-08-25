-- 0060_gyan_safety_resources.sql
-- Privacy-preserving public child resources for A5 GYAN cards.
-- Public tokens map internally to a Calendar GYAN, but do not expose
-- the parent 4-character GYAN slug in the printed URL.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS gyan_safety_resources (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  calendar_access_id INTEGER NOT NULL,

  resource_type TEXT NOT NULL
    CHECK (
      resource_type IN (
        'CERTIFICATE',
        'LOST_FOUND',
        'EMERGENCY',
        'HELP'
      )
    ),

  public_token TEXT NOT NULL UNIQUE,

  status TEXT NOT NULL DEFAULT 'ACTIVE'
    CHECK (
      status IN (
        'ACTIVE',
        'REVOKED'
      )
    ),

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  revoked_at TEXT,

  FOREIGN KEY (calendar_access_id)
    REFERENCES calendar_access_codes(id)
    ON DELETE CASCADE,

  UNIQUE (
    calendar_access_id,
    resource_type
  )
);

CREATE INDEX IF NOT EXISTS idx_gyan_safety_public_token
  ON gyan_safety_resources(public_token);

CREATE INDEX IF NOT EXISTS idx_gyan_safety_calendar_access
  ON gyan_safety_resources(calendar_access_id);

CREATE INDEX IF NOT EXISTS idx_gyan_safety_status
  ON gyan_safety_resources(status);
