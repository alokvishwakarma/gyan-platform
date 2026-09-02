-- GYAN IIT-JEE rebuild, Phase 1
-- Question metadata + fixed Mock/Mini Test infrastructure.
-- This DOES NOT alter existing education_questions rows.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_question_metadata (
  question_id INTEGER PRIMARY KEY,
  exam_level TEXT NOT NULL DEFAULT 'BOTH'
    CHECK (exam_level IN ('MAIN','ADVANCED','BOTH')),
  question_format TEXT NOT NULL DEFAULT 'SINGLE_CHOICE'
    CHECK (question_format IN (
      'SINGLE_CHOICE',
      'NUMERICAL',
      'MULTI_SELECT',
      'INTEGER',
      'MATCHING',
      'COMPREHENSION'
    )),
  syllabus_version TEXT NOT NULL DEFAULT 'JEE_2026',
  quality_status TEXT NOT NULL DEFAULT 'DRAFT'
    CHECK (quality_status IN ('DRAFT','REVIEWED','PUBLISHED','RETIRED')),
  archetype_code TEXT,
  source_note TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_education_question_metadata_level
ON education_question_metadata (
  exam_level,
  quality_status
);

CREATE TABLE IF NOT EXISTS education_mock_tests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  program_code TEXT NOT NULL,
  test_kind TEXT NOT NULL
    CHECK (test_kind IN ('FULL','MINI')),
  test_code TEXT NOT NULL,
  test_name TEXT NOT NULL,
  exam_level TEXT NOT NULL
    CHECK (exam_level IN ('MAIN','ADVANCED','NEET')),
  version INTEGER NOT NULL DEFAULT 1,
  access_mode TEXT NOT NULL DEFAULT 'LOCKED'
    CHECK (access_mode IN ('OPEN','CODE','LOCKED')),
  published INTEGER NOT NULL DEFAULT 0
    CHECK (published IN (0,1)),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (
    program_code,
    test_kind,
    test_code,
    exam_level,
    version
  )
);

CREATE INDEX IF NOT EXISTS idx_education_mock_tests_lookup
ON education_mock_tests (
  program_code,
  test_kind,
  test_code,
  exam_level,
  published
);

CREATE TABLE IF NOT EXISTS education_mock_test_questions (
  mock_test_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  question_order INTEGER NOT NULL,
  section_code TEXT,
  marks_correct REAL,
  marks_incorrect REAL,
  marks_unanswered REAL NOT NULL DEFAULT 0,
  PRIMARY KEY (mock_test_id, question_order),
  UNIQUE (mock_test_id, question_id),
  FOREIGN KEY (mock_test_id)
    REFERENCES education_mock_tests(id)
    ON DELETE CASCADE,
  FOREIGN KEY (question_id)
    REFERENCES education_questions(id)
    ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_education_mock_test_questions_question
ON education_mock_test_questions (question_id);

CREATE TABLE IF NOT EXISTS education_mock_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INTEGER,
  mock_test_id INTEGER NOT NULL,
  started_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  submitted_at TEXT,
  score REAL,
  max_score REAL,
  correct_count INTEGER,
  incorrect_count INTEGER,
  unanswered_count INTEGER,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id)
    REFERENCES education_students(id)
    ON DELETE SET NULL,
  FOREIGN KEY (mock_test_id)
    REFERENCES education_mock_tests(id)
    ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS education_mock_attempt_answers (
  attempt_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  selected_answer TEXT,
  correct INTEGER
    CHECK (correct IS NULL OR correct IN (0,1)),
  marks_awarded REAL,
  PRIMARY KEY (attempt_id, question_id),
  FOREIGN KEY (attempt_id)
    REFERENCES education_mock_attempts(id)
    ON DELETE CASCADE,
  FOREIGN KEY (question_id)
    REFERENCES education_questions(id)
    ON DELETE RESTRICT
);

-- Fixed named JEE tests. Test 1-2 are open; Test 3-8 require access.
-- Nothing is published until fixed question assignments are populated and reviewed.


INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_1','Test 1','MAIN',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_1','Test 1','ADVANCED',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_2','Test 2','MAIN',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_2','Test 2','ADVANCED',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_3','Test 3','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_3','Test 3','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_4','Test 4','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_4','Test 4','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_5','Test 5','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_5','Test 5','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_6','Test 6','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_6','Test 6','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_7','Test 7','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_7','Test 7','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_8','Test 8','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','FULL','TEST_8','Test 8','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_A','Mini Test A','MAIN',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_A','Mini Test A','ADVANCED',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_B','Mini Test B','MAIN',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_B','Mini Test B','ADVANCED',1,'OPEN',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_C','Mini Test C','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_C','Mini Test C','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_D','Mini Test D','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_D','Mini Test D','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_E','Mini Test E','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_E','Mini Test E','ADVANCED',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_F','Mini Test F','MAIN',1,'CODE',0);
INSERT OR IGNORE INTO education_mock_tests (program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published) VALUES ('JEE','MINI','MINI_F','Mini Test F','ADVANCED',1,'CODE',0);
