CREATE TABLE IF NOT EXISTS featured_promotions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  source_type TEXT NOT NULL
    CHECK (
      source_type IN (
        'gyan',
        'groupon',
        'woot',
        'affiliate',
        'default'
      )
    ),

  title TEXT NOT NULL,
  description TEXT,

  icon TEXT,
  image_url TEXT,

  cta_label TEXT NOT NULL DEFAULT 'View',

  target_url TEXT,

  service_code TEXT,
  shop_code TEXT,

  latitude REAL,
  longitude REAL,
  radius_km REAL,

  starts_at TEXT,
  ends_at TEXT,

  priority INTEGER NOT NULL DEFAULT 0,

  enabled INTEGER NOT NULL DEFAULT 1,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS
  idx_featured_promotions_active
ON featured_promotions (
  enabled,
  starts_at,
  ends_at,
  priority
);

CREATE INDEX IF NOT EXISTS
  idx_featured_promotions_location
ON featured_promotions (
  latitude,
  longitude
);


/*
 * Default homepage feature.
 */
INSERT INTO featured_promotions (
  source_type,
  title,
  description,
  icon,
  cta_label,
  service_code,
  priority,
  enabled
)
SELECT
  'default',
  'Form Assistance',
  'Get help completing everyday forms online.',
  '📝',
  'Start',
  'FORM_ASSISTANCE',
  0,
  1
WHERE NOT EXISTS (
  SELECT 1
  FROM featured_promotions
  WHERE source_type = 'default'
);