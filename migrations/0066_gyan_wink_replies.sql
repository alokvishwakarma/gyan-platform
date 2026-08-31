-- 0066_gyan_wink_replies.sql
-- Tie G-Winks to sender/recipient GYAN accounts and support reply threads.

ALTER TABLE gyan_winks
ADD COLUMN sender_account_id INTEGER
REFERENCES gyan_accounts(id)
ON DELETE SET NULL;

ALTER TABLE gyan_winks
ADD COLUMN recipient_account_id INTEGER
REFERENCES gyan_accounts(id)
ON DELETE SET NULL;

ALTER TABLE gyan_winks
ADD COLUMN parent_wink_id INTEGER
REFERENCES gyan_winks(id)
ON DELETE SET NULL;


CREATE INDEX IF NOT EXISTS
idx_gyan_winks_sender_account
ON gyan_winks(sender_account_id);


CREATE INDEX IF NOT EXISTS
idx_gyan_winks_recipient_account
ON gyan_winks(recipient_account_id);


CREATE INDEX IF NOT EXISTS
idx_gyan_winks_parent
ON gyan_winks(parent_wink_id);
