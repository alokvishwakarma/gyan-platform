-- 0127_neet_remove_legacy_mega_banks_v2.sql
-- Clean removal of obsolete generic NEET mega-banks.
--
-- Removes only legacy PROGRAM_NEET content where:
--   subject_code IN (PHYSICS,CHEMISTRY,BIOLOGY)
--   topic_code = subject_code
--
-- Before question deletion, remove dependent practice/mock attempts and
-- practice history that reference those legacy question ids.
--
-- Does NOT touch the rebuilt Mini A / Test 1 mappings unless they still
-- reference a legacy question (the preflight should show zero).

PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------
-- 1. Remove ordinary practice attempts that used legacy questions.
--    Deleting the parent attempt lets ON DELETE CASCADE remove its answers.
-- ------------------------------------------------------------

DELETE FROM education_attempts
WHERE id IN (
  SELECT DISTINCT aa.attempt_id
  FROM education_attempt_answers aa
  WHERE aa.question_id IN (
    SELECT q.id
    FROM education_questions q
    JOIN education_subtopics st
      ON st.id = q.subtopic_id
    JOIN education_topics t
      ON t.id = st.topic_id
    JOIN education_subjects s
      ON s.id = t.subject_id
    WHERE s.country_code = 'IN'
      AND s.grade_code = 'PROGRAM_NEET'
      AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
      AND t.topic_code = s.subject_code
  )
);

-- ------------------------------------------------------------
-- 2. Remove mock attempts only if an old submitted attempt still
--    contains answers to a legacy mega-bank question.
-- ------------------------------------------------------------

DELETE FROM education_mock_attempts
WHERE id IN (
  SELECT DISTINCT maa.attempt_id
  FROM education_mock_attempt_answers maa
  WHERE maa.question_id IN (
    SELECT q.id
    FROM education_questions q
    JOIN education_subtopics st
      ON st.id = q.subtopic_id
    JOIN education_topics t
      ON t.id = st.topic_id
    JOIN education_subjects s
      ON s.id = t.subject_id
    WHERE s.country_code = 'IN'
      AND s.grade_code = 'PROGRAM_NEET'
      AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
      AND t.topic_code = s.subject_code
  )
);

-- ------------------------------------------------------------
-- 3. Remove direct question-history references.
-- ------------------------------------------------------------

DELETE FROM education_student_question_history
WHERE question_id IN (
  SELECT q.id
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND t.topic_code = s.subject_code
);

-- ------------------------------------------------------------
-- 4. Remove summary rows for the obsolete generic topics.
-- ------------------------------------------------------------

DELETE FROM education_subtopic_mastery
WHERE grade_code = 'PROGRAM_NEET'
  AND (
    (subject_code='PHYSICS'   AND topic_code='PHYSICS')
    OR
    (subject_code='CHEMISTRY' AND topic_code='CHEMISTRY')
    OR
    (subject_code='BIOLOGY'   AND topic_code='BIOLOGY')
  );

DELETE FROM education_topic_mastery
WHERE grade_code = 'PROGRAM_NEET'
  AND (
    (subject_code='PHYSICS'   AND topic_code='PHYSICS')
    OR
    (subject_code='CHEMISTRY' AND topic_code='CHEMISTRY')
    OR
    (subject_code='BIOLOGY'   AND topic_code='BIOLOGY')
  );

-- ------------------------------------------------------------
-- 5. Remove practice cursors for obsolete generic topics/subtopics.
--    Uses ids so this remains correct even if cursor schema is id-based.
-- ------------------------------------------------------------

DELETE FROM education_practice_cursors
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

-- ------------------------------------------------------------
-- 6. Remove legacy questions.
-- ------------------------------------------------------------

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

-- ------------------------------------------------------------
-- 7. Remove now-empty legacy subtopics and topics.
-- ------------------------------------------------------------

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

-- ------------------------------------------------------------
-- 8. Verification.
-- ------------------------------------------------------------

SELECT
  'legacy_topics' AS check_name,
  COUNT(*) AS remaining
FROM education_topics t
JOIN education_subjects s
  ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
  AND t.topic_code=s.subject_code

UNION ALL

SELECT
  'legacy_questions',
  COUNT(*)
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
  AND t.topic_code=s.subject_code

UNION ALL

SELECT
  'legacy_mock_refs',
  COUNT(*)
FROM education_mock_test_questions mtq
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
  AND t.topic_code=s.subject_code;
