-- 0134_restore_general_request.sql
-- Restore GENERAL_REQUEST and its compact request form.
-- Safe to rerun.

INSERT INTO services (
  service_code, service_type, category, sub_category, name,
  description, icon, color, workflow_type, owner_shop_code,
  enabled, sort_order, homepage_order
)
VALUES (
  'GENERAL_REQUEST', 'system', 'online', 'general', 'General Request',
  'Send a general request with optional files and contact details.',
  '📝', '#64748b', 'assistance', NULL, 1, 1300, NULL
)
ON CONFLICT(service_code)
DO UPDATE SET
  service_type='system',
  category='online',
  sub_category='general',
  name='General Request',
  description='Send a general request with optional files and contact details.',
  icon='📝',
  color='#64748b',
  workflow_type='assistance',
  enabled=1,
  sort_order=1300,
  updated_at=CURRENT_TIMESTAMP;

INSERT INTO service_sections (
  service_id, section_key, label, visibility,
  include_in_shop_email, include_in_customer_email, sort_order
)
SELECT s.id, 'service_details', 'Request', 'visible', 1, 1, 10
FROM services s
WHERE s.service_code='GENERAL_REQUEST'
  AND NOT EXISTS (
    SELECT 1 FROM service_sections x
    WHERE x.service_id=s.id AND x.section_key='service_details'
  );

INSERT INTO service_sections (
  service_id, section_key, label, visibility,
  include_in_shop_email, include_in_customer_email, sort_order
)
SELECT s.id, 'customer_details', 'Contact', 'visible', 1, 1, 20
FROM services s
WHERE s.service_code='GENERAL_REQUEST'
  AND NOT EXISTS (
    SELECT 1 FROM service_sections x
    WHERE x.service_id=s.id AND x.section_key='customer_details'
  );

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  email_label, include_in_shop_email, include_in_customer_email,
  options_json, validation_json, sort_order
)
SELECT
  target.id,
  source.field_key,
  source.label,
  source.field_type,
  CASE WHEN source.field_key='phone_or_whatsapp'
       THEN 'optional' ELSE source.requirement END,
  source.email_label,
  source.include_in_shop_email,
  source.include_in_customer_email,
  source.options_json,
  source.validation_json,
  source.sort_order
FROM service_fields source
JOIN service_sections source_section
  ON source_section.id=source.section_id
JOIN services source_service
  ON source_service.id=source_section.service_id
 AND source_service.service_code='NEARBY_PRINT'
JOIN services general
  ON general.service_code='GENERAL_REQUEST'
JOIN service_sections target
  ON target.service_id=general.id
 AND target.section_key=source_section.section_key
WHERE source.field_key IN (
  'request_details',
  'attachments',
  'customer_name',
  'phone_or_whatsapp',
  'email_address'
)
AND NOT EXISTS (
  SELECT 1 FROM service_fields existing
  WHERE existing.section_id=target.id
    AND existing.field_key=source.field_key
);

SELECT
  id, service_code, service_type, category, workflow_type, enabled
FROM services
WHERE service_code='GENERAL_REQUEST';

SELECT
  ss.section_key, sf.field_key, sf.field_type,
  sf.requirement, sf.sort_order
FROM services s
JOIN service_sections ss ON ss.service_id=s.id
JOIN service_fields sf ON sf.section_id=ss.id
WHERE s.service_code='GENERAL_REQUEST'
ORDER BY ss.sort_order, sf.sort_order;
