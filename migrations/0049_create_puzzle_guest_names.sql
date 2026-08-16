CREATE TABLE IF NOT EXISTS puzzle_guest_names (
  puzzle_number INTEGER NOT NULL,
  result_id TEXT NOT NULL,
  guest_name TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (puzzle_number, result_id),
  UNIQUE (puzzle_number, guest_name)
);