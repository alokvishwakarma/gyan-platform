-- 0011_add_homepage_order.sql
--
-- Adds a homepage-specific display order.
--
-- sort_order controls the complete catalog.
-- homepage_order controls compact homepage rows.
-- NULL means the service is not shown on the homepage.

ALTER TABLE services
ADD COLUMN homepage_order INTEGER
  CHECK (
    homepage_order IS NULL OR
    homepage_order >= 0
  );

CREATE INDEX IF NOT EXISTS idx_services_homepage_order
ON services (
  category,
  enabled,
  homepage_order
);
