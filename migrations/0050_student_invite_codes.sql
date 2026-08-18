-- 0050_student_invite_codes.sql

CREATE TABLE IF NOT EXISTS student_invite_codes (
  code TEXT PRIMARY KEY,

  country_code TEXT NOT NULL,

  print_format TEXT NOT NULL
    CHECK (
      print_format IN (
        'A5',
        'A6',
        'A7',
        'A8',
        'CREDIT_CARD',
        'BUSINESS_CARD'
      )
    ),

  orientation TEXT NOT NULL
    CHECK (
      orientation IN (
        'portrait',
        'landscape'
      )
    ),

  range_start TEXT NOT NULL,
  range_end TEXT NOT NULL,

  status TEXT NOT NULL
    DEFAULT 'active'
    CHECK (
      status IN (
        'active',
        'disabled'
      )
    ),

  scan_count INTEGER NOT NULL
    DEFAULT 0,

  registration_count INTEGER NOT NULL
    DEFAULT 0,

  first_scanned_at TEXT,
  last_scanned_at TEXT,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  CHECK (
    length(code) = 4
  )
);

CREATE INDEX IF NOT EXISTS idx_student_invite_codes_country
ON student_invite_codes(country_code);

CREATE INDEX IF NOT EXISTS idx_student_invite_codes_format
ON student_invite_codes(print_format);

CREATE INDEX IF NOT EXISTS idx_student_invite_codes_created
ON student_invite_codes(created_at);
