CREATE TABLE IF NOT EXISTS admin_login_codes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  email TEXT NOT NULL,
  code_hash TEXT NOT NULL,

  request_ip TEXT,

  expires_at TEXT NOT NULL,
  used_at TEXT,

  attempt_count INTEGER NOT NULL DEFAULT 0,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admin_sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  email TEXT NOT NULL,
  session_hash TEXT NOT NULL UNIQUE,

  expires_at TEXT NOT NULL,
  revoked_at TEXT,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_admin_login_codes_email
  ON admin_login_codes (
    email,
    created_at
  );

CREATE INDEX IF NOT EXISTS idx_admin_login_codes_ip
  ON admin_login_codes (
    request_ip,
    created_at
  );

CREATE INDEX IF NOT EXISTS idx_admin_sessions_hash
  ON admin_sessions (
    session_hash
  );