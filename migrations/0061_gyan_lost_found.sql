-- 0061_gyan_lost_found.sql
-- Privacy-friendly Lost & Found details and anonymous GYAN chat.

PRAGMA foreign_keys = ON;


CREATE TABLE IF NOT EXISTS gyan_lost_found_profiles (
  safety_resource_id INTEGER PRIMARY KEY,

  owner_deliver_at TEXT,
  owner_contact TEXT,
  owner_message TEXT,

  finder_found_at TEXT,
  finder_will_deliver_at TEXT,
  finder_message TEXT,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (
    safety_resource_id
  )
    REFERENCES gyan_safety_resources(id)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS gyan_lost_found_messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  safety_resource_id INTEGER NOT NULL,

  sender_role TEXT NOT NULL
    CHECK (
      sender_role IN (
        'FINDER',
        'OWNER'
      )
    ),

  message TEXT NOT NULL,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (
    safety_resource_id
  )
    REFERENCES gyan_safety_resources(id)
    ON DELETE CASCADE
);


CREATE INDEX IF NOT EXISTS
idx_gyan_lost_found_messages_resource
ON gyan_lost_found_messages (
  safety_resource_id,
  id
);
