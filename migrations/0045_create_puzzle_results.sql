CREATE TABLE IF NOT EXISTS puzzle_results (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  result_id TEXT NOT NULL,

  puzzle_number INTEGER NOT NULL,
  puzzle_date TEXT NOT NULL,
  stage TEXT NOT NULL
    CHECK (
      stage IN (
        '5x5',
        '7x7'
      )
    ),

  gq_score INTEGER NOT NULL,
  moves_used INTEGER NOT NULL,

  icons_json TEXT NOT NULL
    DEFAULT '[]',

  skill_stats_json TEXT NOT NULL
    DEFAULT '{}',

  name TEXT,
  email TEXT,

  claimed INTEGER NOT NULL
    DEFAULT 0
    CHECK (
      claimed IN (
        0,
        1
      )
    ),

  created_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  UNIQUE (
    puzzle_number,
    stage,
    result_id
  )
);

CREATE INDEX IF NOT EXISTS
idx_puzzle_results_rank
ON puzzle_results (
  puzzle_number,
  stage,
  gq_score DESC,
  moves_used ASC,
  created_at ASC
);

CREATE INDEX IF NOT EXISTS
idx_puzzle_results_email
ON puzzle_results (
  email
);

CREATE INDEX IF NOT EXISTS
idx_puzzle_results_date
ON puzzle_results (
  puzzle_date
);