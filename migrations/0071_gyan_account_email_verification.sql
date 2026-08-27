-- 0071_gyan_account_email_verification.sql
-- Keep unverified addresses separate from gyan_accounts.email.
-- The verified email is promoted only after the user clicks the verification link.

CREATE TABLE IF NOT EXISTS gyan_account_email_verifications (
  account_id INTEGER PRIMARY KEY,
  email TEXT NOT NULL,
  token_hash TEXT NOT NULL UNIQUE,
  expires_at TEXT NOT NULL,
  verified_at TEXT,
  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id)
    REFERENCES gyan_accounts(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
idx_gyan_account_email_verifications_token
ON gyan_account_email_verifications (
  token_hash
);
