CREATE TABLE IF NOT EXISTS puzzle_winners (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  puzzle_number INTEGER NOT NULL,
  puzzle_date TEXT NOT NULL,

  name TEXT NOT NULL,
  email TEXT NOT NULL,

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  UNIQUE (
    puzzle_number,
    email
  )
);

CREATE INDEX IF NOT EXISTS
idx_puzzle_winners_number
ON puzzle_winners (
  puzzle_number
);

CREATE INDEX IF NOT EXISTS
idx_puzzle_winners_email
ON puzzle_winners (
  email
);

CREATE INDEX IF NOT EXISTS
idx_puzzle_winners_date
ON puzzle_winners (
  puzzle_date
);