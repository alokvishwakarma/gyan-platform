-- 0051_education_config.sql
-- Country-specific GYAN Education Portal configuration.

CREATE TABLE IF NOT EXISTS education_country_settings (
  country_code TEXT PRIMARY KEY
    CHECK (country_code IN ('US', 'IN')),

  prek12_enabled INTEGER NOT NULL DEFAULT 1
    CHECK (prek12_enabled IN (0, 1)),

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS education_programs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  country_code TEXT NOT NULL
    CHECK (country_code IN ('US', 'IN')),

  program_code TEXT NOT NULL,
  program_name TEXT NOT NULL,

  enabled INTEGER NOT NULL DEFAULT 1
    CHECK (enabled IN (0, 1)),

  is_custom INTEGER NOT NULL DEFAULT 0
    CHECK (is_custom IN (0, 1)),

  sort_order INTEGER NOT NULL DEFAULT 100,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  UNIQUE(country_code, program_code),

  FOREIGN KEY(country_code)
    REFERENCES education_country_settings(country_code)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
  idx_education_programs_country_order
ON education_programs(
  country_code,
  sort_order,
  program_name
);

INSERT OR IGNORE INTO education_country_settings
  (country_code, prek12_enabled)
VALUES
  ('US', 1),
  ('IN', 1);

-- United States defaults
INSERT OR IGNORE INTO education_programs
(country_code, program_code, program_name, enabled, is_custom, sort_order)
VALUES
('US', 'SAT', 'SAT', 1, 0, 10),
('US', 'OLSAT', 'OLSAT', 1, 0, 20),
('US', 'MATH_OLYMPIAD', 'Math Olympiad', 1, 0, 30),
('US', 'JEE', 'JEE / IIT', 0, 0, 40),
('US', 'NEET', 'NEET', 0, 0, 50);

-- India defaults
INSERT OR IGNORE INTO education_programs
(country_code, program_code, program_name, enabled, is_custom, sort_order)
VALUES
('IN', 'SAT', 'SAT', 0, 0, 10),
('IN', 'OLSAT', 'OLSAT', 0, 0, 20),
('IN', 'MATH_OLYMPIAD', 'Math Olympiad', 1, 0, 30),
('IN', 'JEE', 'JEE / IIT', 1, 0, 40),
('IN', 'NEET', 'NEET', 1, 0, 50);
