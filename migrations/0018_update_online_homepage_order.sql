-- 0018_update_online_homepage_order.sql
--
-- Updates the homepage order for online services.
-- This migration is safe to apply locally now and remotely later.

UPDATE services
SET
  homepage_order = CASE
    WHEN service_code = 'ONLINE_FORM_ASSISTANCE'
      OR lower(name) = 'form assistance'
      THEN 100

    WHEN service_code = 'PDF_TOOLS'
      OR lower(name) = 'pdf tools'
      THEN 200

    WHEN service_code = 'ONLINE_TUITION'
      OR lower(name) = 'tuition'
      THEN 300

    WHEN service_code = 'PROJECTS'
      OR lower(name) IN (
        'project',
        'projects'
      )
      THEN 400

    WHEN service_code = 'DOCUMENT_FORMATTING'
      OR lower(name) = 'document formatting'
      THEN 500

    WHEN service_code = 'TYPING_SERVICE'
      OR lower(name) = 'typing service'
      THEN 600

    WHEN service_code = 'RESUME_MAKING'
      OR lower(name) IN (
        'resume making',
        'resume & cv',
        'resume / cv'
      )
      THEN 650

    WHEN service_code = 'TRANSLATION_ASSISTANCE'
      OR lower(name) IN (
        'translation',
        'translation assistance'
      )
      THEN 700

    WHEN service_code = 'OCR_SCAN_TO_TEXT'
      OR lower(name) IN (
        'ocr / scan to text',
        'ocr scan to text',
        'scan to text'
      )
      THEN 800

    WHEN service_code = 'FILE_CONVERSION'
      OR lower(name) = 'file conversion'
      THEN 900

    ELSE homepage_order
  END,
  updated_at = CURRENT_TIMESTAMP
WHERE
  category = 'online'
  AND (
    service_code IN (
      'ONLINE_FORM_ASSISTANCE',
      'PDF_TOOLS',
      'ONLINE_TUITION',
      'PROJECTS',
      'DOCUMENT_FORMATTING',
      'TYPING_SERVICE',
      'RESUME_MAKING',
      'TRANSLATION_ASSISTANCE',
      'OCR_SCAN_TO_TEXT',
      'FILE_CONVERSION'
    )
    OR lower(name) IN (
      'form assistance',
      'pdf tools',
      'tuition',
      'project',
      'projects',
      'document formatting',
      'typing service',
      'resume making',
      'resume & cv',
      'resume / cv',
      'translation',
      'translation assistance',
      'ocr / scan to text',
      'ocr scan to text',
      'scan to text',
      'file conversion'
    )
  );
