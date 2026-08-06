-- 0015_seed_default_online_service_forms.sql
--
-- Seeds useful starter sections and fields for every enabled online service.
-- The migration is idempotent and can safely be refined later through
-- the existing admin form studio.

------------------------------------------------------------
-- Common sections
------------------------------------------------------------

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  description,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order,
  updated_at
)
SELECT
  s.id,
  'service_details',
  'Service Details',
  'Tell us what you need and when you need it.',
  'visible',
  1,
  1,
  100,
  CURRENT_TIMESTAMP
FROM services s
WHERE s.category = 'online'
ON CONFLICT(service_id, section_key)
DO UPDATE SET
  label = excluded.label,
  description = excluded.description,
  visibility = excluded.visibility,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  description,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order,
  updated_at
)
SELECT
  s.id,
  'files',
  'Files',
  'Upload any documents, photos, screenshots, or instructions that may help.',
  'visible',
  1,
  1,
  200,
  CURRENT_TIMESTAMP
FROM services s
WHERE s.category = 'online'
ON CONFLICT(service_id, section_key)
DO UPDATE SET
  label = excluded.label,
  description = excluded.description,
  visibility = excluded.visibility,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  description,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order,
  updated_at
)
SELECT
  s.id,
  'customer_details',
  'Customer Details',
  'Provide contact information so GYAN Support can confirm the request.',
  'visible',
  1,
  1,
  300,
  CURRENT_TIMESTAMP
FROM services s
WHERE s.category = 'online'
ON CONFLICT(service_id, section_key)
DO UPDATE SET
  label = excluded.label,
  description = excluded.description,
  visibility = excluded.visibility,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_sections (
  service_id,
  section_key,
  label,
  description,
  visibility,
  include_in_shop_email,
  include_in_customer_email,
  sort_order,
  updated_at
)
SELECT
  s.id,
  'address',
  'Address',
  'Location is optional for online work, but it may help with pricing and assignment.',
  'visible',
  1,
  1,
  400,
  CURRENT_TIMESTAMP
FROM services s
WHERE s.category = 'online'
ON CONFLICT(service_id, section_key)
DO UPDATE SET
  label = excluded.label,
  description = excluded.description,
  visibility = excluded.visibility,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

------------------------------------------------------------
-- Shared Service Details fields
------------------------------------------------------------

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
  sort_order,
  updated_at
)
SELECT
  ss.id,
  'request_summary',
  'What do you need?',
  'textarea',
  'mandatory',
  'Describe the work you would like GYAN to complete.',
  'Include the expected output and any special instructions.',
  NULL,
  NULL,
  '{"minimumLength":10,"maximumLength":2000}',
  'Request',
  1,
  1,
  1,
  100,
  CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE
  s.category = 'online'
  AND ss.section_key = 'service_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  field_type = excluded.field_type,
  requirement = excluded.requirement,
  placeholder = excluded.placeholder,
  help_text = excluded.help_text,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'due_date',
  'Desired completion date',
  'date',
  'optional',
  NULL,
  'Leave blank when there is no specific deadline.',
  NULL,
  NULL,
  NULL,
  'Due date',
  1, 1, 1, 200, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'service_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  field_type = excluded.field_type,
  requirement = excluded.requirement,
  help_text = excluded.help_text,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'additional_instructions',
  'Additional instructions',
  'textarea',
  'optional',
  'Anything else we should know?',
  NULL,
  NULL,
  NULL,
  '{"maximumLength":2000}',
  'Additional instructions',
  1, 1, 1, 300, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'service_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  placeholder = excluded.placeholder,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

------------------------------------------------------------
-- Files
------------------------------------------------------------

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'supporting_files',
  'Upload supporting files',
  'file',
  'optional',
  NULL,
  'Upload documents, photos, screenshots, samples, or reference material.',
  NULL,
  NULL,
  NULL,
  'Supporting files',
  1, 1, 1, 100, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'files'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  help_text = excluded.help_text,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

------------------------------------------------------------
-- Customer Details
------------------------------------------------------------

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'customer_name',
  'Name',
  'text',
  'mandatory',
  'Your name',
  NULL,
  NULL,
  NULL,
  '{"minimumLength":2,"maximumLength":100}',
  'Customer name',
  1, 1, 1, 100, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'customer_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  requirement = excluded.requirement,
  placeholder = excluded.placeholder,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'phone_number',
  'Phone or WhatsApp number',
  'tel',
  'mandatory',
  'Include country code when possible',
  NULL,
  NULL,
  NULL,
  '{"minimumLength":7,"maximumLength":20}',
  'Phone',
  1, 1, 1, 200, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'customer_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  requirement = excluded.requirement,
  placeholder = excluded.placeholder,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'email_address',
  'Email address',
  'email',
  'optional',
  'name@example.com',
  NULL,
  NULL,
  NULL,
  '{"maximumLength":200}',
  'Email',
  1, 1, 1, 300, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'customer_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  placeholder = excluded.placeholder,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'preferred_contact',
  'Preferred contact method',
  'select',
  'mandatory',
  'Select a contact method',
  NULL,
  'whatsapp',
  '[{"value":"whatsapp","label":"WhatsApp"},{"value":"phone","label":"Phone call"},{"value":"email","label":"Email"}]',
  NULL,
  'Preferred contact',
  1, 1, 1, 400, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'customer_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  field_type = excluded.field_type,
  requirement = excluded.requirement,
  default_value = excluded.default_value,
  options_json = excluded.options_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

------------------------------------------------------------
-- Address
------------------------------------------------------------

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'country',
  'Country',
  'select',
  'mandatory',
  'Select country',
  'GYAN may suggest this value from your internet connection. Please verify it.',
  NULL,
  '[{"value":"IN","label":"India"},{"value":"US","label":"United States"},{"value":"OTHER","label":"Other"}]',
  NULL,
  'Country',
  1, 1, 1, 100, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'address'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  field_type = excluded.field_type,
  requirement = excluded.requirement,
  placeholder = excluded.placeholder,
  help_text = excluded.help_text,
  options_json = excluded.options_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'state_region',
  'State or region',
  'text',
  'optional',
  'State, province, or region',
  'This may be suggested automatically and can be edited.',
  NULL,
  NULL,
  '{"maximumLength":100}',
  'State/Region',
  1, 1, 1, 200, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'address'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  placeholder = excluded.placeholder,
  help_text = excluded.help_text,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'city',
  'City',
  'text',
  'optional',
  'City or town',
  'This may be suggested automatically and can be edited.',
  NULL,
  NULL,
  '{"maximumLength":100}',
  'City',
  1, 1, 1, 300, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'address'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  placeholder = excluded.placeholder,
  help_text = excluded.help_text,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'postal_code',
  'Postal code',
  'text',
  'optional',
  'PIN or ZIP code',
  NULL,
  NULL,
  NULL,
  '{"maximumLength":20}',
  'Postal code',
  1, 1, 1, 400, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'address'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  placeholder = excluded.placeholder,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'address_line',
  'Address',
  'textarea',
  'optional',
  'Street, locality, landmark, or delivery instructions',
  NULL,
  NULL,
  NULL,
  '{"maximumLength":500}',
  'Address',
  1, 1, 1, 500, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE s.category = 'online'
  AND ss.section_key = 'address'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  placeholder = excluded.placeholder,
  validation_json = excluded.validation_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;

------------------------------------------------------------
-- Service-specific request type dropdowns
------------------------------------------------------------

INSERT INTO service_fields (
  section_id, field_key, label, field_type, requirement,
  placeholder, help_text, default_value, options_json,
  validation_json, email_label,
  include_in_shop_email, include_in_customer_email,
  include_in_request_view, sort_order, updated_at
)
SELECT
  ss.id,
  'request_type',
  CASE s.service_code
    WHEN 'ONLINE_FORM_ASSISTANCE' THEN 'Form or application type'
    WHEN 'PROJECTS' THEN 'Project type'
    WHEN 'RESUME_MAKING' THEN 'Resume request'
    WHEN 'PDF_TOOLS' THEN 'PDF task'
    WHEN 'DOCUMENT_FORMATTING' THEN 'Document type'
    WHEN 'PASSPORT_PHOTO_PREPARATION' THEN 'Photo purpose'
    WHEN 'TYPING_SERVICE' THEN 'Typing source'
    WHEN 'FILE_CONVERSION' THEN 'Conversion type'
    WHEN 'BACKGROUND_REMOVAL' THEN 'Background task'
    WHEN 'TRANSLATION_ASSISTANCE' THEN 'Translation type'
    WHEN 'OCR_SCAN_TO_TEXT' THEN 'Text extraction type'
    WHEN 'LETTER_WRITING' THEN 'Letter type'
    WHEN 'DOCUMENT_REVIEW' THEN 'Review type'
    ELSE 'Request type'
  END,
  'select',
  'mandatory',
  'Select an option',
  NULL,
  NULL,
  CASE s.service_code
    WHEN 'ONLINE_FORM_ASSISTANCE' THEN
      '[{"value":"government","label":"Government form"},{"value":"school","label":"School or college form"},{"value":"job","label":"Job application"},{"value":"travel","label":"Travel or passport form"},{"value":"other","label":"Other"}]'
    WHEN 'PROJECTS' THEN
      '[{"value":"homework","label":"Homework"},{"value":"school_project","label":"School project"},{"value":"college_project","label":"College project"},{"value":"presentation","label":"Presentation"},{"value":"assignment","label":"Assignment"},{"value":"other","label":"Other"}]'
    WHEN 'RESUME_MAKING' THEN
      '[{"value":"new","label":"Create a new resume"},{"value":"update","label":"Update an existing resume"},{"value":"format","label":"Format an existing resume"},{"value":"cover_letter","label":"Resume and cover letter"}]'
    WHEN 'PDF_TOOLS' THEN
      '[{"value":"merge","label":"Merge PDFs"},{"value":"split","label":"Split PDF"},{"value":"compress","label":"Compress PDF"},{"value":"convert","label":"Convert PDF"},{"value":"reorder","label":"Reorder or rotate pages"},{"value":"other","label":"Other"}]'
    WHEN 'DOCUMENT_FORMATTING' THEN
      '[{"value":"letter","label":"Letter"},{"value":"report","label":"Report"},{"value":"assignment","label":"Assignment"},{"value":"application","label":"Application"},{"value":"other","label":"Other"}]'
    WHEN 'PASSPORT_PHOTO_PREPARATION' THEN
      '[{"value":"passport","label":"Passport"},{"value":"visa","label":"Visa"},{"value":"id","label":"ID card"},{"value":"application","label":"Application form"},{"value":"other","label":"Other"}]'
    WHEN 'TYPING_SERVICE' THEN
      '[{"value":"handwritten","label":"Handwritten pages"},{"value":"scan","label":"Scanned document"},{"value":"photo","label":"Photo of text"},{"value":"audio","label":"Audio transcription"},{"value":"other","label":"Other"}]'
    WHEN 'FILE_CONVERSION' THEN
      '[{"value":"word_pdf","label":"Word to PDF"},{"value":"pdf_word","label":"PDF to Word"},{"value":"image_pdf","label":"Image to PDF"},{"value":"image_format","label":"Image format conversion"},{"value":"other","label":"Other"}]'
    WHEN 'BACKGROUND_REMOVAL' THEN
      '[{"value":"remove","label":"Remove background"},{"value":"white","label":"Replace with white background"},{"value":"custom","label":"Replace with another background"},{"value":"other","label":"Other"}]'
    WHEN 'TRANSLATION_ASSISTANCE' THEN
      '[{"value":"document","label":"Document translation"},{"value":"letter","label":"Letter translation"},{"value":"form","label":"Form translation"},{"value":"review","label":"Review an existing translation"},{"value":"other","label":"Other"}]'
    WHEN 'OCR_SCAN_TO_TEXT' THEN
      '[{"value":"editable_text","label":"Extract editable text"},{"value":"word","label":"Convert to Word"},{"value":"spreadsheet","label":"Convert table to spreadsheet"},{"value":"other","label":"Other"}]'
    WHEN 'LETTER_WRITING' THEN
      '[{"value":"personal","label":"Personal letter"},{"value":"business","label":"Business letter"},{"value":"school","label":"School letter"},{"value":"application","label":"Application letter"},{"value":"complaint","label":"Complaint letter"},{"value":"other","label":"Other"}]'
    WHEN 'DOCUMENT_REVIEW' THEN
      '[{"value":"clarity","label":"Clarity and grammar"},{"value":"formatting","label":"Formatting"},{"value":"completeness","label":"Completeness"},{"value":"full_review","label":"Full review"},{"value":"other","label":"Other"}]'
    ELSE
      '[{"value":"standard","label":"Standard request"},{"value":"other","label":"Other"}]'
  END,
  NULL,
  'Request type',
  1, 1, 1, 50, CURRENT_TIMESTAMP
FROM service_sections ss
JOIN services s ON s.id = ss.service_id
WHERE
  s.category = 'online'
  AND ss.section_key = 'service_details'
ON CONFLICT(section_id, field_key)
DO UPDATE SET
  label = excluded.label,
  field_type = excluded.field_type,
  requirement = excluded.requirement,
  placeholder = excluded.placeholder,
  options_json = excluded.options_json,
  sort_order = excluded.sort_order,
  updated_at = CURRENT_TIMESTAMP;
