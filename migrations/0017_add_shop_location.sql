-- 0017_add_shop_location.sql
--
-- Adds optional coordinates for distance-based shop discovery.
-- Existing shops remain valid when coordinates are not yet known.

ALTER TABLE shops
ADD COLUMN latitude REAL
CHECK (
  latitude IS NULL OR
  (latitude >= -90 AND latitude <= 90)
);

ALTER TABLE shops
ADD COLUMN longitude REAL
CHECK (
  longitude IS NULL OR
  (longitude >= -180 AND longitude <= 180)
);

CREATE INDEX IF NOT EXISTS idx_shops_location
ON shops (
  status,
  state,
  city,
  latitude,
  longitude
);
