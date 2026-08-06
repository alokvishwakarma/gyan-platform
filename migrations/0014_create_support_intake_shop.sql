-- 0014_create_support_intake_shop.sql
--
-- Creates a system intake shop for public online requests.
-- Associating a request with SUPP does not authenticate the customer
-- or grant any admin privileges.

INSERT INTO shops (
  code,
  name,
  owner_name,
  phone_number,
  whatsapp_number,
  email_address,
  address_line,
  city,
  state,
  postal_code,
  status,
  updated_at
)
VALUES (
  'SUPP',
  'GYAN Support',
  'GYAN Support Team',
  '0000000000',
  NULL,
  NULL,
  'Online service intake',
  'Lucknow',
  'Uttar Pradesh',
  '000000',
  'active',
  CURRENT_TIMESTAMP
)
ON CONFLICT(code)
DO UPDATE SET
  name = excluded.name,
  owner_name = excluded.owner_name,
  address_line = excluded.address_line,
  city = excluded.city,
  state = excluded.state,
  postal_code = excluded.postal_code,
  status = excluded.status,
  updated_at = CURRENT_TIMESTAMP;

-- Enable every current global online service for the support intake shop.
INSERT INTO shop_services (
  shop_code,
  service_id,
  enabled,
  display_name,
  description_override,
  icon_override,
  color_override,
  price_type,
  price_amount_paise,
  price_note,
  sort_order,
  updated_at
)
SELECT
  'SUPP',
  s.id,
  1,
  NULL,
  NULL,
  NULL,
  NULL,
  'contact',
  NULL,
  'Price shown according to the customer market when available.',
  s.sort_order,
  CURRENT_TIMESTAMP
FROM services s
WHERE
  s.category = 'online'
  AND s.enabled = 1
ON CONFLICT(shop_code, service_id)
DO UPDATE SET
  enabled = 1,
  sort_order = excluded.sort_order,
  price_note = excluded.price_note,
  updated_at = CURRENT_TIMESTAMP;
