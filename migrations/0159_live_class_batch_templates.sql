-- 0159_live_class_batch_templates.sql
--
-- Reusable 38-teaching-day class templates for two-month JEE/NEET batches.
--
-- Design:
--   1) Template rows contain course sequence + times, not calendar dates.
--   2) A batch maps teaching_day 1..38 onto the first 38 eligible weekdays.
--   3) Weekends are always skipped.
--   4) education_live_class_blackout_dates can skip holidays/admin blackout dates.
--   5) Generated education_live_class_schedule rows remain independently editable.
--   6) Generation is fill-missing-only; existing class rows are preserved.

CREATE TABLE IF NOT EXISTS education_live_class_templates (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  template_code TEXT NOT NULL UNIQUE,
  program_code TEXT NOT NULL
    CHECK (program_code IN ('JEE','NEET','SAT','GRE','OLSAT')),
  label TEXT NOT NULL,
  teaching_days INTEGER NOT NULL DEFAULT 38
    CHECK (teaching_days > 0),
  active INTEGER NOT NULL DEFAULT 1
    CHECK (active IN (0,1)),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_live_class_templates_program_active
ON education_live_class_templates (
  program_code,
  active
);

CREATE TABLE IF NOT EXISTS education_live_class_template_rows (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  template_code TEXT NOT NULL,
  teaching_day INTEGER NOT NULL
    CHECK (teaching_day > 0),
  subject_code TEXT NOT NULL,
  topic_code TEXT,
  topic_name TEXT NOT NULL,
  class_start_local TEXT NOT NULL,
  class_end_local TEXT NOT NULL,
  schedule_timezone TEXT NOT NULL,
  sequence_number INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (template_code)
    REFERENCES education_live_class_templates(template_code)
    ON DELETE CASCADE,

  UNIQUE (
    template_code,
    teaching_day,
    subject_code,
    sequence_number
  )
);

CREATE INDEX IF NOT EXISTS idx_live_class_template_rows_lookup
ON education_live_class_template_rows (
  template_code,
  teaching_day,
  sequence_number
);

CREATE TABLE IF NOT EXISTS education_live_class_blackout_dates (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  batch_code TEXT NOT NULL,
  program_code TEXT NOT NULL DEFAULT 'ALL'
    CHECK (program_code IN ('ALL','JEE','NEET','SAT','GRE','OLSAT')),
  blackout_date TEXT NOT NULL,
  reason TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  UNIQUE (
    batch_code,
    program_code,
    blackout_date
  )
);

CREATE INDEX IF NOT EXISTS idx_live_class_blackout_lookup
ON education_live_class_blackout_dates (
  batch_code,
  program_code,
  blackout_date
);

INSERT INTO education_live_class_templates (
  template_code,
  program_code,
  label,
  teaching_days,
  active
)
VALUES
  ('JEE_STANDARD_38', 'JEE', 'JEE Standard 38-Day Batch', 38, 1),
  ('NEET_STANDARD_38', 'NEET', 'NEET Standard 38-Day Batch', 38, 1)
ON CONFLICT(template_code)
DO UPDATE SET
  label = excluded.label,
  teaching_days = excluded.teaching_days,
  active = excluded.active,
  updated_at = CURRENT_TIMESTAMP;

DELETE FROM education_live_class_template_rows
WHERE template_code IN (
  'JEE_STANDARD_38',
  'NEET_STANDARD_38'
);

-- JEE: 38 teaching days x 3 subjects.
-- Topic progression comes from the current enabled curriculum topics that
-- actually have active questions.  The topic list cycles only if a subject
-- has fewer than 38 usable topics.
WITH RECURSIVE
days(day_no) AS (
  SELECT 1
  UNION ALL
  SELECT day_no + 1
  FROM days
  WHERE day_no < 38
),
subjects(subject_code, start_local, end_local, sequence_number) AS (
  VALUES
    ('MATH',      '15:30', '16:00', 1),
    ('PHYSICS',   '16:00', '16:30', 2),
    ('CHEMISTRY', '16:30', '17:00', 3)
),
ranked_topics AS (
  SELECT
    s.subject_code,
    t.topic_code,
    t.topic_name,
    ROW_NUMBER() OVER (
      PARTITION BY s.subject_code
      ORDER BY t.id
    ) AS topic_no
  FROM education_topics t
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    s.grade_code = 'PROGRAM_JEE'
    AND t.enabled = 1
    AND EXISTS (
      SELECT 1
      FROM education_subtopics st
      JOIN education_questions q
        ON q.subtopic_id = st.id
      WHERE
        st.topic_id = t.id
        AND st.enabled = 1
        AND q.active = 1
    )
),
topic_counts AS (
  SELECT
    subject_code,
    COUNT(*) AS topic_count
  FROM ranked_topics
  GROUP BY subject_code
)
INSERT INTO education_live_class_template_rows (
  template_code,
  teaching_day,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone,
  sequence_number
)
SELECT
  'JEE_STANDARD_38',
  d.day_no,
  s.subject_code,
  rt.topic_code,
  rt.topic_name,
  s.start_local,
  s.end_local,
  'Asia/Kolkata',
  s.sequence_number
FROM days d
CROSS JOIN subjects s
JOIN topic_counts tc
  ON tc.subject_code = s.subject_code
JOIN ranked_topics rt
  ON rt.subject_code = s.subject_code
 AND rt.topic_no =
   (
     ((d.day_no - 1) % tc.topic_count) + 1
   );

-- NEET: 38 teaching days x 3 subjects.
WITH RECURSIVE
days(day_no) AS (
  SELECT 1
  UNION ALL
  SELECT day_no + 1
  FROM days
  WHERE day_no < 38
),
subjects(subject_code, start_local, end_local, sequence_number) AS (
  VALUES
    ('PHYSICS',   '15:30', '16:00', 1),
    ('CHEMISTRY', '16:00', '16:30', 2),
    ('BIOLOGY',   '16:30', '17:30', 3)
),
ranked_topics AS (
  SELECT
    s.subject_code,
    t.topic_code,
    t.topic_name,
    ROW_NUMBER() OVER (
      PARTITION BY s.subject_code
      ORDER BY t.id
    ) AS topic_no
  FROM education_topics t
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    s.grade_code = 'PROGRAM_NEET'
    AND t.enabled = 1
    AND EXISTS (
      SELECT 1
      FROM education_subtopics st
      JOIN education_questions q
        ON q.subtopic_id = st.id
      WHERE
        st.topic_id = t.id
        AND st.enabled = 1
        AND q.active = 1
    )
),
topic_counts AS (
  SELECT
    subject_code,
    COUNT(*) AS topic_count
  FROM ranked_topics
  GROUP BY subject_code
)
INSERT INTO education_live_class_template_rows (
  template_code,
  teaching_day,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone,
  sequence_number
)
SELECT
  'NEET_STANDARD_38',
  d.day_no,
  s.subject_code,
  rt.topic_code,
  rt.topic_name,
  s.start_local,
  s.end_local,
  'Asia/Kolkata',
  s.sequence_number
FROM days d
CROSS JOIN subjects s
JOIN topic_counts tc
  ON tc.subject_code = s.subject_code
JOIN ranked_topics rt
  ON rt.subject_code = s.subject_code
 AND rt.topic_no =
   (
     ((d.day_no - 1) % tc.topic_count) + 1
   );

-- Verification result should be 114 rows for JEE and 114 rows for NEET.
SELECT
  t.program_code,
  t.template_code,
  t.teaching_days,
  COUNT(r.id) AS template_rows,
  COUNT(DISTINCT r.teaching_day) AS teaching_days_seeded
FROM education_live_class_templates t
LEFT JOIN education_live_class_template_rows r
  ON r.template_code = t.template_code
WHERE t.template_code IN (
  'JEE_STANDARD_38',
  'NEET_STANDARD_38'
)
GROUP BY
  t.program_code,
  t.template_code,
  t.teaching_days
ORDER BY
  t.program_code;
