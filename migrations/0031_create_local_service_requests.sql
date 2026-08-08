CREATE TABLE IF NOT EXISTS local_service_requests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  status TEXT NOT NULL DEFAULT 'pending_email_verification',

  service_name TEXT NOT NULL,

  details TEXT,

  latitude REAL NOT NULL,
  longitude REAL NOT NULL,

  search_radius_km REAL NOT NULL,

  email TEXT NOT NULL,
  phone TEXT,

  preferred_time TEXT,

  verification_token_hash TEXT,
  verification_expires_at TEXT,

  email_verified_at TEXT,

  assigned_shop_code TEXT,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE INDEX IF NOT EXISTS
  idx_local_service_requests_status
ON local_service_requests (
  status,
  created_at
);


CREATE INDEX IF NOT EXISTS
  idx_local_service_requests_email
ON local_service_requests (
  email
);


CREATE INDEX IF NOT EXISTS
  idx_local_service_requests_assignment
ON local_service_requests (
  assigned_shop_code,
  status
);