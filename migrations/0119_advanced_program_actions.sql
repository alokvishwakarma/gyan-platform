-- 0119_advanced_program_actions.sql
-- Combined Advanced-program portal refinement.
--
-- Goals:
--   1. Show Class consistently for JEE / NEET / SAT / OLSAT / GRE.
--   2. Enable the OLSAT Mock Tests entry.
--   3. Add visible OLSAT locked shells without inventing questions.
--
-- OLSAT shells use access_mode='CODE', published=0.
-- The generic MockTestsPage will display them as locked/request-access tests,
-- but it will never try to run nonexistent questions.
--
-- Safe to rerun.

PRAGMA foreign_keys = ON;

UPDATE education_program_catalog
SET show_classes = 1,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code IN (
  'JEE',
  'NEET',
  'SAT',
  'OLSAT',
  'GRE'
);

UPDATE education_program_catalog
SET show_mock_tests = 1,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'OLSAT';

-- ------------------------------------------------------------
-- OLSAT full-test locked shells
-- ------------------------------------------------------------

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES
  ('OLSAT','FULL','TEST_1','Test 1','MAIN',1,'CODE',0),
  ('OLSAT','FULL','TEST_2','Test 2','MAIN',1,'CODE',0),
  ('OLSAT','FULL','TEST_3','Test 3','MAIN',1,'CODE',0),
  ('OLSAT','FULL','TEST_4','Test 4','MAIN',1,'CODE',0),
  ('OLSAT','FULL','TEST_5','Test 5','MAIN',1,'CODE',0),
  ('OLSAT','FULL','TEST_6','Test 6','MAIN',1,'CODE',0),
  ('OLSAT','FULL','TEST_7','Test 7','MAIN',1,'CODE',0),
  ('OLSAT','FULL','TEST_8','Test 8','MAIN',1,'CODE',0);

-- ------------------------------------------------------------
-- OLSAT mini-test locked shells
-- ------------------------------------------------------------

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES
  ('OLSAT','MINI','MINI_A','OLSAT Mini A','MAIN',1,'CODE',0),
  ('OLSAT','MINI','MINI_B','OLSAT Mini B','MAIN',1,'CODE',0),
  ('OLSAT','MINI','MINI_C','OLSAT Mini C','MAIN',1,'CODE',0),
  ('OLSAT','MINI','MINI_D','OLSAT Mini D','MAIN',1,'CODE',0),
  ('OLSAT','MINI','MINI_E','OLSAT Mini E','MAIN',1,'CODE',0),
  ('OLSAT','MINI','MINI_F','OLSAT Mini F','MAIN',1,'CODE',0);

-- Keep every empty OLSAT shell locked even if this migration is rerun
-- after some manual catalog edits.
UPDATE education_mock_tests
SET access_mode = 'CODE',
    published = 0,
    updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'OLSAT'
  AND version = 1
  AND NOT EXISTS (
    SELECT 1
    FROM education_mock_test_questions mtq
    WHERE mtq.mock_test_id = education_mock_tests.id
  );

-- ------------------------------------------------------------
-- Audits
-- ------------------------------------------------------------

SELECT
  program_code,
  canonical_name,
  show_questions,
  show_mock_tests,
  show_reports,
  show_classes
FROM education_program_catalog
WHERE program_code IN (
  'JEE',
  'NEET',
  'SAT',
  'OLSAT',
  'GRE'
)
ORDER BY program_code;

SELECT
  test_kind,
  test_code,
  test_name,
  exam_level,
  access_mode,
  published,
  (
    SELECT COUNT(*)
    FROM education_mock_test_questions mtq
    WHERE mtq.mock_test_id = mt.id
  ) AS question_count
FROM education_mock_tests mt
WHERE program_code = 'OLSAT'
  AND version = 1
ORDER BY
  CASE test_kind
    WHEN 'FULL' THEN 1
    ELSE 2
  END,
  test_code;
