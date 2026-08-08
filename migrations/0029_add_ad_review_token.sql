ALTER TABLE advertisement_submissions
ADD COLUMN admin_review_token_hash TEXT;

ALTER TABLE advertisement_submissions
ADD COLUMN admin_review_expires_at TEXT;

ALTER TABLE advertisement_submissions
ADD COLUMN duration_days INTEGER NOT NULL DEFAULT 7;

ALTER TABLE advertisement_submissions
ADD COLUMN description TEXT;