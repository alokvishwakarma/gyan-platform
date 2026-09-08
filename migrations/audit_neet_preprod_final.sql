-- audit_neet_preprod_final.sql
-- Final local audit before moving NEET rebuild to production.

-- ============================================================
-- 1. NEET subject/topic inventory
-- ============================================================

SELECT
  s.subject_code,
  COUNT(DISTINCT t.id) AS enabled_topics,
  COUNT(DISTINCT st.id) AS enabled_subtopics,
  COUNT(q.id) AS active_questions
FROM education_subjects s
LEFT JOIN education_topics t
  ON t.subject_id=s.id
 AND t.enabled=1
LEFT JOIN education_subtopics st
  ON st.topic_id=t.id
 AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id
 AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
GROUP BY s.subject_code
ORDER BY s.subject_code;

-- ============================================================
-- 2. Legacy generic mega-banks must be gone
-- ============================================================

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

-- ============================================================
-- 3. Physics target: exactly 20 topics x 25 = 500
-- ============================================================

SELECT
  t.sort_order,
  t.topic_code,
  COUNT(q.id) AS active_questions,
  SUM(
    CASE
      WHEN qm.exam_level='NEET'
       AND qm.syllabus_version='NEET_2026'
      THEN 1 ELSE 0
    END
  ) AS tracked_neet_2026,
  SUM(
    CASE
      WHEN qm.exam_level='NEET'
       AND qm.syllabus_version='NEET_2026'
       AND qm.quality_status='REVIEWED'
      THEN 1 ELSE 0
    END
  ) AS reviewed,
  SUM(
    CASE
      WHEN qm.exam_level='NEET'
       AND qm.syllabus_version='NEET_2026'
       AND qm.quality_status='DRAFT'
      THEN 1 ELSE 0
    END
  ) AS draft
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
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
GROUP BY t.id,t.sort_order,t.topic_code
ORDER BY t.sort_order;

SELECT
  COUNT(DISTINCT t.id) AS physics_topics,
  COUNT(q.id) AS active_physics_questions,
  SUM(
    CASE
      WHEN qm.exam_level='NEET'
       AND qm.syllabus_version='NEET_2026'
      THEN 1 ELSE 0
    END
  ) AS tracked_neet_2026
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
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
  AND t.enabled=1;

-- ============================================================
-- 4. Metadata coverage: every active NEET question in named topics
--    should have exactly one metadata row.
-- ============================================================

SELECT
  s.subject_code,
  COUNT(q.id) AS active_questions,
  SUM(CASE WHEN qm.question_id IS NOT NULL THEN 1 ELSE 0 END) AS with_metadata,
  SUM(CASE WHEN qm.question_id IS NULL THEN 1 ELSE 0 END) AS missing_metadata,
  SUM(
    CASE
      WHEN qm.exam_level='NEET'
       AND qm.syllabus_version='NEET_2026'
      THEN 1 ELSE 0
    END
  ) AS valid_neet_metadata
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
LEFT JOIN education_question_metadata qm ON qm.question_id=q.id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
  AND t.topic_code<>s.subject_code
  AND t.enabled=1
  AND st.enabled=1
  AND q.active=1
GROUP BY s.subject_code
ORDER BY s.subject_code;

-- ============================================================
-- 5. Duplicate question keys inside active NEET catalog
-- ============================================================

SELECT
  question_key,
  COUNT(*) AS copies
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND q.active=1
GROUP BY question_key
HAVING COUNT(*)>1
ORDER BY copies DESC,question_key;

-- ============================================================
-- 6. Assessment integrity
-- ============================================================

SELECT
  mt.test_kind,
  mt.test_code,
  mt.test_name,
  mt.published,
  COUNT(mtq.question_id) AS question_count,
  SUM(CASE WHEN mtq.section_code='PHYSICS' THEN 1 ELSE 0 END) AS physics,
  SUM(CASE WHEN mtq.section_code='CHEMISTRY' THEN 1 ELSE 0 END) AS chemistry,
  SUM(CASE WHEN mtq.section_code='BIOLOGY' THEN 1 ELSE 0 END) AS biology
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='NEET'
  AND mt.version=1
  AND (
    (mt.test_kind='FULL' AND mt.test_code='TEST_1')
    OR
    (mt.test_kind='MINI' AND mt.test_code='MINI_A')
  )
GROUP BY mt.id
ORDER BY mt.test_kind,mt.test_code;

-- ============================================================
-- 7. Any assessment refs to disabled/inactive catalog questions?
-- ============================================================

SELECT
  mt.test_code,
  COUNT(*) AS bad_refs
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
WHERE mt.program_code='NEET'
  AND (
    q.active<>1
    OR st.enabled<>1
    OR t.enabled<>1
  )
GROUP BY mt.test_code;

-- ============================================================
-- 8. FK integrity
-- ============================================================

PRAGMA foreign_key_check;

-- ============================================================
-- 9. Index presence on hot paths
-- ============================================================

SELECT
  name,
  tbl_name,
  sql
FROM sqlite_master
WHERE type='index'
  AND (
    tbl_name='education_questions'
    OR tbl_name='education_subtopics'
    OR tbl_name='education_attempts'
    OR tbl_name='education_topic_mastery'
    OR tbl_name='education_subtopic_mastery'
    OR tbl_name='education_mock_attempts'
  )
ORDER BY tbl_name,name;
