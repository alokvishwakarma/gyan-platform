CREATE TABLE IF NOT EXISTS system_settings (
  setting_key TEXT PRIMARY KEY,
  setting_value TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT OR IGNORE INTO system_settings (
  setting_key,
  setting_value
)
VALUES
  (
    'uploads_enabled',
    'true'
  ),
  (
    'storage_warning_bytes',
    '41943040'
  ),
  (
    'storage_stop_bytes',
    '52428800'
  ),
  (
    'storage_used_bytes',
    '0'
  ),
  (
    'storage_warning_active',
    'false'
  ),
  (
    'file_retention_days',
    '15'
  );

CREATE INDEX IF NOT EXISTS
  idx_print_request_files_storage_cleanup
ON print_request_files (
  storage_status,
  created_at
);