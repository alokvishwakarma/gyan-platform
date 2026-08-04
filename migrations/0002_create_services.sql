PRAGMA foreign_keys = ON;

/*
 * Global GYAN service catalog.
 *
 * service_type:
 *   system  = supplied by GYAN
 *   custom  = created by a shop
 *
 * workflow_type:
 *   print, upload, assistance, appointment, payment, generic
 */
CREATE TABLE IF NOT EXISTS services (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  service_code TEXT NOT NULL UNIQUE,
  service_type TEXT NOT NULL DEFAULT 'system'
    CHECK(service_type IN ('system', 'custom')),

  category TEXT NOT NULL,
  sub_category TEXT,

  name TEXT NOT NULL,
  description TEXT,

  icon TEXT,
  color TEXT,

  workflow_type TEXT NOT NULL DEFAULT 'generic'
    CHECK(
      workflow_type IN (
        'print',
        'upload',
        'assistance',
        'appointment',
        'payment',
        'generic'
      )
    ),

  /*
   * Custom services can belong to one shop.
   * System services leave owner_shop_code NULL.
   */
  owner_shop_code TEXT,

  enabled INTEGER NOT NULL DEFAULT 1
    CHECK(enabled IN (0, 1)),

  sort_order INTEGER NOT NULL DEFAULT 0,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(owner_shop_code)
    REFERENCES shops(code)
    ON DELETE CASCADE
);

/*
 * Shop-specific configuration.
 *
 * Every global service is initially inserted for a shop
 * with enabled = 0.
 */
CREATE TABLE IF NOT EXISTS shop_services (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  shop_code TEXT NOT NULL,
  service_id INTEGER NOT NULL,

  enabled INTEGER NOT NULL DEFAULT 0
    CHECK(enabled IN (0, 1)),

  display_name TEXT,
  description_override TEXT,
  icon_override TEXT,
  color_override TEXT,

  price_type TEXT NOT NULL DEFAULT 'contact'
    CHECK(
      price_type IN (
        'fixed',
        'starting_at',
        'per_page',
        'quote',
        'free',
        'contact'
      )
    ),

  price_amount_paise INTEGER
    CHECK(
      price_amount_paise IS NULL OR
      price_amount_paise >= 0
    ),

  price_note TEXT,

  sort_order INTEGER NOT NULL DEFAULT 0,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  UNIQUE(shop_code, service_id),

  FOREIGN KEY(shop_code)
    REFERENCES shops(code)
    ON DELETE CASCADE,

  FOREIGN KEY(service_id)
    REFERENCES services(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_services_category
  ON services(category, sub_category);

CREATE INDEX IF NOT EXISTS idx_services_type
  ON services(service_type);

CREATE INDEX IF NOT EXISTS idx_services_owner_shop
  ON services(owner_shop_code);

CREATE INDEX IF NOT EXISTS idx_shop_services_shop
  ON shop_services(shop_code);

CREATE INDEX IF NOT EXISTS idx_shop_services_enabled
  ON shop_services(shop_code, enabled);

/*
 * Default GYAN service catalog.
 */
INSERT OR IGNORE INTO services (
  service_code,
  service_type,
  category,
  sub_category,
  name,
  description,
  icon,
  color,
  workflow_type,
  enabled,
  sort_order
)
VALUES
  (
    'PRINT',
    'system',
    'documents',
    'printing',
    'Print',
    'Upload documents and request printing.',
    '🖨️',
    '#1565c0',
    'print',
    1,
    10
  ),
  (
    'SCAN',
    'system',
    'documents',
    'digitization',
    'Scan',
    'Scan paper documents into digital files.',
    '📠',
    '#1976d2',
    'upload',
    1,
    20
  ),
  (
    'PHOTO',
    'system',
    'documents',
    'photography',
    'Photo',
    'Photo printing and basic photo services.',
    '📷',
    '#1e88e5',
    'upload',
    1,
    30
  ),
  (
    'LAMINATION',
    'system',
    'documents',
    'finishing',
    'Lamination',
    'Document and identity-card lamination.',
    '📄',
    '#2196f3',
    'assistance',
    1,
    40
  ),
  (
    'BINDING',
    'system',
    'documents',
    'finishing',
    'Binding',
    'Document, report and project binding.',
    '📚',
    '#42a5f5',
    'assistance',
    1,
    50
  ),
  (
    'PDF_TOOLS',
    'system',
    'documents',
    'digital',
    'PDF Tools',
    'Merge, split, compress or prepare PDF files.',
    '📑',
    '#64b5f6',
    'upload',
    1,
    60
  ),

  (
    'EDU_FORMS',
    'system',
    'education',
    'forms',
    'Forms',
    'Help completing education-related forms.',
    '📝',
    '#2e7d32',
    'assistance',
    1,
    10
  ),
  (
    'RESUME',
    'system',
    'education',
    'career',
    'Resume',
    'Resume preparation and formatting.',
    '📋',
    '#388e3c',
    'assistance',
    1,
    20
  ),
  (
    'CERTIFICATES',
    'system',
    'education',
    'documents',
    'Certificates',
    'Certificate application and document help.',
    '🎓',
    '#43a047',
    'assistance',
    1,
    30
  ),
  (
    'ADMIT_CARD',
    'system',
    'education',
    'examinations',
    'Admit Card',
    'Download and print examination admit cards.',
    '🪪',
    '#4caf50',
    'assistance',
    1,
    40
  ),
  (
    'APPLICATIONS',
    'system',
    'education',
    'applications',
    'Applications',
    'School, college and examination applications.',
    '✍️',
    '#66bb6a',
    'assistance',
    1,
    50
  ),

  (
    'PAN_HELP',
    'system',
    'government',
    'identity',
    'PAN Help',
    'Assistance with PAN-related applications.',
    '🪪',
    '#e65100',
    'assistance',
    1,
    10
  ),
  (
    'AADHAAR_HELP',
    'system',
    'government',
    'identity',
    'Aadhaar Help',
    'Assistance with supported Aadhaar services.',
    '👤',
    '#ef6c00',
    'assistance',
    1,
    20
  ),
  (
    'PASSPORT',
    'system',
    'government',
    'identity',
    'Passport',
    'Passport application and appointment help.',
    '🛂',
    '#f57c00',
    'appointment',
    1,
    30
  ),
  (
    'BILL_PAYMENT',
    'system',
    'government',
    'payments',
    'Bill Payment',
    'Assistance with supported utility payments.',
    '🧾',
    '#fb8c00',
    'payment',
    1,
    40
  ),
  (
    'INSURANCE',
    'system',
    'government',
    'financial',
    'Insurance',
    'Assistance with supported insurance services.',
    '🛡️',
    '#ff9800',
    'assistance',
    1,
    50
  ),
  (
    'GOVT_FORMS',
    'system',
    'government',
    'forms',
    'Govt Forms',
    'Help completing government-related forms.',
    '🏛️',
    '#ffa726',
    'assistance',
    1,
    60
  );

/*
 * Create disabled configuration rows for every
 * existing shop and every global system service.
 */
INSERT OR IGNORE INTO shop_services (
  shop_code,
  service_id,
  enabled,
  sort_order
)
SELECT
  shops.code,
  services.id,
  0,
  services.sort_order
FROM shops
CROSS JOIN services
WHERE services.service_type = 'system';