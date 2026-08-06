-- 0013_update_online_homepage_order.sql
--
-- Adds Projects and configures the five online homepage shortcuts.
-- The UI generates the final Other tile.

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
  sort_order,
  homepage_order
)
VALUES (
  'PROJECTS',
  'system',
  'online',
  'education',
  'Projects',
  'Request help with homework, school projects, college projects, assignments, presentations, and related educational work.',
  '📚',
  '#0ea5e9',
  'assistance',
  NULL,
  1,
  150,
  20
)
ON CONFLICT(service_code)
DO UPDATE SET
  service_type = excluded.service_type,
  category = excluded.category,
  sub_category = excluded.sub_category,
  name = excluded.name,
  description = excluded.description,
  icon = excluded.icon,
  color = excluded.color,
  workflow_type = excluded.workflow_type,
  owner_shop_code = excluded.owner_shop_code,
  enabled = excluded.enabled,
  sort_order = excluded.sort_order,
  homepage_order = excluded.homepage_order,
  updated_at = CURRENT_TIMESTAMP;

UPDATE services
SET homepage_order = NULL,
    updated_at = CURRENT_TIMESTAMP
WHERE category = 'online';

UPDATE services
SET homepage_order = 10,
    updated_at = CURRENT_TIMESTAMP
WHERE service_code = 'ONLINE_FORM_ASSISTANCE';

UPDATE services
SET homepage_order = 20,
    updated_at = CURRENT_TIMESTAMP
WHERE service_code = 'PROJECTS';

UPDATE services
SET homepage_order = 30,
    updated_at = CURRENT_TIMESTAMP
WHERE service_code = 'RESUME_MAKING';

UPDATE services
SET homepage_order = 40,
    updated_at = CURRENT_TIMESTAMP
WHERE service_code = 'PDF_TOOLS';

UPDATE services
SET homepage_order = 50,
    updated_at = CURRENT_TIMESTAMP
WHERE service_code = 'DOCUMENT_FORMATTING';
