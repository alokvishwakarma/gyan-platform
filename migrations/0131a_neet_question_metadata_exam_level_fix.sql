-- 0131a_neet_question_metadata_exam_level_fix.sql
-- Allow NEET as a first-class education_question_metadata.exam_level.
-- Preserves all existing metadata rows and indexes.
-- Then backfills metadata for active, proper NEET 2026 practice questions
-- that were previously skipped because exam_level='NEET' violated the old CHECK.

PRAGMA foreign_keys = OFF;

ALTER TABLE education_question_metadata
RENAME TO education_question_metadata_old;

CREATE TABLE education_question_metadata (
  question_id INTEGER PRIMARY KEY,

  exam_level TEXT NOT NULL DEFAULT 'BOTH'
    CHECK (
      exam_level IN (
        'MAIN',
        'ADVANCED',
        'BOTH',
        'NEET'
      )
    ),

  question_format TEXT NOT NULL DEFAULT 'SINGLE_CHOICE'
    CHECK (
      question_format IN (
        'SINGLE_CHOICE',
        'NUMERICAL',
        'MULTI_SELECT',
        'INTEGER',
        'MATCHING',
        'COMPREHENSION'
      )
    ),

  syllabus_version TEXT NOT NULL DEFAULT 'JEE_2026',

  quality_status TEXT NOT NULL DEFAULT 'DRAFT'
    CHECK (
      quality_status IN (
        'DRAFT',
        'REVIEWED',
        'PUBLISHED',
        'RETIRED'
      )
    ),

  archetype_code TEXT,
  source_note TEXT,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE
);

INSERT INTO education_question_metadata (
  question_id,
  exam_level,
  question_format,
  syllabus_version,
  quality_status,
  archetype_code,
  source_note,
  created_at,
  updated_at
)
SELECT
  question_id,
  exam_level,
  question_format,
  syllabus_version,
  quality_status,
  archetype_code,
  source_note,
  created_at,
  updated_at
FROM education_question_metadata_old;

DROP TABLE education_question_metadata_old;

CREATE INDEX IF NOT EXISTS idx_education_question_metadata_level
ON education_question_metadata (
  exam_level,
  quality_status
);

-- ------------------------------------------------------------
-- Backfill missing metadata for active questions in proper NEET topics.
--
-- Known reviewed sources:
--   neet-starter-v1
--   neet-bank-v1
--   gyan-quality-test1
--
-- Current quality expansion:
--   neet-2026-quality-v2 -> DRAFT
--
-- Any other NEET source is conservatively DRAFT.
-- ------------------------------------------------------------

INSERT OR IGNORE INTO education_question_metadata (
  question_id,
  exam_level,
  question_format,
  syllabus_version,
  quality_status,
  archetype_code,
  source_note
)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',

  CASE
    WHEN q.source_type IN (
      'neet-starter-v1',
      'neet-bank-v1',
      'gyan-quality-test1'
    )
    THEN 'REVIEWED'

    ELSE 'DRAFT'
  END,

  'NEET_BACKFILL_' || q.id,

  CASE
    WHEN q.source_type='neet-2026-quality-v2'
      THEN 'GYAN NEET 2026 quality rebuild v2'
    WHEN q.source_type='gyan-quality-test1'
      THEN 'GYAN NEET Quality Test 1'
    WHEN q.source_type='neet-starter-v1'
      THEN 'GYAN NEET 2026 starter bank'
    WHEN q.source_type='neet-bank-v1'
      THEN 'GYAN NEET bank expansion'
    ELSE 'GYAN NEET metadata backfill'
  END

FROM education_questions q
JOIN education_subtopics st
  ON st.id=q.subtopic_id
JOIN education_topics t
  ON t.id=st.topic_id
JOIN education_subjects s
  ON s.id=t.subject_id

WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code IN (
    'PHYSICS',
    'CHEMISTRY',
    'BIOLOGY'
  )
  AND t.topic_code <> s.subject_code
  AND t.enabled=1
  AND st.enabled=1
  AND q.active=1;

PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------
-- Verification.
-- ------------------------------------------------------------

SELECT
  exam_level,
  syllabus_version,
  quality_status,
  COUNT(*) AS questions
FROM education_question_metadata
WHERE syllabus_version='NEET_2026'
GROUP BY
  exam_level,
  syllabus_version,
  quality_status
ORDER BY
  exam_level,
  quality_status;

SELECT
  t.sort_order,
  t.topic_code,
  COUNT(q.id) AS active_questions,

  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
      THEN 1 ELSE 0
    END
  ) AS tracked_neet_2026,

  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
       AND qm.quality_status='REVIEWED'
      THEN 1 ELSE 0
    END
  ) AS reviewed,

  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
       AND qm.quality_status='DRAFT'
      THEN 1 ELSE 0
    END
  ) AS draft

FROM education_topics t
JOIN education_subjects s
  ON s.id=t.subject_id
JOIN education_subtopics st
  ON st.topic_id=t.id
 AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id
 AND q.active=1
LEFT JOIN education_question_metadata qm
  ON qm.question_id=q.id

WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.enabled=1
  AND t.topic_code IN (
    'PHYSICS_AND_MEASUREMENT',
    'KINEMATICS',
    'LAWS_OF_MOTION',
    'WORK_ENERGY_POWER',
    'ROTATIONAL_MOTION'
  )

GROUP BY
  t.id,
  t.sort_order,
  t.topic_code

ORDER BY
  t.sort_order;
