-- 0041_resale_item_list.sql
-- Adds Sell Old Items using an existing textarea field type.
-- The UI recognizes field_key='items' as a repeatable item-list renderer.

INSERT INTO services (
  service_code, service_type, category, sub_category, name, description,
  icon, color, workflow_type, owner_shop_code, enabled, sort_order, homepage_order
)
SELECT
  'NEARBY_RESALE','system','nearby','resale_recycle','Sell Old Items',
  'Sell or recycle multiple old items through nearby buyers, resellers and recycling providers.',
  '♻️','#2e7d32','generic',NULL,1,1000,1000
WHERE NOT EXISTS (
  SELECT 1 FROM services WHERE service_code='NEARBY_RESALE'
);

UPDATE services
SET
  service_type='system',
  category='nearby',
  sub_category='resale_recycle',
  name='Sell Old Items',
  description='Sell or recycle multiple old items through nearby buyers, resellers and recycling providers.',
  icon='♻️',
  color='#2e7d32',
  workflow_type='generic',
  enabled=1,
  sort_order=1000,
  homepage_order=1000
WHERE service_code='NEARBY_RESALE';

-- Keep room around the new service without changing the earlier sequence.
UPDATE services SET homepage_order=1100
WHERE service_code='NEARBY_REPAIR' AND category='nearby';

UPDATE services SET homepage_order=1200
WHERE service_code='NEARBY_BANKING' AND category='nearby';

UPDATE services SET homepage_order=1300
WHERE service_code='NEARBY_MAPS' AND category='nearby';

INSERT INTO service_sections (
  service_id, section_key, label, description, visibility,
  include_in_shop_email, include_in_customer_email, sort_order
)
SELECT s.id,'items','Items to sell','Add one or more old items.','visible',1,1,100
FROM services s
WHERE s.service_code='NEARBY_RESALE'
AND NOT EXISTS (
  SELECT 1 FROM service_sections ss
  WHERE ss.service_id=s.id AND ss.section_key='items'
);

INSERT INTO service_sections (
  service_id, section_key, label, description, visibility,
  include_in_shop_email, include_in_customer_email, sort_order
)
SELECT s.id,'customer_details','Customer Details',NULL,'visible',1,1,200
FROM services s
WHERE s.service_code='NEARBY_RESALE'
AND NOT EXISTS (
  SELECT 1 FROM service_sections ss
  WHERE ss.service_id=s.id AND ss.section_key='customer_details'
);

INSERT INTO service_sections (
  service_id, section_key, label, description, visibility,
  include_in_shop_email, include_in_customer_email, sort_order
)
SELECT s.id,'additional_details','Additional Details',
       'Optional pickup or item information.','visible',1,1,300
FROM services s
WHERE s.service_code='NEARBY_RESALE'
AND NOT EXISTS (
  SELECT 1 FROM service_sections ss
  WHERE ss.service_id=s.id AND ss.section_key='additional_details'
);

-- Reusable item list. Stored as JSON text so the existing schema remains valid.
INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json, validation_json,
  email_label, include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order
)
SELECT
  ss.id,'items','Items','textarea','mandatory','',
  'Add one or more items. Quantity, unit, expected price and details are optional.',
  '[]',NULL,'{"maximumLength":12000}',
  'Items',1,1,1,100
FROM service_sections ss
JOIN services s ON s.id=ss.service_id
WHERE s.service_code='NEARBY_RESALE'
  AND ss.section_key='items'
  AND NOT EXISTS (
    SELECT 1 FROM service_fields sf
    WHERE sf.section_id=ss.id AND sf.field_key='items'
  );

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json, validation_json,
  email_label, include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order
)
SELECT
  ss.id,'attachments','Photos','file','optional','',
  'Photos help buyers understand condition and value.',
  NULL,NULL,NULL,'Photos',1,1,1,200
FROM service_sections ss
JOIN services s ON s.id=ss.service_id
WHERE s.service_code='NEARBY_RESALE'
  AND ss.section_key='items'
  AND NOT EXISTS (
    SELECT 1 FROM service_fields sf
    WHERE sf.section_id=ss.id AND sf.field_key='attachments'
  );

-- Clone standard customer-contact fields from Nearby Print.
INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json, validation_json,
  email_label, include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order
)
SELECT
  target.id, source.field_key, source.label, source.field_type,
  source.requirement, source.placeholder, source.help_text,
  source.default_value, source.options_json, source.validation_json,
  source.email_label, source.include_in_shop_email,
  source.include_in_customer_email, source.include_in_request_view,
  source.sort_order
FROM service_fields source
JOIN service_sections source_section ON source_section.id=source.section_id
JOIN services source_service ON source_service.id=source_section.service_id
JOIN services resale ON resale.service_code='NEARBY_RESALE'
JOIN service_sections target
  ON target.service_id=resale.id
 AND target.section_key='customer_details'
WHERE source_service.service_code='NEARBY_PRINT'
  AND source_section.section_key='customer_details'
  AND source.field_key IN ('customer_name','phone_or_whatsapp','email_address')
  AND NOT EXISTS (
    SELECT 1 FROM service_fields existing
    WHERE existing.section_id=target.id
      AND existing.field_key=source.field_key
  );

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json, validation_json,
  email_label, include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order
)
SELECT
  ss.id,'pickup_notes','Pickup / additional notes','textarea','optional',
  'Pickup timing, landmark, floor, bulky item details, etc.',
  NULL,NULL,NULL,'{"maximumLength":1000}',
  'Pickup / additional notes',1,1,1,100
FROM service_sections ss
JOIN services s ON s.id=ss.service_id
WHERE s.service_code='NEARBY_RESALE'
  AND ss.section_key='additional_details'
  AND NOT EXISTS (
    SELECT 1 FROM service_fields sf
    WHERE sf.section_id=ss.id AND sf.field_key='pickup_notes'
  );