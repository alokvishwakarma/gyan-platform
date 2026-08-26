-- 0064_gyan_emergency_messages.sql
-- One-way scanner messages for Emergency QR cards.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS gyan_emergency_messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  safety_resource_id INTEGER NOT NULL,

  message TEXT NOT NULL,

  contact TEXT,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (
    safety_resource_id
  )
    REFERENCES gyan_safety_resources(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
idx_gyan_emergency_messages_resource
ON gyan_emergency_messages (
  safety_resource_id,
  id
);
