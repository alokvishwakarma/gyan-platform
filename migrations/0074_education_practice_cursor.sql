-- 0074_education_practice_cursor.sql
-- D1 read optimization:
--   * remove dependence on ORDER BY RANDOM() for normal practice
--   * persist a tiny sequential cursor per GYAN card + practice scope
--   * support indexed "next questions" range scans

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS education_practice_cursors (
  gyan_account_id INTEGER NOT NULL,
  scope_key TEXT NOT NULL,

  last_subtopic_id INTEGER NOT NULL DEFAULT 0,
  last_question_id INTEGER NOT NULL DEFAULT 0,
  completed_cycles INTEGER NOT NULL DEFAULT 0,

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (
    gyan_account_id,
    scope_key
  )
);

-- Critical hot-path index:
-- WHERE subtopic_id = ? AND active = 1 AND id > ?
-- ORDER BY id
-- LIMIT 5
CREATE INDEX IF NOT EXISTS idx_education_questions_subtopic_active_id
  ON education_questions(
    subtopic_id,
    active,
    id
  );

-- Helps enumerate enabled subtopics in stable teaching order.
CREATE INDEX IF NOT EXISTS idx_education_subtopics_topic_enabled_order
  ON education_subtopics(
    topic_id,
    enabled,
    sort_order,
    id
  );

PRAGMA optimize;
