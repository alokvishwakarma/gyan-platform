-- 0021_enable_support_nearby_services.sql
--
-- Enables the GYAN Support intake shop to receive requests
-- for external/non-registered nearby businesses.

INSERT INTO shop_services (
  shop_code,
  service_id,
  enabled,
  price_type,
  sort_order,
  created_at,
  updated_at
)
SELECT
  'SUPP',
  s.id,
  1,
  'contact',
  COALESCE(
    s.homepage_order,
    s.sort_order,
    0
  ),
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
FROM services s
WHERE
  s.category = 'nearby'
  AND s.service_code <> 'NEARBY_MAPS'
  AND NOT EXISTS (
    SELECT 1
    FROM shop_services ss
    WHERE
      ss.shop_code = 'SUPP'
      AND ss.service_id = s.id
  );

UPDATE shop_services
SET
  enabled = 1,
  updated_at = CURRENT_TIMESTAMP
WHERE
  shop_code = 'SUPP'
  AND service_id IN (
    SELECT id
    FROM services
    WHERE
      category = 'nearby'
      AND service_code <> 'NEARBY_MAPS'
  );
