CREATE TABLE IF NOT EXISTS shops (
  code TEXT PRIMARY KEY
    CHECK(length(code) = 4),

  name TEXT NOT NULL,
  owner_name TEXT NOT NULL,

  phone_number TEXT NOT NULL,
  whatsapp_number TEXT,
  email_address TEXT,

  address_line TEXT NOT NULL,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  postal_code TEXT NOT NULL,

  status TEXT NOT NULL DEFAULT 'active'
    CHECK(status IN ('pending', 'active', 'suspended')),

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_shops_city
  ON shops(city);

CREATE INDEX IF NOT EXISTS idx_shops_status
  ON shops(status);