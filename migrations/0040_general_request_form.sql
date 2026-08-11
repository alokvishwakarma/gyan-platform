-- GENERAL_REQUEST minimal form configuration.
-- Safe to run after the GENERAL_REQUEST service row exists.

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order
)
SELECT
  general.id,
  source.section_key,
  source.label,
  source.visibility,
  source.include_in_shop_email,
  source.include_in_customer_email,
  source.sort_order
FROM services general
JOIN service_sections source
  ON source.service_id = (
    SELECT id
    FROM services
    WHERE service_code = 'NEARBY_PRINT'
    LIMIT 1
  )
WHERE
  general.service_code = 'GENERAL_REQUEST'
  AND source.section_key IN (
    'service_details',
    'customer_details'
  )
  AND NOT EXISTS (
    SELECT 1
    FROM service_sections existing
    WHERE
      existing.service_id = general.id
      AND existing.section_key = source.section_key
  );

INSERT INTO service_fields (
  section_id,
  field_key,
  label,
  field_type,
  requirement,
  email_label,
  include_in_shop_email,
  include_in_customer_email,
  options_json,
  validation_json,
  sort_order
)
SELECT
  target.id,
  source.field_key,
  source.label,
  source.field_type,
  CASE
    WHEN source.field_key = 'phone_or_whatsapp'
      THEN 'optional'
    ELSE source.requirement
  END,
  source.email_label,
  source.include_in_shop_email,
  source.include_in_customer_email,
  source.options_json,
  source.validation_json,
  source.sort_order
FROM service_fields source
JOIN service_sections source_section
  ON source_section.id = source.section_id
JOIN services general
  ON general.service_code = 'GENERAL_REQUEST'
JOIN service_sections target
  ON target.service_id = general.id
  AND target.section_key = source_section.section_key
WHERE
  source_section.service_id = (
    SELECT id
    FROM services
    WHERE service_code = 'NEARBY_PRINT'
    LIMIT 1
  )
  AND source.field_key IN (
    'request_details',
    'attachments',
    'customer_name',
    'phone_or_whatsapp',
    'email_address'
  )
  AND NOT EXISTS (
    SELECT 1
    FROM service_fields existing
    WHERE
      existing.section_id = target.id
      AND existing.field_key = source.field_key
  );