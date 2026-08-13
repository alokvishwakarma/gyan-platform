-- 0043_shop_featured_services.sql
-- Up to three featured services per shop.

CREATE TABLE IF NOT EXISTS shop_featured_services (
  shop_code TEXT NOT NULL,
  service_id INTEGER NOT NULL,
  featured_order INTEGER NOT NULL
    CHECK (featured_order BETWEEN 1 AND 3),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (shop_code, service_id),
  UNIQUE (shop_code, featured_order),

  FOREIGN KEY (shop_code)
    REFERENCES shops(code)
    ON DELETE CASCADE,

  FOREIGN KEY (service_id)
    REFERENCES services(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
  idx_shop_featured_services_shop
ON shop_featured_services (
  shop_code,
  featured_order
);