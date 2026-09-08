-- 0127_neet_remove_legacy_mega_banks.sql
-- Removes obsolete generic NEET practice banks such as:
--   PHYSICS  -> PHYSICS   -> KINEMATICS / MECHANICS (~1000)
--   CHEMISTRY-> CHEMISTRY -> BONDING / MOLES (~1000)
--   BIOLOGY  -> BIOLOGY   -> legacy generic buckets (~1500)
--
-- Scope is deliberately narrow:
--   country_code = IN
--   grade_code   = PROGRAM_NEET
--   subject_code = topic_code
--   subject in PHYSICS/CHEMISTRY/BIOLOGY
--
-- Run the preflight mock-reference query before applying this migration.
-- Mock-test rows are NOT modified here.

PRAGMA foreign_keys = ON;

DELETE FROM education_questions
WHERE subtopic_id IN (
  SELECT st.id
  FROM education_subtopics st
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND t.topic_code = s.subject_code
);

DELETE FROM education_subtopics
WHERE topic_id IN (
  SELECT t.id
  FROM education_topics t
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND t.topic_code = s.subject_code
);

DELETE FROM education_topics
WHERE id IN (
  SELECT t.id
  FROM education_topics t
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND t.topic_code = s.subject_code
);
