CREATE TABLE IF NOT EXISTS daily_puzzles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  puzzle_date TEXT NOT NULL,
  puzzle_number INTEGER NOT NULL,

  stage TEXT NOT NULL
    CHECK (
      stage IN (
        '5x5',
        '7x7'
      )
    ),

  board_size INTEGER NOT NULL,
  max_moves INTEGER NOT NULL,
  mystery_count INTEGER NOT NULL,

  /*
   * What the player receives.
   */
  start_board_json TEXT NOT NULL,

  /*
   * Admin/debug only.
   */
  solved_board_json TEXT NOT NULL,

  /*
   * Admin/hint-engine only.
   */
  solution_moves_json TEXT NOT NULL,

  /*
   * Server-side reveal sequence.
   */
  mystery_reveal_order_json TEXT NOT NULL,

  verified INTEGER
    NOT NULL
    DEFAULT 0,

  status TEXT
    NOT NULL
    DEFAULT 'draft'
    CHECK (
      status IN (
        'draft',
        'published',
        'retired'
      )
    ),

  created_at TEXT
    NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT
    NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  UNIQUE (
    puzzle_date,
    stage
  ),

  UNIQUE (
    puzzle_number,
    stage
  )
);

CREATE INDEX IF NOT EXISTS
idx_daily_puzzles_number
ON daily_puzzles (
  puzzle_number
);

CREATE INDEX IF NOT EXISTS
idx_daily_puzzles_date
ON daily_puzzles (
  puzzle_date
);

CREATE INDEX IF NOT EXISTS
idx_daily_puzzles_status
ON daily_puzzles (
  status
);