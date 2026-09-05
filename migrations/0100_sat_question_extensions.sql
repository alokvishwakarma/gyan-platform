-- 0100_sat_question_extensions.sql
-- SAT-specific extension layer. Does NOT alter education_questions or
-- education_question_metadata, protecting existing JEE/NEET behavior.

CREATE TABLE IF NOT EXISTS education_sat_question_details (
  question_id INTEGER PRIMARY KEY,

  response_type TEXT NOT NULL DEFAULT 'MCQ'
    CHECK (response_type IN ('MCQ','SPR')),

  stimulus_type TEXT NOT NULL DEFAULT 'NONE'
    CHECK (stimulus_type IN (
      'NONE',
      'TEXT',
      'PASSAGE_PAIR',
      'STUDENT_NOTES',
      'TABLE',
      'BAR_GRAPH',
      'LINE_GRAPH',
      'OTHER_GRAPHIC'
    )),

  stimulus_text TEXT,
  stimulus_secondary_text TEXT,

  -- JSON payload for a table/graph or future structured visual.
  stimulus_data_json TEXT,

  -- For Math student-produced response questions.
  accepted_answers_json TEXT,

  -- SAT section/module metadata. NULL means usable in either module.
  module_number INTEGER
    CHECK (module_number IS NULL OR module_number IN (1,2)),

  module_path TEXT
    CHECK (
      module_path IS NULL OR
      module_path IN ('BASE','EASIER','HARDER')
    ),

  calculator_allowed INTEGER NOT NULL DEFAULT 1
    CHECK (calculator_allowed IN (0,1)),

  contextual INTEGER NOT NULL DEFAULT 0
    CHECK (contextual IN (0,1)),

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_sat_question_details_response
  ON education_sat_question_details(response_type);

CREATE INDEX IF NOT EXISTS idx_sat_question_details_module
  ON education_sat_question_details(module_number,module_path);
