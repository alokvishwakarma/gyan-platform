-- 0106_neet_locked_test_shells.sql
-- GYAN NEET future mock-test shells.
--
-- Adds visible access-code/locked shells only:
--   Full Tests 2-8
--   Mini Tests B-F
--
-- No education_mock_test_questions rows are created here.
-- access_mode='CODE' mirrors the existing locked/access-code behavior.
-- published=0 keeps these shells from being treated as ready fixed tests.
--
-- Safe to rerun because education_mock_tests has a unique key and
-- every insert uses INSERT OR IGNORE.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'FULL', 'TEST_2', 'Test 2', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'FULL', 'TEST_3', 'Test 3', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'FULL', 'TEST_4', 'Test 4', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'FULL', 'TEST_5', 'Test 5', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'FULL', 'TEST_6', 'Test 6', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'FULL', 'TEST_7', 'Test 7', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'FULL', 'TEST_8', 'Test 8', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'MINI', 'MINI_B', 'Mini B', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'MINI', 'MINI_C', 'Mini C', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'MINI', 'MINI_D', 'Mini D', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'MINI', 'MINI_E', 'Mini E', 'NEET', 1, 'CODE', 0);

INSERT OR IGNORE INTO education_mock_tests
(program_code, test_kind, test_code, test_name, exam_level, version, access_mode, published)
VALUES ('NEET', 'MINI', 'MINI_F', 'Mini F', 'NEET', 1, 'CODE', 0);
