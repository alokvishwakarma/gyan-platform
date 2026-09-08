-- 0135_gyan_friends.sql
-- Persistent GYAN friend/contact relationships.
-- One-way by design: when A adds B, B does not automatically add A.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS gyan_friends (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  owner_account_id INTEGER NOT NULL,
  friend_account_id INTEGER NOT NULL,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (owner_account_id)
    REFERENCES gyan_accounts(id)
    ON DELETE CASCADE,

  FOREIGN KEY (friend_account_id)
    REFERENCES gyan_accounts(id)
    ON DELETE CASCADE,

  CHECK (
    owner_account_id <> friend_account_id
  ),

  UNIQUE (
    owner_account_id,
    friend_account_id
  )
);

CREATE INDEX IF NOT EXISTS
idx_gyan_friends_owner
ON gyan_friends (
  owner_account_id,
  created_at DESC
);

CREATE INDEX IF NOT EXISTS
idx_gyan_friends_friend
ON gyan_friends (
  friend_account_id
);
