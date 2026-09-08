-- 0129_neet_mini_a_quality_rebuild_v2.sql
-- Robust deterministic NEET Mini A rebuild.
--
-- 15 questions:
--   1-5   Physics
--   6-10  Chemistry
--   11-15 Biology
--
-- Selection:
--   * PROGRAM_NEET / IN only
--   * active question
--   * enabled named topic + subtopic
--   * NEET_2026
--   * REVIEWED or PUBLISHED
--   * explicitly excludes legacy generic topic where topic_code = subject_code
--   * deterministic ordering by topic sort_order, subtopic sort_order, question id
--
-- Safe to rerun.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('NEET','MINI','MINI_A','Mini A','NEET',1,'OPEN',0);

UPDATE education_mock_tests
SET test_name='Mini A',
    access_mode='OPEN',
    published=0,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET'
  AND test_kind='MINI'
  AND test_code='MINI_A'
  AND exam_level='NEET'
  AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id=(
  SELECT id
  FROM education_mock_tests
  WHERE program_code='NEET'
    AND test_kind='MINI'
    AND test_code='MINI_A'
    AND exam_level='NEET'
    AND version=1
  LIMIT 1
);

-- Physics 1-5
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  picked.question_id,
  picked.rn,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        t.sort_order,
        st.sort_order,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_question_metadata qm
    ON qm.question_id=q.id
  JOIN education_subtopics st
    ON st.id=q.subtopic_id
  JOIN education_topics t
    ON t.id=st.topic_id
  JOIN education_subjects s
    ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code='PHYSICS'
    AND t.topic_code <> s.subject_code
    AND t.enabled=1
    AND st.enabled=1
    AND q.active=1
    AND qm.syllabus_version='NEET_2026'
    AND qm.quality_status IN ('REVIEWED','PUBLISHED')
) picked
  ON picked.rn BETWEEN 1 AND 5
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1;

-- Chemistry 6-10
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  picked.question_id,
  5 + picked.rn,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        t.sort_order,
        st.sort_order,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_question_metadata qm
    ON qm.question_id=q.id
  JOIN education_subtopics st
    ON st.id=q.subtopic_id
  JOIN education_topics t
    ON t.id=st.topic_id
  JOIN education_subjects s
    ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code='CHEMISTRY'
    AND t.topic_code <> s.subject_code
    AND t.enabled=1
    AND st.enabled=1
    AND q.active=1
    AND qm.syllabus_version='NEET_2026'
    AND qm.quality_status IN ('REVIEWED','PUBLISHED')
) picked
  ON picked.rn BETWEEN 1 AND 5
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1;

-- Biology 11-15
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  picked.question_id,
  10 + picked.rn,
  'BIOLOGY',
  4,-1,0
FROM education_mock_tests mt
JOIN (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        t.sort_order,
        st.sort_order,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_question_metadata qm
    ON qm.question_id=q.id
  JOIN education_subtopics st
    ON st.id=q.subtopic_id
  JOIN education_topics t
    ON t.id=st.topic_id
  JOIN education_subjects s
    ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code='BIOLOGY'
    AND t.topic_code <> s.subject_code
    AND t.enabled=1
    AND st.enabled=1
    AND q.active=1
    AND qm.syllabus_version='NEET_2026'
    AND qm.quality_status IN ('REVIEWED','PUBLISHED')
) picked
  ON picked.rn BETWEEN 1 AND 5
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1;

-- Publish only with the exact expected composition.
UPDATE education_mock_tests
SET published = CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      ) = 15
      AND (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
          AND mtq.section_code='PHYSICS'
      ) = 5
      AND (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
          AND mtq.section_code='CHEMISTRY'
      ) = 5
      AND (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
          AND mtq.section_code='BIOLOGY'
      ) = 5
      THEN 1 ELSE 0 END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET'
  AND test_kind='MINI'
  AND test_code='MINI_A'
  AND exam_level='NEET'
  AND version=1;

-- Summary.
SELECT
  mt.test_code,
  mt.published,
  COUNT(mtq.question_id) AS question_count,
  SUM(CASE WHEN mtq.section_code='PHYSICS' THEN 1 ELSE 0 END) AS physics,
  SUM(CASE WHEN mtq.section_code='CHEMISTRY' THEN 1 ELSE 0 END) AS chemistry,
  SUM(CASE WHEN mtq.section_code='BIOLOGY' THEN 1 ELSE 0 END) AS biology
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
GROUP BY mt.id,mt.test_code,mt.published;

-- Show exactly what Mini A contains.
SELECT
  mtq.question_order,
  mtq.section_code,
  t.topic_code,
  st.subtopic_code,
  q.question_key,
  q.difficulty,
  q.question_text
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
JOIN education_questions q
  ON q.id=mtq.question_id
JOIN education_subtopics st
  ON st.id=q.subtopic_id
JOIN education_topics t
  ON t.id=st.topic_id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
ORDER BY mtq.question_order;
