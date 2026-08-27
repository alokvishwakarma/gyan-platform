CREATE TABLE IF NOT EXISTS gyan_accounts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  code TEXT NOT NULL UNIQUE,
  display_name TEXT NOT NULL,
  access_code TEXT,
  email TEXT,
  registered INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS gyan_browser_sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  account_id INTEGER NOT NULL,
  secret_hash TEXT NOT NULL UNIQUE,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_seen_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id) REFERENCES gyan_accounts(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_gyan_browser_sessions_account
ON gyan_browser_sessions(account_id);

CREATE TABLE IF NOT EXISTS gyan_account_aliases (
  alias_code TEXT PRIMARY KEY,
  account_id INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id) REFERENCES gyan_accounts(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_gyan_account_aliases_account
ON gyan_account_aliases(account_id);

/*
IMPORTANT:
Backfill existing calendar_access_codes/student identities into gyan_accounts
before switching production reads. Do not create duplicate identities for
existing ABCD accounts.
*/
