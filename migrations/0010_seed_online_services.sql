-- GYAN global online-service catalog
-- Lower sort_order appears first.
-- Values use increments of 100 to allow future insertions.

INSERT INTO services (
  service_code,
  service_type,
  category,
  sub_category,
  name,
  description,
  icon,
  color,
  workflow_type,
  owner_shop_code,
  enabled,
  sort_order
)
VALUES
  (
    'ONLINE_FORM_ASSISTANCE',
    'system',
    'online',
    'forms_applications',
    'Form Assistance',
    'Request help preparing supported online forms and applications.',
    '📝',
    '#ea580c',
    'assistance',
    NULL,
    1,
    100
  ),
  (
    'RESUME_MAKING',
    'system',
    'online',
    'career',
    'Resume Making',
    'Create, update, or format a professional resume.',
    '📄',
    '#2563eb',
    'assistance',
    NULL,
    1,
    200
  ),
  (
    'PDF_TOOLS',
    'system',
    'online',
    'documents',
    'PDF Tools',
    'Merge, split, compress, rotate, organize, or convert PDF files.',
    '📑',
    '#7c3aed',
    'assistance',
    NULL,
    1,
    300
  ),
  (
    'DOCUMENT_FORMATTING',
    'system',
    'online',
    'documents',
    'Document Formatting',
    'Format letters, reports, assignments, applications, and Word documents.',
    '✍️',
    '#0891b2',
    'assistance',
    NULL,
    1,
    400
  ),
  (
    'PASSPORT_PHOTO_PREPARATION',
    'system',
    'online',
    'images_photos',
    'Passport Photo',
    'Crop, resize, and prepare a photo for supported passport or ID requirements.',
    '🪪',
    '#db2777',
    'assistance',
    NULL,
    1,
    500
  ),
  (
    'TYPING_SERVICE',
    'system',
    'online',
    'documents',
    'Typing Service',
    'Convert handwritten, scanned, or photographed text into an editable document.',
    '⌨️',
    '#4f46e5',
    'assistance',
    NULL,
    1,
    600
  ),
  (
    'FILE_CONVERSION',
    'system',
    'online',
    'documents',
    'File Conversion',
    'Convert supported documents and images between common file formats.',
    '🔄',
    '#0284c7',
    'assistance',
    NULL,
    1,
    700
  ),
  (
    'BACKGROUND_REMOVAL',
    'system',
    'online',
    'images_photos',
    'Background Removal',
    'Remove or replace the background of a submitted image.',
    '🖼️',
    '#059669',
    'assistance',
    NULL,
    1,
    800
  ),
  (
    'TRANSLATION_ASSISTANCE',
    'system',
    'online',
    'language',
    'Translation Assistance',
    'Request human-reviewed assistance translating supported documents.',
    '🌐',
    '#0f766e',
    'assistance',
    NULL,
    1,
    900
  ),
  (
    'OCR_SCAN_TO_TEXT',
    'system',
    'online',
    'documents',
    'Scan to Text',
    'Extract editable text from supported scanned documents or images.',
    '🔤',
    '#0369a1',
    'assistance',
    NULL,
    1,
    1000
  ),
  (
    'LETTER_WRITING',
    'system',
    'online',
    'writing_assistance',
    'Letter Writing',
    'Prepare a clear personal, business, school, or application letter.',
    '✉️',
    '#9333ea',
    'assistance',
    NULL,
    1,
    1100
  ),
  (
    'DOCUMENT_REVIEW',
    'system',
    'online',
    'writing_assistance',
    'Document Review',
    'Review a document for clarity, formatting, completeness, and common errors.',
    '🔎',
    '#475569',
    'assistance',
    NULL,
    1,
    1200
  )

ON CONFLICT(service_code)
DO UPDATE SET
  service_type =
    excluded.service_type,

  category =
    excluded.category,

  sub_category =
    excluded.sub_category,

  name =
    excluded.name,

  description =
    excluded.description,

  icon =
    excluded.icon,

  color =
    excluded.color,

  workflow_type =
    excluded.workflow_type,

  owner_shop_code =
    excluded.owner_shop_code,

  enabled =
    excluded.enabled,

  sort_order =
    excluded.sort_order,

  updated_at =
    CURRENT_TIMESTAMP;