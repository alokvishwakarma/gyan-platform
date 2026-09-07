-- education_full_audit.sql
-- Reusable GYAN education audit:
--   A. Program/question-bank totals
--   B. Mock-test inventory by program/test
--   C. Section composition
--   D. Difficulty composition
--   E. Response/question formats
--   F. Duplicate/missing mapping health checks
--
-- Read-only. Safe for local or remote use.

PRAGMA foreign_keys = ON;

-- ============================================================
-- A1. PROGRAM CATALOG / PORTAL FLAGS
-- ============================================================

SELECT
  pc.program_code,
  pc.canonical_name,
  pc.grade_code,
  pc.experience_type,
  pc.enabled,
  pc.show_questions,
  pc.show_mock_tests,
  pc.show_reports,
  pc.show_classes,
  pc.duration_minutes,
  pc.question_count AS catalog_question_count
FROM education_program_catalog pc
ORDER BY pc.program_code;


-- ============================================================
-- A2. QUESTION BANK TOTALS PER PROGRAM
-- Counts active and inactive questions across all country rows.
-- ============================================================

SELECT
  s.grade_code,
  CASE
    WHEN s.grade_code LIKE 'PROGRAM_%'
      THEN SUBSTR(s.grade_code, 9)
    ELSE s.grade_code
  END AS program_code,
  COUNT(DISTINCT q.id) AS total_questions,
  COUNT(DISTINCT CASE WHEN q.active = 1 THEN q.id END) AS active_questions,
  COUNT(DISTINCT CASE WHEN q.active = 0 THEN q.id END) AS inactive_questions,
  COUNT(DISTINCT s.id) AS subjects,
  COUNT(DISTINCT t.id) AS topics,
  COUNT(DISTINCT st.id) AS subtopics
FROM education_subjects s
LEFT JOIN education_topics t
  ON t.subject_id = s.id
LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
WHERE s.grade_code LIKE 'PROGRAM_%'
GROUP BY s.grade_code
ORDER BY program_code;


-- ============================================================
-- A3. QUESTION BANK TOTALS PER PROGRAM + SUBJECT
-- ============================================================

SELECT
  CASE
    WHEN s.grade_code LIKE 'PROGRAM_%'
      THEN SUBSTR(s.grade_code, 9)
    ELSE s.grade_code
  END AS program_code,
  s.country_code,
  s.subject_code,
  s.subject_name,
  COUNT(DISTINCT q.id) AS total_questions,
  COUNT(DISTINCT CASE WHEN q.active = 1 THEN q.id END) AS active_questions,
  COUNT(DISTINCT t.id) AS topics,
  COUNT(DISTINCT st.id) AS subtopics
FROM education_subjects s
LEFT JOIN education_topics t
  ON t.subject_id = s.id
LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
WHERE s.grade_code LIKE 'PROGRAM_%'
GROUP BY
  s.grade_code,
  s.country_code,
  s.subject_code,
  s.subject_name
ORDER BY
  program_code,
  s.country_code,
  s.sort_order,
  s.subject_code;


-- ============================================================
-- B1. ALL MOCK TESTS / MINI TESTS
-- Includes locked shells with zero questions.
-- ============================================================

SELECT
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.test_name,
  mt.exam_level,
  mt.version,
  mt.access_mode,
  mt.published,
  COUNT(mtq.question_id) AS question_count,
  COUNT(DISTINCT mtq.question_id) AS unique_questions,
  SUM(COALESCE(mtq.marks_correct, 0)) AS maximum_marks,
  CASE
    WHEN mt.published = 1
         AND COUNT(mtq.question_id) = 0
      THEN 'ERROR: PUBLISHED EMPTY'
    WHEN mt.published = 1
         AND COUNT(mtq.question_id) > 0
      THEN 'OK: PUBLISHED'
    WHEN mt.published = 0
         AND COUNT(mtq.question_id) = 0
      THEN 'LOCKED/EMPTY SHELL'
    WHEN mt.published = 0
         AND COUNT(mtq.question_id) > 0
      THEN 'UNPUBLISHED WITH QUESTIONS'
    ELSE 'CHECK'
  END AS audit_status
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.test_name,
  mt.exam_level,
  mt.version,
  mt.access_mode,
  mt.published
ORDER BY
  mt.program_code,
  CASE mt.test_kind
    WHEN 'FULL' THEN 1
    WHEN 'MINI' THEN 2
    ELSE 3
  END,
  mt.test_code,
  mt.exam_level,
  mt.version;


-- ============================================================
-- B2. TEST COUNTS SUMMARIZED BY PROGRAM
-- ============================================================

SELECT
  mt.program_code,
  COUNT(DISTINCT mt.id) AS test_shells,
  COUNT(DISTINCT CASE
    WHEN mt.test_kind = 'FULL' THEN mt.id
  END) AS full_tests,
  COUNT(DISTINCT CASE
    WHEN mt.test_kind = 'MINI' THEN mt.id
  END) AS mini_tests,
  COUNT(DISTINCT CASE
    WHEN mt.published = 1 THEN mt.id
  END) AS published_tests,
  COUNT(DISTINCT CASE
    WHEN mt.published = 0 THEN mt.id
  END) AS unpublished_tests,
  COUNT(mtq.question_id) AS total_test_question_slots,
  COUNT(DISTINCT mtq.question_id) AS distinct_questions_used_in_tests
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
GROUP BY mt.program_code
ORDER BY mt.program_code;


-- ============================================================
-- C1. SECTION COMPOSITION FOR EVERY NONEMPTY TEST
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  COALESCE(mtq.section_code, '(NO SECTION)') AS section_code,
  COUNT(*) AS questions,
  SUM(COALESCE(mtq.marks_correct, 0)) AS maximum_marks
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mtq.section_code
ORDER BY
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  MIN(mtq.question_order);


-- ============================================================
-- D1. DIFFICULTY MIX FOR EVERY NONEMPTY TEST
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  COALESCE(q.difficulty, '(NULL)') AS difficulty,
  COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  q.difficulty
ORDER BY
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  CASE q.difficulty
    WHEN 'easy' THEN 1
    WHEN 'medium' THEN 2
    WHEN 'challenge' THEN 3
    ELSE 4
  END;


-- ============================================================
-- E1. QUESTION / RESPONSE FORMAT MIX FOR EVERY TEST
-- Uses generic response details when present; otherwise metadata.
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  COALESCE(
    rd.response_type,
    qm.question_format,
    'SINGLE_CHOICE'
  ) AS response_type,
  COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
LEFT JOIN education_question_response_details rd
  ON rd.question_id = q.id
LEFT JOIN education_question_metadata qm
  ON qm.question_id = q.id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  COALESCE(
    rd.response_type,
    qm.question_format,
    'SINGLE_CHOICE'
  )
ORDER BY
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  response_type;


-- ============================================================
-- F1. DUPLICATE QUESTION MAPPINGS INSIDE ONE TEST
-- Should return ZERO rows because the schema also protects this.
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mtq.question_id,
  COUNT(*) AS occurrences
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mtq.question_id
HAVING COUNT(*) > 1
ORDER BY
  mt.program_code,
  mt.test_code,
  mtq.question_id;


-- ============================================================
-- F2. DUPLICATE QUESTION ORDER NUMBERS INSIDE ONE TEST
-- Should return ZERO rows.
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mtq.question_order,
  COUNT(*) AS occurrences
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mtq.question_order
HAVING COUNT(*) > 1
ORDER BY
  mt.program_code,
  mt.test_code,
  mtq.question_order;


-- ============================================================
-- F3. TEST MAPPINGS TO INACTIVE QUESTIONS
-- Ideally returns ZERO rows for published tests.
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mt.published,
  mtq.question_order,
  q.id AS question_id,
  q.question_key,
  q.active
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
WHERE q.active <> 1
ORDER BY
  mt.program_code,
  mt.test_code,
  mtq.question_order;


-- ============================================================
-- F4. QUESTION FORMAT METADATA GAPS IN PUBLISHED TESTS
-- Generic SINGLE_CHOICE fallback is legal, so this is informational.
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  COUNT(*) AS questions_without_metadata,
  SUM(
    CASE
      WHEN rd.question_id IS NULL THEN 1
      ELSE 0
    END
  ) AS questions_without_response_details
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
LEFT JOIN education_question_metadata qm
  ON qm.question_id = q.id
LEFT JOIN education_question_response_details rd
  ON rd.question_id = q.id
WHERE mt.published = 1
  AND qm.question_id IS NULL
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version
ORDER BY
  mt.program_code,
  mt.test_code;


-- ============================================================
-- G1. ATTEMPT HISTORY BY PROGRAM / TEST
-- Useful now that old prototype history was cleared.
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  COUNT(DISTINCT a.id) AS attempts,
  COUNT(aa.question_id) AS saved_answer_rows,
  MAX(a.submitted_at) AS latest_submission
FROM education_mock_tests mt
LEFT JOIN education_mock_attempts a
  ON a.mock_test_id = mt.id
LEFT JOIN education_mock_attempt_answers aa
  ON aa.attempt_id = a.id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version
HAVING COUNT(DISTINCT a.id) > 0
ORDER BY
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version;
