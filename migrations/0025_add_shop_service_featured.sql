ALTER TABLE shop_services
ADD COLUMN featured INTEGER NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS
  idx_shop_services_featured
ON shop_services (
  shop_code,
  featured,
  enabled
);