-- 0114_education_question_response_details.sql
-- Generic rich question-response layer for every education program.
--
-- This promotes the useful structure first introduced for GRE into a
-- program-independent table. Existing JEE / NEET / SAT A-D questions
-- continue to work without rows in this table.
--
-- The mock runner/API may use this table when present and otherwise
-- fall back to education_questions + education_question_metadata.

CREATE TABLE IF NOT EXISTS education_question_response_details (
  question_id INTEGER PRIMARY KEY,

  response_type TEXT NOT NULL DEFAULT 'SINGLE_CHOICE'
    CHECK (response_type IN (
      'SINGLE_CHOICE',
      'MULTI_SELECT',
      'NUMERIC_ENTRY',
      'INTEGER',
      'QUANT_COMPARISON',
      'READING_COMPREHENSION',
      'TEXT_COMPLETION',
      'SENTENCE_EQUIVALENCE',
      'MATCHING',
      'COMPREHENSION'
    )),

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

  -- Array form:
  --   ["A text","B text","C text","D text","E text","F text"]
  --
  -- Grouped / multi-blank form:
  --   {
  --     "blank1":["a","b","c"],
  --     "blank2":["d","e","f"]
  --   }
  choices_json TEXT,

  -- Single: ["B"]
  -- Multi-select / sentence equivalence: ["A","C"]
  -- Multi-blank: {"blank1":"B","blank2":"A"}
  -- Numeric: ["12","12.0"]
  correct_answers_json TEXT,

  blank_count INTEGER NOT NULL DEFAULT 0
    CHECK (blank_count BETWEEN 0 AND 10),

  numeric_tolerance REAL,

  calculator_allowed INTEGER NOT NULL DEFAULT 0
    CHECK (calculator_allowed IN (0,1)),

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_question_response_details_type
  ON education_question_response_details(response_type);

-- Backfill every existing GRE rich-response row.
INSERT OR REPLACE INTO education_question_response_details
(
  question_id,
  response_type,
  stimulus_type,
  stimulus_text,
  directions_text,
  choices_json,
  correct_answers_json,
  blank_count,
  numeric_tolerance,
  calculator_allowed,
  updated_at
)
SELECT
  question_id,
  response_type,
  stimulus_type,
  stimulus_text,
  directions_text,
  choices_json,
  correct_answers_json,
  blank_count,
  numeric_tolerance,
  calculator_allowed,
  CURRENT_TIMESTAMP
FROM education_gre_question_details;

-- Audit.
SELECT
  response_type,
  COUNT(*) AS question_count
FROM education_question_response_details
GROUP BY response_type
ORDER BY response_type;
