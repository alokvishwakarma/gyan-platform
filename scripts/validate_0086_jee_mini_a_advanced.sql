-- Validate JEE Mini A Advanced v1.
SELECT id,test_name,exam_level,version,access_mode,published
FROM education_mock_tests
WHERE program_code='JEE' AND test_kind='MINI' AND test_code='MINI_A'
  AND exam_level='ADVANCED' AND version=1;

SELECT
 COUNT(*) AS question_count,
 COUNT(DISTINCT mtq.question_id) AS distinct_question_count,
 MIN(mtq.question_order) AS min_order,
 MAX(mtq.question_order) AS max_order,
 SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1;

SELECT mtq.section_code,qm.question_format,COUNT(*) AS question_count
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1
GROUP BY mtq.section_code,qm.question_format
ORDER BY mtq.section_code,qm.question_format;

-- Must return zero rows: no question reuse from Mini A Main.
SELECT adv.question_order AS advanced_order, main.question_order AS main_order, q.question_key
FROM education_mock_test_questions adv
JOIN education_mock_tests advt ON advt.id=adv.mock_test_id
JOIN education_mock_test_questions main ON main.question_id=adv.question_id
JOIN education_mock_tests maint ON maint.id=main.mock_test_id
JOIN education_questions q ON q.id=adv.question_id
WHERE advt.program_code='JEE' AND advt.test_kind='MINI' AND advt.test_code='MINI_A'
  AND advt.exam_level='ADVANCED' AND advt.version=1
  AND maint.program_code='JEE' AND maint.test_kind='MINI' AND maint.test_code='MINI_A'
  AND maint.exam_level='MAIN' AND maint.version=1;
