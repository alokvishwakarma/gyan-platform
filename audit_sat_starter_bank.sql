-- audit_sat_starter_bank.sql

SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS questions
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id
JOIN education_subtopics st ON st.topic_id=t.id
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
GROUP BY s.subject_code,t.id,t.topic_code,t.topic_name
ORDER BY s.sort_order,t.sort_order;

-- Expected: every SAT skill has exactly 2 starter questions.
SELECT
  s.subject_code,
  t.topic_code,
  st.subtopic_code,
  st.subtopic_name,
  COUNT(q.id) AS questions
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id
JOIN education_subtopics st ON st.topic_id=t.id
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
GROUP BY s.subject_code,t.id,st.id
HAVING COUNT(q.id) <> 2
ORDER BY s.sort_order,t.sort_order,st.sort_order;

-- Expected totals: RW 22, MATH 38, TOTAL 60.
SELECT
  s.subject_code,
  COUNT(q.id) AS questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND q.active=1
GROUP BY s.subject_code
ORDER BY s.sort_order;

-- SAT detail coverage should equal SAT question count.
SELECT
  COUNT(*) AS sat_detail_rows
FROM education_sat_question_details d
JOIN education_questions q ON q.id=d.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT';
