-- migrations/0030_add_ad_delete_control.sql

ALTER TABLE advertisement_submissions
ADD COLUMN featured_promotion_id INTEGER;

ALTER TABLE advertisement_submissions
ADD COLUMN delete_token_hash TEXT;

ALTER TABLE advertisement_submissions
ADD COLUMN delete_token_expires_at TEXT;

ALTER TABLE advertisement_submissions
ADD COLUMN deleted_at TEXT;