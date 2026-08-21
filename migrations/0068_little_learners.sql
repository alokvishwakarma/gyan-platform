-- 0068_little_learners.sql
-- Lightweight child learning + independent-word tracking.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_little_questions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  skill_code TEXT NOT NULL,
  level INTEGER NOT NULL DEFAULT 1,

  prompt_text TEXT NOT NULL,

  question_type TEXT NOT NULL
    CHECK (
      question_type IN (
        'tap',
        'speak'
      )
    ),

  option_a TEXT,
  option_b TEXT,
  option_c TEXT,

  correct_option TEXT
    CHECK (
      correct_option IS NULL OR
      correct_option IN ('A','B','C')
    ),

  accepted_words TEXT,

  active INTEGER NOT NULL DEFAULT 1
    CHECK (active IN (0,1)),

  sort_order INTEGER NOT NULL DEFAULT 100,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  UNIQUE(
    skill_code,
    level,
    prompt_text,
    option_a,
    option_b,
    option_c
  )
);

CREATE INDEX IF NOT EXISTS idx_little_questions_skill
  ON education_little_questions(
    skill_code,
    level,
    active
  );


CREATE TABLE IF NOT EXISTS education_child_words (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  student_id INTEGER NOT NULL,

  word TEXT NOT NULL,
  normalized_word TEXT NOT NULL,

  status TEXT NOT NULL
    CHECK (
      status IN (
        'emerging',
        'independent'
      )
    ),

  first_observed_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  first_independent_at TEXT,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE CASCADE,

  UNIQUE(
    student_id,
    normalized_word
  )
);

CREATE INDEX IF NOT EXISTS idx_child_words_student
  ON education_child_words(
    student_id,
    status,
    first_independent_at
  );


CREATE TABLE IF NOT EXISTS education_little_attempts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  student_id INTEGER,

  question_id INTEGER NOT NULL,

  response_type TEXT NOT NULL
    CHECK (
      response_type IN (
        'tap',
        'speech',
        'parent'
      )
    ),

  response_value TEXT,

  correct INTEGER NOT NULL
    CHECK (correct IN (0,1)),

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(student_id)
    REFERENCES education_students(id)
    ON DELETE SET NULL,

  FOREIGN KEY(question_id)
    REFERENCES education_little_questions(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_little_attempts_student
  ON education_little_attempts(
    student_id,
    created_at
  );


-- -----------------------------------------------------
-- Seed: colors
-- -----------------------------------------------------

INSERT OR IGNORE INTO education_little_questions
(skill_code, level, prompt_text, question_type, option_a, option_b, option_c, correct_option, accepted_words, sort_order)
VALUES
('COLOR_BLUE',1,'Blue','tap','🔵',NULL,NULL,'A','blue',10),
('COLOR_BLUE',2,'Touch blue','tap','🔵','🔴',NULL,'A','blue',20),
('COLOR_BLUE',3,'Touch blue','tap','🔴','🔵','🟡','B','blue',30),

('COLOR_YELLOW',1,'Yellow','tap','🟡',NULL,NULL,'A','yellow',10),
('COLOR_YELLOW',2,'Touch yellow','tap','🟡','🔵',NULL,'A','yellow',20),
('COLOR_YELLOW',3,'Touch yellow','tap','🔴','🟢','🟡','C','yellow',30),

('COLOR_RED',1,'Red','tap','🔴',NULL,NULL,'A','red',10),
('COLOR_RED',2,'Touch red','tap','🔵','🔴',NULL,'B','red',20),
('COLOR_RED',3,'Touch red','tap','🟡','🔴','🟢','B','red',30);


-- -----------------------------------------------------
-- Big / small
-- -----------------------------------------------------

INSERT OR IGNORE INTO education_little_questions
(skill_code, level, prompt_text, question_type, option_a, option_b, option_c, correct_option, accepted_words, sort_order)
VALUES
('BIG',1,'Big','tap','🐘',NULL,NULL,'A','big',10),
('BIG',2,'Touch big','tap','🐘','🐭',NULL,'A','big',20),
('BIG',3,'Touch big','tap','🍉','🍒','🫐','A','big',30),

('SMALL',1,'Small','tap','🐭',NULL,NULL,'A','small',10),
('SMALL',2,'Touch small','tap','🐘','🐭',NULL,'B','small',20),
('SMALL',3,'Touch small','tap','🍉','🍒','🫐','B','small',30);


-- -----------------------------------------------------
-- Numbers 1-5
-- -----------------------------------------------------

INSERT OR IGNORE INTO education_little_questions
(skill_code, level, prompt_text, question_type, option_a, option_b, option_c, correct_option, accepted_words, sort_order)
VALUES
('NUMBER_1',2,'One','tap','⭐','⭐⭐','⭐⭐⭐','A','one|1',20),
('NUMBER_2',2,'Two','tap','⭐','⭐⭐','⭐⭐⭐','B','two|2',20),
('NUMBER_3',2,'Three','tap','⭐⭐','⭐⭐⭐','⭐⭐⭐⭐','B','three|3',20),
('NUMBER_4',2,'Four','tap','⭐⭐⭐','⭐⭐⭐⭐','⭐⭐⭐⭐⭐','B','four|4',20),
('NUMBER_5',2,'Five','tap','⭐⭐⭐⭐','⭐⭐⭐⭐⭐','⭐⭐⭐','B','five|5',20);


-- -----------------------------------------------------
-- Functional words
-- -----------------------------------------------------

INSERT OR IGNORE INTO education_little_questions
(skill_code, level, prompt_text, question_type, option_a, option_b, option_c, correct_option, accepted_words, sort_order)
VALUES
('HELP',2,'Help','tap','🆘','💧','🚪','A','help',20),
('OUT',2,'Out','tap','🚪','💧','🧸','A','out',20),
('WATER',2,'Water','tap','💧','🚪','🧸','A','water',20),
('STOP',2,'Stop','tap','🛑','▶️','💧','A','stop',20),
('GO',2,'Go','tap','▶️','🛑','💧','A','go',20);


-- -----------------------------------------------------
-- Spoken expressive practice.
-- These are OPTIONAL; browser speech recognition may not
-- be available on every Fire/Silk installation.
-- -----------------------------------------------------

INSERT OR IGNORE INTO education_little_questions
(skill_code, level, prompt_text, question_type, accepted_words, sort_order)
VALUES
('SAY_HELP',1,'Say help','speak','help',10),
('SAY_OUT',1,'Say out','speak','out',10),
('SAY_WATER',1,'Say water','speak','water',10),
('SAY_STOP',1,'Say stop','speak','stop',10),
('SAY_YELLOW',1,'Say yellow','speak','yellow',10);
