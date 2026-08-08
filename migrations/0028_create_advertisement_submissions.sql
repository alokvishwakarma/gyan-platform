CREATE TABLE IF NOT EXISTS advertisement_submissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  status TEXT NOT NULL DEFAULT 'pending_email_verification'
    CHECK (
      status IN (
        'pending_email_verification',
        'pending_review',
        'approved',
        'rejected'
      )
    ),

  business_name TEXT NOT NULL,
  service_name TEXT NOT NULL,

  offer_text TEXT,
  discount_percent REAL,

  latitude REAL NOT NULL,
  longitude REAL NOT NULL,

  service_radius_km REAL NOT NULL,

  phone TEXT NOT NULL,
  email TEXT NOT NULL,

  verification_token_hash TEXT,
  verification_expires_at TEXT,

  email_verified_at TEXT,
  approved_at TEXT,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE INDEX IF NOT EXISTS
  idx_advertisement_submissions_status
ON advertisement_submissions (
  status,
  created_at
);


CREATE INDEX IF NOT EXISTS
  idx_advertisement_submissions_email
ON advertisement_submissions (
  email
);