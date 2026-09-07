-- 0105_sat_locked_test_shells.sql
-- GYAN SAT future mock-test shells.
--
-- Adds visible access-code/locked shells only:
--   Full Tests 2-8
--   Mini Tests B-F
--
-- No education_mock_test_questions rows are created here.
-- program_code='SAT' identifies the exam.
-- exam_level='MAIN' is retained for compatibility with the current schema.
--
-- access_mode='CODE' mirrors the existing JEE "locked" test behavior.
-- published=0 prevents these shells from being treated as ready fixed tests.
--
-- Safe to rerun because education_mock_tests has a unique key and
-- every insert uses INSERT OR IGNORE.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'FULL', 'TEST_2', 'Test 2', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'FULL', 'TEST_3', 'Test 3', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'FULL', 'TEST_4', 'Test 4', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'FULL', 'TEST_5', 'Test 5', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'FULL', 'TEST_6', 'Test 6', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'FULL', 'TEST_7', 'Test 7', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'FULL', 'TEST_8', 'Test 8', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'MINI', 'MINI_B', 'SAT Mini B', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'MINI', 'MINI_C', 'SAT Mini C', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'MINI', 'MINI_D', 'SAT Mini D', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'MINI', 'MINI_E', 'SAT Mini E', 'MAIN', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('SAT', 'MINI', 'MINI_F', 'SAT Mini F', 'MAIN', 1, 'CODE', 0);
