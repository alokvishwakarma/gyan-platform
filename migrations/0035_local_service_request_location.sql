-- New request-location snapshot fields.
-- Forward-only: existing rows remain NULL.

ALTER TABLE local_service_requests ADD COLUMN city TEXT;
ALTER TABLE local_service_requests ADD COLUMN region TEXT;
ALTER TABLE local_service_requests ADD COLUMN region_code TEXT;
ALTER TABLE local_service_requests ADD COLUMN country_code TEXT;
ALTER TABLE local_service_requests ADD COLUMN postal_code TEXT;