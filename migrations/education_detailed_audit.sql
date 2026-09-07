-- education_detailed_audit.sql
-- Detailed GYAN education audit
--
-- A. Program totals
-- B. Program -> subject totals
-- C. Program -> subject -> topic totals
-- D. Program -> subject -> topic -> subtopic totals
-- E. Mock test totals
-- F. Mock test -> subject totals
-- G. Mock test -> subject -> topic totals
-- H. Published Test 1 question listing
--
-- Read-only. Safe for local or remote use.

PRAGMA foreign_keys = ON;

-- ============================================================
-- A. PROGRAM QUESTION-BANK TOTALS
-- ============================================================

SELECT
  CASE
    WHEN s.grade_code LIKE 'PROGRAM_%'
      THEN SUBSTR(s.grade_code, 9)
    ELSE s.grade_code
  END AS program_code,
  COUNT(DISTINCT q.id) AS total_questions,
  COUNT(DISTINCT CASE WHEN q.active = 1 THEN q.id END) AS active_questions,
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
-- B. PROGRAM -> SUBJECT COUNTS
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
  COUNT(DISTINCT CASE WHEN q.active = 0 THEN q.id END) AS inactive_questions,
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
-- C. PROGRAM -> SUBJECT -> TOPIC COUNTS
-- ============================================================

SELECT
  CASE
    WHEN s.grade_code LIKE 'PROGRAM_%'
      THEN SUBSTR(s.grade_code, 9)
    ELSE s.grade_code
  END AS program_code,
  s.country_code,
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(DISTINCT q.id) AS total_questions,
  COUNT(DISTINCT CASE WHEN q.active = 1 THEN q.id END) AS active_questions,
  COUNT(DISTINCT st.id) AS subtopics
FROM education_subjects s
JOIN education_topics t
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
  t.id,
  t.topic_code,
  t.topic_name
ORDER BY
  program_code,
  s.country_code,
  s.subject_code,
  t.sort_order,
  t.topic_code;


-- ============================================================
-- D. PROGRAM -> SUBJECT -> TOPIC -> SUBTOPIC COUNTS
-- ============================================================

SELECT
  CASE
    WHEN s.grade_code LIKE 'PROGRAM_%'
      THEN SUBSTR(s.grade_code, 9)
    ELSE s.grade_code
  END AS program_code,
  s.country_code,
  s.subject_code,
  t.topic_code,
  st.subtopic_code,
  st.subtopic_name,
  COUNT(DISTINCT q.id) AS total_questions,
  COUNT(DISTINCT CASE WHEN q.active = 1 THEN q.id END) AS active_questions
FROM education_subjects s
JOIN education_topics t
  ON t.subject_id = s.id
JOIN education_subtopics st
  ON st.topic_id = t.id
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
WHERE s.grade_code LIKE 'PROGRAM_%'
GROUP BY
  s.grade_code,
  s.country_code,
  s.subject_code,
  t.id,
  t.topic_code,
  st.id,
  st.subtopic_code,
  st.subtopic_name
ORDER BY
  program_code,
  s.country_code,
  s.subject_code,
  t.sort_order,
  st.sort_order,
  st.subtopic_code;


-- ============================================================
-- E. MOCK TEST INVENTORY
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
  SUM(COALESCE(mtq.marks_correct, 0)) AS maximum_marks
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
    ELSE 2
  END,
  mt.test_code,
  mt.exam_level,
  mt.version;


-- ============================================================
-- F. MOCK TEST -> SUBJECT COUNTS
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  s.subject_code,
  s.subject_name,
  COUNT(*) AS questions,
  SUM(COALESCE(mtq.marks_correct, 0)) AS maximum_marks
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  s.id,
  s.subject_code,
  s.subject_name
ORDER BY
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  MIN(mtq.question_order);


-- ============================================================
-- G. MOCK TEST -> SUBJECT -> TOPIC COUNTS
-- ============================================================

SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
GROUP BY
  mt.id,
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  s.id,
  t.id,
  t.topic_code,
  t.topic_name
ORDER BY
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.version,
  s.subject_code,
  t.sort_order,
  t.topic_code;


-- ============================================================
-- H. PUBLISHED FULL TEST 1: EXACT QUESTION LIST
-- One row per question, ordered as delivered to the user.
-- ============================================================

SELECT
  mt.program_code,
  mt.test_code,
  mt.exam_level,
  mt.version,
  mtq.question_order,
  COALESCE(mtq.section_code, '') AS section_code,
  s.subject_code,
  t.topic_code,
  st.subtopic_code,
  q.id AS question_id,
  q.question_key,
  q.difficulty,
  COALESCE(
    rd.response_type,
    qm.question_format,
    'SINGLE_CHOICE'
  ) AS response_type,
  q.question_text
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
LEFT JOIN education_question_metadata qm
  ON qm.question_id = q.id
LEFT JOIN education_question_response_details rd
  ON rd.question_id = q.id
WHERE mt.test_kind = 'FULL'
  AND mt.test_code = 'TEST_1'
  AND mt.published = 1
ORDER BY
  mt.program_code,
  mtq.question_order;


-- ============================================================
-- I. PUBLISHED TEST 1 DIFFICULTY BY SUBJECT
-- ============================================================

SELECT
  mt.program_code,
  s.subject_code,
  q.difficulty,
  COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id = mt.id
JOIN education_questions q
  ON q.id = mtq.question_id
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE mt.test_kind = 'FULL'
  AND mt.test_code = 'TEST_1'
  AND mt.published = 1
GROUP BY
  mt.id,
  mt.program_code,
  s.id,
  s.subject_code,
  q.difficulty
ORDER BY
  mt.program_code,
  s.subject_code,
  CASE q.difficulty
    WHEN 'easy' THEN 1
    WHEN 'medium' THEN 2
    WHEN 'challenge' THEN 3
    ELSE 4
  END;


-- ============================================================
-- J. PUBLISHED TEST 1 RESPONSE FORMAT BY SUBJECT
-- ============================================================

SELECT
  mt.program_code,
  s.subject_code,
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
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
LEFT JOIN education_question_metadata qm
  ON qm.question_id = q.id
LEFT JOIN education_question_response_details rd
  ON rd.question_id = q.id
WHERE mt.test_kind = 'FULL'
  AND mt.test_code = 'TEST_1'
  AND mt.published = 1
GROUP BY
  mt.id,
  mt.program_code,
  s.id,
  s.subject_code,
  COALESCE(
    rd.response_type,
    qm.question_format,
    'SINGLE_CHOICE'
  )
ORDER BY
  mt.program_code,
  s.subject_code,
  response_type;
