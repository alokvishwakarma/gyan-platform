CREATE TABLE IF NOT EXISTS print_requests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  order_number TEXT NOT NULL UNIQUE,

  shop_code TEXT NOT NULL,

  customer_name TEXT NOT NULL,
  phone_number TEXT NOT NULL,
  email_address TEXT,
  whatsapp_number TEXT,
  whatsapp_consent INTEGER NOT NULL DEFAULT 0,

  estimated_pages INTEGER NOT NULL DEFAULT 1,
  copies INTEGER NOT NULL DEFAULT 1,

  color_mode TEXT NOT NULL,
  print_sides TEXT NOT NULL,
  paper_size TEXT NOT NULL,

  instructions TEXT,

  estimated_amount_rupees INTEGER,

  status TEXT NOT NULL DEFAULT 'submitted',

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (shop_code)
    REFERENCES shops(code)
);

CREATE INDEX IF NOT EXISTS idx_print_requests_shop_code
ON print_requests(shop_code);

CREATE INDEX IF NOT EXISTS idx_print_requests_status
ON print_requests(status);

CREATE INDEX IF NOT EXISTS idx_print_requests_created_at
ON print_requests(created_at);