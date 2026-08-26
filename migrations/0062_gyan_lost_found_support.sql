-- 0062_gyan_lost_found_support.sql
-- Adds optional GYAN Support participation to Lost & Found chat.

PRAGMA foreign_keys = OFF;


ALTER TABLE gyan_lost_found_profiles
ADD COLUMN support_requested INTEGER NOT NULL
DEFAULT 0
CHECK (
  support_requested IN (
    0,
    1
  )
);


ALTER TABLE gyan_lost_found_messages
RENAME TO gyan_lost_found_messages_old;


CREATE TABLE gyan_lost_found_messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  safety_resource_id INTEGER NOT NULL,

  sender_role TEXT NOT NULL
    CHECK (
      sender_role IN (
        'FINDER',
        'OWNER',
        'SUPPORT'
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


INSERT INTO gyan_lost_found_messages (
  id,
  safety_resource_id,
  sender_role,
  message,
  created_at
)
SELECT
  id,
  safety_resource_id,
  sender_role,
  message,
  created_at
FROM gyan_lost_found_messages_old;


DROP TABLE gyan_lost_found_messages_old;


CREATE INDEX IF NOT EXISTS
idx_gyan_lost_found_messages_resource
ON gyan_lost_found_messages (
  safety_resource_id,
  id
);


PRAGMA foreign_keys = ON;
