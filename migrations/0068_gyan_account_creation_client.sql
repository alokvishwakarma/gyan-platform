ALTER TABLE gyan_accounts
ADD COLUMN created_device_type TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_os TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_os_version TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_browser TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_browser_version TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_screen_width INTEGER;

ALTER TABLE gyan_accounts
ADD COLUMN created_screen_height INTEGER;

ALTER TABLE gyan_accounts
ADD COLUMN created_viewport_width INTEGER;

ALTER TABLE gyan_accounts
ADD COLUMN created_viewport_height INTEGER;

ALTER TABLE gyan_accounts
ADD COLUMN created_touch INTEGER NOT NULL DEFAULT 0;

ALTER TABLE gyan_accounts
ADD COLUMN created_language TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_languages TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_platform TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_referrer TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_utm_source TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_utm_medium TEXT;

ALTER TABLE gyan_accounts
ADD COLUMN created_utm_campaign TEXT;
