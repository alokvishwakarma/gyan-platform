CREATE TABLE IF NOT EXISTS service_sections (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  service_id INTEGER NOT NULL,

  section_key TEXT NOT NULL,
  label TEXT NOT NULL,

  description TEXT,

  visibility TEXT NOT NULL DEFAULT 'visible'
    CHECK (
      visibility IN (
        'visible',
        'hidden'
      )
    ),

  include_in_shop_email INTEGER NOT NULL DEFAULT 1,
  include_in_customer_email INTEGER NOT NULL DEFAULT 1,

  sort_order INTEGER NOT NULL DEFAULT 10,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (service_id)
    REFERENCES services(id)
    ON DELETE CASCADE,

  UNIQUE (
    service_id,
    section_key
  )
);

CREATE INDEX IF NOT EXISTS
  idx_service_sections_service
ON service_sections (
  service_id,
  sort_order
);

CREATE TABLE IF NOT EXISTS service_fields (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  section_id INTEGER NOT NULL,

  field_key TEXT NOT NULL,
  label TEXT NOT NULL,

  field_type TEXT NOT NULL
    CHECK (
      field_type IN (
        'text',
        'textarea',
        'number',
        'email',
        'tel',
        'date',
        'select',
        'radio',
        'checkbox',
        'checkbox-group',
        'file'
      )
    ),

  requirement TEXT NOT NULL DEFAULT 'optional'
    CHECK (
      requirement IN (
        'mandatory',
        'optional',
        'hidden'
      )
    ),

  placeholder TEXT,
  help_text TEXT,

  default_value TEXT,

  options_json TEXT,
  validation_json TEXT,

  email_label TEXT,

  include_in_shop_email INTEGER NOT NULL DEFAULT 1,
  include_in_customer_email INTEGER NOT NULL DEFAULT 1,
  include_in_request_view INTEGER NOT NULL DEFAULT 1,

  sort_order INTEGER NOT NULL DEFAULT 10,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (section_id)
    REFERENCES service_sections(id)
    ON DELETE CASCADE,

  UNIQUE (
    section_id,
    field_key
  )
);

CREATE INDEX IF NOT EXISTS
  idx_service_fields_section
ON service_fields (
  section_id,
  sort_order
);