-- 0094_education_country_program_catalog.sql
-- Revised migration for the EXISTING GYAN education_programs schema.
--
-- Existing education_programs already represents:
--   country_code + program_code + program_name + enabled + sort_order
--
-- We preserve that table and add:
--   1. education_countries         -> country master
--   2. education_program_catalog  -> shared exam/program behavior
--
-- GRE can therefore have one shared catalog definition and two country rows.

CREATE TABLE IF NOT EXISTS education_countries (
  country_code TEXT PRIMARY KEY,
  country_name TEXT NOT NULL,
  flag_emoji TEXT,
  enabled INTEGER NOT NULL DEFAULT 1,
  sort_order INTEGER NOT NULL DEFAULT 100,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS education_program_catalog (
  program_code TEXT PRIMARY KEY,
  canonical_name TEXT NOT NULL,

  /*
   * Grade/catalog key used by education_subjects/topics/questions.
   * Examples:
   * PROGRAM_JEE
   * PROGRAM_NEET
   * PROGRAM_SAT
   */
  grade_code TEXT NOT NULL,

  /*
   * Reusable UI/engine family.
   * Examples: CBT, ABILITY, ABA
   */
  experience_type TEXT NOT NULL DEFAULT 'CBT',

  enabled INTEGER NOT NULL DEFAULT 1,

  show_questions INTEGER NOT NULL DEFAULT 1,
  show_mock_tests INTEGER NOT NULL DEFAULT 0,
  show_reports INTEGER NOT NULL DEFAULT 1,
  show_demo INTEGER NOT NULL DEFAULT 0,
  show_classes INTEGER NOT NULL DEFAULT 0,

  duration_minutes INTEGER,
  question_count INTEGER,

  correct_marks REAL,
  incorrect_marks REAL,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);


INSERT OR IGNORE INTO education_countries
(
  country_code,
  country_name,
  flag_emoji,
  enabled,
  sort_order
)
VALUES
  ('IN', 'India', '🇮🇳', 1, 10),
  ('US', 'United States', '🇺🇸', 1, 20);


INSERT OR IGNORE INTO education_program_catalog
(
  program_code,
  canonical_name,
  grade_code,
  experience_type,
  enabled,
  show_questions,
  show_mock_tests,
  show_reports,
  show_demo,
  show_classes,
  duration_minutes,
  question_count,
  correct_marks,
  incorrect_marks
)
VALUES
  (
    'JEE',
    'IIT-JEE',
    'PROGRAM_JEE',
    'CBT',
    1,
    1,
    1,
    1,
    0,
    1,
    180,
    75,
    4,
    -1
  ),

  (
    'NEET',
    'NEET',
    'PROGRAM_NEET',
    'CBT',
    1,
    1,
    1,
    1,
    0,
    1,
    180,
    180,
    4,
    -1
  ),

  (
    'SAT',
    'SAT',
    'PROGRAM_SAT',
    'CBT',
    1,
    1,
    1,
    1,
    0,
    0,
    NULL,
    NULL,
    NULL,
    NULL
  ),

  (
    'GRE',
    'GRE',
    'PROGRAM_GRE',
    'CBT',
    1,
    1,
    1,
    1,
    0,
    0,
    NULL,
    NULL,
    NULL,
    NULL
  ),

  (
    'OLSAT',
    'OLSAT',
    'PROGRAM_OLSAT',
    'ABILITY',
    1,
    1,
    0,
    1,
    0,
    0,
    NULL,
    NULL,
    NULL,
    NULL
  ),

  (
    'MATH_OLYMPIAD',
    'Math Olympiad',
    'PROGRAM_MATH_OLYMPIAD',
    'CBT',
    1,
    1,
    0,
    1,
    0,
    0,
    NULL,
    NULL,
    NULL,
    NULL
  );


/*
 * Preserve all existing rows.
 *
 * Add GRE to both countries.
 * INSERT only if missing.
 */
INSERT INTO education_programs
(
  country_code,
  program_code,
  program_name,
  enabled,
  is_custom,
  sort_order
)
SELECT
  'IN',
  'GRE',
  'GRE',
  1,
  0,
  60
WHERE NOT EXISTS (
  SELECT 1
  FROM education_programs
  WHERE
    country_code = 'IN'
    AND program_code = 'GRE'
);


INSERT INTO education_programs
(
  country_code,
  program_code,
  program_name,
  enabled,
  is_custom,
  sort_order
)
SELECT
  'US',
  'GRE',
  'GRE',
  1,
  0,
  40
WHERE NOT EXISTS (
  SELECT 1
  FROM education_programs
  WHERE
    country_code = 'US'
    AND program_code = 'GRE'
);


/*
 * Normalize the currently intended country availability.
 *
 * Existing rows are reused rather than recreated.
 */
UPDATE education_programs
SET
  enabled = 1,
  program_name = 'JEE / IIT'
WHERE
  country_code = 'IN'
  AND program_code = 'JEE';


UPDATE education_programs
SET
  enabled = 1
WHERE
  country_code = 'IN'
  AND program_code = 'NEET';


UPDATE education_programs
SET
  enabled = 1
WHERE
  country_code = 'US'
  AND program_code = 'SAT';


UPDATE education_programs
SET
  enabled = 1
WHERE
  country_code = 'US'
  AND program_code = 'OLSAT';


/*
 * Keep JEE/NEET hidden from the US by default.
 * Keep SAT/OLSAT hidden from India by default.
 * These can later be toggled from Admin without code changes.
 */
UPDATE education_programs
SET enabled = 0
WHERE
  country_code = 'US'
  AND program_code IN ('JEE', 'NEET');


UPDATE education_programs
SET enabled = 0
WHERE
  country_code = 'IN'
  AND program_code IN ('SAT', 'OLSAT');
