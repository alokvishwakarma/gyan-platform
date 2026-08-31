-- 0067_gyan_wink_retention_unread.sql
-- Track unread G-Winks and expire/delete them after 30 days.

ALTER TABLE gyan_winks
ADD COLUMN read_at TEXT;


ALTER TABLE gyan_winks
ADD COLUMN expires_at TEXT;


UPDATE gyan_winks
SET expires_at =
  datetime(
    created_at,
    '+30 days'
  )
WHERE expires_at IS NULL;


CREATE INDEX IF NOT EXISTS
idx_gyan_winks_recipient_unread
ON gyan_winks(
  recipient_account_id,
  read_at
);


CREATE INDEX IF NOT EXISTS
idx_gyan_winks_expires_at
ON gyan_winks(
  expires_at
);
