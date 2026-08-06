-- 0016_seed_demo_market_pricing.sql
--
-- Adds simple market-specific demo prices without live FX conversion.
-- Prices are stored in the smallest currency unit:
--   INR: paise
--   USD: cents
--
-- These are starter/demo values and can be refined after customer testing.

CREATE TABLE IF NOT EXISTS service_market_prices (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  service_id INTEGER NOT NULL,

  country_code TEXT NOT NULL,
  currency_code TEXT NOT NULL,

  price_type TEXT NOT NULL DEFAULT 'starting_at'
    CHECK (
      price_type IN (
        'fixed',
        'starting_at',
        'per_page',
        'quote',
        'free',
        'contact'
      )
    ),

  amount_minor INTEGER
    CHECK (
      amount_minor IS NULL OR
      amount_minor >= 0
    ),

  price_note TEXT,

  enabled INTEGER NOT NULL DEFAULT 1
    CHECK (enabled IN (0, 1)),

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (service_id)
    REFERENCES services(id)
    ON DELETE CASCADE,

  UNIQUE(service_id, country_code)
);

CREATE INDEX IF NOT EXISTS idx_service_market_prices_lookup
ON service_market_prices (
  service_id,
  country_code,
  enabled
);

-- India prices
INSERT INTO service_market_prices (
  service_id,
  country_code,
  currency_code,
  price_type,
  amount_minor,
  price_note,
  enabled,
  updated_at
)
SELECT
  s.id,
  'IN',
  'INR',
  CASE
    WHEN s.service_code = 'TYPING_SERVICE' THEN 'per_page'
    ELSE 'starting_at'
  END,
  CASE s.service_code
    WHEN 'ONLINE_FORM_ASSISTANCE' THEN 10000
    WHEN 'PROJECTS' THEN 15000
    WHEN 'RESUME_MAKING' THEN 30000
    WHEN 'PDF_TOOLS' THEN 5000
    WHEN 'DOCUMENT_FORMATTING' THEN 10000
    WHEN 'PASSPORT_PHOTO_PREPARATION' THEN 5000
    WHEN 'TYPING_SERVICE' THEN 1000
    WHEN 'FILE_CONVERSION' THEN 5000
    WHEN 'BACKGROUND_REMOVAL' THEN 5000
    WHEN 'TRANSLATION_ASSISTANCE' THEN 20000
    WHEN 'OCR_SCAN_TO_TEXT' THEN 5000
    WHEN 'LETTER_WRITING' THEN 15000
    WHEN 'DOCUMENT_REVIEW' THEN 20000
    ELSE NULL
  END,
  CASE
    WHEN s.service_code = 'TYPING_SERVICE'
      THEN 'Starting price per page; final price depends on complexity.'
    ELSE 'Starter price; final price may depend on complexity, urgency, pages, and revisions.'
  END,
  1,
  CURRENT_TIMESTAMP
FROM services s
WHERE s.category = 'online'
ON CONFLICT(service_id, country_code)
DO UPDATE SET
  currency_code = excluded.currency_code,
  price_type = excluded.price_type,
  amount_minor = excluded.amount_minor,
  price_note = excluded.price_note,
  enabled = excluded.enabled,
  updated_at = CURRENT_TIMESTAMP;

-- United States demo prices
INSERT INTO service_market_prices (
  service_id,
  country_code,
  currency_code,
  price_type,
  amount_minor,
  price_note,
  enabled,
  updated_at
)
SELECT
  s.id,
  'US',
  'USD',
  CASE
    WHEN s.service_code = 'TYPING_SERVICE' THEN 'per_page'
    ELSE 'starting_at'
  END,
  CASE s.service_code
    WHEN 'ONLINE_FORM_ASSISTANCE' THEN 500
    WHEN 'PROJECTS' THEN 800
    WHEN 'RESUME_MAKING' THEN 1500
    WHEN 'PDF_TOOLS' THEN 300
    WHEN 'DOCUMENT_FORMATTING' THEN 500
    WHEN 'PASSPORT_PHOTO_PREPARATION' THEN 300
    WHEN 'TYPING_SERVICE' THEN 100
    WHEN 'FILE_CONVERSION' THEN 300
    WHEN 'BACKGROUND_REMOVAL' THEN 300
    WHEN 'TRANSLATION_ASSISTANCE' THEN 1000
    WHEN 'OCR_SCAN_TO_TEXT' THEN 300
    WHEN 'LETTER_WRITING' THEN 800
    WHEN 'DOCUMENT_REVIEW' THEN 1000
    ELSE NULL
  END,
  CASE
    WHEN s.service_code = 'TYPING_SERVICE'
      THEN 'Starting price per page; final price depends on complexity.'
    ELSE 'Starter price; final price may depend on complexity, urgency, pages, and revisions.'
  END,
  1,
  CURRENT_TIMESTAMP
FROM services s
WHERE s.category = 'online'
ON CONFLICT(service_id, country_code)
DO UPDATE SET
  currency_code = excluded.currency_code,
  price_type = excluded.price_type,
  amount_minor = excluded.amount_minor,
  price_note = excluded.price_note,
  enabled = excluded.enabled,
  updated_at = CURRENT_TIMESTAMP;

-- Other countries: ask for a quote.
INSERT INTO service_market_prices (
  service_id,
  country_code,
  currency_code,
  price_type,
  amount_minor,
  price_note,
  enabled,
  updated_at
)
SELECT
  s.id,
  'OTHER',
  'USD',
  'contact',
  NULL,
  'Contact GYAN Support for local pricing.',
  1,
  CURRENT_TIMESTAMP
FROM services s
WHERE s.category = 'online'
ON CONFLICT(service_id, country_code)
DO UPDATE SET
  currency_code = excluded.currency_code,
  price_type = excluded.price_type,
  amount_minor = excluded.amount_minor,
  price_note = excluded.price_note,
  enabled = excluded.enabled,
  updated_at = CURRENT_TIMESTAMP;
