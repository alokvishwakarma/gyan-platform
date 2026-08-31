-- 0065_gyan_winks.sql
-- Persistent, per-message G-Wink reveal links.

CREATE TABLE IF NOT EXISTS gyan_winks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  safety_resource_id INTEGER NOT NULL,

  wink_token TEXT NOT NULL UNIQUE,

  kind TEXT NOT NULL DEFAULT '😉',

  message TEXT NOT NULL,

  recipient_query TEXT,

  add_friend INTEGER NOT NULL DEFAULT 0
    CHECK (add_friend IN (0, 1)),

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (safety_resource_id)
    REFERENCES gyan_safety_resources(id)
    ON DELETE CASCADE
);


CREATE INDEX IF NOT EXISTS
idx_gyan_winks_resource
ON gyan_winks(safety_resource_id);


CREATE INDEX IF NOT EXISTS
idx_gyan_winks_token
ON gyan_winks(wink_token);
