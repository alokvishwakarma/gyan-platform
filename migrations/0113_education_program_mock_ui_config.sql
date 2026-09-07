-- 0113_education_program_mock_ui_config.sql
-- Shared program-level mock-test configuration.
-- Keeps question behavior in the question engine while moving stable
-- program presentation/timing values out of React conditionals.

ALTER TABLE education_program_catalog
  ADD COLUMN question_palette_columns INTEGER NOT NULL DEFAULT 5;

ALTER TABLE education_program_catalog
  ADD COLUMN result_palette_columns INTEGER NOT NULL DEFAULT 5;

UPDATE education_program_catalog
SET question_palette_columns = 5,
    result_palette_columns = 5,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'JEE';

UPDATE education_program_catalog
SET question_palette_columns = 7,
    result_palette_columns = 7,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code IN ('NEET', 'SAT', 'GRE');

UPDATE education_program_catalog
SET question_palette_columns = 5,
    result_palette_columns = 5,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'OLSAT';

UPDATE education_program_catalog
SET duration_minutes = 180,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code IN ('JEE', 'NEET');

UPDATE education_program_catalog
SET duration_minutes = 134,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'SAT';

UPDATE education_program_catalog
SET duration_minutes = 118,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'GRE';

SELECT
  program_code,
  canonical_name,
  duration_minutes,
  question_palette_columns,
  result_palette_columns
FROM education_program_catalog
WHERE enabled = 1
ORDER BY program_code;
