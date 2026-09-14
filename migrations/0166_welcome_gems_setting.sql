INSERT INTO platform_settings (
  setting_key,
  setting_value,
  updated_at
)
VALUES (
  'WELCOME_GEMS',
  '100',
  CURRENT_TIMESTAMP
)
ON CONFLICT(setting_key)
DO NOTHING;