CREATE TABLE IF NOT EXISTS print_request_files (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  print_request_id INTEGER NOT NULL,

  original_file_name TEXT NOT NULL,
  content_type TEXT,
  file_size INTEGER NOT NULL,

  storage_key TEXT,
  storage_status TEXT NOT NULL DEFAULT 'pending',

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (print_request_id)
    REFERENCES print_requests(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_print_request_files_request_id
ON print_request_files(print_request_id);