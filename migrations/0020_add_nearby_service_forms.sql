-- 0020_add_nearby_service_forms.sql
--
-- Adds a simple configurable request form to all nearby services except Maps.
-- Safe to apply locally now and remotely later.
-- Re-running is safe because every insert checks for an existing key.

-- ============================================================
-- Sections
-- ============================================================

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  description,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order
)
SELECT
  s.id,
  'service_details',
  'Service Details',
  'Tell the shop what you need.',
  'visible',
  1,
  1,
  100
FROM services s
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND NOT EXISTS (
    SELECT 1
    FROM service_sections ss
    WHERE
      ss.service_id = s.id
      AND ss.section_key = 'service_details'
  );

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  description,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order
)
SELECT
  s.id,
  'customer_details',
  'Customer Details',
  'Provide your name and a contact number.',
  'visible',
  1,
  1,
  200
FROM services s
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND NOT EXISTS (
    SELECT 1
    FROM service_sections ss
    WHERE
      ss.service_id = s.id
      AND ss.section_key = 'customer_details'
  );

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  description,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order
)
SELECT
  s.id,
  'additional_details',
  'Additional Details',
  'Optional information that may help the shop.',
  'visible',
  1,
  1,
  300
FROM services s
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND NOT EXISTS (
    SELECT 1
    FROM service_sections ss
    WHERE
      ss.service_id = s.id
      AND ss.section_key = 'additional_details'
  );

-- ============================================================
-- Service Details fields
-- ============================================================

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'request_details',
  'What do you need?',
  'textarea',
  'mandatory',
  'Briefly describe what you need',
  NULL,
  NULL,
  NULL,
  '{"minimumLength":2,"maximumLength":2000}',
  'Request details',
  1,
  1,
  1,
  100
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'service_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'request_details'
  );

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'attachments',
  'Files',
  'file',
  'optional',
  '',
  'Attach a photo or document when helpful.',
  NULL,
  NULL,
  NULL,
  'Files',
  1,
  1,
  1,
  200
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'service_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'attachments'
  );

-- ============================================================
-- Customer Details fields
-- ============================================================

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'customer_name',
  'Name',
  'text',
  'mandatory',
  'Name',
  NULL,
  NULL,
  NULL,
  '{"minimumLength":2,"maximumLength":120}',
  'Customer name',
  1,
  1,
  1,
  100
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'customer_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'customer_name'
  );

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'phone_or_whatsapp',
  'Phone or WhatsApp number',
  'tel',
  'mandatory',
  'Phone or WhatsApp number',
  'The shop will use this number to contact you.',
  NULL,
  NULL,
  '{"minimumLength":7,"maximumLength":30}',
  'Phone or WhatsApp',
  1,
  1,
  1,
  200
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'customer_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'phone_or_whatsapp'
  );

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'email_address',
  'Email',
  'email',
  'optional',
  'Email address',
  NULL,
  NULL,
  NULL,
  '{"maximumLength":254}',
  'Email',
  1,
  1,
  1,
  300
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'customer_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'email_address'
  );

-- ============================================================
-- Additional Details fields
-- ============================================================

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'preferred_date',
  'Preferred date',
  'date',
  'optional',
  '',
  NULL,
  NULL,
  NULL,
  NULL,
  'Preferred date',
  1,
  1,
  1,
  100
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'additional_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'preferred_date'
  );

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'service_address',
  'Service address or landmark',
  'text',
  'optional',
  'Address or nearby landmark',
  NULL,
  NULL,
  NULL,
  '{"maximumLength":300}',
  'Address or landmark',
  1,
  1,
  1,
  200
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'additional_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'service_address'
  );

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  placeholder,
  help_text,
  default_value,
  options_json,
  validation_json,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  include_in_request_view,
  sort_order
)
SELECT
  ss.id,
  'additional_notes',
  'Additional notes',
  'textarea',
  'optional',
  'Anything else the shop should know?',
  NULL,
  NULL,
  NULL,
  '{"maximumLength":2000}',
  'Additional notes',
  1,
  1,
  1,
  300
FROM service_sections ss
JOIN services s
  ON s.id = ss.service_id
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND ss.section_key = 'additional_details'
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields sf
    WHERE
      sf.section_id = ss.id
      AND sf.field_key = 'additional_notes'
  );
