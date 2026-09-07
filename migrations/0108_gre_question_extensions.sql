-- 0108_gre_question_extensions.sql
-- GRE-specific extension layer.
-- Does NOT alter education_questions or education_question_metadata.
-- This protects existing JEE / NEET / SAT behavior while allowing
-- authentic GRE response formats that do not fit the base A-D schema.

CREATE TABLE IF NOT EXISTS education_gre_question_details (
  question_id INTEGER PRIMARY KEY,

  -- Learner-facing GRE item family.
  response_type TEXT NOT NULL DEFAULT 'SINGLE_CHOICE'
    CHECK (response_type IN (
      'SINGLE_CHOICE',
      'MULTI_SELECT',
      'NUMERIC_ENTRY',
      'QUANT_COMPARISON',
      'READING_COMPREHENSION',
      'TEXT_COMPLETION',
      'SENTENCE_EQUIVALENCE'
    )),

  -- GRE section family.
  section_kind TEXT NOT NULL
    CHECK (section_kind IN ('VERBAL','QUANT')),

  -- Optional material shown before / with the question.
  stimulus_type TEXT NOT NULL DEFAULT 'NONE'
    CHECK (stimulus_type IN (
      'NONE',
      'TEXT',
      'PASSAGE',
      'TABLE',
      'BAR_GRAPH',
      'LINE_GRAPH',
      'SCATTERPLOT',
      'OTHER_GRAPHIC'
    )),

  stimulus_text TEXT,
  directions_text TEXT,

  -- JSON supports GRE formats that exceed the base education_questions A-D
  -- columns. Examples:
  --
  -- Sentence Equivalence:
  --   ["lucid","opaque","clear","tedious","ornate","ambiguous"]
  --
  -- Multi-blank Text Completion:
  --   {
  --     "blank1":["a","b","c"],
  --     "blank2":["d","e","f"]
  --   }
  choices_json TEXT,

  -- JSON examples:
  -- Single choice: ["B"]
  -- Sentence equivalence: ["A","C"]
  -- Double blank: {"blank1":"B","blank2":"A"}
  -- Numeric entry: ["12","12.0"]
  correct_answers_json TEXT,

  -- Number of blanks for Text Completion; otherwise normally 0.
  blank_count INTEGER NOT NULL DEFAULT 0
    CHECK (blank_count BETWEEN 0 AND 3),

  -- For numeric entry where mathematically equivalent decimal forms may differ.
  numeric_tolerance REAL,

  -- GRE Quant allows an on-screen calculator.
  calculator_allowed INTEGER NOT NULL DEFAULT 0
    CHECK (calculator_allowed IN (0,1)),

  -- Section-level adaptivity metadata.
  -- NULL means usable in either first or second section.
  section_number INTEGER
    CHECK (section_number IS NULL OR section_number IN (1,2)),

  section_path TEXT
    CHECK (
      section_path IS NULL OR
      section_path IN ('BASE','EASIER','HARDER')
    ),

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_gre_question_details_type
  ON education_gre_question_details(response_type);

CREATE INDEX IF NOT EXISTS idx_gre_question_details_section
  ON education_gre_question_details(section_kind,section_number,section_path);

-- Audit: expected 0 rows immediately after this migration.
SELECT COUNT(*) AS gre_detail_rows
FROM education_gre_question_details;
