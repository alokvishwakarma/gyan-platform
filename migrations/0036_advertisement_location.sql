-- Advertisement location snapshot fields.
-- Existing advertisements remain NULL.

ALTER TABLE advertisement_submissions ADD COLUMN city TEXT;
ALTER TABLE advertisement_submissions ADD COLUMN region TEXT;
ALTER TABLE advertisement_submissions ADD COLUMN region_code TEXT;
ALTER TABLE advertisement_submissions ADD COLUMN country_code TEXT;
ALTER TABLE advertisement_submissions ADD COLUMN postal_code TEXT;