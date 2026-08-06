CREATE TABLE IF NOT EXISTS service_requests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  request_number TEXT NOT NULL UNIQUE,

  shop_code TEXT NOT NULL,
  service_id INTEGER NOT NULL,

  customer_name TEXT,
  phone_number TEXT,
  email_address TEXT,
  whatsapp_number TEXT,
  whatsapp_consent INTEGER NOT NULL DEFAULT 0,

  status TEXT NOT NULL DEFAULT 'submitted',

  details_json TEXT NOT NULL DEFAULT '{}',

  estimated_amount_paise INTEGER,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (shop_code)
    REFERENCES shops(code),

  FOREIGN KEY (service_id)
    REFERENCES services(id)
);

CREATE INDEX IF NOT EXISTS
  idx_service_requests_shop_created
ON service_requests (
  shop_code,
  created_at DESC
);

CREATE INDEX IF NOT EXISTS
  idx_service_requests_service_created
ON service_requests (
  service_id,
  created_at DESC
);

CREATE INDEX IF NOT EXISTS
  idx_service_requests_status
ON service_requests (
  status,
  created_at DESC
);

CREATE TABLE IF NOT EXISTS service_request_files (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  service_request_id INTEGER NOT NULL,

  section_key TEXT NOT NULL,
  field_key TEXT NOT NULL,

  original_file_name TEXT NOT NULL,
  content_type TEXT NOT NULL,
  file_size INTEGER NOT NULL,

  storage_key TEXT NOT NULL UNIQUE,
  storage_status TEXT NOT NULL DEFAULT 'stored',

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (service_request_id)
    REFERENCES service_requests(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
  idx_service_request_files_request
ON service_request_files (
  service_request_id
);