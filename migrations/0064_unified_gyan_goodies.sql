-- 0064_unified_gyan_goodies.sql
-- Connect unified gyan_accounts to the existing printable/safety resource
-- infrastructure, add MESSAGE as a public QR resource type, and preserve
-- all existing four-resource calendar cards.

PRAGMA foreign_keys = OFF;


CREATE TABLE gyan_safety_resources_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  calendar_access_id INTEGER NOT NULL,

  resource_type TEXT NOT NULL
    CHECK (
      resource_type IN (
        'MESSAGE',
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

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  revoked_at TEXT,

  FOREIGN KEY (calendar_access_id)
    REFERENCES calendar_access_codes(id)
    ON DELETE CASCADE,

  UNIQUE (
    calendar_access_id,
    resource_type
  )
);


INSERT INTO gyan_safety_resources_new (
  id,
  calendar_access_id,
  resource_type,
  public_token,
  status,
  created_at,
  revoked_at
)
SELECT
  id,
  calendar_access_id,
  resource_type,
  public_token,
  status,
  created_at,
  revoked_at
FROM gyan_safety_resources;


DROP TABLE gyan_safety_resources;

ALTER TABLE gyan_safety_resources_new
RENAME TO gyan_safety_resources;


CREATE INDEX IF NOT EXISTS
idx_gyan_safety_public_token
ON gyan_safety_resources(public_token);

CREATE INDEX IF NOT EXISTS
idx_gyan_safety_calendar_access
ON gyan_safety_resources(calendar_access_id);

CREATE INDEX IF NOT EXISTS
idx_gyan_safety_status
ON gyan_safety_resources(status);


CREATE TABLE IF NOT EXISTS
gyan_account_calendar_links (
  gyan_account_id INTEGER NOT NULL UNIQUE,

  calendar_access_id INTEGER NOT NULL UNIQUE,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (gyan_account_id)
    REFERENCES gyan_accounts(id)
    ON DELETE CASCADE,

  FOREIGN KEY (calendar_access_id)
    REFERENCES calendar_access_codes(id)
    ON DELETE CASCADE
);


CREATE INDEX IF NOT EXISTS
idx_gyan_account_calendar_links_access
ON gyan_account_calendar_links(calendar_access_id);


PRAGMA foreign_keys = ON;
