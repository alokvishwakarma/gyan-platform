-- 0121_jee_main_test1_remote_gap_patch.sql
-- Repairs only the three missing JEE Main Test 1 positions found on production:
--   Math      : orders 22, 25
--   Chemistry : order 71
--
-- Safe to run after 0117. Does not delete existing mappings.

PRAGMA foreign_keys = ON;

-- Order 22: MATH single-choice
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_REMOTE_PATCH_022',
  'medium',
  'If the roots of x^2 - 9x + 20 = 0 are alpha and beta, then alpha beta equals:',
  '9','20','29','180',
  'B',
  'For ax^2+bx+c=0, the product of roots is c/a = 20.',
  1,
  'gyan-quality-test1-patch'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC'
  AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'QUALITY_TEST1_REMOTE_PATCH_022',
       'GYAN JEE Main Test 1 production gap patch'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_REMOTE_PATCH_022';

INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,22,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_REMOTE_PATCH_022'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND NOT EXISTS (
    SELECT 1 FROM education_mock_test_questions x
    WHERE x.mock_test_id=mt.id AND x.question_order=22
  );

-- Order 25: MATH numerical
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_REMOTE_PATCH_025',
  'challenge',
  'For matrix [[3,2],[1,5]], enter the value of its determinant.',
  '13','','','',
  'A',
  'The determinant is 3x5 - 2x1 = 13.',
  1,
  'gyan-quality-test1-patch'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS'
  AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'QUALITY_TEST1_REMOTE_PATCH_025',
       'GYAN JEE Main Test 1 production gap patch'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_REMOTE_PATCH_025';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,'Enter the numerical value.',
       NULL,'["13"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_REMOTE_PATCH_025';

INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,25,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_REMOTE_PATCH_025'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND NOT EXISTS (
    SELECT 1 FROM education_mock_test_questions x
    WHERE x.mock_test_id=mt.id AND x.question_order=25
  );

-- Order 71: CHEMISTRY single-choice
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_REMOTE_PATCH_071',
  'medium',
  'Which species acts as a Lewis base?',
  'BF3','NH3','AlCl3','H+',
  'B',
  'NH3 donates its lone pair and therefore acts as a Lewis base.',
  1,
  'gyan-quality-test1-patch'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'QUALITY_TEST1_REMOTE_PATCH_071',
       'GYAN JEE Main Test 1 production gap patch'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_REMOTE_PATCH_071';

INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,71,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_REMOTE_PATCH_071'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND NOT EXISTS (
    SELECT 1 FROM education_mock_test_questions x
    WHERE x.mock_test_id=mt.id AND x.question_order=71
  );

UPDATE education_mock_tests
SET published=CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      )=75 THEN 1 ELSE 0 END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

-- Audits
SELECT mt.id,mt.published,
       COUNT(mtq.question_id) AS questions,
       COUNT(DISTINCT mtq.question_id) AS unique_questions,
       SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id,mt.published;

SELECT s.subject_code,COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
GROUP BY s.subject_code
ORDER BY MIN(mtq.question_order);
