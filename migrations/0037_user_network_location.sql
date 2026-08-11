-- Approximate network location captured during magic-link verification.
-- This is not precise GPS and may be affected by VPN/mobile/corporate networks.

ALTER TABLE users ADD COLUMN last_city TEXT;
ALTER TABLE users ADD COLUMN last_region TEXT;
ALTER TABLE users ADD COLUMN last_region_code TEXT;
ALTER TABLE users ADD COLUMN last_country_code TEXT;
ALTER TABLE users ADD COLUMN last_postal_code TEXT;
ALTER TABLE users ADD COLUMN last_location_at TEXT;