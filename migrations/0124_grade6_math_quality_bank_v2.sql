-- 0124_grade6_math_quality_bank_v2.sql
-- Grade 6 Math v2 quality bank.
-- 24 subtopics × 25 questions × 2 aligned country catalogs = 1200 question rows.
-- Difficulty per subtopic: 8 easy / 11 medium / 6 challenge.
-- Run after 0123_rebuild_grade_math_curriculum_v2.sql.
--
-- US and IN receive aligned content for now.


-- ==================== US GRADE 6 ====================

-- RATIOS / RATIO_CONCEPTS — Understanding Ratios

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_001',
  'easy',
  'A basket has 2 red apples and 3 green apples. What is the ratio of red apples to green apples?',
  '2:3','3:2','2:5','5:3',
  'A',
  'Red to green compares 2 red apples with 3 green apples, so the ratio is 2:3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_002',
  'easy',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:5. If 9 students wear sneakers, how many wear sandals?',
  '9','15','20','8',
  'B',
  'The scale factor is 3, so 5 × 3 = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_003',
  'easy',
  'Which statement correctly describes the ratio 4:7?',
  'There are 11 of each quantity.','The second quantity is always 4 times the first.','For every 4 of the first quantity, there are 7 of the second.','The two quantities must be equal.',
  'C',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_004',
  'easy',
  'A recipe uses 5 cups of oats for every 9 cups of milk. Which ratio represents milk to oats?',
  '5:9','14:5','9:14','9:5',
  'D',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_005',
  'easy',
  'The ratio of blue tiles to all tiles is 6:10. If there are 6 blue tiles, how many non-blue tiles are there?',
  '4','6','10','2',
  'A',
  'All tiles = blue + non-blue, so 10 - 6 = 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_006',
  'easy',
  'A basket has 2 red apples and 6 green apples. What is the ratio of red apples to green apples?',
  '6:2','2:6','2:8','8:6',
  'B',
  'Red to green compares 2 red apples with 6 green apples, so the ratio is 2:6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_007',
  'easy',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:8. If 12 students wear sneakers, how many wear sandals?',
  '12','40','32','11',
  'C',
  'The scale factor is 4, so 8 × 4 = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_008',
  'easy',
  'Which statement correctly describes the ratio 4:3?',
  'There are 7 of each quantity.','The second quantity is always 4 times the first.','The two quantities must be equal.','For every 4 of the first quantity, there are 3 of the second.',
  'D',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_009',
  'medium',
  'A recipe uses 5 cups of oats for every 5 cups of milk. Which ratio represents milk to oats?',
  '5:5','10:5','5:10','5:5_1',
  'A',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_010',
  'medium',
  'The ratio of blue tiles to all tiles is 6:13. If there are 6 blue tiles, how many non-blue tiles are there?',
  '6','7','13','1',
  'B',
  'All tiles = blue + non-blue, so 13 - 6 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_011',
  'medium',
  'A basket has 2 red apples and 9 green apples. What is the ratio of red apples to green apples?',
  '9:2','2:11','2:9','11:9',
  'C',
  'Red to green compares 2 red apples with 9 green apples, so the ratio is 2:9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_012',
  'medium',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:4. If 15 students wear sneakers, how many wear sandals?',
  '15','24','7','20',
  'D',
  'The scale factor is 5, so 4 × 5 = 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_013',
  'medium',
  'Which statement correctly describes the ratio 4:6?',
  'For every 4 of the first quantity, there are 6 of the second.','There are 10 of each quantity.','The second quantity is always 4 times the first.','The two quantities must be equal.',
  'A',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_014',
  'medium',
  'A recipe uses 5 cups of oats for every 8 cups of milk. Which ratio represents milk to oats?',
  '5:8','8:5','13:5','8:13',
  'B',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_015',
  'medium',
  'The ratio of blue tiles to all tiles is 6:9. If there are 6 blue tiles, how many non-blue tiles are there?',
  '6','9','3','4',
  'C',
  'All tiles = blue + non-blue, so 9 - 6 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_016',
  'medium',
  'A basket has 2 red apples and 5 green apples. What is the ratio of red apples to green apples?',
  '5:2','2:7','7:5','2:5',
  'D',
  'Red to green compares 2 red apples with 5 green apples, so the ratio is 2:5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_017',
  'medium',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:7. If 6 students wear sneakers, how many wear sandals?',
  '14','6','21','10',
  'A',
  'The scale factor is 2, so 7 × 2 = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_018',
  'medium',
  'Which statement correctly describes the ratio 4:9?',
  'There are 13 of each quantity.','For every 4 of the first quantity, there are 9 of the second.','The second quantity is always 4 times the first.','The two quantities must be equal.',
  'B',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_019',
  'medium',
  'A recipe uses 5 cups of oats for every 4 cups of milk. Which ratio represents milk to oats?',
  '5:4','9:5','4:5','4:9',
  'C',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_020',
  'challenge',
  'The ratio of blue tiles to all tiles is 6:12. If there are 6 blue tiles, how many non-blue tiles are there?',
  '12','0','7','6',
  'D',
  'All tiles = blue + non-blue, so 12 - 6 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_021',
  'challenge',
  'A basket has 2 red apples and 8 green apples. What is the ratio of red apples to green apples?',
  '2:8','8:2','2:10','10:8',
  'A',
  'Red to green compares 2 red apples with 8 green apples, so the ratio is 2:8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_022',
  'challenge',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:3. If 9 students wear sneakers, how many wear sandals?',
  '12','9','6','10',
  'B',
  'The scale factor is 3, so 3 × 3 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_023',
  'challenge',
  'Which statement correctly describes the ratio 4:5?',
  'There are 9 of each quantity.','The second quantity is always 4 times the first.','For every 4 of the first quantity, there are 5 of the second.','The two quantities must be equal.',
  'C',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_024',
  'challenge',
  'A recipe uses 5 cups of oats for every 7 cups of milk. Which ratio represents milk to oats?',
  '5:7','12:5','7:12','7:5',
  'D',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_025',
  'challenge',
  'The ratio of blue tiles to all tiles is 6:15. If there are 6 blue tiles, how many non-blue tiles are there?',
  '9','6','15','3',
  'A',
  'All tiles = blue + non-blue, so 15 - 6 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

-- RATIOS / EQUIVALENT_RATIOS — Equivalent Ratios

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_001',
  'easy',
  'Which ratio is equivalent to 2:3?',
  '4:6','4:5','4:3','2:6',
  'A',
  'Multiply both terms by the same factor 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_002',
  'easy',
  'Complete the equivalent ratio: 3:5 = 9:x. What is x?',
  '8','15','9','10',
  'B',
  'The scale factor is 3, so x=5×3=15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_003',
  'easy',
  'A recipe uses ingredients in the ratio 4:7. Which pair keeps exactly the same ratio?',
  '8 and 11','16 and 7','16 and 28','4 and 28',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_004',
  'easy',
  'A map uses 5 cm for 9 km. At the same scale, 25 cm represents how many kilometers?',
  '14','25','46','45',
  'D',
  'The length is multiplied by 5, so the distance is also multiplied by 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_005',
  'easy',
  'Which ratio is equivalent to 6:11?',
  '36:66','12:17','36:11','6:66',
  'A',
  'Multiply both terms by the same factor 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_006',
  'easy',
  'Complete the equivalent ratio: 7:13 = 14:x. What is x?',
  '15','26','14','13',
  'B',
  'The scale factor is 2, so x=13×2=26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_007',
  'easy',
  'A recipe uses ingredients in the ratio 8:15. Which pair keeps exactly the same ratio?',
  '11 and 18','24 and 15','24 and 45','8 and 45',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_008',
  'easy',
  'A map uses 9 cm for 17 km. At the same scale, 36 cm represents how many kilometers?',
  '21','36','26','68',
  'D',
  'The length is multiplied by 4, so the distance is also multiplied by 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_009',
  'medium',
  'Which ratio is equivalent to 10:19?',
  '50:95','15:24','50:19','10:95',
  'A',
  'Multiply both terms by the same factor 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_010',
  'medium',
  'Complete the equivalent ratio: 11:21 = 66:x. What is x?',
  '27','126','66','105',
  'B',
  'The scale factor is 6, so x=21×6=126.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_011',
  'medium',
  'A recipe uses ingredients in the ratio 12:23. Which pair keeps exactly the same ratio?',
  '14 and 25','24 and 23','24 and 46','12 and 46',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_012',
  'medium',
  'A map uses 13 cm for 25 km. At the same scale, 39 cm represents how many kilometers?',
  '28','39','38','75',
  'D',
  'The length is multiplied by 3, so the distance is also multiplied by 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_013',
  'medium',
  'Which ratio is equivalent to 14:27?',
  '56:108','18:31','56:27','14:108',
  'A',
  'Multiply both terms by the same factor 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_014',
  'medium',
  'Complete the equivalent ratio: 15:29 = 75:x. What is x?',
  '34','145','75','116',
  'B',
  'The scale factor is 5, so x=29×5=145.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_015',
  'medium',
  'A recipe uses ingredients in the ratio 16:31. Which pair keeps exactly the same ratio?',
  '22 and 37','96 and 31','96 and 186','16 and 186',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_016',
  'medium',
  'A map uses 17 cm for 33 km. At the same scale, 34 cm represents how many kilometers?',
  '35','34','50','66',
  'D',
  'The length is multiplied by 2, so the distance is also multiplied by 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_017',
  'medium',
  'Which ratio is equivalent to 18:35?',
  '54:105','21:38','54:35','18:105',
  'A',
  'Multiply both terms by the same factor 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_018',
  'medium',
  'Complete the equivalent ratio: 19:37 = 76:x. What is x?',
  '41','148','76','111',
  'B',
  'The scale factor is 4, so x=37×4=148.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_019',
  'medium',
  'A recipe uses ingredients in the ratio 20:39. Which pair keeps exactly the same ratio?',
  '25 and 44','100 and 39','100 and 195','20 and 195',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_020',
  'challenge',
  'A map uses 21 cm for 41 km. At the same scale, 126 cm represents how many kilometers?',
  '47','126','62','246',
  'D',
  'The length is multiplied by 6, so the distance is also multiplied by 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_021',
  'challenge',
  'Which ratio is equivalent to 22:43?',
  '44:86','24:45','44:43','22:86',
  'A',
  'Multiply both terms by the same factor 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_022',
  'challenge',
  'Complete the equivalent ratio: 23:45 = 69:x. What is x?',
  '48','135','69','90',
  'B',
  'The scale factor is 3, so x=45×3=135.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_023',
  'challenge',
  'A recipe uses ingredients in the ratio 24:47. Which pair keeps exactly the same ratio?',
  '28 and 51','96 and 47','96 and 188','24 and 188',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_024',
  'challenge',
  'A map uses 25 cm for 49 km. At the same scale, 125 cm represents how many kilometers?',
  '54','125','74','245',
  'D',
  'The length is multiplied by 5, so the distance is also multiplied by 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_025',
  'challenge',
  'Which ratio is equivalent to 26:51?',
  '156:306','32:57','156:51','26:306',
  'A',
  'Multiply both terms by the same factor 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

-- RATIOS / UNIT_RATES — Unit Rates

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_001',
  'easy',
  '3 notebooks cost $6. What is the cost per notebook?',
  '$2','$3','$6','$2_1',
  'A',
  'Unit rate = total cost ÷ number of notebooks = 6 ÷ 3 = 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_002',
  'easy',
  'A cyclist travels 20 miles in 4 hours at a constant rate. What is the unit rate?',
  '4 miles per hour','5 miles per hour','20 miles per hour','16 miles per hour',
  'B',
  '20 ÷ 4 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_003',
  'easy',
  'A printer produces 35 pages in 5 minutes. How many pages per minute?',
  '35','5','7','30',
  'C',
  'Divide pages by minutes: 35 ÷ 5 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_004',
  'easy',
  'A package of 36 ounces costs $6. How many ounces are received per dollar?',
  '36','30','7','6',
  'D',
  'Unit rate = 36 ÷ 6 = 6 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_005',
  'easy',
  'Store A sells 7 pens for $42. Store B sells one pen for $7. Which store has the lower cost per pen?',
  'Store A','Store B','They cost the same','Not enough information',
  'A',
  'Store A costs $6 per pen, which is less than $7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_006',
  'easy',
  '8 notebooks cost $56. What is the cost per notebook?',
  '$8','$7','$56','$7_1',
  'B',
  'Unit rate = total cost ÷ number of notebooks = 56 ÷ 8 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_007',
  'easy',
  'A cyclist travels 15 miles in 3 hours at a constant rate. What is the unit rate?',
  '3 miles per hour','15 miles per hour','5 miles per hour','12 miles per hour',
  'C',
  '15 ÷ 3 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_008',
  'easy',
  'A printer produces 24 pages in 4 minutes. How many pages per minute?',
  '24','4','20','6',
  'D',
  'Divide pages by minutes: 24 ÷ 4 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_009',
  'medium',
  'A package of 15 ounces costs $5. How many ounces are received per dollar?',
  '3','5','15','10',
  'A',
  'Unit rate = 15 ÷ 5 = 3 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_010',
  'medium',
  'Store A sells 6 pens for $24. Store B sells one pen for $5. Which store has the lower cost per pen?',
  'Store B','Store A','They cost the same','Not enough information',
  'B',
  'Store A costs $4 per pen, which is less than $5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_011',
  'medium',
  '7 notebooks cost $35. What is the cost per notebook?',
  '$6','$35','$5','$7',
  'C',
  'Unit rate = total cost ÷ number of notebooks = 35 ÷ 7 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_012',
  'medium',
  'A cyclist travels 40 miles in 8 hours at a constant rate. What is the unit rate?',
  '8 miles per hour','40 miles per hour','32 miles per hour','5 miles per hour',
  'D',
  '40 ÷ 8 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_013',
  'medium',
  'A printer produces 15 pages in 3 minutes. How many pages per minute?',
  '5','15','3','12',
  'A',
  'Divide pages by minutes: 15 ÷ 3 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_014',
  'medium',
  'A package of 16 ounces costs $4. How many ounces are received per dollar?',
  '16','4','12','5',
  'B',
  'Unit rate = 16 ÷ 4 = 4 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_015',
  'medium',
  'Store A sells 5 pens for $10. Store B sells one pen for $3. Which store has the lower cost per pen?',
  'Store B','They cost the same','Store A','Not enough information',
  'C',
  'Store A costs $2 per pen, which is less than $3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_016',
  'medium',
  '6 notebooks cost $18. What is the cost per notebook?',
  '$4','$18','$6','$3',
  'D',
  'Unit rate = total cost ÷ number of notebooks = 18 ÷ 6 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_017',
  'medium',
  'A cyclist travels 35 miles in 7 hours at a constant rate. What is the unit rate?',
  '5 miles per hour','7 miles per hour','35 miles per hour','28 miles per hour',
  'A',
  '35 ÷ 7 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_018',
  'medium',
  'A printer produces 80 pages in 8 minutes. How many pages per minute?',
  '80','10','8','72',
  'B',
  'Divide pages by minutes: 80 ÷ 8 = 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_019',
  'medium',
  'A package of 15 ounces costs $3. How many ounces are received per dollar?',
  '3','15','5','12',
  'C',
  'Unit rate = 15 ÷ 3 = 5 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_020',
  'challenge',
  'Store A sells 4 pens for $28. Store B sells one pen for $8. Which store has the lower cost per pen?',
  'Store B','They cost the same','Not enough information','Store A',
  'D',
  'Store A costs $7 per pen, which is less than $8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_021',
  'challenge',
  '5 notebooks cost $40. What is the cost per notebook?',
  '$8','$9','$40','$5',
  'A',
  'Unit rate = total cost ÷ number of notebooks = 40 ÷ 5 = 8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_022',
  'challenge',
  'A cyclist travels 30 miles in 6 hours at a constant rate. What is the unit rate?',
  '6 miles per hour','5 miles per hour','30 miles per hour','24 miles per hour',
  'B',
  '30 ÷ 6 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_023',
  'challenge',
  'A printer produces 63 pages in 7 minutes. How many pages per minute?',
  '63','7','9','56',
  'C',
  'Divide pages by minutes: 63 ÷ 7 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_024',
  'challenge',
  'A package of 48 ounces costs $8. How many ounces are received per dollar?',
  '8','48','40','6',
  'D',
  'Unit rate = 48 ÷ 8 = 6 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_UNIT_RATES_025',
  'challenge',
  'Store A sells 3 pens for $15. Store B sells one pen for $6. Which store has the lower cost per pen?',
  'Store A','Store B','They cost the same','Not enough information',
  'A',
  'Store A costs $5 per pen, which is less than $6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

-- RATIOS / RATIO_TABLES — Ratio Tables

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_001',
  'easy',
  'A ratio table follows the relationship 2:3. If the first column entry is 4, what should the second entry be?',
  '6','5','4','7',
  'A',
  'Both entries are scaled by 2: 3 × 2 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_002',
  'easy',
  'Which pair belongs in a ratio table for 3:5?',
  '(6, 8)','(9, 15)','(9, 5)','(3, 15)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_003',
  'easy',
  'A table has pairs (4, 7), (8, 14), and (12, x). What is x?',
  '10','12','21','14',
  'C',
  'The third pair uses scale factor 3, so x = 7 × 3 = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_004',
  'easy',
  'In a ratio table, 20 corresponds to 36. What value corresponds to 5?',
  '36','5','13','9',
  'D',
  'Divide both entries by 4 to return to the base ratio 5:9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_005',
  'easy',
  'A ratio table follows the relationship 6:4. If the first column entry is 36, what should the second entry be?',
  '24','10','36','25',
  'A',
  'Both entries are scaled by 6: 4 × 6 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_006',
  'easy',
  'Which pair belongs in a ratio table for 2:6?',
  '(4, 8)','(4, 12)','(4, 6)','(2, 12)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_007',
  'easy',
  'A table has pairs (3, 8), (6, 16), and (9, x). What is x?',
  '11','9','24','16',
  'C',
  'The third pair uses scale factor 3, so x = 8 × 3 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_008',
  'easy',
  'In a ratio table, 16 corresponds to 12. What value corresponds to 4?',
  '12','4','7','3',
  'D',
  'Divide both entries by 4 to return to the base ratio 4:3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_009',
  'medium',
  'A ratio table follows the relationship 5:5. If the first column entry is 25, what should the second entry be?',
  '25','10','26','27',
  'A',
  'Both entries are scaled by 5: 5 × 5 = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_010',
  'medium',
  'Which pair belongs in a ratio table for 6:7?',
  '(12, 13)','(36, 42)','(36, 7)','(6, 42)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_011',
  'medium',
  'A table has pairs (2, 9), (4, 18), and (6, x). What is x?',
  '12','6','27','18',
  'C',
  'The third pair uses scale factor 3, so x = 9 × 3 = 27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_012',
  'medium',
  'In a ratio table, 12 corresponds to 16. What value corresponds to 3?',
  '16','3','8','4',
  'D',
  'Divide both entries by 4 to return to the base ratio 3:4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_013',
  'medium',
  'A ratio table follows the relationship 4:6. If the first column entry is 16, what should the second entry be?',
  '24','10','16','25',
  'A',
  'Both entries are scaled by 4: 6 × 4 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_014',
  'medium',
  'Which pair belongs in a ratio table for 5:8?',
  '(10, 13)','(25, 40)','(25, 8)','(5, 40)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_015',
  'medium',
  'A table has pairs (6, 3), (12, 6), and (18, x). What is x?',
  '6','18','9','10',
  'C',
  'The third pair uses scale factor 3, so x = 3 × 3 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_016',
  'medium',
  'In a ratio table, 8 corresponds to 20. What value corresponds to 2?',
  '20','2','9','5',
  'D',
  'Divide both entries by 4 to return to the base ratio 2:5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_017',
  'medium',
  'A ratio table follows the relationship 3:7. If the first column entry is 9, what should the second entry be?',
  '21','10','9','22',
  'A',
  'Both entries are scaled by 3: 7 × 3 = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_018',
  'medium',
  'Which pair belongs in a ratio table for 4:9?',
  '(8, 13)','(16, 36)','(16, 9)','(4, 36)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_019',
  'medium',
  'A table has pairs (5, 4), (10, 8), and (15, x). What is x?',
  '7','15','12','8',
  'C',
  'The third pair uses scale factor 3, so x = 4 × 3 = 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_020',
  'challenge',
  'In a ratio table, 24 corresponds to 24. What value corresponds to 6?',
  '24','10','7','6',
  'D',
  'Divide both entries by 4 to return to the base ratio 6:6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_021',
  'challenge',
  'A ratio table follows the relationship 2:8. If the first column entry is 4, what should the second entry be?',
  '16','10','4','17',
  'A',
  'Both entries are scaled by 2: 8 × 2 = 16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_022',
  'challenge',
  'Which pair belongs in a ratio table for 3:3?',
  '(6, 6)','(9, 9)','(9, 3)','(3, 9)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_023',
  'challenge',
  'A table has pairs (4, 5), (8, 10), and (12, x). What is x?',
  '8','12','15','10',
  'C',
  'The third pair uses scale factor 3, so x = 5 × 3 = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_024',
  'challenge',
  'In a ratio table, 20 corresponds to 28. What value corresponds to 5?',
  '28','5','11','7',
  'D',
  'Divide both entries by 4 to return to the base ratio 5:7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_RATIO_TABLES_025',
  'challenge',
  'A ratio table follows the relationship 6:9. If the first column entry is 36, what should the second entry be?',
  '54','15','36','55',
  'A',
  'Both entries are scaled by 6: 9 × 6 = 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

-- RATIOS / PERCENT — Percent

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_001',
  'easy',
  'What is 10% of 40?',
  '4','36','9','10',
  'A',
  '10% = 0.1. Multiply 40 by 0.1 to get 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_002',
  'easy',
  '10 is what percent of 50?',
  '80%','20%','30%','50%',
  'B',
  '10 ÷ 50 = 0.2 = 20%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_003',
  'easy',
  'A shirt priced at $60 is discounted by 25%. What is the amount of the discount?',
  '$45','$25','$15','$15_1',
  'C',
  'Discount = 25% of $60 = $15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_004',
  'easy',
  'In a survey, 30% of 70 students chose option A. How many students chose option A?',
  '49','30','23','21',
  'D',
  '30% of 70 equals 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_005',
  'easy',
  'Which decimal is equivalent to 40%?',
  '0.4','4','2.5','0.6',
  'A',
  'Divide a percent by 100: 40% = 0.4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_006',
  'easy',
  'What is 50% of 90?',
  '50','45','46','47',
  'B',
  '50% = 0.5. Multiply 90 by 0.5 to get 45.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_007',
  'easy',
  '60 is what percent of 100?',
  '40%','70%','60%','100%',
  'C',
  '60 ÷ 100 = 0.6 = 60%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_008',
  'easy',
  'A shirt priced at $110 is discounted by 75%. What is the amount of the discount?',
  '$27.5','$75','$92.5','$82.5',
  'D',
  'Discount = 75% of $110 = $82.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_009',
  'medium',
  'In a survey, 10% of 120 students chose option A. How many students chose option A?',
  '12','108','10','14',
  'A',
  '10% of 120 equals 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_010',
  'medium',
  'Which decimal is equivalent to 20%?',
  '2','0.2','5','0.8',
  'B',
  'Divide a percent by 100: 20% = 0.2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_011',
  'medium',
  'What is 25% of 50?',
  '37.5','17.5','12.5','25',
  'C',
  '25% = 0.25. Multiply 50 by 0.25 to get 12.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_012',
  'medium',
  '18 is what percent of 60?',
  '70%','40%','60%','30%',
  'D',
  '18 ÷ 60 = 0.3 = 30%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_013',
  'medium',
  'A shirt priced at $70 is discounted by 40%. What is the amount of the discount?',
  '$28','$42','$40','$38',
  'A',
  'Discount = 40% of $70 = $28.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_014',
  'medium',
  'In a survey, 50% of 80 students chose option A. How many students chose option A?',
  '50','40','42','41',
  'B',
  '50% of 80 equals 40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_015',
  'medium',
  'Which decimal is equivalent to 60%?',
  '6','1.6667','0.6','0.4',
  'C',
  'Divide a percent by 100: 60% = 0.6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_016',
  'medium',
  'What is 75% of 100?',
  '25','80','76','75',
  'D',
  '75% = 0.75. Multiply 100 by 0.75 to get 75.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_017',
  'medium',
  '11 is what percent of 110?',
  '10%','90%','20%','110%',
  'A',
  '11 ÷ 110 = 0.1 = 10%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_018',
  'medium',
  'A shirt priced at $120 is discounted by 20%. What is the amount of the discount?',
  '$96','$24','$20','$34',
  'B',
  'Discount = 20% of $120 = $24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_019',
  'medium',
  'In a survey, 25% of 40 students chose option A. How many students chose option A?',
  '30','25','10','12',
  'C',
  '25% of 40 equals 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_020',
  'challenge',
  'Which decimal is equivalent to 30%?',
  '3','3.3333','0.7','0.3',
  'D',
  'Divide a percent by 100: 30% = 0.3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_021',
  'challenge',
  'What is 40% of 60?',
  '24','36','29','40',
  'A',
  '40% = 0.4. Multiply 60 by 0.4 to get 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_022',
  'challenge',
  '35 is what percent of 70?',
  '60%','50%','70%','50%_1',
  'B',
  '35 ÷ 70 = 0.5 = 50%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_023',
  'challenge',
  'A shirt priced at $80 is discounted by 60%. What is the amount of the discount?',
  '$32','$60','$48','$58',
  'C',
  'Discount = 60% of $80 = $48.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_024',
  'challenge',
  'In a survey, 75% of 90 students chose option A. How many students chose option A?',
  '22.5','75','69.5','67.5',
  'D',
  '75% of 90 equals 67.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_RATIOS_PERCENT_025',
  'challenge',
  'Which decimal is equivalent to 10%?',
  '0.1','1','10','0.9',
  'A',
  'Divide a percent by 100: 10% = 0.1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

-- NUMBER_SYSTEM / FRACTIONS — Fraction Operations

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_001',
  'easy',
  'What is 1/3 + 1/5 in simplest form?',
  '8/15','2/15','1/4','3/5',
  'A',
  'Use a common denominator and simplify: 1/3 + 1/5 = 8/15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_002',
  'easy',
  'What is 3/4 - 4/7 in simplest form?',
  '37/28','5/28','1/11','3/14',
  'B',
  'Use a common denominator and subtract. The simplified result is 5/28.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_003',
  'easy',
  'What is 1/5 × 7/9 in simplest form?',
  '44/45','1/2','7/45','8/45',
  'C',
  'Multiply numerators and denominators, then simplify to 7/45.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_004',
  'easy',
  'What is 1/3 ÷ 10/11 in simplest form?',
  '10/33','30/11','41/33','11/30',
  'D',
  'Multiply by the reciprocal: 1/3 × 11/10 = 11/30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_005',
  'easy',
  'Maya walked 3/7 mile in the morning and 1/13 mile in the evening. How far did she walk in all?',
  '46/91 mile','32/91 mile','3/91 mile','3/7 mile',
  'A',
  'Add the distances: 3/7 + 1/13 = 46/91 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_006',
  'easy',
  'What is 1/2 + 2/15 in simplest form?',
  '11/30','19/30','6/23','77/120',
  'B',
  'Use a common denominator and simplify: 1/2 + 2/15 = 19/30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_007',
  'easy',
  'What is 5/9 - 3/17 in simplest form?',
  '112/153','1/13','58/153','59/153',
  'C',
  'Use a common denominator and subtract. The simplified result is 58/153.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_008',
  'easy',
  'What is 3/5 × 4/19 in simplest form?',
  '77/95','24/29','5/38','12/95',
  'D',
  'Multiply numerators and denominators, then simplify to 12/95.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_009',
  'medium',
  'What is 7/11 ÷ 5/21 in simplest form?',
  '147/55','5/33','55/147','202/231',
  'A',
  'Multiply by the reciprocal: 7/11 × 21/5 = 147/55.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_010',
  'medium',
  'Maya walked 2/3 mile in the morning and 6/23 mile in the evening. How far did she walk in all?',
  '28/69 mile','64/69 mile','4/23 mile','2/3 mile',
  'B',
  'Add the distances: 2/3 + 6/23 = 64/69 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_011',
  'medium',
  'What is 9/13 + 7/25 in simplest form?',
  '134/325','8/19','316/325','317/325',
  'C',
  'Use a common denominator and simplify: 9/13 + 7/25 = 316/325.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_012',
  'medium',
  'What is 5/7 - 8/27 in simplest form?',
  '191/189','3/34','53/126','79/189',
  'D',
  'Use a common denominator and subtract. The simplified result is 79/189.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_013',
  'medium',
  'What is 11/15 × 9/29 in simplest form?',
  '33/145','454/435','9/4','20/87',
  'A',
  'Multiply numerators and denominators, then simplify to 33/145.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_014',
  'medium',
  'What is 3/4 ÷ 10/31 in simplest form?',
  '15/62','93/40','40/93','133/124',
  'B',
  'Multiply by the reciprocal: 3/4 × 31/10 = 93/40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_015',
  'medium',
  'Maya walked 13/17 mile in the morning and 1/3 mile in the evening. How far did she walk in all?',
  '22/51 mile','13/51 mile','56/51 mile','13/17 mile',
  'C',
  'Add the distances: 13/17 + 1/3 = 56/51 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_016',
  'medium',
  'What is 7/9 + 12/35 in simplest form?',
  '137/315','26/53','101/90','353/315',
  'D',
  'Use a common denominator and simplify: 7/9 + 12/35 = 353/315.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_017',
  'medium',
  'What is 15/19 - 13/37 in simplest form?',
  '308/703','802/703','1/28','309/703',
  'A',
  'Use a common denominator and subtract. The simplified result is 308/703.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_018',
  'medium',
  'What is 4/5 × 14/39 in simplest form?',
  '226/195','56/195','224/59','15/52',
  'B',
  'Multiply numerators and denominators, then simplify to 56/195.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_019',
  'medium',
  'What is 17/21 ÷ 15/41 in simplest form?',
  '85/287','315/697','697/315','1012/861',
  'C',
  'Multiply by the reciprocal: 17/21 × 41/15 = 697/315.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_020',
  'challenge',
  'Maya walked 9/11 mile in the morning and 16/43 mile in the evening. How far did she walk in all?',
  '211/473 mile','144/473 mile','9/11 mile','563/473 mile',
  'D',
  'Add the distances: 9/11 + 16/43 = 563/473 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_021',
  'challenge',
  'What is 19/23 + 17/45 in simplest form?',
  '1246/1035','464/1035','9/17','1247/1035',
  'A',
  'Use a common denominator and simplify: 19/23 + 17/45 = 1246/1035.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_022',
  'challenge',
  'What is 5/6 - 18/47 in simplest form?',
  '343/282','127/282','13/53','509/1128',
  'B',
  'Use a common denominator and subtract. The simplified result is 127/282.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_023',
  'challenge',
  'What is 21/25 × 19/49 in simplest form?',
  '1504/1225','399/74','57/175','16/49',
  'C',
  'Multiply numerators and denominators, then simplify to 57/175.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_024',
  'challenge',
  'What is 11/13 ÷ 20/51 in simplest form?',
  '220/663','260/561','821/663','561/260',
  'D',
  'Multiply by the reciprocal: 11/13 × 51/20 = 561/260.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_025',
  'challenge',
  'Maya walked 23/27 mile in the morning and 21/53 mile in the evening. How far did she walk in all?',
  '1786/1431 mile','652/1431 mile','161/477 mile','23/27 mile',
  'A',
  'Add the distances: 23/27 + 21/53 = 1786/1431 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

-- NUMBER_SYSTEM / DECIMALS — Decimal Operations

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_001',
  'easy',
  'What is 1.15 + 0.55?',
  '1.7','0.6','1.8','1.6',
  'A',
  'Align decimal points and add to get 1.7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_002',
  'easy',
  'What is 1.32 - 0.66?',
  '1.98','0.66','0.76','0.56',
  'B',
  'Align decimal points and subtract to get 0.66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_003',
  'easy',
  'What is 1.49 × 4?',
  '5.49','6.96','5.96','1.96',
  'C',
  'Multiply 1.49 by 4 to get 5.96.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_004',
  'easy',
  '8.3 ÷ 5 = ?',
  '5','8.3','2.66','1.66',
  'D',
  'Division reverses multiplication: 8.3 ÷ 5 = 1.66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_005',
  'easy',
  'Which number is greater: 1.83 or 0.99?',
  '1.83','0.99','They are equal','Cannot be determined',
  'A',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_006',
  'easy',
  'What is 2 + 1.1?',
  '0.9','3.1','3.2','3',
  'B',
  'Align decimal points and add to get 3.1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_007',
  'easy',
  'What is 2.17 - 1.21?',
  '3.38','1.06','0.96','0.86',
  'C',
  'Align decimal points and subtract to get 0.96.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_008',
  'easy',
  'What is 2.34 × 4?',
  '6.34','10.36','5.36','9.36',
  'D',
  'Multiply 2.34 by 4 to get 9.36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_009',
  'medium',
  '5.02 ÷ 2 = ?',
  '2.51','2','5.02','3.51',
  'A',
  'Division reverses multiplication: 5.02 ÷ 2 = 2.51.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_010',
  'medium',
  'Which number is greater: 2.68 or 1.54?',
  '1.54','2.68','They are equal','Cannot be determined',
  'B',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_011',
  'medium',
  'What is 2.85 + 1.65?',
  '1.2','4.6','4.5','4.4',
  'C',
  'Align decimal points and add to get 4.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_012',
  'medium',
  'What is 3.02 - 1.76?',
  '4.78','1.36','1.16','1.26',
  'D',
  'Align decimal points and subtract to get 1.26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_013',
  'medium',
  'What is 3.19 × 4?',
  '12.76','7.19','13.76','8.76',
  'A',
  'Multiply 3.19 by 4 to get 12.76.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_014',
  'medium',
  '10.08 ÷ 3 = ?',
  '3','3.36','10.08','4.36',
  'B',
  'Division reverses multiplication: 10.08 ÷ 3 = 3.36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_015',
  'medium',
  'Which number is greater: 3.53 or 2.09?',
  '2.09','They are equal','3.53','Cannot be determined',
  'C',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_016',
  'medium',
  'What is 3.7 + 2.2?',
  '1.5','6','5.8','5.9',
  'D',
  'Align decimal points and add to get 5.9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_017',
  'medium',
  'What is 3.87 - 2.31?',
  '1.56','6.18','1.66','1.46',
  'A',
  'Align decimal points and subtract to get 1.56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_018',
  'medium',
  'What is 4.04 × 4?',
  '8.04','16.16','17.16','12.16',
  'B',
  'Multiply 4.04 by 4 to get 16.16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_019',
  'medium',
  '16.84 ÷ 4 = ?',
  '4','16.84','4.21','5.21',
  'C',
  'Division reverses multiplication: 16.84 ÷ 4 = 4.21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_020',
  'challenge',
  'Which number is greater: 4.38 or 2.64?',
  '2.64','They are equal','Cannot be determined','4.38',
  'D',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_021',
  'challenge',
  'What is 4.55 + 2.75?',
  '7.3','1.8','7.4','7.2',
  'A',
  'Align decimal points and add to get 7.3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_022',
  'challenge',
  'What is 4.72 - 2.86?',
  '7.58','1.86','1.96','1.76',
  'B',
  'Align decimal points and subtract to get 1.86.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_023',
  'challenge',
  'What is 4.89 × 4?',
  '8.89','20.56','19.56','15.56',
  'C',
  'Multiply 4.89 by 4 to get 19.56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_024',
  'challenge',
  '25.3 ÷ 5 = ?',
  '5','25.3','6.06','5.06',
  'D',
  'Division reverses multiplication: 25.3 ÷ 5 = 5.06.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_025',
  'challenge',
  'Which number is greater: 5.23 or 3.19?',
  '5.23','3.19','They are equal','Cannot be determined',
  'A',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

-- NUMBER_SYSTEM / INTEGERS — Integers

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_001',
  'easy',
  'What is 3 + (2)?',
  '5','1','-5','6',
  'A',
  'Combine signed numbers to get 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_002',
  'easy',
  'What is -4 - (-4)?',
  '-8','0','1','2',
  'B',
  'Subtracting -4 gives 0.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_003',
  'easy',
  'What is 5 × (-6)?',
  '30','-1','-30','-29',
  'C',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_004',
  'easy',
  'Which integer is greater: -6 or 8?',
  '-6','0','They are equal','8',
  'D',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_005',
  'easy',
  'The temperature is -1°C and drops 6°C. What is the new temperature?',
  '-7°C','5°C','7°C','-1°C',
  'A',
  'A drop means add -6: -1 + (-6) = -7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_006',
  'easy',
  'What is -8 + (-4)?',
  '-4','-12','12','-11',
  'B',
  'Combine signed numbers to get -12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_007',
  'easy',
  'What is 9 - (6)?',
  '15','-3','3','4',
  'C',
  'Subtracting 6 gives 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_008',
  'easy',
  'What is -10 × (-8)?',
  '-80','-18','81','80',
  'D',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_009',
  'medium',
  'Which integer is greater: 11 or -2?',
  '11','-2','0','They are equal',
  'A',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_010',
  'medium',
  'The temperature is -4°C and drops 6°C. What is the new temperature?',
  '2°C','-10°C','10°C','-4°C',
  'B',
  'A drop means add -6: -4 + (-6) = -10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_011',
  'medium',
  'What is 4 + (-6)?',
  '10','2','-2','-1',
  'C',
  'Combine signed numbers to get -2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_012',
  'medium',
  'What is -5 - (-8)?',
  '-13','-3','4','3',
  'D',
  'Subtracting -8 gives 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_013',
  'medium',
  'What is 6 × (2)?',
  '12','-12','8','13',
  'A',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_014',
  'medium',
  'Which integer is greater: -7 or -4?',
  '-7','-4','0','They are equal',
  'B',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_015',
  'medium',
  'The temperature is 1°C and drops 6°C. What is the new temperature?',
  '7°C','5°C','-5°C','1°C',
  'C',
  'A drop means add -6: 1 + (-6) = -5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_016',
  'medium',
  'What is -9 + (8)?',
  '-17','1','17','-1',
  'D',
  'Combine signed numbers to get -1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_017',
  'medium',
  'What is 10 - (-2)?',
  '12','8','-12','13',
  'A',
  'Subtracting -2 gives 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_018',
  'medium',
  'What is -11 × (-4)?',
  '-44','44','-15','45',
  'B',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_019',
  'medium',
  'Which integer is greater: 3 or 6?',
  '3','0','6','They are equal',
  'C',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_020',
  'challenge',
  'The temperature is -2°C and drops 6°C. What is the new temperature?',
  '4°C','8°C','-2°C','-8°C',
  'D',
  'A drop means add -6: -2 + (-6) = -8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_021',
  'challenge',
  'What is 5 + (-2)?',
  '3','7','-3','4',
  'A',
  'Combine signed numbers to get 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_022',
  'challenge',
  'What is -6 - (4)?',
  '-2','-10','10','11',
  'B',
  'Subtracting 4 gives -10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_023',
  'challenge',
  'What is 7 × (-6)?',
  '42','1','-42','-41',
  'C',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_024',
  'challenge',
  'Which integer is greater: -8 or -8?',
  '0','They are equal','-7','-8',
  'D',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_025',
  'challenge',
  'The temperature is -5°C and drops 6°C. What is the new temperature?',
  '-11°C','1°C','11°C','-5°C',
  'A',
  'A drop means add -6: -5 + (-6) = -11.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

-- NUMBER_SYSTEM / GCF_LCM — GCF & LCM

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_001',
  'easy',
  'What is the greatest common factor of 6 and 9?',
  '3','4','2','18',
  'A',
  'The greatest number dividing both 6 and 9 is 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_002',
  'easy',
  'What is the least common multiple of 8 and 12?',
  '20','24','4','12',
  'B',
  'The least positive multiple shared by both numbers is 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_003',
  'easy',
  'Two lights flash every 10 seconds and every 15 seconds. If they flash together now, after how many seconds will they flash together again?',
  '5','25','30','15',
  'C',
  'This is an LCM problem. LCM(10,15) = 30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_004',
  'easy',
  'You have 12 red beads and 18 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '36','12','30','6',
  'D',
  'The number of groups must divide both counts, so use GCF(12,18) = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_005',
  'easy',
  'What is the greatest common factor of 14 and 21?',
  '7','8','6','42',
  'A',
  'The greatest number dividing both 14 and 21 is 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_006',
  'easy',
  'What is the least common multiple of 16 and 24?',
  '40','48','8','24',
  'B',
  'The least positive multiple shared by both numbers is 48.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_007',
  'easy',
  'Two lights flash every 18 seconds and every 27 seconds. If they flash together now, after how many seconds will they flash together again?',
  '9','45','54','27',
  'C',
  'This is an LCM problem. LCM(18,27) = 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_008',
  'easy',
  'You have 20 red beads and 9 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '180','9','29','1',
  'D',
  'The number of groups must divide both counts, so use GCF(20,9) = 1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_009',
  'medium',
  'What is the greatest common factor of 6 and 12?',
  '6','7','5','12',
  'A',
  'The greatest number dividing both 6 and 12 is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_010',
  'medium',
  'What is the least common multiple of 8 and 15?',
  '23','120','1','15',
  'B',
  'The least positive multiple shared by both numbers is 120.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_011',
  'medium',
  'Two lights flash every 10 seconds and every 18 seconds. If they flash together now, after how many seconds will they flash together again?',
  '2','28','90','18',
  'C',
  'This is an LCM problem. LCM(10,18) = 90.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_012',
  'medium',
  'You have 12 red beads and 21 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '84','12','33','3',
  'D',
  'The number of groups must divide both counts, so use GCF(12,21) = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_013',
  'medium',
  'What is the greatest common factor of 14 and 24?',
  '2','3','1','168',
  'A',
  'The greatest number dividing both 14 and 24 is 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_014',
  'medium',
  'What is the least common multiple of 16 and 27?',
  '43','432','1','27',
  'B',
  'The least positive multiple shared by both numbers is 432.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_015',
  'medium',
  'Two lights flash every 18 seconds and every 9 seconds. If they flash together now, after how many seconds will they flash together again?',
  '9','27','18','19',
  'C',
  'This is an LCM problem. LCM(18,9) = 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_016',
  'medium',
  'You have 20 red beads and 12 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '60','12','32','4',
  'D',
  'The number of groups must divide both counts, so use GCF(20,12) = 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_017',
  'medium',
  'What is the greatest common factor of 6 and 15?',
  '3','4','2','30',
  'A',
  'The greatest number dividing both 6 and 15 is 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_018',
  'medium',
  'What is the least common multiple of 8 and 18?',
  '26','72','2','18',
  'B',
  'The least positive multiple shared by both numbers is 72.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_019',
  'medium',
  'Two lights flash every 10 seconds and every 21 seconds. If they flash together now, after how many seconds will they flash together again?',
  '1','31','210','21',
  'C',
  'This is an LCM problem. LCM(10,21) = 210.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_020',
  'challenge',
  'You have 12 red beads and 24 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '24','36','13','12',
  'D',
  'The number of groups must divide both counts, so use GCF(12,24) = 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_021',
  'challenge',
  'What is the greatest common factor of 14 and 27?',
  '1','2','378','3',
  'A',
  'The greatest number dividing both 14 and 27 is 1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_022',
  'challenge',
  'What is the least common multiple of 16 and 9?',
  '25','144','1','16',
  'B',
  'The least positive multiple shared by both numbers is 144.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_023',
  'challenge',
  'Two lights flash every 18 seconds and every 12 seconds. If they flash together now, after how many seconds will they flash together again?',
  '6','30','36','18',
  'C',
  'This is an LCM problem. LCM(18,12) = 36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_024',
  'challenge',
  'You have 20 red beads and 15 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '60','15','35','5',
  'D',
  'The number of groups must divide both counts, so use GCF(20,15) = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_025',
  'challenge',
  'What is the greatest common factor of 6 and 18?',
  '6','7','5','18',
  'A',
  'The greatest number dividing both 6 and 18 is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

-- NUMBER_SYSTEM / COORDINATE_PLANE — Coordinate Plane

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_001',
  'easy',
  'Where is the point (-5, -4) located?',
  'Quadrant III','Quadrant I','Quadrant II','Quadrant IV',
  'A',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_002',
  'easy',
  'What is the x-coordinate of the point (-4, -2)?',
  '-2','-4','4','2',
  'B',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_003',
  'easy',
  'What is the y-coordinate of the point (-3, 0)?',
  '-3','3','0','1',
  'C',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_004',
  'easy',
  'Starting at (-2, 2), move 5 units to the right. What is the new point?',
  '(-7, 2)','(-2, 7)','(-2, -3)','(3, 2)',
  'D',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_005',
  'easy',
  'Starting at (-1, 4), move 2 units up. What is the new point?',
  '(-1, 6)','(-1, 2)','(1, 4)','(-3, 4)',
  'A',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_006',
  'easy',
  'Where is the point (0, -3) located?',
  'Quadrant I','an axis','Quadrant II','Quadrant III',
  'B',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_007',
  'easy',
  'What is the x-coordinate of the point (1, -1)?',
  '-1','2','1','3',
  'C',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_008',
  'easy',
  'What is the y-coordinate of the point (2, 1)?',
  '2','-2','-1','1',
  'D',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_009',
  'medium',
  'Starting at (3, 3), move 2 units to the right. What is the new point?',
  '(5, 3)','(1, 3)','(3, 5)','(3, 1)',
  'A',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_010',
  'medium',
  'Starting at (4, -4), move 3 units up. What is the new point?',
  '(4, -7)','(4, -1)','(7, -4)','(1, -4)',
  'B',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_011',
  'medium',
  'Where is the point (5, -2) located?',
  'Quadrant I','Quadrant II','Quadrant IV','Quadrant III',
  'C',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_012',
  'medium',
  'What is the x-coordinate of the point (-5, 0)?',
  '0','5','-4','-5',
  'D',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_013',
  'medium',
  'What is the y-coordinate of the point (-4, 2)?',
  '2','-4','4','-2',
  'A',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_014',
  'medium',
  'Starting at (-3, 4), move 3 units to the right. What is the new point?',
  '(-6, 4)','(0, 4)','(-3, 7)','(-3, 1)',
  'B',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_015',
  'medium',
  'Starting at (-2, -3), move 4 units up. What is the new point?',
  '(-2, -7)','(2, -3)','(-2, 1)','(-6, -3)',
  'C',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_016',
  'medium',
  'Where is the point (-1, -1) located?',
  'Quadrant I','Quadrant II','Quadrant IV','Quadrant III',
  'D',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_017',
  'medium',
  'What is the x-coordinate of the point (0, 1)?',
  '0','1','-1','2',
  'A',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_018',
  'medium',
  'What is the y-coordinate of the point (1, 3)?',
  '1','3','-1','-3',
  'B',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_019',
  'medium',
  'Starting at (2, -4), move 4 units to the right. What is the new point?',
  '(-2, -4)','(2, 0)','(6, -4)','(2, -8)',
  'C',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_020',
  'challenge',
  'Starting at (3, -2), move 5 units up. What is the new point?',
  '(3, -7)','(8, -2)','(-2, -2)','(3, 3)',
  'D',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_021',
  'challenge',
  'Where is the point (4, 0) located?',
  'an axis','Quadrant I','Quadrant II','Quadrant III',
  'A',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_022',
  'challenge',
  'What is the x-coordinate of the point (5, 2)?',
  '2','5','-5','-2',
  'B',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_023',
  'challenge',
  'What is the y-coordinate of the point (-5, 4)?',
  '-5','5','4','-4',
  'C',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_024',
  'challenge',
  'Starting at (-4, -3), move 5 units to the right. What is the new point?',
  '(-9, -3)','(-4, 2)','(-4, -8)','(1, -3)',
  'D',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_025',
  'challenge',
  'Starting at (-3, -1), move 2 units up. What is the new point?',
  '(-3, 1)','(-3, -3)','(-1, -1)','(-5, -1)',
  'A',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

-- EXPRESSIONS / EXPRESSIONS — Writing & Evaluating Expressions

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_001',
  'easy',
  'Evaluate 2x + 1 when x = 2.',
  '5','3','4','6',
  'A',
  'Substitute x=2: 2(2)+1=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_002',
  'easy',
  'Which expression means ''3 times a number n, then add 4''?',
  '3(n+4)','3n + 4','n + 7','4n + 3',
  'B',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_003',
  'easy',
  'How many terms are in the expression 4x + 7y - 4?',
  '1','2','3','4',
  'C',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_004',
  'easy',
  'In the expression 5x + 3, what is the coefficient of x?',
  '3','8','6','5',
  'D',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_005',
  'easy',
  'Evaluate 6(x + 6) when x = 6.',
  '72','42','18','0',
  'A',
  'First evaluate the parentheses, then multiply: 6(12)=72.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_006',
  'easy',
  'Evaluate 2x + 2 when x = 7.',
  '11','16','12','17',
  'B',
  'Substitute x=7: 2(7)+2=16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_007',
  'easy',
  'Which expression means ''3 times a number n, then add 5''?',
  '3(n+5)','n + 8','3n + 5','5n + 3',
  'C',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_008',
  'easy',
  'How many terms are in the expression 4x + 1y - 3?',
  '1','2','4','3',
  'D',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_009',
  'medium',
  'In the expression 5x + 4, what is the coefficient of x?',
  '5','4','9','6',
  'A',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_010',
  'medium',
  'Evaluate 6(x + 7) when x = 5.',
  '37','72','18','-12',
  'B',
  'First evaluate the parentheses, then multiply: 6(12)=72.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_011',
  'medium',
  'Evaluate 2x + 3 when x = 6.',
  '11','9','15','20',
  'C',
  'Substitute x=6: 2(6)+3=15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_012',
  'medium',
  'Which expression means ''3 times a number n, then add 6''?',
  '3(n+6)','n + 9','6n + 3','3n + 6',
  'D',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_013',
  'medium',
  'How many terms are in the expression 4x + 2y - 2?',
  '3','1','2','4',
  'A',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_014',
  'medium',
  'In the expression 5x + 5, what is the coefficient of x?',
  '3','5','10','6',
  'B',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_015',
  'medium',
  'Evaluate 6(x + 1) when x = 4.',
  '25','11','30','18',
  'C',
  'First evaluate the parentheses, then multiply: 6(5)=30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_016',
  'medium',
  'Evaluate 2x + 4 when x = 5.',
  '11','6','22','14',
  'D',
  'Substitute x=5: 2(5)+4=14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_017',
  'medium',
  'Which expression means ''3 times a number n, then add 7''?',
  '3n + 7','3(n+7)','n + 10','7n + 3',
  'A',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_018',
  'medium',
  'How many terms are in the expression 4x + 3y - 7?',
  '1','3','2','4',
  'B',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_019',
  'medium',
  'In the expression 5x + 6, what is the coefficient of x?',
  '6','2','5','11',
  'C',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_020',
  'challenge',
  'Evaluate 6(x + 2) when x = 3.',
  '20','11','6','30',
  'D',
  'First evaluate the parentheses, then multiply: 6(5)=30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_021',
  'challenge',
  'Evaluate 2x + 5 when x = 4.',
  '13','11','3','22',
  'A',
  'Substitute x=4: 2(4)+5=13.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_022',
  'challenge',
  'Which expression means ''3 times a number n, then add 1''?',
  '3(n+1)','3n + 1','n + 4','1n + 3',
  'B',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_023',
  'challenge',
  'How many terms are in the expression 4x + 4y - 6?',
  '1','2','3','4',
  'C',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_024',
  'challenge',
  'In the expression 5x + 7, what is the coefficient of x?',
  '7','12','6','5',
  'D',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_025',
  'challenge',
  'Evaluate 6(x + 3) when x = 2.',
  '30','15','11','-6',
  'A',
  'First evaluate the parentheses, then multiply: 6(5)=30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

-- EXPRESSIONS / DISTRIBUTIVE — Distributive Property

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_001',
  'easy',
  'Use the distributive property to simplify 2(1x + 2).',
  '2x + 4','3x + 4','2x + 2','1x + 4',
  'A',
  'Multiply 2 by each term: 2·1x + 2·2 = 2x + 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_002',
  'easy',
  'Which expression is equivalent to 3x + 15?',
  '3(x + 15)','3(x + 5)','5(x + 3)','x(8)',
  'B',
  'Factor out the common factor 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_003',
  'easy',
  'Evaluate 4(5 + 8) using the distributive property.',
  '28','17','52','37',
  'C',
  '4·5 + 4·8 = 52.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_004',
  'easy',
  'A student says 5(1x + 4) = 5x + 4. What did the student forget?',
  'To add 5 and 1','To divide by 5','Nothing; the work is correct','To multiply 4 by 5',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_005',
  'easy',
  'Use the distributive property to simplify 6(3x + 7).',
  '18x + 42','9x + 13','18x + 7','3x + 42',
  'A',
  'Multiply 6 by each term: 6·3x + 6·7 = 18x + 42.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_006',
  'easy',
  'Which expression is equivalent to 2x + 6?',
  '2(x + 6)','2(x + 3)','3(x + 2)','x(5)',
  'B',
  'Factor out the common factor 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_007',
  'easy',
  'Evaluate 3(1 + 6) using the distributive property.',
  '9','10','21','19',
  'C',
  '3·1 + 3·6 = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_008',
  'easy',
  'A student says 4(3x + 2) = 12x + 2. What did the student forget?',
  'To add 4 and 3','To divide by 4','Nothing; the work is correct','To multiply 2 by 4',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_009',
  'medium',
  'Use the distributive property to simplify 5(5x + 5).',
  '25x + 25','10x + 10','25x + 5','5x + 25',
  'A',
  'Multiply 5 by each term: 5·5x + 5·5 = 25x + 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_010',
  'medium',
  'Which expression is equivalent to 6x + 48?',
  '6(x + 48)','6(x + 8)','8(x + 6)','x(14)',
  'B',
  'Factor out the common factor 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_011',
  'medium',
  'Evaluate 2(3 + 4) using the distributive property.',
  '10','9','14','11',
  'C',
  '2·3 + 2·4 = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_012',
  'medium',
  'A student says 3(5x + 7) = 15x + 7. What did the student forget?',
  'To add 3 and 5','To divide by 3','Nothing; the work is correct','To multiply 7 by 3',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_013',
  'medium',
  'Use the distributive property to simplify 4(1x + 3).',
  '4x + 12','5x + 7','4x + 3','1x + 12',
  'A',
  'Multiply 4 by each term: 4·1x + 4·3 = 4x + 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_014',
  'medium',
  'Which expression is equivalent to 5x + 30?',
  '5(x + 30)','5(x + 6)','6(x + 5)','x(11)',
  'B',
  'Factor out the common factor 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_015',
  'medium',
  'Evaluate 6(5 + 2) using the distributive property.',
  '32','13','42','17',
  'C',
  '6·5 + 6·2 = 42.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_016',
  'medium',
  'A student says 2(1x + 5) = 2x + 5. What did the student forget?',
  'To add 2 and 1','To divide by 2','Nothing; the work is correct','To multiply 5 by 2',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_017',
  'medium',
  'Use the distributive property to simplify 3(3x + 8).',
  '9x + 24','6x + 11','9x + 8','3x + 24',
  'A',
  'Multiply 3 by each term: 3·3x + 3·8 = 9x + 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_018',
  'medium',
  'Which expression is equivalent to 4x + 16?',
  '4(x + 16)','4(x + 4)','x(8)','4(x + 4)_1',
  'B',
  'Factor out the common factor 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_019',
  'medium',
  'Evaluate 5(1 + 7) using the distributive property.',
  '12','13','40','36',
  'C',
  '5·1 + 5·7 = 40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_020',
  'challenge',
  'A student says 6(3x + 3) = 18x + 3. What did the student forget?',
  'To add 6 and 3','To divide by 6','Nothing; the work is correct','To multiply 3 by 6',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_021',
  'challenge',
  'Use the distributive property to simplify 2(5x + 6).',
  '10x + 12','7x + 8','10x + 6','5x + 12',
  'A',
  'Multiply 2 by each term: 2·5x + 2·6 = 10x + 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_022',
  'challenge',
  'Which expression is equivalent to 3x + 6?',
  '3(x + 6)','3(x + 2)','2(x + 3)','x(5)',
  'B',
  'Factor out the common factor 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_023',
  'challenge',
  'Evaluate 4(3 + 5) using the distributive property.',
  '17','12','32','23',
  'C',
  '4·3 + 4·5 = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_024',
  'challenge',
  'A student says 5(5x + 8) = 25x + 8. What did the student forget?',
  'To add 5 and 5','To divide by 5','Nothing; the work is correct','To multiply 8 by 5',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_025',
  'challenge',
  'Use the distributive property to simplify 6(1x + 4).',
  '6x + 24','7x + 10','6x + 4','1x + 24',
  'A',
  'Multiply 6 by each term: 6·1x + 6·4 = 6x + 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

-- EXPRESSIONS / ONE_STEP_EQUATIONS — One-Step Equations

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_001',
  'easy',
  'Solve x + 2 = 4.',
  '2','4','6','3',
  'A',
  'Subtract 2 from both sides to get x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_002',
  'easy',
  'Solve x - 3 = 0.',
  '0','3','-3','4',
  'B',
  'Add 3 to both sides to get x=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_003',
  'easy',
  'Solve 4x = 16.',
  '16','12','4','5',
  'C',
  'Divide both sides by 4: x=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_004',
  'easy',
  'Solve x/5 = 5.',
  '5','30','26','25',
  'D',
  'Multiply both sides by 5: x=25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_005',
  'easy',
  'Sam had some marbles. After receiving 5 more, Sam had 11. How many marbles did Sam start with?',
  '6','5','11','16',
  'A',
  'Let x be the starting amount: x+5=11, so x=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_006',
  'easy',
  'Solve x + 7 = 14.',
  '14','7','21','8',
  'B',
  'Subtract 7 from both sides to get x=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_007',
  'easy',
  'Solve x - 8 = 0.',
  '0','-8','8','9',
  'C',
  'Add 8 to both sides to get x=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_008',
  'easy',
  'Solve 9x = 18.',
  '9','18','3','2',
  'D',
  'Divide both sides by 9: x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_009',
  'medium',
  'Solve x/2 = 3.',
  '6','3','2','8',
  'A',
  'Multiply both sides by 2: x=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_010',
  'medium',
  'Sam had some marbles. After receiving 10 more, Sam had 14. How many marbles did Sam start with?',
  '10','4','14','24',
  'B',
  'Let x be the starting amount: x+10=14, so x=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_011',
  'medium',
  'Solve x + 4 = 9.',
  '9','4','5','13',
  'C',
  'Subtract 4 from both sides to get x=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_012',
  'medium',
  'Solve x - 5 = 1.',
  '1','5','-4','6',
  'D',
  'Add 5 to both sides to get x=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_013',
  'medium',
  'Solve 6x = 42.',
  '7','6','42','36',
  'A',
  'Divide both sides by 6: x=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_014',
  'medium',
  'Solve x/7 = 8.',
  '8','56','7','63',
  'B',
  'Multiply both sides by 7: x=56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_015',
  'medium',
  'Sam had some marbles. After receiving 5 more, Sam had 7. How many marbles did Sam start with?',
  '5','7','2','12',
  'C',
  'Let x be the starting amount: x+5=7, so x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_016',
  'medium',
  'Solve x + 9 = 12.',
  '12','9','21','3',
  'D',
  'Subtract 9 from both sides to get x=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_017',
  'medium',
  'Solve x - 2 = 2.',
  '4','2','0','5',
  'A',
  'Add 2 to both sides to get x=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_018',
  'medium',
  'Solve 3x = 15.',
  '3','5','15','12',
  'B',
  'Divide both sides by 3: x=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_019',
  'medium',
  'Solve x/4 = 6.',
  '6','4','24','28',
  'C',
  'Multiply both sides by 4: x=24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_020',
  'challenge',
  'Sam had some marbles. After receiving 10 more, Sam had 17. How many marbles did Sam start with?',
  '10','17','27','7',
  'D',
  'Let x be the starting amount: x+10=17, so x=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_021',
  'challenge',
  'Solve x + 6 = 14.',
  '8','14','6','20',
  'A',
  'Subtract 6 from both sides to get x=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_022',
  'challenge',
  'Solve x - 7 = -5.',
  '-5','2','7','-12',
  'B',
  'Add 7 to both sides to get x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_023',
  'challenge',
  'Solve 8x = 24.',
  '8','24','3','16',
  'C',
  'Divide both sides by 8: x=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_024',
  'challenge',
  'Solve x/9 = 4.',
  '4','9','45','36',
  'D',
  'Multiply both sides by 9: x=36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_025',
  'challenge',
  'Sam had some marbles. After receiving 5 more, Sam had 10. How many marbles did Sam start with?',
  '5','10','15','6',
  'A',
  'Let x be the starting amount: x+5=10, so x=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

-- EXPRESSIONS / INEQUALITIES — Inequalities

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_001',
  'easy',
  'Which value satisfies x > 5?',
  '7','5','4','2',
  'A',
  'A solution must be greater than 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_002',
  'easy',
  'Which inequality represents ''n is at most 6''?',
  'n < 6','n ≤ 6','n ≥ 6','n > 6',
  'B',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_003',
  'easy',
  'Solve x + 4 < 11.',
  'x > 7','x ≤ 11','x < 7','x < 4',
  'C',
  'Subtract 4 from both sides to get x < 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_004',
  'easy',
  'Solve 5x ≤ 40.',
  'x ≥ 8','x < 5','x ≤ 40','x ≤ 8',
  'D',
  'Divide both sides by positive 5: x ≤ 8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_005',
  'easy',
  'A ride requires passengers to be at least 9 inches tall. Which inequality models height h?',
  'h ≥ 9','h > 9','h ≤ 9','h < 9',
  'A',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_006',
  'easy',
  'Which value satisfies x > 10?',
  '10','12','9','7',
  'B',
  'A solution must be greater than 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_007',
  'easy',
  'Which inequality represents ''n is at most 11''?',
  'n < 11','n ≥ 11','n ≤ 11','n > 11',
  'C',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_008',
  'easy',
  'Solve x + 2 < 14.',
  'x > 12','x ≤ 14','x < 2','x < 12',
  'D',
  'Subtract 2 from both sides to get x < 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_009',
  'medium',
  'Solve 3x ≤ 39.',
  'x ≤ 13','x ≥ 13','x < 3','x ≤ 39',
  'A',
  'Divide both sides by positive 3: x ≤ 13.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_010',
  'medium',
  'A ride requires passengers to be at least 14 inches tall. Which inequality models height h?',
  'h > 14','h ≥ 14','h ≤ 14','h < 14',
  'B',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_011',
  'medium',
  'Which value satisfies x > 15?',
  '15','14','17','12',
  'C',
  'A solution must be greater than 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_012',
  'medium',
  'Which inequality represents ''n is at most 16''?',
  'n < 16','n ≥ 16','n > 16','n ≤ 16',
  'D',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_013',
  'medium',
  'Solve x + 7 < 24.',
  'x < 17','x > 17','x ≤ 24','x < 7',
  'A',
  'Subtract 7 from both sides to get x < 17.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_014',
  'medium',
  'Solve 8x ≤ 144.',
  'x ≥ 18','x ≤ 18','x < 8','x ≤ 144',
  'B',
  'Divide both sides by positive 8: x ≤ 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_015',
  'medium',
  'A ride requires passengers to be at least 19 inches tall. Which inequality models height h?',
  'h > 19','h ≤ 19','h ≥ 19','h < 19',
  'C',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_016',
  'medium',
  'Which value satisfies x > 20?',
  '20','19','17','22',
  'D',
  'A solution must be greater than 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_017',
  'medium',
  'Which inequality represents ''n is at most 21''?',
  'n ≤ 21','n < 21','n ≥ 21','n > 21',
  'A',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_018',
  'medium',
  'Solve x + 5 < 27.',
  'x > 22','x < 22','x ≤ 27','x < 5',
  'B',
  'Subtract 5 from both sides to get x < 22.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_019',
  'medium',
  'Solve 6x ≤ 138.',
  'x ≥ 23','x < 6','x ≤ 23','x ≤ 138',
  'C',
  'Divide both sides by positive 6: x ≤ 23.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_020',
  'challenge',
  'A ride requires passengers to be at least 24 inches tall. Which inequality models height h?',
  'h > 24','h ≤ 24','h < 24','h ≥ 24',
  'D',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_021',
  'challenge',
  'Which value satisfies x > 25?',
  '27','25','24','22',
  'A',
  'A solution must be greater than 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_022',
  'challenge',
  'Which inequality represents ''n is at most 26''?',
  'n < 26','n ≤ 26','n ≥ 26','n > 26',
  'B',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_023',
  'challenge',
  'Solve x + 3 < 30.',
  'x > 27','x ≤ 30','x < 27','x < 3',
  'C',
  'Subtract 3 from both sides to get x < 27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_024',
  'challenge',
  'Solve 4x ≤ 112.',
  'x ≥ 28','x < 4','x ≤ 112','x ≤ 28',
  'D',
  'Divide both sides by positive 4: x ≤ 28.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_025',
  'challenge',
  'A ride requires passengers to be at least 29 inches tall. Which inequality models height h?',
  'h ≥ 29','h > 29','h ≤ 29','h < 29',
  'A',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

-- EXPRESSIONS / DEPENDENT_VARIABLES — Dependent & Independent Variables

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_001',
  'easy',
  'The total cost C depends on the number n of notebooks bought at $2 each. Which is the dependent variable?',
  'C','n','$2','Neither',
  'A',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_002',
  'easy',
  'In y = 3x + 3, which variable is independent?',
  'y','x','3','x_1',
  'B',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_003',
  'easy',
  'For y = 4x + 5, what is y when x = 5?',
  '20','29','25','26',
  'C',
  'Substitute x=5: y=4(5)+5=25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_004',
  'easy',
  'A plant''s height h is recorded over 8 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','Both are independent','Neither','h',
  'D',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_005',
  'easy',
  'For the relationship y = 6x, how much does y change when x increases by 1?',
  '6','1','7','12',
  'A',
  'The coefficient 6 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_006',
  'easy',
  'The total cost C depends on the number n of notebooks bought at $7 each. Which is the dependent variable?',
  'n','C','$7','Neither',
  'B',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_007',
  'easy',
  'In y = 2x + 3, which variable is independent?',
  'y','2','x','3',
  'C',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_008',
  'easy',
  'For y = 3x + 5, what is y when x = 5?',
  '15','23','25','20',
  'D',
  'Substitute x=5: y=3(5)+5=20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_009',
  'medium',
  'A plant''s height h is recorded over 13 days. Height changes as the number of days d changes. Which variable is dependent?',
  'h','d','Both are independent','Neither',
  'A',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_010',
  'medium',
  'For the relationship y = 5x, how much does y change when x increases by 1?',
  '1','5','6','10',
  'B',
  'The coefficient 5 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_011',
  'medium',
  'The total cost C depends on the number n of notebooks bought at $6 each. Which is the dependent variable?',
  'n','$6','C','Neither',
  'C',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_012',
  'medium',
  'In y = 7x + 3, which variable is independent?',
  'y','7','3','x',
  'D',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_013',
  'medium',
  'For y = 2x + 5, what is y when x = 5?',
  '15','10','17','25',
  'A',
  'Substitute x=5: y=2(5)+5=15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_014',
  'medium',
  'A plant''s height h is recorded over 18 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','h','Both are independent','Neither',
  'B',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_015',
  'medium',
  'For the relationship y = 4x, how much does y change when x increases by 1?',
  '1','5','4','8',
  'C',
  'The coefficient 4 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_016',
  'medium',
  'The total cost C depends on the number n of notebooks bought at $5 each. Which is the dependent variable?',
  'n','$5','Neither','C',
  'D',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_017',
  'medium',
  'In y = 6x + 3, which variable is independent?',
  'x','y','6','3',
  'A',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_018',
  'medium',
  'For y = 7x + 5, what is y when x = 5?',
  '35','40','47','25',
  'B',
  'Substitute x=5: y=7(5)+5=40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_019',
  'medium',
  'A plant''s height h is recorded over 23 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','Both are independent','h','Neither',
  'C',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_020',
  'challenge',
  'For the relationship y = 3x, how much does y change when x increases by 1?',
  '1','4','6','3',
  'D',
  'The coefficient 3 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_021',
  'challenge',
  'The total cost C depends on the number n of notebooks bought at $4 each. Which is the dependent variable?',
  'C','n','$4','Neither',
  'A',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_022',
  'challenge',
  'In y = 5x + 3, which variable is independent?',
  'y','x','5','3',
  'B',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_023',
  'challenge',
  'For y = 6x + 5, what is y when x = 5?',
  '30','41','35','25',
  'C',
  'Substitute x=5: y=6(5)+5=35.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_024',
  'challenge',
  'A plant''s height h is recorded over 28 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','Both are independent','Neither','h',
  'D',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_025',
  'challenge',
  'For the relationship y = 2x, how much does y change when x increases by 1?',
  '2','1','3','4',
  'A',
  'The coefficient 2 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

-- GEOMETRY / AREA_TRIANGLES — Area of Triangles

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_001',
  'easy',
  'What is the area of a triangle with base 4 units and height 3 units?',
  '6','12','7','8',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 3 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_002',
  'easy',
  'A triangle has area 12.5 square units and base 5 units. What is its height?',
  '25','5','10','6',
  'B',
  'From A=1/2 bh, h=2A/b=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_003',
  'easy',
  'A right triangle has perpendicular sides 6 and 7. What is its area?',
  '42','13','21','26',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_004',
  'easy',
  'If the height of a triangle stays 9 units and its base doubles from 7 to 14, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_005',
  'easy',
  'What is the area of a triangle with base 8 units and height 4 units?',
  '16','32','12','18',
  'A',
  'A = 1/2 × base × height = 1/2 × 8 × 4 = 16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_006',
  'easy',
  'A triangle has area 27 square units and base 9 units. What is its height?',
  '9','6','54','15',
  'B',
  'From A=1/2 bh, h=2A/b=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_007',
  'easy',
  'A right triangle has perpendicular sides 10 and 8. What is its area?',
  '80','18','40','36',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_008',
  'easy',
  'If the height of a triangle stays 3 units and its base doubles from 11 to 22, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_009',
  'medium',
  'What is the area of a triangle with base 4 units and height 5 units?',
  '10','20','9','12',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 5 = 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_010',
  'medium',
  'A triangle has area 17.5 square units and base 5 units. What is its height?',
  '5','7','35','12',
  'B',
  'From A=1/2 bh, h=2A/b=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_011',
  'medium',
  'A right triangle has perpendicular sides 6 and 9. What is its area?',
  '54','15','27','30',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_012',
  'medium',
  'If the height of a triangle stays 4 units and its base doubles from 7 to 14, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_013',
  'medium',
  'What is the area of a triangle with base 8 units and height 6 units?',
  '24','48','14','26',
  'A',
  'A = 1/2 × base × height = 1/2 × 8 × 6 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_014',
  'medium',
  'A triangle has area 36 square units and base 9 units. What is its height?',
  '9','8','72','17',
  'B',
  'From A=1/2 bh, h=2A/b=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_015',
  'medium',
  'A right triangle has perpendicular sides 10 and 3. What is its area?',
  '30','13','15','26',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_016',
  'medium',
  'If the height of a triangle stays 5 units and its base doubles from 11 to 22, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_017',
  'medium',
  'What is the area of a triangle with base 4 units and height 7 units?',
  '14','28','11','16',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 7 = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_018',
  'medium',
  'A triangle has area 22.5 square units and base 5 units. What is its height?',
  '5','9','45','14',
  'B',
  'From A=1/2 bh, h=2A/b=9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_019',
  'medium',
  'A right triangle has perpendicular sides 6 and 4. What is its area?',
  '24','10','12','20',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_020',
  'challenge',
  'If the height of a triangle stays 6 units and its base doubles from 7 to 14, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_021',
  'challenge',
  'What is the area of a triangle with base 8 units and height 8 units?',
  '32','64','16','34',
  'A',
  'A = 1/2 × base × height = 1/2 × 8 × 8 = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_022',
  'challenge',
  'A triangle has area 13.5 square units and base 9 units. What is its height?',
  '9','3','27','12',
  'B',
  'From A=1/2 bh, h=2A/b=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_023',
  'challenge',
  'A right triangle has perpendicular sides 10 and 5. What is its area?',
  '50','15','25','30',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_024',
  'challenge',
  'If the height of a triangle stays 7 units and its base doubles from 11 to 22, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_025',
  'challenge',
  'What is the area of a triangle with base 4 units and height 9 units?',
  '18','36','13','20',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 9 = 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

-- GEOMETRY / AREA_QUADRILATERALS — Area of Quadrilaterals

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_001',
  'easy',
  'What is the area of a rectangle 4 units long and 3 units wide?',
  '12','14','7','15',
  'A',
  'Rectangle area = length × width = 4 × 3 = 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_002',
  'easy',
  'What is the area of a parallelogram with base 5 units and perpendicular height 5 units?',
  '10','25','20','26',
  'B',
  'Parallelogram area = base × height = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_003',
  'easy',
  'A trapezoid has parallel bases 6 and 7 units and height 3 units. What is its area?',
  '126','39','19.5','16',
  'C',
  'A = 1/2(b1+b2)h = 19.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_004',
  'easy',
  'What is the area of a square with side length 7 units?',
  '28','14','56','49',
  'D',
  'Square area = side² = 7² = 49.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_005',
  'easy',
  'A rectangle has area 40 square units and length 8 units. What is its width?',
  '5','8','40','13',
  'A',
  'Width = area ÷ length = 40 ÷ 8 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_006',
  'easy',
  'What is the area of a rectangle 9 units long and 7 units wide?',
  '32','63','16','70',
  'B',
  'Rectangle area = length × width = 9 × 7 = 63.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_007',
  'easy',
  'What is the area of a parallelogram with base 10 units and perpendicular height 5 units?',
  '15','30','50','51',
  'C',
  'Parallelogram area = base × height = 50.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_008',
  'easy',
  'A trapezoid has parallel bases 4 and 5 units and height 3 units. What is its area?',
  '60','27','12','13.5',
  'D',
  'A = 1/2(b1+b2)h = 13.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_009',
  'medium',
  'What is the area of a square with side length 5 units?',
  '25','20','10','30',
  'A',
  'Square area = side² = 5² = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_010',
  'medium',
  'A rectangle has area 18 square units and length 6 units. What is its width?',
  '6','3','18','9',
  'B',
  'Width = area ÷ length = 18 ÷ 6 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_011',
  'medium',
  'What is the area of a rectangle 7 units long and 5 units wide?',
  '24','12','35','40',
  'C',
  'Rectangle area = length × width = 7 × 5 = 35.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_012',
  'medium',
  'What is the area of a parallelogram with base 8 units and perpendicular height 5 units?',
  '13','26','56','40',
  'D',
  'Parallelogram area = base × height = 40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_013',
  'medium',
  'A trapezoid has parallel bases 9 and 3 units and height 3 units. What is its area?',
  '18','81','36','15',
  'A',
  'A = 1/2(b1+b2)h = 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_014',
  'medium',
  'What is the area of a square with side length 10 units?',
  '40','100','20','110',
  'B',
  'Square area = side² = 10² = 100.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_015',
  'medium',
  'A rectangle has area 28 square units and length 4 units. What is its width?',
  '4','28','7','11',
  'C',
  'Width = area ÷ length = 28 ÷ 4 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_016',
  'medium',
  'What is the area of a rectangle 5 units long and 3 units wide?',
  '16','8','18','15',
  'D',
  'Rectangle area = length × width = 5 × 3 = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_017',
  'medium',
  'What is the area of a parallelogram with base 6 units and perpendicular height 5 units?',
  '30','11','22','31',
  'A',
  'Parallelogram area = base × height = 30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_018',
  'medium',
  'A trapezoid has parallel bases 7 and 7 units and height 3 units. What is its area?',
  '147','21','42','17',
  'B',
  'A = 1/2(b1+b2)h = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_019',
  'medium',
  'What is the area of a square with side length 8 units?',
  '32','16','64','72',
  'C',
  'Square area = side² = 8² = 64.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_020',
  'challenge',
  'A rectangle has area 45 square units and length 9 units. What is its width?',
  '9','45','14','5',
  'D',
  'Width = area ÷ length = 45 ÷ 9 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_021',
  'challenge',
  'What is the area of a rectangle 10 units long and 7 units wide?',
  '70','34','17','77',
  'A',
  'Rectangle area = length × width = 10 × 7 = 70.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_022',
  'challenge',
  'What is the area of a parallelogram with base 4 units and perpendicular height 5 units?',
  '9','20','18','12',
  'B',
  'Parallelogram area = base × height = 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_023',
  'challenge',
  'A trapezoid has parallel bases 5 and 5 units and height 3 units. What is its area?',
  '75','30','15','13',
  'C',
  'A = 1/2(b1+b2)h = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_024',
  'challenge',
  'What is the area of a square with side length 6 units?',
  '24','12','42','36',
  'D',
  'Square area = side² = 6² = 36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_025',
  'challenge',
  'A rectangle has area 21 square units and length 7 units. What is its width?',
  '3','7','21','10',
  'A',
  'Width = area ÷ length = 21 ÷ 7 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

-- GEOMETRY / SURFACE_AREA — Surface Area

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_001',
  'easy',
  'What is the surface area of a rectangular prism with dimensions 3 × 2 × 2?',
  '32','12','14','16',
  'A',
  'SA = 2(lw+lh+wh) = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_002',
  'easy',
  'What is the surface area of a cube with edge length 3?',
  '27','54','36','18',
  'B',
  'A cube has 6 square faces, so SA = 6×3² = 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_003',
  'easy',
  'A rectangular prism has a face measuring 5 by 4. What is the area of that face?',
  '18','9','20','120',
  'C',
  'Face area = 5 × 4 = 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_004',
  'easy',
  'If every edge of a cube is multiplied by 2, by what factor does its surface area change?',
  '2','8','5','4',
  'D',
  'Surface area scales with the square of edge length: 2²=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_005',
  'easy',
  'What is the surface area of a rectangular prism with dimensions 7 × 6 × 3?',
  '162','126','32','81',
  'A',
  'SA = 2(lw+lh+wh) = 162.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_006',
  'easy',
  'What is the surface area of a cube with edge length 7?',
  '343','294','196','42',
  'B',
  'A cube has 6 square faces, so SA = 6×7² = 294.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_007',
  'easy',
  'A rectangular prism has a face measuring 9 by 3. What is the area of that face?',
  '24','12','27','189',
  'C',
  'Face area = 9 × 3 = 27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_008',
  'easy',
  'If every edge of a cube is multiplied by 3, by what factor does its surface area change?',
  '3','27','6','9',
  'D',
  'Surface area scales with the square of edge length: 3²=9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_009',
  'medium',
  'What is the surface area of a rectangular prism with dimensions 11 × 5 × 4?',
  '238','220','40','119',
  'A',
  'SA = 2(lw+lh+wh) = 238.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_010',
  'medium',
  'What is the surface area of a cube with edge length 11?',
  '1331','726','484','66',
  'B',
  'A cube has 6 square faces, so SA = 6×11² = 726.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_011',
  'medium',
  'A rectangular prism has a face measuring 13 by 2. What is the area of that face?',
  '30','15','26','208',
  'C',
  'Face area = 13 × 2 = 26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_012',
  'medium',
  'If every edge of a cube is multiplied by 4, by what factor does its surface area change?',
  '4','64','8','16',
  'D',
  'Surface area scales with the square of edge length: 4²=16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_013',
  'medium',
  'What is the surface area of a rectangular prism with dimensions 15 × 4 × 5?',
  '310','300','48','155',
  'A',
  'SA = 2(lw+lh+wh) = 310.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_014',
  'medium',
  'What is the surface area of a cube with edge length 15?',
  '3375','1350','900','90',
  'B',
  'A cube has 6 square faces, so SA = 6×15² = 1350.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_015',
  'medium',
  'A rectangular prism has a face measuring 17 by 6. What is the area of that face?',
  '46','23','102','204',
  'C',
  'Face area = 17 × 6 = 102.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_016',
  'medium',
  'If every edge of a cube is multiplied by 5, by what factor does its surface area change?',
  '5','125','10','25',
  'D',
  'Surface area scales with the square of edge length: 5²=25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_017',
  'medium',
  'What is the surface area of a rectangular prism with dimensions 19 × 3 × 6?',
  '378','342','56','189',
  'A',
  'SA = 2(lw+lh+wh) = 378.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_018',
  'medium',
  'What is the surface area of a cube with edge length 19?',
  '6859','2166','1444','114',
  'B',
  'A cube has 6 square faces, so SA = 6×19² = 2166.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_019',
  'medium',
  'A rectangular prism has a face measuring 21 by 5. What is the area of that face?',
  '52','26','105','315',
  'C',
  'Face area = 21 × 5 = 105.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_020',
  'challenge',
  'If every edge of a cube is multiplied by 6, by what factor does its surface area change?',
  '6','216','12','36',
  'D',
  'Surface area scales with the square of edge length: 6²=36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_021',
  'challenge',
  'What is the surface area of a rectangular prism with dimensions 23 × 2 × 7?',
  '442','322','64','221',
  'A',
  'SA = 2(lw+lh+wh) = 442.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_022',
  'challenge',
  'What is the surface area of a cube with edge length 23?',
  '12167','3174','2116','138',
  'B',
  'A cube has 6 square faces, so SA = 6×23² = 3174.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_023',
  'challenge',
  'A rectangular prism has a face measuring 25 by 4. What is the area of that face?',
  '58','29','100','400',
  'C',
  'Face area = 25 × 4 = 100.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_024',
  'challenge',
  'If every edge of a cube is multiplied by 7, by what factor does its surface area change?',
  '7','343','14','49',
  'D',
  'Surface area scales with the square of edge length: 7²=49.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_025',
  'challenge',
  'What is the surface area of a rectangular prism with dimensions 27 × 6 × 8?',
  '852','1296','82','426',
  'A',
  'SA = 2(lw+lh+wh) = 852.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

-- GEOMETRY / VOLUME — Volume

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_001',
  'easy',
  'What is the volume of a rectangular prism with dimensions 3 × 2 × 2?',
  '12','32','7','8',
  'A',
  'V=lwh=3×2×2=12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_002',
  'easy',
  'A prism has base area 12 square units and height 5 units. What is its volume?',
  '17','60','120','12',
  'B',
  'Volume = base area × height = 12×5=60.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_003',
  'easy',
  'A rectangular prism has volume 160 cubic units, length 5, and width 4. What is its height?',
  '5','4','8','20',
  'C',
  'h=V÷(lw)=160÷20=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_004',
  'easy',
  'If every dimension of a rectangular prism is multiplied by 2, by what factor does its volume change?',
  '2','4','9','8',
  'D',
  'Volume scales with the cube of the linear factor: 2³=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_005',
  'easy',
  'What is the volume of a rectangular prism with dimensions 7 × 6 × 7?',
  '294','266','20','49',
  'A',
  'V=lwh=7×6×7=294.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_006',
  'easy',
  'A prism has base area 16 square units and height 3 units. What is its volume?',
  '19','48','96','16',
  'B',
  'Volume = base area × height = 16×3=48.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_007',
  'easy',
  'A rectangular prism has volume 162 cubic units, length 9, and width 3. What is its height?',
  '9','3','6','27',
  'C',
  'h=V÷(lw)=162÷27=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_008',
  'easy',
  'If every dimension of a rectangular prism is multiplied by 3, by what factor does its volume change?',
  '3','9','6','27',
  'D',
  'Volume scales with the cube of the linear factor: 3³=27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_009',
  'medium',
  'What is the volume of a rectangular prism with dimensions 11 × 5 × 5?',
  '275','270','21','60',
  'A',
  'V=lwh=11×5×5=275.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_010',
  'medium',
  'A prism has base area 72 square units and height 8 units. What is its volume?',
  '80','576','1152','72',
  'B',
  'Volume = base area × height = 72×8=576.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_011',
  'medium',
  'A rectangular prism has volume 104 cubic units, length 13, and width 2. What is its height?',
  '13','2','4','26',
  'C',
  'h=V÷(lw)=104÷26=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_012',
  'medium',
  'If every dimension of a rectangular prism is multiplied by 4, by what factor does its volume change?',
  '4','16','8','64',
  'D',
  'Volume scales with the cube of the linear factor: 4³=64.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_013',
  'medium',
  'What is the volume of a rectangular prism with dimensions 15 × 4 × 3?',
  '180','234','22','63',
  'A',
  'V=lwh=15×4×3=180.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_014',
  'medium',
  'A prism has base area 80 square units and height 6 units. What is its volume?',
  '86','480','960','80',
  'B',
  'Volume = base area × height = 80×6=480.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_015',
  'medium',
  'A rectangular prism has volume 204 cubic units, length 17, and width 6. What is its height?',
  '17','6','2','102',
  'C',
  'h=V÷(lw)=204÷102=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_016',
  'medium',
  'If every dimension of a rectangular prism is multiplied by 5, by what factor does its volume change?',
  '5','25','10','125',
  'D',
  'Volume scales with the cube of the linear factor: 5³=125.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_017',
  'medium',
  'What is the volume of a rectangular prism with dimensions 19 × 3 × 8?',
  '456','466','30','65',
  'A',
  'V=lwh=19×3×8=456.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_018',
  'medium',
  'A prism has base area 80 square units and height 4 units. What is its volume?',
  '84','320','640','80',
  'B',
  'Volume = base area × height = 80×4=320.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_019',
  'medium',
  'A rectangular prism has volume 735 cubic units, length 21, and width 5. What is its height?',
  '21','5','7','105',
  'C',
  'h=V÷(lw)=735÷105=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_020',
  'challenge',
  'If every dimension of a rectangular prism is multiplied by 6, by what factor does its volume change?',
  '6','36','12','216',
  'D',
  'Volume scales with the cube of the linear factor: 6³=216.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_021',
  'challenge',
  'What is the volume of a rectangular prism with dimensions 23 × 2 × 6?',
  '276','392','31','52',
  'A',
  'V=lwh=23×2×6=276.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_022',
  'challenge',
  'A prism has base area 72 square units and height 2 units. What is its volume?',
  '74','144','288','72',
  'B',
  'Volume = base area × height = 72×2=144.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_023',
  'challenge',
  'A rectangular prism has volume 500 cubic units, length 25, and width 4. What is its height?',
  '25','4','5','100',
  'C',
  'h=V÷(lw)=500÷100=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_024',
  'challenge',
  'If every dimension of a rectangular prism is multiplied by 7, by what factor does its volume change?',
  '7','49','14','343',
  'D',
  'Volume scales with the cube of the linear factor: 7³=343.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_GEOMETRY_VOLUME_025',
  'challenge',
  'What is the volume of a rectangular prism with dimensions 27 × 6 × 4?',
  '648','588','37','166',
  'A',
  'V=lwh=27×6×4=648.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

-- STATISTICS / MEAN — Mean

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_001',
  'easy',
  'What is the mean of 3, 5, 7, 9?',
  '6','24','7','8',
  'A',
  'Add the values (24) and divide by 4 to get 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_002',
  'easy',
  'The mean of four numbers is 7. Three numbers are 5, 6, and 8. What is the fourth number?',
  '7','9','28','11',
  'B',
  'The total needed is 7×4=28; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_003',
  'easy',
  'Which expression correctly computes the mean of 5, 9, 13, and 17?',
  '(5 + 17) ÷ 2','44 ÷ 3','(5 + 9 + 13 + 17) ÷ 4','17 - 5',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_004',
  'easy',
  'A student''s four quiz scores are 6, 11, 16, 21. What average score did the student earn?',
  '21','6','15','13.5',
  'D',
  'Average = total ÷ 4 = 13.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_005',
  'easy',
  'What is the mean of 7, 13, 19, 25?',
  '16','18','64','17',
  'A',
  'Add the values (64) and divide by 4 to get 16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_006',
  'easy',
  'The mean of four numbers is 11. Three numbers are 9, 10, and 12. What is the fourth number?',
  '11','13','44','15',
  'B',
  'The total needed is 11×4=44; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_007',
  'easy',
  'Which expression correctly computes the mean of 9, 17, 25, and 33?',
  '(9 + 33) ÷ 2','84 ÷ 3','(9 + 17 + 25 + 33) ÷ 4','33 - 9',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_008',
  'easy',
  'A student''s four quiz scores are 10, 19, 28, 37. What average score did the student earn?',
  '37','10','27','23.5',
  'D',
  'Average = total ÷ 4 = 23.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_009',
  'medium',
  'What is the mean of 11, 21, 31, 41?',
  '26','30','104','27',
  'A',
  'Add the values (104) and divide by 4 to get 26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_010',
  'medium',
  'The mean of four numbers is 15. Three numbers are 13, 14, and 16. What is the fourth number?',
  '15','17','60','19',
  'B',
  'The total needed is 15×4=60; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_011',
  'medium',
  'Which expression correctly computes the mean of 13, 25, 37, and 49?',
  '(13 + 49) ÷ 2','124 ÷ 3','(13 + 25 + 37 + 49) ÷ 4','49 - 13',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_012',
  'medium',
  'A student''s four quiz scores are 14, 27, 40, 53. What average score did the student earn?',
  '53','14','39','33.5',
  'D',
  'Average = total ÷ 4 = 33.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_013',
  'medium',
  'What is the mean of 15, 29, 43, 57?',
  '36','42','144','37',
  'A',
  'Add the values (144) and divide by 4 to get 36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_014',
  'medium',
  'The mean of four numbers is 19. Three numbers are 17, 18, and 20. What is the fourth number?',
  '19','21','76','23',
  'B',
  'The total needed is 19×4=76; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_015',
  'medium',
  'Which expression correctly computes the mean of 17, 33, 49, and 65?',
  '(17 + 65) ÷ 2','164 ÷ 3','(17 + 33 + 49 + 65) ÷ 4','65 - 17',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_016',
  'medium',
  'A student''s four quiz scores are 18, 35, 52, 69. What average score did the student earn?',
  '69','18','51','43.5',
  'D',
  'Average = total ÷ 4 = 43.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_017',
  'medium',
  'What is the mean of 19, 37, 55, 73?',
  '46','54','184','47',
  'A',
  'Add the values (184) and divide by 4 to get 46.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_018',
  'medium',
  'The mean of four numbers is 23. Three numbers are 21, 22, and 24. What is the fourth number?',
  '23','25','92','27',
  'B',
  'The total needed is 23×4=92; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_019',
  'medium',
  'Which expression correctly computes the mean of 21, 41, 61, and 81?',
  '(21 + 81) ÷ 2','204 ÷ 3','(21 + 41 + 61 + 81) ÷ 4','81 - 21',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_020',
  'challenge',
  'A student''s four quiz scores are 22, 43, 64, 85. What average score did the student earn?',
  '85','22','63','53.5',
  'D',
  'Average = total ÷ 4 = 53.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_021',
  'challenge',
  'What is the mean of 23, 45, 67, 89?',
  '56','66','224','57',
  'A',
  'Add the values (224) and divide by 4 to get 56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_022',
  'challenge',
  'The mean of four numbers is 27. Three numbers are 25, 26, and 28. What is the fourth number?',
  '27','29','108','31',
  'B',
  'The total needed is 27×4=108; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_023',
  'challenge',
  'Which expression correctly computes the mean of 25, 49, 73, and 97?',
  '(25 + 97) ÷ 2','244 ÷ 3','(25 + 49 + 73 + 97) ÷ 4','97 - 25',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_024',
  'challenge',
  'A student''s four quiz scores are 26, 51, 76, 101. What average score did the student earn?',
  '101','26','75','63.5',
  'D',
  'Average = total ÷ 4 = 63.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEAN_025',
  'challenge',
  'What is the mean of 27, 53, 79, 105?',
  '66','78','264','67',
  'A',
  'Add the values (264) and divide by 4 to get 66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

-- STATISTICS / MEDIAN — Median

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_001',
  'easy',
  'What is the median of 2, 4, 6, 8, 10?',
  '6','8','2','7',
  'A',
  'The ordered middle value is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_002',
  'easy',
  'What is the median of 3, 6, 9, 12?',
  '6','7.5','9','8.5',
  'B',
  'Average the two middle values to get 7.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_003',
  'easy',
  'In an ordered data set with 5 values, which position contains the median?',
  'Position 1','Position 5','Position 3','Position 2',
  'C',
  'With 5 values, the middle position is 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_004',
  'easy',
  'The ordered data set is 5, 10, 15, 20, 25. If the largest value increases by 13, what happens to the median?',
  'It increases by 13','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_005',
  'easy',
  'What is the median of 6, 12, 18, 24, 30?',
  '18','24','6','19',
  'A',
  'The ordered middle value is 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_006',
  'easy',
  'What is the median of 7, 14, 21, 28?',
  '14','17.5','21','18.5',
  'B',
  'Average the two middle values to get 17.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_007',
  'easy',
  'In an ordered data set with 7 values, which position contains the median?',
  'Position 1','Position 7','Position 4','Position 3',
  'C',
  'With 7 values, the middle position is 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_008',
  'easy',
  'The ordered data set is 9, 18, 27, 36, 45. If the largest value increases by 17, what happens to the median?',
  'It increases by 17','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_009',
  'medium',
  'What is the median of 10, 20, 30, 40, 50?',
  '30','40','10','31',
  'A',
  'The ordered middle value is 30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_010',
  'medium',
  'What is the median of 11, 22, 33, 44?',
  '22','27.5','33','28.5',
  'B',
  'Average the two middle values to get 27.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_011',
  'medium',
  'In an ordered data set with 9 values, which position contains the median?',
  'Position 1','Position 9','Position 5','Position 4',
  'C',
  'With 9 values, the middle position is 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_012',
  'medium',
  'The ordered data set is 13, 26, 39, 52, 65. If the largest value increases by 21, what happens to the median?',
  'It increases by 21','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_013',
  'medium',
  'What is the median of 14, 28, 42, 56, 70?',
  '42','56','14','43',
  'A',
  'The ordered middle value is 42.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_014',
  'medium',
  'What is the median of 15, 30, 45, 60?',
  '30','37.5','45','38.5',
  'B',
  'Average the two middle values to get 37.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_015',
  'medium',
  'In an ordered data set with 11 values, which position contains the median?',
  'Position 1','Position 11','Position 6','Position 5',
  'C',
  'With 11 values, the middle position is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_016',
  'medium',
  'The ordered data set is 17, 34, 51, 68, 85. If the largest value increases by 25, what happens to the median?',
  'It increases by 25','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_017',
  'medium',
  'What is the median of 18, 36, 54, 72, 90?',
  '54','72','18','55',
  'A',
  'The ordered middle value is 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_018',
  'medium',
  'What is the median of 19, 38, 57, 76?',
  '38','47.5','57','48.5',
  'B',
  'Average the two middle values to get 47.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_019',
  'medium',
  'In an ordered data set with 13 values, which position contains the median?',
  'Position 1','Position 13','Position 7','Position 6',
  'C',
  'With 13 values, the middle position is 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_020',
  'challenge',
  'The ordered data set is 21, 42, 63, 84, 105. If the largest value increases by 29, what happens to the median?',
  'It increases by 29','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_021',
  'challenge',
  'What is the median of 22, 44, 66, 88, 110?',
  '66','88','22','67',
  'A',
  'The ordered middle value is 66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_022',
  'challenge',
  'What is the median of 23, 46, 69, 92?',
  '46','57.5','69','58.5',
  'B',
  'Average the two middle values to get 57.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_023',
  'challenge',
  'In an ordered data set with 15 values, which position contains the median?',
  'Position 1','Position 15','Position 8','Position 7',
  'C',
  'With 15 values, the middle position is 8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_024',
  'challenge',
  'The ordered data set is 25, 50, 75, 100, 125. If the largest value increases by 33, what happens to the median?',
  'It increases by 33','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MEDIAN_025',
  'challenge',
  'What is the median of 26, 52, 78, 104, 130?',
  '78','104','26','79',
  'A',
  'The ordered middle value is 78.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

-- STATISTICS / MODE — Mode

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_001',
  'easy',
  'What is the mode of 2, 2, 2, 3, 4, 5?',
  '2','3','4','5',
  'A',
  '2 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_002',
  'easy',
  'For the data set 3, 4, 4, 5, 6, which value occurs most often?',
  '3','4','5','6',
  'B',
  '4 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_003',
  'easy',
  'Which values are modes of 4, 4, 5, 5, 6?',
  '4','5','4 and 5','There is no mode',
  'C',
  'Both 4 and 5 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_004',
  'easy',
  'What can you say about the mode of 5, 6, 7, 8?',
  'The mode is 5','The mode is 8','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_005',
  'easy',
  'What is the mode of 6, 6, 6, 7, 8, 9?',
  '6','7','8','3',
  'A',
  '6 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_006',
  'easy',
  'For the data set 7, 8, 8, 9, 10, which value occurs most often?',
  '7','8','9','10',
  'B',
  '8 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_007',
  'easy',
  'Which values are modes of 8, 8, 9, 9, 10?',
  '8','9','8 and 9','There is no mode',
  'C',
  'Both 8 and 9 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_008',
  'easy',
  'What can you say about the mode of 9, 10, 11, 12?',
  'The mode is 9','The mode is 12','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_009',
  'medium',
  'What is the mode of 10, 10, 10, 11, 12, 13?',
  '10','11','12','3',
  'A',
  '10 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_010',
  'medium',
  'For the data set 11, 12, 12, 13, 14, which value occurs most often?',
  '11','12','13','14',
  'B',
  '12 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_011',
  'medium',
  'Which values are modes of 12, 12, 13, 13, 14?',
  '12','13','12 and 13','There is no mode',
  'C',
  'Both 12 and 13 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_012',
  'medium',
  'What can you say about the mode of 13, 14, 15, 16?',
  'The mode is 13','The mode is 16','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_013',
  'medium',
  'What is the mode of 14, 14, 14, 15, 16, 17?',
  '14','15','16','3',
  'A',
  '14 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_014',
  'medium',
  'For the data set 15, 16, 16, 17, 18, which value occurs most often?',
  '15','16','17','18',
  'B',
  '16 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_015',
  'medium',
  'Which values are modes of 16, 16, 17, 17, 18?',
  '16','17','16 and 17','There is no mode',
  'C',
  'Both 16 and 17 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_016',
  'medium',
  'What can you say about the mode of 17, 18, 19, 20?',
  'The mode is 17','The mode is 20','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_017',
  'medium',
  'What is the mode of 18, 18, 18, 19, 20, 21?',
  '18','19','20','3',
  'A',
  '18 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_018',
  'medium',
  'For the data set 19, 20, 20, 21, 22, which value occurs most often?',
  '19','20','21','22',
  'B',
  '20 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_019',
  'medium',
  'Which values are modes of 20, 20, 21, 21, 22?',
  '20','21','20 and 21','There is no mode',
  'C',
  'Both 20 and 21 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_020',
  'challenge',
  'What can you say about the mode of 21, 22, 23, 24?',
  'The mode is 21','The mode is 24','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_021',
  'challenge',
  'What is the mode of 22, 22, 22, 23, 24, 25?',
  '22','23','24','3',
  'A',
  '22 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_022',
  'challenge',
  'For the data set 23, 24, 24, 25, 26, which value occurs most often?',
  '23','24','25','26',
  'B',
  '24 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_023',
  'challenge',
  'Which values are modes of 24, 24, 25, 25, 26?',
  '24','25','24 and 25','There is no mode',
  'C',
  'Both 24 and 25 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_024',
  'challenge',
  'What can you say about the mode of 25, 26, 27, 28?',
  'The mode is 25','The mode is 28','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_MODE_025',
  'challenge',
  'What is the mode of 26, 26, 26, 27, 28, 29?',
  '26','27','28','3',
  'A',
  '26 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

-- STATISTICS / RANGE — Range

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_001',
  'easy',
  'What is the range of 2, 5, 9, 12?',
  '10','12','2','7',
  'A',
  'Range = greatest - least = 12 - 2 = 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_002',
  'easy',
  'A data set has least value 3 and greatest value 16. What is its range?',
  '16','13','3','19',
  'B',
  'Range = 16 - 3 = 13.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_003',
  'easy',
  'The least value in a data set is 4 and the range is 21. What is the greatest value?',
  '21','4','25','20',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_004',
  'easy',
  'A data set has range 19. If both its least and greatest values increase by 6, what is the new range?',
  '25','13','38','19',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_005',
  'easy',
  'What is the range of 6, 13, 21, 28?',
  '22','28','6','17',
  'A',
  'Range = greatest - least = 28 - 6 = 22.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_006',
  'easy',
  'A data set has least value 7 and greatest value 32. What is its range?',
  '32','25','7','39',
  'B',
  'Range = 32 - 7 = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_007',
  'easy',
  'The least value in a data set is 8 and the range is 33. What is the greatest value?',
  '33','8','41','36',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_008',
  'easy',
  'A data set has range 31. If both its least and greatest values increase by 10, what is the new range?',
  '41','21','62','31',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_009',
  'medium',
  'What is the range of 10, 21, 33, 44?',
  '34','44','10','27',
  'A',
  'Range = greatest - least = 44 - 10 = 34.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_010',
  'medium',
  'A data set has least value 11 and greatest value 48. What is its range?',
  '48','37','11','59',
  'B',
  'Range = 48 - 11 = 37.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_011',
  'medium',
  'The least value in a data set is 12 and the range is 45. What is the greatest value?',
  '45','12','57','52',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_012',
  'medium',
  'A data set has range 43. If both its least and greatest values increase by 14, what is the new range?',
  '57','29','86','43',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_013',
  'medium',
  'What is the range of 14, 29, 45, 60?',
  '46','60','14','37',
  'A',
  'Range = greatest - least = 60 - 14 = 46.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_014',
  'medium',
  'A data set has least value 15 and greatest value 64. What is its range?',
  '64','49','15','79',
  'B',
  'Range = 64 - 15 = 49.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_015',
  'medium',
  'The least value in a data set is 16 and the range is 57. What is the greatest value?',
  '57','16','73','68',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_016',
  'medium',
  'A data set has range 55. If both its least and greatest values increase by 18, what is the new range?',
  '73','37','110','55',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_017',
  'medium',
  'What is the range of 18, 37, 57, 76?',
  '58','76','18','47',
  'A',
  'Range = greatest - least = 76 - 18 = 58.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_018',
  'medium',
  'A data set has least value 19 and greatest value 80. What is its range?',
  '80','61','19','99',
  'B',
  'Range = 80 - 19 = 61.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_019',
  'medium',
  'The least value in a data set is 20 and the range is 69. What is the greatest value?',
  '69','20','89','84',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_020',
  'challenge',
  'A data set has range 67. If both its least and greatest values increase by 22, what is the new range?',
  '89','45','134','67',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_021',
  'challenge',
  'What is the range of 22, 45, 69, 92?',
  '70','92','22','57',
  'A',
  'Range = greatest - least = 92 - 22 = 70.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_022',
  'challenge',
  'A data set has least value 23 and greatest value 96. What is its range?',
  '96','73','23','119',
  'B',
  'Range = 96 - 23 = 73.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_023',
  'challenge',
  'The least value in a data set is 24 and the range is 81. What is the greatest value?',
  '81','24','105','100',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_024',
  'challenge',
  'A data set has range 79. If both its least and greatest values increase by 26, what is the new range?',
  '105','53','158','79',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_RANGE_025',
  'challenge',
  'What is the range of 26, 53, 81, 108?',
  '82','108','26','67',
  'A',
  'Range = greatest - least = 108 - 26 = 82.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

-- STATISTICS / DATA_DISPLAYS — Data Displays

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_001',
  'easy',
  'A bar graph shows Red=3, Blue=5, Green=2. Which category has the greatest value?',
  'Blue','Red','Green','They are equal',
  'A',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_002',
  'easy',
  'A frequency table lists 4 Cats, 7 Dogs, and 5 Birds. What is the total frequency?',
  '7','16','18','11',
  'B',
  'Add the frequencies: 4+7+5=16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_003',
  'easy',
  'A bar graph shows Class A=5 and Class B=9. What is the difference?',
  '14','9','4','5',
  'C',
  'Difference = |9-5| = 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_004',
  'easy',
  'A student records temperature once per day for 7 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Number sentence','Multiplication table','Line graph',
  'D',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_005',
  'easy',
  'A graph uses a vertical scale increasing by 1 at each tick. What should a reader check before comparing bar heights?',
  'The axis labels and scale','Only the tallest bar','Only the title','Ignore the tick marks',
  'A',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_006',
  'easy',
  'A bar graph shows Red=8, Blue=15, Green=17. Which category has the greatest value?',
  'Red','Green','Blue','They are equal',
  'B',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_007',
  'easy',
  'A frequency table lists 9 Cats, 17 Dogs, and 20 Birds. What is the total frequency?',
  '20','48','46','26',
  'C',
  'Add the frequencies: 9+17+20=46.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_008',
  'easy',
  'A bar graph shows Class A=10 and Class B=19. What is the difference?',
  '29','19','10','9',
  'D',
  'Difference = |19-10| = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_009',
  'medium',
  'A student records temperature once per day for 12 days and wants to show how it changes over time. Which display is most suitable?',
  'Line graph','Circle graph','Number sentence','Multiplication table',
  'A',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_010',
  'medium',
  'A graph uses a vertical scale increasing by 2 at each tick. What should a reader check before comparing bar heights?',
  'Only the tallest bar','The axis labels and scale','Only the title','Ignore the tick marks',
  'B',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_011',
  'medium',
  'A bar graph shows Red=13, Blue=25, Green=32. Which category has the greatest value?',
  'Red','Blue','Green','They are equal',
  'C',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_012',
  'medium',
  'A frequency table lists 14 Cats, 27 Dogs, and 35 Birds. What is the total frequency?',
  '35','78','41','76',
  'D',
  'Add the frequencies: 14+27+35=76.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_013',
  'medium',
  'A bar graph shows Class A=15 and Class B=29. What is the difference?',
  '14','44','29','15',
  'A',
  'Difference = |29-15| = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_014',
  'medium',
  'A student records temperature once per day for 17 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Line graph','Number sentence','Multiplication table',
  'B',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_015',
  'medium',
  'A graph uses a vertical scale increasing by 3 at each tick. What should a reader check before comparing bar heights?',
  'Only the tallest bar','Only the title','The axis labels and scale','Ignore the tick marks',
  'C',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_016',
  'medium',
  'A bar graph shows Red=18, Blue=35, Green=47. Which category has the greatest value?',
  'Red','Blue','They are equal','Green',
  'D',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_017',
  'medium',
  'A frequency table lists 19 Cats, 37 Dogs, and 50 Birds. What is the total frequency?',
  '106','50','108','56',
  'A',
  'Add the frequencies: 19+37+50=106.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_018',
  'medium',
  'A bar graph shows Class A=20 and Class B=39. What is the difference?',
  '59','19','39','20',
  'B',
  'Difference = |39-20| = 19.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_019',
  'medium',
  'A student records temperature once per day for 22 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Number sentence','Line graph','Multiplication table',
  'C',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_020',
  'challenge',
  'A graph uses a vertical scale increasing by 4 at each tick. What should a reader check before comparing bar heights?',
  'Only the tallest bar','Only the title','Ignore the tick marks','The axis labels and scale',
  'D',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_021',
  'challenge',
  'A bar graph shows Red=23, Blue=45, Green=62. Which category has the greatest value?',
  'Green','Red','Blue','They are equal',
  'A',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_022',
  'challenge',
  'A frequency table lists 24 Cats, 47 Dogs, and 65 Birds. What is the total frequency?',
  '65','136','138','71',
  'B',
  'Add the frequencies: 24+47+65=136.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_023',
  'challenge',
  'A bar graph shows Class A=25 and Class B=49. What is the difference?',
  '74','49','24','25',
  'C',
  'Difference = |49-25| = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_024',
  'challenge',
  'A student records temperature once per day for 27 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Number sentence','Multiplication table','Line graph',
  'D',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_025',
  'challenge',
  'A graph uses a vertical scale increasing by 5 at each tick. What should a reader check before comparing bar heights?',
  'The axis labels and scale','Only the tallest bar','Only the title','Ignore the tick marks',
  'A',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

-- ==================== IN GRADE 6 ====================

-- RATIOS / RATIO_CONCEPTS — Understanding Ratios

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_001',
  'easy',
  'A basket has 2 red apples and 3 green apples. What is the ratio of red apples to green apples?',
  '2:3','3:2','2:5','5:3',
  'A',
  'Red to green compares 2 red apples with 3 green apples, so the ratio is 2:3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_002',
  'easy',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:5. If 9 students wear sneakers, how many wear sandals?',
  '9','15','20','8',
  'B',
  'The scale factor is 3, so 5 × 3 = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_003',
  'easy',
  'Which statement correctly describes the ratio 4:7?',
  'There are 11 of each quantity.','The second quantity is always 4 times the first.','For every 4 of the first quantity, there are 7 of the second.','The two quantities must be equal.',
  'C',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_004',
  'easy',
  'A recipe uses 5 cups of oats for every 9 cups of milk. Which ratio represents milk to oats?',
  '5:9','14:5','9:14','9:5',
  'D',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_005',
  'easy',
  'The ratio of blue tiles to all tiles is 6:10. If there are 6 blue tiles, how many non-blue tiles are there?',
  '4','6','10','2',
  'A',
  'All tiles = blue + non-blue, so 10 - 6 = 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_006',
  'easy',
  'A basket has 2 red apples and 6 green apples. What is the ratio of red apples to green apples?',
  '6:2','2:6','2:8','8:6',
  'B',
  'Red to green compares 2 red apples with 6 green apples, so the ratio is 2:6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_007',
  'easy',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:8. If 12 students wear sneakers, how many wear sandals?',
  '12','40','32','11',
  'C',
  'The scale factor is 4, so 8 × 4 = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_008',
  'easy',
  'Which statement correctly describes the ratio 4:3?',
  'There are 7 of each quantity.','The second quantity is always 4 times the first.','The two quantities must be equal.','For every 4 of the first quantity, there are 3 of the second.',
  'D',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_009',
  'medium',
  'A recipe uses 5 cups of oats for every 5 cups of milk. Which ratio represents milk to oats?',
  '5:5','10:5','5:10','5:5_1',
  'A',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_010',
  'medium',
  'The ratio of blue tiles to all tiles is 6:13. If there are 6 blue tiles, how many non-blue tiles are there?',
  '6','7','13','1',
  'B',
  'All tiles = blue + non-blue, so 13 - 6 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_011',
  'medium',
  'A basket has 2 red apples and 9 green apples. What is the ratio of red apples to green apples?',
  '9:2','2:11','2:9','11:9',
  'C',
  'Red to green compares 2 red apples with 9 green apples, so the ratio is 2:9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_012',
  'medium',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:4. If 15 students wear sneakers, how many wear sandals?',
  '15','24','7','20',
  'D',
  'The scale factor is 5, so 4 × 5 = 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_013',
  'medium',
  'Which statement correctly describes the ratio 4:6?',
  'For every 4 of the first quantity, there are 6 of the second.','There are 10 of each quantity.','The second quantity is always 4 times the first.','The two quantities must be equal.',
  'A',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_014',
  'medium',
  'A recipe uses 5 cups of oats for every 8 cups of milk. Which ratio represents milk to oats?',
  '5:8','8:5','13:5','8:13',
  'B',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_015',
  'medium',
  'The ratio of blue tiles to all tiles is 6:9. If there are 6 blue tiles, how many non-blue tiles are there?',
  '6','9','3','4',
  'C',
  'All tiles = blue + non-blue, so 9 - 6 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_016',
  'medium',
  'A basket has 2 red apples and 5 green apples. What is the ratio of red apples to green apples?',
  '5:2','2:7','7:5','2:5',
  'D',
  'Red to green compares 2 red apples with 5 green apples, so the ratio is 2:5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_017',
  'medium',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:7. If 6 students wear sneakers, how many wear sandals?',
  '14','6','21','10',
  'A',
  'The scale factor is 2, so 7 × 2 = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_018',
  'medium',
  'Which statement correctly describes the ratio 4:9?',
  'There are 13 of each quantity.','For every 4 of the first quantity, there are 9 of the second.','The second quantity is always 4 times the first.','The two quantities must be equal.',
  'B',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_019',
  'medium',
  'A recipe uses 5 cups of oats for every 4 cups of milk. Which ratio represents milk to oats?',
  '5:4','9:5','4:5','4:9',
  'C',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_020',
  'challenge',
  'The ratio of blue tiles to all tiles is 6:12. If there are 6 blue tiles, how many non-blue tiles are there?',
  '12','0','7','6',
  'D',
  'All tiles = blue + non-blue, so 12 - 6 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_021',
  'challenge',
  'A basket has 2 red apples and 8 green apples. What is the ratio of red apples to green apples?',
  '2:8','8:2','2:10','10:8',
  'A',
  'Red to green compares 2 red apples with 8 green apples, so the ratio is 2:8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_022',
  'challenge',
  'In a class, the ratio of students wearing sneakers to students wearing sandals is 3:3. If 9 students wear sneakers, how many wear sandals?',
  '12','9','6','10',
  'B',
  'The scale factor is 3, so 3 × 3 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_023',
  'challenge',
  'Which statement correctly describes the ratio 4:5?',
  'There are 9 of each quantity.','The second quantity is always 4 times the first.','For every 4 of the first quantity, there are 5 of the second.','The two quantities must be equal.',
  'C',
  'A ratio compares two quantities in a specified order.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_024',
  'challenge',
  'A recipe uses 5 cups of oats for every 7 cups of milk. Which ratio represents milk to oats?',
  '5:7','12:5','7:12','7:5',
  'D',
  'The requested order is milk first, then oats.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_CONCEPTS_025',
  'challenge',
  'The ratio of blue tiles to all tiles is 6:15. If there are 6 blue tiles, how many non-blue tiles are there?',
  '9','6','15','3',
  'A',
  'All tiles = blue + non-blue, so 15 - 6 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_CONCEPTS';

-- RATIOS / EQUIVALENT_RATIOS — Equivalent Ratios

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_001',
  'easy',
  'Which ratio is equivalent to 2:3?',
  '4:6','4:5','4:3','2:6',
  'A',
  'Multiply both terms by the same factor 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_002',
  'easy',
  'Complete the equivalent ratio: 3:5 = 9:x. What is x?',
  '8','15','9','10',
  'B',
  'The scale factor is 3, so x=5×3=15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_003',
  'easy',
  'A recipe uses ingredients in the ratio 4:7. Which pair keeps exactly the same ratio?',
  '8 and 11','16 and 7','16 and 28','4 and 28',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_004',
  'easy',
  'A map uses 5 cm for 9 km. At the same scale, 25 cm represents how many kilometers?',
  '14','25','46','45',
  'D',
  'The length is multiplied by 5, so the distance is also multiplied by 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_005',
  'easy',
  'Which ratio is equivalent to 6:11?',
  '36:66','12:17','36:11','6:66',
  'A',
  'Multiply both terms by the same factor 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_006',
  'easy',
  'Complete the equivalent ratio: 7:13 = 14:x. What is x?',
  '15','26','14','13',
  'B',
  'The scale factor is 2, so x=13×2=26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_007',
  'easy',
  'A recipe uses ingredients in the ratio 8:15. Which pair keeps exactly the same ratio?',
  '11 and 18','24 and 15','24 and 45','8 and 45',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_008',
  'easy',
  'A map uses 9 cm for 17 km. At the same scale, 36 cm represents how many kilometers?',
  '21','36','26','68',
  'D',
  'The length is multiplied by 4, so the distance is also multiplied by 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_009',
  'medium',
  'Which ratio is equivalent to 10:19?',
  '50:95','15:24','50:19','10:95',
  'A',
  'Multiply both terms by the same factor 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_010',
  'medium',
  'Complete the equivalent ratio: 11:21 = 66:x. What is x?',
  '27','126','66','105',
  'B',
  'The scale factor is 6, so x=21×6=126.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_011',
  'medium',
  'A recipe uses ingredients in the ratio 12:23. Which pair keeps exactly the same ratio?',
  '14 and 25','24 and 23','24 and 46','12 and 46',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_012',
  'medium',
  'A map uses 13 cm for 25 km. At the same scale, 39 cm represents how many kilometers?',
  '28','39','38','75',
  'D',
  'The length is multiplied by 3, so the distance is also multiplied by 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_013',
  'medium',
  'Which ratio is equivalent to 14:27?',
  '56:108','18:31','56:27','14:108',
  'A',
  'Multiply both terms by the same factor 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_014',
  'medium',
  'Complete the equivalent ratio: 15:29 = 75:x. What is x?',
  '34','145','75','116',
  'B',
  'The scale factor is 5, so x=29×5=145.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_015',
  'medium',
  'A recipe uses ingredients in the ratio 16:31. Which pair keeps exactly the same ratio?',
  '22 and 37','96 and 31','96 and 186','16 and 186',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_016',
  'medium',
  'A map uses 17 cm for 33 km. At the same scale, 34 cm represents how many kilometers?',
  '35','34','50','66',
  'D',
  'The length is multiplied by 2, so the distance is also multiplied by 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_017',
  'medium',
  'Which ratio is equivalent to 18:35?',
  '54:105','21:38','54:35','18:105',
  'A',
  'Multiply both terms by the same factor 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_018',
  'medium',
  'Complete the equivalent ratio: 19:37 = 76:x. What is x?',
  '41','148','76','111',
  'B',
  'The scale factor is 4, so x=37×4=148.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_019',
  'medium',
  'A recipe uses ingredients in the ratio 20:39. Which pair keeps exactly the same ratio?',
  '25 and 44','100 and 39','100 and 195','20 and 195',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_020',
  'challenge',
  'A map uses 21 cm for 41 km. At the same scale, 126 cm represents how many kilometers?',
  '47','126','62','246',
  'D',
  'The length is multiplied by 6, so the distance is also multiplied by 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_021',
  'challenge',
  'Which ratio is equivalent to 22:43?',
  '44:86','24:45','44:43','22:86',
  'A',
  'Multiply both terms by the same factor 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_022',
  'challenge',
  'Complete the equivalent ratio: 23:45 = 69:x. What is x?',
  '48','135','69','90',
  'B',
  'The scale factor is 3, so x=45×3=135.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_023',
  'challenge',
  'A recipe uses ingredients in the ratio 24:47. Which pair keeps exactly the same ratio?',
  '28 and 51','96 and 47','96 and 188','24 and 188',
  'C',
  'Equivalent ratios scale both quantities by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_024',
  'challenge',
  'A map uses 25 cm for 49 km. At the same scale, 125 cm represents how many kilometers?',
  '54','125','74','245',
  'D',
  'The length is multiplied by 5, so the distance is also multiplied by 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_EQUIVALENT_RATIOS_025',
  'challenge',
  'Which ratio is equivalent to 26:51?',
  '156:306','32:57','156:51','26:306',
  'A',
  'Multiply both terms by the same factor 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='EQUIVALENT_RATIOS';

-- RATIOS / UNIT_RATES — Unit Rates

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_001',
  'easy',
  '3 notebooks cost $6. What is the cost per notebook?',
  '$2','$3','$6','$2_1',
  'A',
  'Unit rate = total cost ÷ number of notebooks = 6 ÷ 3 = 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_002',
  'easy',
  'A cyclist travels 20 miles in 4 hours at a constant rate. What is the unit rate?',
  '4 miles per hour','5 miles per hour','20 miles per hour','16 miles per hour',
  'B',
  '20 ÷ 4 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_003',
  'easy',
  'A printer produces 35 pages in 5 minutes. How many pages per minute?',
  '35','5','7','30',
  'C',
  'Divide pages by minutes: 35 ÷ 5 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_004',
  'easy',
  'A package of 36 ounces costs $6. How many ounces are received per dollar?',
  '36','30','7','6',
  'D',
  'Unit rate = 36 ÷ 6 = 6 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_005',
  'easy',
  'Store A sells 7 pens for $42. Store B sells one pen for $7. Which store has the lower cost per pen?',
  'Store A','Store B','They cost the same','Not enough information',
  'A',
  'Store A costs $6 per pen, which is less than $7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_006',
  'easy',
  '8 notebooks cost $56. What is the cost per notebook?',
  '$8','$7','$56','$7_1',
  'B',
  'Unit rate = total cost ÷ number of notebooks = 56 ÷ 8 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_007',
  'easy',
  'A cyclist travels 15 miles in 3 hours at a constant rate. What is the unit rate?',
  '3 miles per hour','15 miles per hour','5 miles per hour','12 miles per hour',
  'C',
  '15 ÷ 3 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_008',
  'easy',
  'A printer produces 24 pages in 4 minutes. How many pages per minute?',
  '24','4','20','6',
  'D',
  'Divide pages by minutes: 24 ÷ 4 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_009',
  'medium',
  'A package of 15 ounces costs $5. How many ounces are received per dollar?',
  '3','5','15','10',
  'A',
  'Unit rate = 15 ÷ 5 = 3 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_010',
  'medium',
  'Store A sells 6 pens for $24. Store B sells one pen for $5. Which store has the lower cost per pen?',
  'Store B','Store A','They cost the same','Not enough information',
  'B',
  'Store A costs $4 per pen, which is less than $5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_011',
  'medium',
  '7 notebooks cost $35. What is the cost per notebook?',
  '$6','$35','$5','$7',
  'C',
  'Unit rate = total cost ÷ number of notebooks = 35 ÷ 7 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_012',
  'medium',
  'A cyclist travels 40 miles in 8 hours at a constant rate. What is the unit rate?',
  '8 miles per hour','40 miles per hour','32 miles per hour','5 miles per hour',
  'D',
  '40 ÷ 8 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_013',
  'medium',
  'A printer produces 15 pages in 3 minutes. How many pages per minute?',
  '5','15','3','12',
  'A',
  'Divide pages by minutes: 15 ÷ 3 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_014',
  'medium',
  'A package of 16 ounces costs $4. How many ounces are received per dollar?',
  '16','4','12','5',
  'B',
  'Unit rate = 16 ÷ 4 = 4 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_015',
  'medium',
  'Store A sells 5 pens for $10. Store B sells one pen for $3. Which store has the lower cost per pen?',
  'Store B','They cost the same','Store A','Not enough information',
  'C',
  'Store A costs $2 per pen, which is less than $3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_016',
  'medium',
  '6 notebooks cost $18. What is the cost per notebook?',
  '$4','$18','$6','$3',
  'D',
  'Unit rate = total cost ÷ number of notebooks = 18 ÷ 6 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_017',
  'medium',
  'A cyclist travels 35 miles in 7 hours at a constant rate. What is the unit rate?',
  '5 miles per hour','7 miles per hour','35 miles per hour','28 miles per hour',
  'A',
  '35 ÷ 7 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_018',
  'medium',
  'A printer produces 80 pages in 8 minutes. How many pages per minute?',
  '80','10','8','72',
  'B',
  'Divide pages by minutes: 80 ÷ 8 = 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_019',
  'medium',
  'A package of 15 ounces costs $3. How many ounces are received per dollar?',
  '3','15','5','12',
  'C',
  'Unit rate = 15 ÷ 3 = 5 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_020',
  'challenge',
  'Store A sells 4 pens for $28. Store B sells one pen for $8. Which store has the lower cost per pen?',
  'Store B','They cost the same','Not enough information','Store A',
  'D',
  'Store A costs $7 per pen, which is less than $8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_021',
  'challenge',
  '5 notebooks cost $40. What is the cost per notebook?',
  '$8','$9','$40','$5',
  'A',
  'Unit rate = total cost ÷ number of notebooks = 40 ÷ 5 = 8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_022',
  'challenge',
  'A cyclist travels 30 miles in 6 hours at a constant rate. What is the unit rate?',
  '6 miles per hour','5 miles per hour','30 miles per hour','24 miles per hour',
  'B',
  '30 ÷ 6 = 5 miles per hour.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_023',
  'challenge',
  'A printer produces 63 pages in 7 minutes. How many pages per minute?',
  '63','7','9','56',
  'C',
  'Divide pages by minutes: 63 ÷ 7 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_024',
  'challenge',
  'A package of 48 ounces costs $8. How many ounces are received per dollar?',
  '8','48','40','6',
  'D',
  'Unit rate = 48 ÷ 8 = 6 ounces per dollar.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_UNIT_RATES_025',
  'challenge',
  'Store A sells 3 pens for $15. Store B sells one pen for $6. Which store has the lower cost per pen?',
  'Store A','Store B','They cost the same','Not enough information',
  'A',
  'Store A costs $5 per pen, which is less than $6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='UNIT_RATES';

-- RATIOS / RATIO_TABLES — Ratio Tables

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_001',
  'easy',
  'A ratio table follows the relationship 2:3. If the first column entry is 4, what should the second entry be?',
  '6','5','4','7',
  'A',
  'Both entries are scaled by 2: 3 × 2 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_002',
  'easy',
  'Which pair belongs in a ratio table for 3:5?',
  '(6, 8)','(9, 15)','(9, 5)','(3, 15)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_003',
  'easy',
  'A table has pairs (4, 7), (8, 14), and (12, x). What is x?',
  '10','12','21','14',
  'C',
  'The third pair uses scale factor 3, so x = 7 × 3 = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_004',
  'easy',
  'In a ratio table, 20 corresponds to 36. What value corresponds to 5?',
  '36','5','13','9',
  'D',
  'Divide both entries by 4 to return to the base ratio 5:9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_005',
  'easy',
  'A ratio table follows the relationship 6:4. If the first column entry is 36, what should the second entry be?',
  '24','10','36','25',
  'A',
  'Both entries are scaled by 6: 4 × 6 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_006',
  'easy',
  'Which pair belongs in a ratio table for 2:6?',
  '(4, 8)','(4, 12)','(4, 6)','(2, 12)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_007',
  'easy',
  'A table has pairs (3, 8), (6, 16), and (9, x). What is x?',
  '11','9','24','16',
  'C',
  'The third pair uses scale factor 3, so x = 8 × 3 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_008',
  'easy',
  'In a ratio table, 16 corresponds to 12. What value corresponds to 4?',
  '12','4','7','3',
  'D',
  'Divide both entries by 4 to return to the base ratio 4:3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_009',
  'medium',
  'A ratio table follows the relationship 5:5. If the first column entry is 25, what should the second entry be?',
  '25','10','26','27',
  'A',
  'Both entries are scaled by 5: 5 × 5 = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_010',
  'medium',
  'Which pair belongs in a ratio table for 6:7?',
  '(12, 13)','(36, 42)','(36, 7)','(6, 42)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_011',
  'medium',
  'A table has pairs (2, 9), (4, 18), and (6, x). What is x?',
  '12','6','27','18',
  'C',
  'The third pair uses scale factor 3, so x = 9 × 3 = 27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_012',
  'medium',
  'In a ratio table, 12 corresponds to 16. What value corresponds to 3?',
  '16','3','8','4',
  'D',
  'Divide both entries by 4 to return to the base ratio 3:4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_013',
  'medium',
  'A ratio table follows the relationship 4:6. If the first column entry is 16, what should the second entry be?',
  '24','10','16','25',
  'A',
  'Both entries are scaled by 4: 6 × 4 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_014',
  'medium',
  'Which pair belongs in a ratio table for 5:8?',
  '(10, 13)','(25, 40)','(25, 8)','(5, 40)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_015',
  'medium',
  'A table has pairs (6, 3), (12, 6), and (18, x). What is x?',
  '6','18','9','10',
  'C',
  'The third pair uses scale factor 3, so x = 3 × 3 = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_016',
  'medium',
  'In a ratio table, 8 corresponds to 20. What value corresponds to 2?',
  '20','2','9','5',
  'D',
  'Divide both entries by 4 to return to the base ratio 2:5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_017',
  'medium',
  'A ratio table follows the relationship 3:7. If the first column entry is 9, what should the second entry be?',
  '21','10','9','22',
  'A',
  'Both entries are scaled by 3: 7 × 3 = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_018',
  'medium',
  'Which pair belongs in a ratio table for 4:9?',
  '(8, 13)','(16, 36)','(16, 9)','(4, 36)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_019',
  'medium',
  'A table has pairs (5, 4), (10, 8), and (15, x). What is x?',
  '7','15','12','8',
  'C',
  'The third pair uses scale factor 3, so x = 4 × 3 = 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_020',
  'challenge',
  'In a ratio table, 24 corresponds to 24. What value corresponds to 6?',
  '24','10','7','6',
  'D',
  'Divide both entries by 4 to return to the base ratio 6:6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_021',
  'challenge',
  'A ratio table follows the relationship 2:8. If the first column entry is 4, what should the second entry be?',
  '16','10','4','17',
  'A',
  'Both entries are scaled by 2: 8 × 2 = 16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_022',
  'challenge',
  'Which pair belongs in a ratio table for 3:3?',
  '(6, 6)','(9, 9)','(9, 3)','(3, 9)',
  'B',
  'Equivalent ratio-table pairs multiply both values by the same factor.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_023',
  'challenge',
  'A table has pairs (4, 5), (8, 10), and (12, x). What is x?',
  '8','12','15','10',
  'C',
  'The third pair uses scale factor 3, so x = 5 × 3 = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_024',
  'challenge',
  'In a ratio table, 20 corresponds to 28. What value corresponds to 5?',
  '28','5','11','7',
  'D',
  'Divide both entries by 4 to return to the base ratio 5:7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_RATIO_TABLES_025',
  'challenge',
  'A ratio table follows the relationship 6:9. If the first column entry is 36, what should the second entry be?',
  '54','15','36','55',
  'A',
  'Both entries are scaled by 6: 9 × 6 = 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='RATIO_TABLES';

-- RATIOS / PERCENT — Percent

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_001',
  'easy',
  'What is 10% of 40?',
  '4','36','9','10',
  'A',
  '10% = 0.1. Multiply 40 by 0.1 to get 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_002',
  'easy',
  '10 is what percent of 50?',
  '80%','20%','30%','50%',
  'B',
  '10 ÷ 50 = 0.2 = 20%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_003',
  'easy',
  'A shirt priced at $60 is discounted by 25%. What is the amount of the discount?',
  '$45','$25','$15','$15_1',
  'C',
  'Discount = 25% of $60 = $15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_004',
  'easy',
  'In a survey, 30% of 70 students chose option A. How many students chose option A?',
  '49','30','23','21',
  'D',
  '30% of 70 equals 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_005',
  'easy',
  'Which decimal is equivalent to 40%?',
  '0.4','4','2.5','0.6',
  'A',
  'Divide a percent by 100: 40% = 0.4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_006',
  'easy',
  'What is 50% of 90?',
  '50','45','46','47',
  'B',
  '50% = 0.5. Multiply 90 by 0.5 to get 45.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_007',
  'easy',
  '60 is what percent of 100?',
  '40%','70%','60%','100%',
  'C',
  '60 ÷ 100 = 0.6 = 60%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_008',
  'easy',
  'A shirt priced at $110 is discounted by 75%. What is the amount of the discount?',
  '$27.5','$75','$92.5','$82.5',
  'D',
  'Discount = 75% of $110 = $82.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_009',
  'medium',
  'In a survey, 10% of 120 students chose option A. How many students chose option A?',
  '12','108','10','14',
  'A',
  '10% of 120 equals 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_010',
  'medium',
  'Which decimal is equivalent to 20%?',
  '2','0.2','5','0.8',
  'B',
  'Divide a percent by 100: 20% = 0.2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_011',
  'medium',
  'What is 25% of 50?',
  '37.5','17.5','12.5','25',
  'C',
  '25% = 0.25. Multiply 50 by 0.25 to get 12.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_012',
  'medium',
  '18 is what percent of 60?',
  '70%','40%','60%','30%',
  'D',
  '18 ÷ 60 = 0.3 = 30%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_013',
  'medium',
  'A shirt priced at $70 is discounted by 40%. What is the amount of the discount?',
  '$28','$42','$40','$38',
  'A',
  'Discount = 40% of $70 = $28.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_014',
  'medium',
  'In a survey, 50% of 80 students chose option A. How many students chose option A?',
  '50','40','42','41',
  'B',
  '50% of 80 equals 40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_015',
  'medium',
  'Which decimal is equivalent to 60%?',
  '6','1.6667','0.6','0.4',
  'C',
  'Divide a percent by 100: 60% = 0.6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_016',
  'medium',
  'What is 75% of 100?',
  '25','80','76','75',
  'D',
  '75% = 0.75. Multiply 100 by 0.75 to get 75.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_017',
  'medium',
  '11 is what percent of 110?',
  '10%','90%','20%','110%',
  'A',
  '11 ÷ 110 = 0.1 = 10%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_018',
  'medium',
  'A shirt priced at $120 is discounted by 20%. What is the amount of the discount?',
  '$96','$24','$20','$34',
  'B',
  'Discount = 20% of $120 = $24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_019',
  'medium',
  'In a survey, 25% of 40 students chose option A. How many students chose option A?',
  '30','25','10','12',
  'C',
  '25% of 40 equals 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_020',
  'challenge',
  'Which decimal is equivalent to 30%?',
  '3','3.3333','0.7','0.3',
  'D',
  'Divide a percent by 100: 30% = 0.3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_021',
  'challenge',
  'What is 40% of 60?',
  '24','36','29','40',
  'A',
  '40% = 0.4. Multiply 60 by 0.4 to get 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_022',
  'challenge',
  '35 is what percent of 70?',
  '60%','50%','70%','50%_1',
  'B',
  '35 ÷ 70 = 0.5 = 50%.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_023',
  'challenge',
  'A shirt priced at $80 is discounted by 60%. What is the amount of the discount?',
  '$32','$60','$48','$58',
  'C',
  'Discount = 60% of $80 = $48.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_024',
  'challenge',
  'In a survey, 75% of 90 students chose option A. How many students chose option A?',
  '22.5','75','69.5','67.5',
  'D',
  '75% of 90 equals 67.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_RATIOS_PERCENT_025',
  'challenge',
  'Which decimal is equivalent to 10%?',
  '0.1','1','10','0.9',
  'A',
  'Divide a percent by 100: 10% = 0.1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='RATIOS'
  AND st.subtopic_code='PERCENT';

-- NUMBER_SYSTEM / FRACTIONS — Fraction Operations

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_001',
  'easy',
  'What is 1/3 + 1/5 in simplest form?',
  '8/15','2/15','1/4','3/5',
  'A',
  'Use a common denominator and simplify: 1/3 + 1/5 = 8/15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_002',
  'easy',
  'What is 3/4 - 4/7 in simplest form?',
  '37/28','5/28','1/11','3/14',
  'B',
  'Use a common denominator and subtract. The simplified result is 5/28.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_003',
  'easy',
  'What is 1/5 × 7/9 in simplest form?',
  '44/45','1/2','7/45','8/45',
  'C',
  'Multiply numerators and denominators, then simplify to 7/45.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_004',
  'easy',
  'What is 1/3 ÷ 10/11 in simplest form?',
  '10/33','30/11','41/33','11/30',
  'D',
  'Multiply by the reciprocal: 1/3 × 11/10 = 11/30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_005',
  'easy',
  'Maya walked 3/7 mile in the morning and 1/13 mile in the evening. How far did she walk in all?',
  '46/91 mile','32/91 mile','3/91 mile','3/7 mile',
  'A',
  'Add the distances: 3/7 + 1/13 = 46/91 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_006',
  'easy',
  'What is 1/2 + 2/15 in simplest form?',
  '11/30','19/30','6/23','77/120',
  'B',
  'Use a common denominator and simplify: 1/2 + 2/15 = 19/30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_007',
  'easy',
  'What is 5/9 - 3/17 in simplest form?',
  '112/153','1/13','58/153','59/153',
  'C',
  'Use a common denominator and subtract. The simplified result is 58/153.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_008',
  'easy',
  'What is 3/5 × 4/19 in simplest form?',
  '77/95','24/29','5/38','12/95',
  'D',
  'Multiply numerators and denominators, then simplify to 12/95.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_009',
  'medium',
  'What is 7/11 ÷ 5/21 in simplest form?',
  '147/55','5/33','55/147','202/231',
  'A',
  'Multiply by the reciprocal: 7/11 × 21/5 = 147/55.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_010',
  'medium',
  'Maya walked 2/3 mile in the morning and 6/23 mile in the evening. How far did she walk in all?',
  '28/69 mile','64/69 mile','4/23 mile','2/3 mile',
  'B',
  'Add the distances: 2/3 + 6/23 = 64/69 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_011',
  'medium',
  'What is 9/13 + 7/25 in simplest form?',
  '134/325','8/19','316/325','317/325',
  'C',
  'Use a common denominator and simplify: 9/13 + 7/25 = 316/325.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_012',
  'medium',
  'What is 5/7 - 8/27 in simplest form?',
  '191/189','3/34','53/126','79/189',
  'D',
  'Use a common denominator and subtract. The simplified result is 79/189.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_013',
  'medium',
  'What is 11/15 × 9/29 in simplest form?',
  '33/145','454/435','9/4','20/87',
  'A',
  'Multiply numerators and denominators, then simplify to 33/145.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_014',
  'medium',
  'What is 3/4 ÷ 10/31 in simplest form?',
  '15/62','93/40','40/93','133/124',
  'B',
  'Multiply by the reciprocal: 3/4 × 31/10 = 93/40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_015',
  'medium',
  'Maya walked 13/17 mile in the morning and 1/3 mile in the evening. How far did she walk in all?',
  '22/51 mile','13/51 mile','56/51 mile','13/17 mile',
  'C',
  'Add the distances: 13/17 + 1/3 = 56/51 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_016',
  'medium',
  'What is 7/9 + 12/35 in simplest form?',
  '137/315','26/53','101/90','353/315',
  'D',
  'Use a common denominator and simplify: 7/9 + 12/35 = 353/315.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_017',
  'medium',
  'What is 15/19 - 13/37 in simplest form?',
  '308/703','802/703','1/28','309/703',
  'A',
  'Use a common denominator and subtract. The simplified result is 308/703.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_018',
  'medium',
  'What is 4/5 × 14/39 in simplest form?',
  '226/195','56/195','224/59','15/52',
  'B',
  'Multiply numerators and denominators, then simplify to 56/195.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_019',
  'medium',
  'What is 17/21 ÷ 15/41 in simplest form?',
  '85/287','315/697','697/315','1012/861',
  'C',
  'Multiply by the reciprocal: 17/21 × 41/15 = 697/315.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_020',
  'challenge',
  'Maya walked 9/11 mile in the morning and 16/43 mile in the evening. How far did she walk in all?',
  '211/473 mile','144/473 mile','9/11 mile','563/473 mile',
  'D',
  'Add the distances: 9/11 + 16/43 = 563/473 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_021',
  'challenge',
  'What is 19/23 + 17/45 in simplest form?',
  '1246/1035','464/1035','9/17','1247/1035',
  'A',
  'Use a common denominator and simplify: 19/23 + 17/45 = 1246/1035.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_022',
  'challenge',
  'What is 5/6 - 18/47 in simplest form?',
  '343/282','127/282','13/53','509/1128',
  'B',
  'Use a common denominator and subtract. The simplified result is 127/282.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_023',
  'challenge',
  'What is 21/25 × 19/49 in simplest form?',
  '1504/1225','399/74','57/175','16/49',
  'C',
  'Multiply numerators and denominators, then simplify to 57/175.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_024',
  'challenge',
  'What is 11/13 ÷ 20/51 in simplest form?',
  '220/663','260/561','821/663','561/260',
  'D',
  'Multiply by the reciprocal: 11/13 × 51/20 = 561/260.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_FRACTIONS_025',
  'challenge',
  'Maya walked 23/27 mile in the morning and 21/53 mile in the evening. How far did she walk in all?',
  '1786/1431 mile','652/1431 mile','161/477 mile','23/27 mile',
  'A',
  'Add the distances: 23/27 + 21/53 = 1786/1431 mile.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='FRACTIONS';

-- NUMBER_SYSTEM / DECIMALS — Decimal Operations

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_001',
  'easy',
  'What is 1.15 + 0.55?',
  '1.7','0.6','1.8','1.6',
  'A',
  'Align decimal points and add to get 1.7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_002',
  'easy',
  'What is 1.32 - 0.66?',
  '1.98','0.66','0.76','0.56',
  'B',
  'Align decimal points and subtract to get 0.66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_003',
  'easy',
  'What is 1.49 × 4?',
  '5.49','6.96','5.96','1.96',
  'C',
  'Multiply 1.49 by 4 to get 5.96.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_004',
  'easy',
  '8.3 ÷ 5 = ?',
  '5','8.3','2.66','1.66',
  'D',
  'Division reverses multiplication: 8.3 ÷ 5 = 1.66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_005',
  'easy',
  'Which number is greater: 1.83 or 0.99?',
  '1.83','0.99','They are equal','Cannot be determined',
  'A',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_006',
  'easy',
  'What is 2 + 1.1?',
  '0.9','3.1','3.2','3',
  'B',
  'Align decimal points and add to get 3.1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_007',
  'easy',
  'What is 2.17 - 1.21?',
  '3.38','1.06','0.96','0.86',
  'C',
  'Align decimal points and subtract to get 0.96.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_008',
  'easy',
  'What is 2.34 × 4?',
  '6.34','10.36','5.36','9.36',
  'D',
  'Multiply 2.34 by 4 to get 9.36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_009',
  'medium',
  '5.02 ÷ 2 = ?',
  '2.51','2','5.02','3.51',
  'A',
  'Division reverses multiplication: 5.02 ÷ 2 = 2.51.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_010',
  'medium',
  'Which number is greater: 2.68 or 1.54?',
  '1.54','2.68','They are equal','Cannot be determined',
  'B',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_011',
  'medium',
  'What is 2.85 + 1.65?',
  '1.2','4.6','4.5','4.4',
  'C',
  'Align decimal points and add to get 4.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_012',
  'medium',
  'What is 3.02 - 1.76?',
  '4.78','1.36','1.16','1.26',
  'D',
  'Align decimal points and subtract to get 1.26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_013',
  'medium',
  'What is 3.19 × 4?',
  '12.76','7.19','13.76','8.76',
  'A',
  'Multiply 3.19 by 4 to get 12.76.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_014',
  'medium',
  '10.08 ÷ 3 = ?',
  '3','3.36','10.08','4.36',
  'B',
  'Division reverses multiplication: 10.08 ÷ 3 = 3.36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_015',
  'medium',
  'Which number is greater: 3.53 or 2.09?',
  '2.09','They are equal','3.53','Cannot be determined',
  'C',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_016',
  'medium',
  'What is 3.7 + 2.2?',
  '1.5','6','5.8','5.9',
  'D',
  'Align decimal points and add to get 5.9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_017',
  'medium',
  'What is 3.87 - 2.31?',
  '1.56','6.18','1.66','1.46',
  'A',
  'Align decimal points and subtract to get 1.56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_018',
  'medium',
  'What is 4.04 × 4?',
  '8.04','16.16','17.16','12.16',
  'B',
  'Multiply 4.04 by 4 to get 16.16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_019',
  'medium',
  '16.84 ÷ 4 = ?',
  '4','16.84','4.21','5.21',
  'C',
  'Division reverses multiplication: 16.84 ÷ 4 = 4.21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_020',
  'challenge',
  'Which number is greater: 4.38 or 2.64?',
  '2.64','They are equal','Cannot be determined','4.38',
  'D',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_021',
  'challenge',
  'What is 4.55 + 2.75?',
  '7.3','1.8','7.4','7.2',
  'A',
  'Align decimal points and add to get 7.3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_022',
  'challenge',
  'What is 4.72 - 2.86?',
  '7.58','1.86','1.96','1.76',
  'B',
  'Align decimal points and subtract to get 1.86.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_023',
  'challenge',
  'What is 4.89 × 4?',
  '8.89','20.56','19.56','15.56',
  'C',
  'Multiply 4.89 by 4 to get 19.56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_024',
  'challenge',
  '25.3 ÷ 5 = ?',
  '5','25.3','6.06','5.06',
  'D',
  'Division reverses multiplication: 25.3 ÷ 5 = 5.06.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_DECIMALS_025',
  'challenge',
  'Which number is greater: 5.23 or 3.19?',
  '5.23','3.19','They are equal','Cannot be determined',
  'A',
  'Compare place values from left to right.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='DECIMALS';

-- NUMBER_SYSTEM / INTEGERS — Integers

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_001',
  'easy',
  'What is 3 + (2)?',
  '5','1','-5','6',
  'A',
  'Combine signed numbers to get 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_002',
  'easy',
  'What is -4 - (-4)?',
  '-8','0','1','2',
  'B',
  'Subtracting -4 gives 0.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_003',
  'easy',
  'What is 5 × (-6)?',
  '30','-1','-30','-29',
  'C',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_004',
  'easy',
  'Which integer is greater: -6 or 8?',
  '-6','0','They are equal','8',
  'D',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_005',
  'easy',
  'The temperature is -1°C and drops 6°C. What is the new temperature?',
  '-7°C','5°C','7°C','-1°C',
  'A',
  'A drop means add -6: -1 + (-6) = -7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_006',
  'easy',
  'What is -8 + (-4)?',
  '-4','-12','12','-11',
  'B',
  'Combine signed numbers to get -12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_007',
  'easy',
  'What is 9 - (6)?',
  '15','-3','3','4',
  'C',
  'Subtracting 6 gives 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_008',
  'easy',
  'What is -10 × (-8)?',
  '-80','-18','81','80',
  'D',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_009',
  'medium',
  'Which integer is greater: 11 or -2?',
  '11','-2','0','They are equal',
  'A',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_010',
  'medium',
  'The temperature is -4°C and drops 6°C. What is the new temperature?',
  '2°C','-10°C','10°C','-4°C',
  'B',
  'A drop means add -6: -4 + (-6) = -10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_011',
  'medium',
  'What is 4 + (-6)?',
  '10','2','-2','-1',
  'C',
  'Combine signed numbers to get -2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_012',
  'medium',
  'What is -5 - (-8)?',
  '-13','-3','4','3',
  'D',
  'Subtracting -8 gives 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_013',
  'medium',
  'What is 6 × (2)?',
  '12','-12','8','13',
  'A',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_014',
  'medium',
  'Which integer is greater: -7 or -4?',
  '-7','-4','0','They are equal',
  'B',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_015',
  'medium',
  'The temperature is 1°C and drops 6°C. What is the new temperature?',
  '7°C','5°C','-5°C','1°C',
  'C',
  'A drop means add -6: 1 + (-6) = -5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_016',
  'medium',
  'What is -9 + (8)?',
  '-17','1','17','-1',
  'D',
  'Combine signed numbers to get -1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_017',
  'medium',
  'What is 10 - (-2)?',
  '12','8','-12','13',
  'A',
  'Subtracting -2 gives 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_018',
  'medium',
  'What is -11 × (-4)?',
  '-44','44','-15','45',
  'B',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_019',
  'medium',
  'Which integer is greater: 3 or 6?',
  '3','0','6','They are equal',
  'C',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_020',
  'challenge',
  'The temperature is -2°C and drops 6°C. What is the new temperature?',
  '4°C','8°C','-2°C','-8°C',
  'D',
  'A drop means add -6: -2 + (-6) = -8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_021',
  'challenge',
  'What is 5 + (-2)?',
  '3','7','-3','4',
  'A',
  'Combine signed numbers to get 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_022',
  'challenge',
  'What is -6 - (4)?',
  '-2','-10','10','11',
  'B',
  'Subtracting 4 gives -10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_023',
  'challenge',
  'What is 7 × (-6)?',
  '42','1','-42','-41',
  'C',
  'Apply integer sign rules, then multiply absolute values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_024',
  'challenge',
  'Which integer is greater: -8 or -8?',
  '0','They are equal','-7','-8',
  'D',
  'On a number line, the number farther right is greater.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_INTEGERS_025',
  'challenge',
  'The temperature is -5°C and drops 6°C. What is the new temperature?',
  '-11°C','1°C','11°C','-5°C',
  'A',
  'A drop means add -6: -5 + (-6) = -11.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='INTEGERS';

-- NUMBER_SYSTEM / GCF_LCM — GCF & LCM

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_001',
  'easy',
  'What is the greatest common factor of 6 and 9?',
  '3','4','2','18',
  'A',
  'The greatest number dividing both 6 and 9 is 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_002',
  'easy',
  'What is the least common multiple of 8 and 12?',
  '20','24','4','12',
  'B',
  'The least positive multiple shared by both numbers is 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_003',
  'easy',
  'Two lights flash every 10 seconds and every 15 seconds. If they flash together now, after how many seconds will they flash together again?',
  '5','25','30','15',
  'C',
  'This is an LCM problem. LCM(10,15) = 30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_004',
  'easy',
  'You have 12 red beads and 18 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '36','12','30','6',
  'D',
  'The number of groups must divide both counts, so use GCF(12,18) = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_005',
  'easy',
  'What is the greatest common factor of 14 and 21?',
  '7','8','6','42',
  'A',
  'The greatest number dividing both 14 and 21 is 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_006',
  'easy',
  'What is the least common multiple of 16 and 24?',
  '40','48','8','24',
  'B',
  'The least positive multiple shared by both numbers is 48.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_007',
  'easy',
  'Two lights flash every 18 seconds and every 27 seconds. If they flash together now, after how many seconds will they flash together again?',
  '9','45','54','27',
  'C',
  'This is an LCM problem. LCM(18,27) = 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_008',
  'easy',
  'You have 20 red beads and 9 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '180','9','29','1',
  'D',
  'The number of groups must divide both counts, so use GCF(20,9) = 1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_009',
  'medium',
  'What is the greatest common factor of 6 and 12?',
  '6','7','5','12',
  'A',
  'The greatest number dividing both 6 and 12 is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_010',
  'medium',
  'What is the least common multiple of 8 and 15?',
  '23','120','1','15',
  'B',
  'The least positive multiple shared by both numbers is 120.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_011',
  'medium',
  'Two lights flash every 10 seconds and every 18 seconds. If they flash together now, after how many seconds will they flash together again?',
  '2','28','90','18',
  'C',
  'This is an LCM problem. LCM(10,18) = 90.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_012',
  'medium',
  'You have 12 red beads and 21 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '84','12','33','3',
  'D',
  'The number of groups must divide both counts, so use GCF(12,21) = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_013',
  'medium',
  'What is the greatest common factor of 14 and 24?',
  '2','3','1','168',
  'A',
  'The greatest number dividing both 14 and 24 is 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_014',
  'medium',
  'What is the least common multiple of 16 and 27?',
  '43','432','1','27',
  'B',
  'The least positive multiple shared by both numbers is 432.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_015',
  'medium',
  'Two lights flash every 18 seconds and every 9 seconds. If they flash together now, after how many seconds will they flash together again?',
  '9','27','18','19',
  'C',
  'This is an LCM problem. LCM(18,9) = 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_016',
  'medium',
  'You have 20 red beads and 12 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '60','12','32','4',
  'D',
  'The number of groups must divide both counts, so use GCF(20,12) = 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_017',
  'medium',
  'What is the greatest common factor of 6 and 15?',
  '3','4','2','30',
  'A',
  'The greatest number dividing both 6 and 15 is 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_018',
  'medium',
  'What is the least common multiple of 8 and 18?',
  '26','72','2','18',
  'B',
  'The least positive multiple shared by both numbers is 72.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_019',
  'medium',
  'Two lights flash every 10 seconds and every 21 seconds. If they flash together now, after how many seconds will they flash together again?',
  '1','31','210','21',
  'C',
  'This is an LCM problem. LCM(10,21) = 210.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_020',
  'challenge',
  'You have 12 red beads and 24 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '24','36','13','12',
  'D',
  'The number of groups must divide both counts, so use GCF(12,24) = 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_021',
  'challenge',
  'What is the greatest common factor of 14 and 27?',
  '1','2','378','3',
  'A',
  'The greatest number dividing both 14 and 27 is 1.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_022',
  'challenge',
  'What is the least common multiple of 16 and 9?',
  '25','144','1','16',
  'B',
  'The least positive multiple shared by both numbers is 144.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_023',
  'challenge',
  'Two lights flash every 18 seconds and every 12 seconds. If they flash together now, after how many seconds will they flash together again?',
  '6','30','36','18',
  'C',
  'This is an LCM problem. LCM(18,12) = 36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_024',
  'challenge',
  'You have 20 red beads and 15 blue beads and want identical groups with no beads left over. What is the greatest possible number of groups?',
  '60','15','35','5',
  'D',
  'The number of groups must divide both counts, so use GCF(20,15) = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_GCF_LCM_025',
  'challenge',
  'What is the greatest common factor of 6 and 18?',
  '6','7','5','18',
  'A',
  'The greatest number dividing both 6 and 18 is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='GCF_LCM';

-- NUMBER_SYSTEM / COORDINATE_PLANE — Coordinate Plane

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_001',
  'easy',
  'Where is the point (-5, -4) located?',
  'Quadrant III','Quadrant I','Quadrant II','Quadrant IV',
  'A',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_002',
  'easy',
  'What is the x-coordinate of the point (-4, -2)?',
  '-2','-4','4','2',
  'B',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_003',
  'easy',
  'What is the y-coordinate of the point (-3, 0)?',
  '-3','3','0','1',
  'C',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_004',
  'easy',
  'Starting at (-2, 2), move 5 units to the right. What is the new point?',
  '(-7, 2)','(-2, 7)','(-2, -3)','(3, 2)',
  'D',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_005',
  'easy',
  'Starting at (-1, 4), move 2 units up. What is the new point?',
  '(-1, 6)','(-1, 2)','(1, 4)','(-3, 4)',
  'A',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_006',
  'easy',
  'Where is the point (0, -3) located?',
  'Quadrant I','an axis','Quadrant II','Quadrant III',
  'B',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_007',
  'easy',
  'What is the x-coordinate of the point (1, -1)?',
  '-1','2','1','3',
  'C',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_008',
  'easy',
  'What is the y-coordinate of the point (2, 1)?',
  '2','-2','-1','1',
  'D',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_009',
  'medium',
  'Starting at (3, 3), move 2 units to the right. What is the new point?',
  '(5, 3)','(1, 3)','(3, 5)','(3, 1)',
  'A',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_010',
  'medium',
  'Starting at (4, -4), move 3 units up. What is the new point?',
  '(4, -7)','(4, -1)','(7, -4)','(1, -4)',
  'B',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_011',
  'medium',
  'Where is the point (5, -2) located?',
  'Quadrant I','Quadrant II','Quadrant IV','Quadrant III',
  'C',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_012',
  'medium',
  'What is the x-coordinate of the point (-5, 0)?',
  '0','5','-4','-5',
  'D',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_013',
  'medium',
  'What is the y-coordinate of the point (-4, 2)?',
  '2','-4','4','-2',
  'A',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_014',
  'medium',
  'Starting at (-3, 4), move 3 units to the right. What is the new point?',
  '(-6, 4)','(0, 4)','(-3, 7)','(-3, 1)',
  'B',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_015',
  'medium',
  'Starting at (-2, -3), move 4 units up. What is the new point?',
  '(-2, -7)','(2, -3)','(-2, 1)','(-6, -3)',
  'C',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_016',
  'medium',
  'Where is the point (-1, -1) located?',
  'Quadrant I','Quadrant II','Quadrant IV','Quadrant III',
  'D',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_017',
  'medium',
  'What is the x-coordinate of the point (0, 1)?',
  '0','1','-1','2',
  'A',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_018',
  'medium',
  'What is the y-coordinate of the point (1, 3)?',
  '1','3','-1','-3',
  'B',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_019',
  'medium',
  'Starting at (2, -4), move 4 units to the right. What is the new point?',
  '(-2, -4)','(2, 0)','(6, -4)','(2, -8)',
  'C',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_020',
  'challenge',
  'Starting at (3, -2), move 5 units up. What is the new point?',
  '(3, -7)','(8, -2)','(-2, -2)','(3, 3)',
  'D',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_021',
  'challenge',
  'Where is the point (4, 0) located?',
  'an axis','Quadrant I','Quadrant II','Quadrant III',
  'A',
  'The signs of x and y determine the quadrant.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_022',
  'challenge',
  'What is the x-coordinate of the point (5, 2)?',
  '2','5','-5','-2',
  'B',
  'The x-coordinate is the first number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_023',
  'challenge',
  'What is the y-coordinate of the point (-5, 4)?',
  '-5','5','4','-4',
  'C',
  'The y-coordinate is the second number in an ordered pair.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_024',
  'challenge',
  'Starting at (-4, -3), move 5 units to the right. What is the new point?',
  '(-9, -3)','(-4, 2)','(-4, -8)','(1, -3)',
  'D',
  'Moving right increases only the x-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_NUMBER_SYSTEM_COORDINATE_PLANE_025',
  'challenge',
  'Starting at (-3, -1), move 2 units up. What is the new point?',
  '(-3, 1)','(-3, -3)','(-1, -1)','(-5, -1)',
  'A',
  'Moving up increases only the y-coordinate.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='NUMBER_SYSTEM'
  AND st.subtopic_code='COORDINATE_PLANE';

-- EXPRESSIONS / EXPRESSIONS — Writing & Evaluating Expressions

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_001',
  'easy',
  'Evaluate 2x + 1 when x = 2.',
  '5','3','4','6',
  'A',
  'Substitute x=2: 2(2)+1=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_002',
  'easy',
  'Which expression means ''3 times a number n, then add 4''?',
  '3(n+4)','3n + 4','n + 7','4n + 3',
  'B',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_003',
  'easy',
  'How many terms are in the expression 4x + 7y - 4?',
  '1','2','3','4',
  'C',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_004',
  'easy',
  'In the expression 5x + 3, what is the coefficient of x?',
  '3','8','6','5',
  'D',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_005',
  'easy',
  'Evaluate 6(x + 6) when x = 6.',
  '72','42','18','0',
  'A',
  'First evaluate the parentheses, then multiply: 6(12)=72.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_006',
  'easy',
  'Evaluate 2x + 2 when x = 7.',
  '11','16','12','17',
  'B',
  'Substitute x=7: 2(7)+2=16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_007',
  'easy',
  'Which expression means ''3 times a number n, then add 5''?',
  '3(n+5)','n + 8','3n + 5','5n + 3',
  'C',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_008',
  'easy',
  'How many terms are in the expression 4x + 1y - 3?',
  '1','2','4','3',
  'D',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_009',
  'medium',
  'In the expression 5x + 4, what is the coefficient of x?',
  '5','4','9','6',
  'A',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_010',
  'medium',
  'Evaluate 6(x + 7) when x = 5.',
  '37','72','18','-12',
  'B',
  'First evaluate the parentheses, then multiply: 6(12)=72.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_011',
  'medium',
  'Evaluate 2x + 3 when x = 6.',
  '11','9','15','20',
  'C',
  'Substitute x=6: 2(6)+3=15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_012',
  'medium',
  'Which expression means ''3 times a number n, then add 6''?',
  '3(n+6)','n + 9','6n + 3','3n + 6',
  'D',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_013',
  'medium',
  'How many terms are in the expression 4x + 2y - 2?',
  '3','1','2','4',
  'A',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_014',
  'medium',
  'In the expression 5x + 5, what is the coefficient of x?',
  '3','5','10','6',
  'B',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_015',
  'medium',
  'Evaluate 6(x + 1) when x = 4.',
  '25','11','30','18',
  'C',
  'First evaluate the parentheses, then multiply: 6(5)=30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_016',
  'medium',
  'Evaluate 2x + 4 when x = 5.',
  '11','6','22','14',
  'D',
  'Substitute x=5: 2(5)+4=14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_017',
  'medium',
  'Which expression means ''3 times a number n, then add 7''?',
  '3n + 7','3(n+7)','n + 10','7n + 3',
  'A',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_018',
  'medium',
  'How many terms are in the expression 4x + 3y - 7?',
  '1','3','2','4',
  'B',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_019',
  'medium',
  'In the expression 5x + 6, what is the coefficient of x?',
  '6','2','5','11',
  'C',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_020',
  'challenge',
  'Evaluate 6(x + 2) when x = 3.',
  '20','11','6','30',
  'D',
  'First evaluate the parentheses, then multiply: 6(5)=30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_021',
  'challenge',
  'Evaluate 2x + 5 when x = 4.',
  '13','11','3','22',
  'A',
  'Substitute x=4: 2(4)+5=13.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_022',
  'challenge',
  'Which expression means ''3 times a number n, then add 1''?',
  '3(n+1)','3n + 1','n + 4','1n + 3',
  'B',
  'Translate ''times'' as multiplication and ''then add'' as addition.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_023',
  'challenge',
  'How many terms are in the expression 4x + 4y - 6?',
  '1','2','3','4',
  'C',
  'Terms are separated by addition or subtraction signs.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_024',
  'challenge',
  'In the expression 5x + 7, what is the coefficient of x?',
  '7','12','6','5',
  'D',
  'The coefficient is the numerical factor multiplying the variable.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_EXPRESSIONS_025',
  'challenge',
  'Evaluate 6(x + 3) when x = 2.',
  '30','15','11','-6',
  'A',
  'First evaluate the parentheses, then multiply: 6(5)=30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='EXPRESSIONS';

-- EXPRESSIONS / DISTRIBUTIVE — Distributive Property

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_001',
  'easy',
  'Use the distributive property to simplify 2(1x + 2).',
  '2x + 4','3x + 4','2x + 2','1x + 4',
  'A',
  'Multiply 2 by each term: 2·1x + 2·2 = 2x + 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_002',
  'easy',
  'Which expression is equivalent to 3x + 15?',
  '3(x + 15)','3(x + 5)','5(x + 3)','x(8)',
  'B',
  'Factor out the common factor 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_003',
  'easy',
  'Evaluate 4(5 + 8) using the distributive property.',
  '28','17','52','37',
  'C',
  '4·5 + 4·8 = 52.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_004',
  'easy',
  'A student says 5(1x + 4) = 5x + 4. What did the student forget?',
  'To add 5 and 1','To divide by 5','Nothing; the work is correct','To multiply 4 by 5',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_005',
  'easy',
  'Use the distributive property to simplify 6(3x + 7).',
  '18x + 42','9x + 13','18x + 7','3x + 42',
  'A',
  'Multiply 6 by each term: 6·3x + 6·7 = 18x + 42.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_006',
  'easy',
  'Which expression is equivalent to 2x + 6?',
  '2(x + 6)','2(x + 3)','3(x + 2)','x(5)',
  'B',
  'Factor out the common factor 2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_007',
  'easy',
  'Evaluate 3(1 + 6) using the distributive property.',
  '9','10','21','19',
  'C',
  '3·1 + 3·6 = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_008',
  'easy',
  'A student says 4(3x + 2) = 12x + 2. What did the student forget?',
  'To add 4 and 3','To divide by 4','Nothing; the work is correct','To multiply 2 by 4',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_009',
  'medium',
  'Use the distributive property to simplify 5(5x + 5).',
  '25x + 25','10x + 10','25x + 5','5x + 25',
  'A',
  'Multiply 5 by each term: 5·5x + 5·5 = 25x + 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_010',
  'medium',
  'Which expression is equivalent to 6x + 48?',
  '6(x + 48)','6(x + 8)','8(x + 6)','x(14)',
  'B',
  'Factor out the common factor 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_011',
  'medium',
  'Evaluate 2(3 + 4) using the distributive property.',
  '10','9','14','11',
  'C',
  '2·3 + 2·4 = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_012',
  'medium',
  'A student says 3(5x + 7) = 15x + 7. What did the student forget?',
  'To add 3 and 5','To divide by 3','Nothing; the work is correct','To multiply 7 by 3',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_013',
  'medium',
  'Use the distributive property to simplify 4(1x + 3).',
  '4x + 12','5x + 7','4x + 3','1x + 12',
  'A',
  'Multiply 4 by each term: 4·1x + 4·3 = 4x + 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_014',
  'medium',
  'Which expression is equivalent to 5x + 30?',
  '5(x + 30)','5(x + 6)','6(x + 5)','x(11)',
  'B',
  'Factor out the common factor 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_015',
  'medium',
  'Evaluate 6(5 + 2) using the distributive property.',
  '32','13','42','17',
  'C',
  '6·5 + 6·2 = 42.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_016',
  'medium',
  'A student says 2(1x + 5) = 2x + 5. What did the student forget?',
  'To add 2 and 1','To divide by 2','Nothing; the work is correct','To multiply 5 by 2',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_017',
  'medium',
  'Use the distributive property to simplify 3(3x + 8).',
  '9x + 24','6x + 11','9x + 8','3x + 24',
  'A',
  'Multiply 3 by each term: 3·3x + 3·8 = 9x + 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_018',
  'medium',
  'Which expression is equivalent to 4x + 16?',
  '4(x + 16)','4(x + 4)','x(8)','4(x + 4)_1',
  'B',
  'Factor out the common factor 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_019',
  'medium',
  'Evaluate 5(1 + 7) using the distributive property.',
  '12','13','40','36',
  'C',
  '5·1 + 5·7 = 40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_020',
  'challenge',
  'A student says 6(3x + 3) = 18x + 3. What did the student forget?',
  'To add 6 and 3','To divide by 6','Nothing; the work is correct','To multiply 3 by 6',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_021',
  'challenge',
  'Use the distributive property to simplify 2(5x + 6).',
  '10x + 12','7x + 8','10x + 6','5x + 12',
  'A',
  'Multiply 2 by each term: 2·5x + 2·6 = 10x + 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_022',
  'challenge',
  'Which expression is equivalent to 3x + 6?',
  '3(x + 6)','3(x + 2)','2(x + 3)','x(5)',
  'B',
  'Factor out the common factor 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_023',
  'challenge',
  'Evaluate 4(3 + 5) using the distributive property.',
  '17','12','32','23',
  'C',
  '4·3 + 4·5 = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_024',
  'challenge',
  'A student says 5(5x + 8) = 25x + 8. What did the student forget?',
  'To add 5 and 5','To divide by 5','Nothing; the work is correct','To multiply 8 by 5',
  'D',
  'The outside factor must multiply every term inside the parentheses.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DISTRIBUTIVE_025',
  'challenge',
  'Use the distributive property to simplify 6(1x + 4).',
  '6x + 24','7x + 10','6x + 4','1x + 24',
  'A',
  'Multiply 6 by each term: 6·1x + 6·4 = 6x + 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DISTRIBUTIVE';

-- EXPRESSIONS / ONE_STEP_EQUATIONS — One-Step Equations

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_001',
  'easy',
  'Solve x + 2 = 4.',
  '2','4','6','3',
  'A',
  'Subtract 2 from both sides to get x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_002',
  'easy',
  'Solve x - 3 = 0.',
  '0','3','-3','4',
  'B',
  'Add 3 to both sides to get x=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_003',
  'easy',
  'Solve 4x = 16.',
  '16','12','4','5',
  'C',
  'Divide both sides by 4: x=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_004',
  'easy',
  'Solve x/5 = 5.',
  '5','30','26','25',
  'D',
  'Multiply both sides by 5: x=25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_005',
  'easy',
  'Sam had some marbles. After receiving 5 more, Sam had 11. How many marbles did Sam start with?',
  '6','5','11','16',
  'A',
  'Let x be the starting amount: x+5=11, so x=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_006',
  'easy',
  'Solve x + 7 = 14.',
  '14','7','21','8',
  'B',
  'Subtract 7 from both sides to get x=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_007',
  'easy',
  'Solve x - 8 = 0.',
  '0','-8','8','9',
  'C',
  'Add 8 to both sides to get x=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_008',
  'easy',
  'Solve 9x = 18.',
  '9','18','3','2',
  'D',
  'Divide both sides by 9: x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_009',
  'medium',
  'Solve x/2 = 3.',
  '6','3','2','8',
  'A',
  'Multiply both sides by 2: x=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_010',
  'medium',
  'Sam had some marbles. After receiving 10 more, Sam had 14. How many marbles did Sam start with?',
  '10','4','14','24',
  'B',
  'Let x be the starting amount: x+10=14, so x=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_011',
  'medium',
  'Solve x + 4 = 9.',
  '9','4','5','13',
  'C',
  'Subtract 4 from both sides to get x=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_012',
  'medium',
  'Solve x - 5 = 1.',
  '1','5','-4','6',
  'D',
  'Add 5 to both sides to get x=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_013',
  'medium',
  'Solve 6x = 42.',
  '7','6','42','36',
  'A',
  'Divide both sides by 6: x=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_014',
  'medium',
  'Solve x/7 = 8.',
  '8','56','7','63',
  'B',
  'Multiply both sides by 7: x=56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_015',
  'medium',
  'Sam had some marbles. After receiving 5 more, Sam had 7. How many marbles did Sam start with?',
  '5','7','2','12',
  'C',
  'Let x be the starting amount: x+5=7, so x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_016',
  'medium',
  'Solve x + 9 = 12.',
  '12','9','21','3',
  'D',
  'Subtract 9 from both sides to get x=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_017',
  'medium',
  'Solve x - 2 = 2.',
  '4','2','0','5',
  'A',
  'Add 2 to both sides to get x=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_018',
  'medium',
  'Solve 3x = 15.',
  '3','5','15','12',
  'B',
  'Divide both sides by 3: x=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_019',
  'medium',
  'Solve x/4 = 6.',
  '6','4','24','28',
  'C',
  'Multiply both sides by 4: x=24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_020',
  'challenge',
  'Sam had some marbles. After receiving 10 more, Sam had 17. How many marbles did Sam start with?',
  '10','17','27','7',
  'D',
  'Let x be the starting amount: x+10=17, so x=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_021',
  'challenge',
  'Solve x + 6 = 14.',
  '8','14','6','20',
  'A',
  'Subtract 6 from both sides to get x=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_022',
  'challenge',
  'Solve x - 7 = -5.',
  '-5','2','7','-12',
  'B',
  'Add 7 to both sides to get x=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_023',
  'challenge',
  'Solve 8x = 24.',
  '8','24','3','16',
  'C',
  'Divide both sides by 8: x=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_024',
  'challenge',
  'Solve x/9 = 4.',
  '4','9','45','36',
  'D',
  'Multiply both sides by 9: x=36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_ONE_STEP_EQUATIONS_025',
  'challenge',
  'Sam had some marbles. After receiving 5 more, Sam had 10. How many marbles did Sam start with?',
  '5','10','15','6',
  'A',
  'Let x be the starting amount: x+5=10, so x=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='ONE_STEP_EQUATIONS';

-- EXPRESSIONS / INEQUALITIES — Inequalities

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_001',
  'easy',
  'Which value satisfies x > 5?',
  '7','5','4','2',
  'A',
  'A solution must be greater than 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_002',
  'easy',
  'Which inequality represents ''n is at most 6''?',
  'n < 6','n ≤ 6','n ≥ 6','n > 6',
  'B',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_003',
  'easy',
  'Solve x + 4 < 11.',
  'x > 7','x ≤ 11','x < 7','x < 4',
  'C',
  'Subtract 4 from both sides to get x < 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_004',
  'easy',
  'Solve 5x ≤ 40.',
  'x ≥ 8','x < 5','x ≤ 40','x ≤ 8',
  'D',
  'Divide both sides by positive 5: x ≤ 8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_005',
  'easy',
  'A ride requires passengers to be at least 9 inches tall. Which inequality models height h?',
  'h ≥ 9','h > 9','h ≤ 9','h < 9',
  'A',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_006',
  'easy',
  'Which value satisfies x > 10?',
  '10','12','9','7',
  'B',
  'A solution must be greater than 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_007',
  'easy',
  'Which inequality represents ''n is at most 11''?',
  'n < 11','n ≥ 11','n ≤ 11','n > 11',
  'C',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_008',
  'easy',
  'Solve x + 2 < 14.',
  'x > 12','x ≤ 14','x < 2','x < 12',
  'D',
  'Subtract 2 from both sides to get x < 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_009',
  'medium',
  'Solve 3x ≤ 39.',
  'x ≤ 13','x ≥ 13','x < 3','x ≤ 39',
  'A',
  'Divide both sides by positive 3: x ≤ 13.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_010',
  'medium',
  'A ride requires passengers to be at least 14 inches tall. Which inequality models height h?',
  'h > 14','h ≥ 14','h ≤ 14','h < 14',
  'B',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_011',
  'medium',
  'Which value satisfies x > 15?',
  '15','14','17','12',
  'C',
  'A solution must be greater than 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_012',
  'medium',
  'Which inequality represents ''n is at most 16''?',
  'n < 16','n ≥ 16','n > 16','n ≤ 16',
  'D',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_013',
  'medium',
  'Solve x + 7 < 24.',
  'x < 17','x > 17','x ≤ 24','x < 7',
  'A',
  'Subtract 7 from both sides to get x < 17.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_014',
  'medium',
  'Solve 8x ≤ 144.',
  'x ≥ 18','x ≤ 18','x < 8','x ≤ 144',
  'B',
  'Divide both sides by positive 8: x ≤ 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_015',
  'medium',
  'A ride requires passengers to be at least 19 inches tall. Which inequality models height h?',
  'h > 19','h ≤ 19','h ≥ 19','h < 19',
  'C',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_016',
  'medium',
  'Which value satisfies x > 20?',
  '20','19','17','22',
  'D',
  'A solution must be greater than 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_017',
  'medium',
  'Which inequality represents ''n is at most 21''?',
  'n ≤ 21','n < 21','n ≥ 21','n > 21',
  'A',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_018',
  'medium',
  'Solve x + 5 < 27.',
  'x > 22','x < 22','x ≤ 27','x < 5',
  'B',
  'Subtract 5 from both sides to get x < 22.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_019',
  'medium',
  'Solve 6x ≤ 138.',
  'x ≥ 23','x < 6','x ≤ 23','x ≤ 138',
  'C',
  'Divide both sides by positive 6: x ≤ 23.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_020',
  'challenge',
  'A ride requires passengers to be at least 24 inches tall. Which inequality models height h?',
  'h > 24','h ≤ 24','h < 24','h ≥ 24',
  'D',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_021',
  'challenge',
  'Which value satisfies x > 25?',
  '27','25','24','22',
  'A',
  'A solution must be greater than 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_022',
  'challenge',
  'Which inequality represents ''n is at most 26''?',
  'n < 26','n ≤ 26','n ≥ 26','n > 26',
  'B',
  '''At most'' means less than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_023',
  'challenge',
  'Solve x + 3 < 30.',
  'x > 27','x ≤ 30','x < 27','x < 3',
  'C',
  'Subtract 3 from both sides to get x < 27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_024',
  'challenge',
  'Solve 4x ≤ 112.',
  'x ≥ 28','x < 4','x ≤ 112','x ≤ 28',
  'D',
  'Divide both sides by positive 4: x ≤ 28.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_INEQUALITIES_025',
  'challenge',
  'A ride requires passengers to be at least 29 inches tall. Which inequality models height h?',
  'h ≥ 29','h > 29','h ≤ 29','h < 29',
  'A',
  '''At least'' means greater than or equal to.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='INEQUALITIES';

-- EXPRESSIONS / DEPENDENT_VARIABLES — Dependent & Independent Variables

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_001',
  'easy',
  'The total cost C depends on the number n of notebooks bought at $2 each. Which is the dependent variable?',
  'C','n','$2','Neither',
  'A',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_002',
  'easy',
  'In y = 3x + 3, which variable is independent?',
  'y','x','3','x_1',
  'B',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_003',
  'easy',
  'For y = 4x + 5, what is y when x = 5?',
  '20','29','25','26',
  'C',
  'Substitute x=5: y=4(5)+5=25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_004',
  'easy',
  'A plant''s height h is recorded over 8 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','Both are independent','Neither','h',
  'D',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_005',
  'easy',
  'For the relationship y = 6x, how much does y change when x increases by 1?',
  '6','1','7','12',
  'A',
  'The coefficient 6 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_006',
  'easy',
  'The total cost C depends on the number n of notebooks bought at $7 each. Which is the dependent variable?',
  'n','C','$7','Neither',
  'B',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_007',
  'easy',
  'In y = 2x + 3, which variable is independent?',
  'y','2','x','3',
  'C',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_008',
  'easy',
  'For y = 3x + 5, what is y when x = 5?',
  '15','23','25','20',
  'D',
  'Substitute x=5: y=3(5)+5=20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_009',
  'medium',
  'A plant''s height h is recorded over 13 days. Height changes as the number of days d changes. Which variable is dependent?',
  'h','d','Both are independent','Neither',
  'A',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_010',
  'medium',
  'For the relationship y = 5x, how much does y change when x increases by 1?',
  '1','5','6','10',
  'B',
  'The coefficient 5 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_011',
  'medium',
  'The total cost C depends on the number n of notebooks bought at $6 each. Which is the dependent variable?',
  'n','$6','C','Neither',
  'C',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_012',
  'medium',
  'In y = 7x + 3, which variable is independent?',
  'y','7','3','x',
  'D',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_013',
  'medium',
  'For y = 2x + 5, what is y when x = 5?',
  '15','10','17','25',
  'A',
  'Substitute x=5: y=2(5)+5=15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_014',
  'medium',
  'A plant''s height h is recorded over 18 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','h','Both are independent','Neither',
  'B',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_015',
  'medium',
  'For the relationship y = 4x, how much does y change when x increases by 1?',
  '1','5','4','8',
  'C',
  'The coefficient 4 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_016',
  'medium',
  'The total cost C depends on the number n of notebooks bought at $5 each. Which is the dependent variable?',
  'n','$5','Neither','C',
  'D',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_017',
  'medium',
  'In y = 6x + 3, which variable is independent?',
  'x','y','6','3',
  'A',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_018',
  'medium',
  'For y = 7x + 5, what is y when x = 5?',
  '35','40','47','25',
  'B',
  'Substitute x=5: y=7(5)+5=40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_019',
  'medium',
  'A plant''s height h is recorded over 23 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','Both are independent','h','Neither',
  'C',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_020',
  'challenge',
  'For the relationship y = 3x, how much does y change when x increases by 1?',
  '1','4','6','3',
  'D',
  'The coefficient 3 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_021',
  'challenge',
  'The total cost C depends on the number n of notebooks bought at $4 each. Which is the dependent variable?',
  'C','n','$4','Neither',
  'A',
  'The total cost changes when the number purchased changes.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_022',
  'challenge',
  'In y = 5x + 3, which variable is independent?',
  'y','x','5','3',
  'B',
  'x is the input; y depends on x.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_023',
  'challenge',
  'For y = 6x + 5, what is y when x = 5?',
  '30','41','35','25',
  'C',
  'Substitute x=5: y=6(5)+5=35.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_024',
  'challenge',
  'A plant''s height h is recorded over 28 days. Height changes as the number of days d changes. Which variable is dependent?',
  'd','Both are independent','Neither','h',
  'D',
  'Height is the measured output, so h depends on d.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_EXPRESSIONS_DEPENDENT_VARIABLES_025',
  'challenge',
  'For the relationship y = 2x, how much does y change when x increases by 1?',
  '2','1','3','4',
  'A',
  'The coefficient 2 is the rate of change.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='EXPRESSIONS'
  AND st.subtopic_code='DEPENDENT_VARIABLES';

-- GEOMETRY / AREA_TRIANGLES — Area of Triangles

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_001',
  'easy',
  'What is the area of a triangle with base 4 units and height 3 units?',
  '6','12','7','8',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 3 = 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_002',
  'easy',
  'A triangle has area 12.5 square units and base 5 units. What is its height?',
  '25','5','10','6',
  'B',
  'From A=1/2 bh, h=2A/b=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_003',
  'easy',
  'A right triangle has perpendicular sides 6 and 7. What is its area?',
  '42','13','21','26',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_004',
  'easy',
  'If the height of a triangle stays 9 units and its base doubles from 7 to 14, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_005',
  'easy',
  'What is the area of a triangle with base 8 units and height 4 units?',
  '16','32','12','18',
  'A',
  'A = 1/2 × base × height = 1/2 × 8 × 4 = 16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_006',
  'easy',
  'A triangle has area 27 square units and base 9 units. What is its height?',
  '9','6','54','15',
  'B',
  'From A=1/2 bh, h=2A/b=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_007',
  'easy',
  'A right triangle has perpendicular sides 10 and 8. What is its area?',
  '80','18','40','36',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_008',
  'easy',
  'If the height of a triangle stays 3 units and its base doubles from 11 to 22, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_009',
  'medium',
  'What is the area of a triangle with base 4 units and height 5 units?',
  '10','20','9','12',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 5 = 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_010',
  'medium',
  'A triangle has area 17.5 square units and base 5 units. What is its height?',
  '5','7','35','12',
  'B',
  'From A=1/2 bh, h=2A/b=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_011',
  'medium',
  'A right triangle has perpendicular sides 6 and 9. What is its area?',
  '54','15','27','30',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_012',
  'medium',
  'If the height of a triangle stays 4 units and its base doubles from 7 to 14, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_013',
  'medium',
  'What is the area of a triangle with base 8 units and height 6 units?',
  '24','48','14','26',
  'A',
  'A = 1/2 × base × height = 1/2 × 8 × 6 = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_014',
  'medium',
  'A triangle has area 36 square units and base 9 units. What is its height?',
  '9','8','72','17',
  'B',
  'From A=1/2 bh, h=2A/b=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_015',
  'medium',
  'A right triangle has perpendicular sides 10 and 3. What is its area?',
  '30','13','15','26',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_016',
  'medium',
  'If the height of a triangle stays 5 units and its base doubles from 11 to 22, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_017',
  'medium',
  'What is the area of a triangle with base 4 units and height 7 units?',
  '14','28','11','16',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 7 = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_018',
  'medium',
  'A triangle has area 22.5 square units and base 5 units. What is its height?',
  '5','9','45','14',
  'B',
  'From A=1/2 bh, h=2A/b=9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_019',
  'medium',
  'A right triangle has perpendicular sides 6 and 4. What is its area?',
  '24','10','12','20',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_020',
  'challenge',
  'If the height of a triangle stays 6 units and its base doubles from 7 to 14, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_021',
  'challenge',
  'What is the area of a triangle with base 8 units and height 8 units?',
  '32','64','16','34',
  'A',
  'A = 1/2 × base × height = 1/2 × 8 × 8 = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_022',
  'challenge',
  'A triangle has area 13.5 square units and base 9 units. What is its height?',
  '9','3','27','12',
  'B',
  'From A=1/2 bh, h=2A/b=3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_023',
  'challenge',
  'A right triangle has perpendicular sides 10 and 5. What is its area?',
  '50','15','25','30',
  'C',
  'The perpendicular sides can be used as base and height.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_024',
  'challenge',
  'If the height of a triangle stays 7 units and its base doubles from 11 to 22, what happens to its area?',
  'It halves','It stays the same','It quadruples','It doubles',
  'D',
  'Triangle area is directly proportional to the base when height is fixed.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_TRIANGLES_025',
  'challenge',
  'What is the area of a triangle with base 4 units and height 9 units?',
  '18','36','13','20',
  'A',
  'A = 1/2 × base × height = 1/2 × 4 × 9 = 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_TRIANGLES';

-- GEOMETRY / AREA_QUADRILATERALS — Area of Quadrilaterals

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_001',
  'easy',
  'What is the area of a rectangle 4 units long and 3 units wide?',
  '12','14','7','15',
  'A',
  'Rectangle area = length × width = 4 × 3 = 12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_002',
  'easy',
  'What is the area of a parallelogram with base 5 units and perpendicular height 5 units?',
  '10','25','20','26',
  'B',
  'Parallelogram area = base × height = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_003',
  'easy',
  'A trapezoid has parallel bases 6 and 7 units and height 3 units. What is its area?',
  '126','39','19.5','16',
  'C',
  'A = 1/2(b1+b2)h = 19.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_004',
  'easy',
  'What is the area of a square with side length 7 units?',
  '28','14','56','49',
  'D',
  'Square area = side² = 7² = 49.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_005',
  'easy',
  'A rectangle has area 40 square units and length 8 units. What is its width?',
  '5','8','40','13',
  'A',
  'Width = area ÷ length = 40 ÷ 8 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_006',
  'easy',
  'What is the area of a rectangle 9 units long and 7 units wide?',
  '32','63','16','70',
  'B',
  'Rectangle area = length × width = 9 × 7 = 63.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_007',
  'easy',
  'What is the area of a parallelogram with base 10 units and perpendicular height 5 units?',
  '15','30','50','51',
  'C',
  'Parallelogram area = base × height = 50.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_008',
  'easy',
  'A trapezoid has parallel bases 4 and 5 units and height 3 units. What is its area?',
  '60','27','12','13.5',
  'D',
  'A = 1/2(b1+b2)h = 13.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_009',
  'medium',
  'What is the area of a square with side length 5 units?',
  '25','20','10','30',
  'A',
  'Square area = side² = 5² = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_010',
  'medium',
  'A rectangle has area 18 square units and length 6 units. What is its width?',
  '6','3','18','9',
  'B',
  'Width = area ÷ length = 18 ÷ 6 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_011',
  'medium',
  'What is the area of a rectangle 7 units long and 5 units wide?',
  '24','12','35','40',
  'C',
  'Rectangle area = length × width = 7 × 5 = 35.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_012',
  'medium',
  'What is the area of a parallelogram with base 8 units and perpendicular height 5 units?',
  '13','26','56','40',
  'D',
  'Parallelogram area = base × height = 40.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_013',
  'medium',
  'A trapezoid has parallel bases 9 and 3 units and height 3 units. What is its area?',
  '18','81','36','15',
  'A',
  'A = 1/2(b1+b2)h = 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_014',
  'medium',
  'What is the area of a square with side length 10 units?',
  '40','100','20','110',
  'B',
  'Square area = side² = 10² = 100.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_015',
  'medium',
  'A rectangle has area 28 square units and length 4 units. What is its width?',
  '4','28','7','11',
  'C',
  'Width = area ÷ length = 28 ÷ 4 = 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_016',
  'medium',
  'What is the area of a rectangle 5 units long and 3 units wide?',
  '16','8','18','15',
  'D',
  'Rectangle area = length × width = 5 × 3 = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_017',
  'medium',
  'What is the area of a parallelogram with base 6 units and perpendicular height 5 units?',
  '30','11','22','31',
  'A',
  'Parallelogram area = base × height = 30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_018',
  'medium',
  'A trapezoid has parallel bases 7 and 7 units and height 3 units. What is its area?',
  '147','21','42','17',
  'B',
  'A = 1/2(b1+b2)h = 21.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_019',
  'medium',
  'What is the area of a square with side length 8 units?',
  '32','16','64','72',
  'C',
  'Square area = side² = 8² = 64.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_020',
  'challenge',
  'A rectangle has area 45 square units and length 9 units. What is its width?',
  '9','45','14','5',
  'D',
  'Width = area ÷ length = 45 ÷ 9 = 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_021',
  'challenge',
  'What is the area of a rectangle 10 units long and 7 units wide?',
  '70','34','17','77',
  'A',
  'Rectangle area = length × width = 10 × 7 = 70.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_022',
  'challenge',
  'What is the area of a parallelogram with base 4 units and perpendicular height 5 units?',
  '9','20','18','12',
  'B',
  'Parallelogram area = base × height = 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_023',
  'challenge',
  'A trapezoid has parallel bases 5 and 5 units and height 3 units. What is its area?',
  '75','30','15','13',
  'C',
  'A = 1/2(b1+b2)h = 15.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_024',
  'challenge',
  'What is the area of a square with side length 6 units?',
  '24','12','42','36',
  'D',
  'Square area = side² = 6² = 36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_AREA_QUADRILATERALS_025',
  'challenge',
  'A rectangle has area 21 square units and length 7 units. What is its width?',
  '3','7','21','10',
  'A',
  'Width = area ÷ length = 21 ÷ 7 = 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='AREA_QUADRILATERALS';

-- GEOMETRY / SURFACE_AREA — Surface Area

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_001',
  'easy',
  'What is the surface area of a rectangular prism with dimensions 3 × 2 × 2?',
  '32','12','14','16',
  'A',
  'SA = 2(lw+lh+wh) = 32.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_002',
  'easy',
  'What is the surface area of a cube with edge length 3?',
  '27','54','36','18',
  'B',
  'A cube has 6 square faces, so SA = 6×3² = 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_003',
  'easy',
  'A rectangular prism has a face measuring 5 by 4. What is the area of that face?',
  '18','9','20','120',
  'C',
  'Face area = 5 × 4 = 20.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_004',
  'easy',
  'If every edge of a cube is multiplied by 2, by what factor does its surface area change?',
  '2','8','5','4',
  'D',
  'Surface area scales with the square of edge length: 2²=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_005',
  'easy',
  'What is the surface area of a rectangular prism with dimensions 7 × 6 × 3?',
  '162','126','32','81',
  'A',
  'SA = 2(lw+lh+wh) = 162.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_006',
  'easy',
  'What is the surface area of a cube with edge length 7?',
  '343','294','196','42',
  'B',
  'A cube has 6 square faces, so SA = 6×7² = 294.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_007',
  'easy',
  'A rectangular prism has a face measuring 9 by 3. What is the area of that face?',
  '24','12','27','189',
  'C',
  'Face area = 9 × 3 = 27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_008',
  'easy',
  'If every edge of a cube is multiplied by 3, by what factor does its surface area change?',
  '3','27','6','9',
  'D',
  'Surface area scales with the square of edge length: 3²=9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_009',
  'medium',
  'What is the surface area of a rectangular prism with dimensions 11 × 5 × 4?',
  '238','220','40','119',
  'A',
  'SA = 2(lw+lh+wh) = 238.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_010',
  'medium',
  'What is the surface area of a cube with edge length 11?',
  '1331','726','484','66',
  'B',
  'A cube has 6 square faces, so SA = 6×11² = 726.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_011',
  'medium',
  'A rectangular prism has a face measuring 13 by 2. What is the area of that face?',
  '30','15','26','208',
  'C',
  'Face area = 13 × 2 = 26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_012',
  'medium',
  'If every edge of a cube is multiplied by 4, by what factor does its surface area change?',
  '4','64','8','16',
  'D',
  'Surface area scales with the square of edge length: 4²=16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_013',
  'medium',
  'What is the surface area of a rectangular prism with dimensions 15 × 4 × 5?',
  '310','300','48','155',
  'A',
  'SA = 2(lw+lh+wh) = 310.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_014',
  'medium',
  'What is the surface area of a cube with edge length 15?',
  '3375','1350','900','90',
  'B',
  'A cube has 6 square faces, so SA = 6×15² = 1350.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_015',
  'medium',
  'A rectangular prism has a face measuring 17 by 6. What is the area of that face?',
  '46','23','102','204',
  'C',
  'Face area = 17 × 6 = 102.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_016',
  'medium',
  'If every edge of a cube is multiplied by 5, by what factor does its surface area change?',
  '5','125','10','25',
  'D',
  'Surface area scales with the square of edge length: 5²=25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_017',
  'medium',
  'What is the surface area of a rectangular prism with dimensions 19 × 3 × 6?',
  '378','342','56','189',
  'A',
  'SA = 2(lw+lh+wh) = 378.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_018',
  'medium',
  'What is the surface area of a cube with edge length 19?',
  '6859','2166','1444','114',
  'B',
  'A cube has 6 square faces, so SA = 6×19² = 2166.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_019',
  'medium',
  'A rectangular prism has a face measuring 21 by 5. What is the area of that face?',
  '52','26','105','315',
  'C',
  'Face area = 21 × 5 = 105.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_020',
  'challenge',
  'If every edge of a cube is multiplied by 6, by what factor does its surface area change?',
  '6','216','12','36',
  'D',
  'Surface area scales with the square of edge length: 6²=36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_021',
  'challenge',
  'What is the surface area of a rectangular prism with dimensions 23 × 2 × 7?',
  '442','322','64','221',
  'A',
  'SA = 2(lw+lh+wh) = 442.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_022',
  'challenge',
  'What is the surface area of a cube with edge length 23?',
  '12167','3174','2116','138',
  'B',
  'A cube has 6 square faces, so SA = 6×23² = 3174.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_023',
  'challenge',
  'A rectangular prism has a face measuring 25 by 4. What is the area of that face?',
  '58','29','100','400',
  'C',
  'Face area = 25 × 4 = 100.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_024',
  'challenge',
  'If every edge of a cube is multiplied by 7, by what factor does its surface area change?',
  '7','343','14','49',
  'D',
  'Surface area scales with the square of edge length: 7²=49.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_SURFACE_AREA_025',
  'challenge',
  'What is the surface area of a rectangular prism with dimensions 27 × 6 × 8?',
  '852','1296','82','426',
  'A',
  'SA = 2(lw+lh+wh) = 852.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='SURFACE_AREA';

-- GEOMETRY / VOLUME — Volume

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_001',
  'easy',
  'What is the volume of a rectangular prism with dimensions 3 × 2 × 2?',
  '12','32','7','8',
  'A',
  'V=lwh=3×2×2=12.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_002',
  'easy',
  'A prism has base area 12 square units and height 5 units. What is its volume?',
  '17','60','120','12',
  'B',
  'Volume = base area × height = 12×5=60.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_003',
  'easy',
  'A rectangular prism has volume 160 cubic units, length 5, and width 4. What is its height?',
  '5','4','8','20',
  'C',
  'h=V÷(lw)=160÷20=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_004',
  'easy',
  'If every dimension of a rectangular prism is multiplied by 2, by what factor does its volume change?',
  '2','4','9','8',
  'D',
  'Volume scales with the cube of the linear factor: 2³=8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_005',
  'easy',
  'What is the volume of a rectangular prism with dimensions 7 × 6 × 7?',
  '294','266','20','49',
  'A',
  'V=lwh=7×6×7=294.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_006',
  'easy',
  'A prism has base area 16 square units and height 3 units. What is its volume?',
  '19','48','96','16',
  'B',
  'Volume = base area × height = 16×3=48.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_007',
  'easy',
  'A rectangular prism has volume 162 cubic units, length 9, and width 3. What is its height?',
  '9','3','6','27',
  'C',
  'h=V÷(lw)=162÷27=6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_008',
  'easy',
  'If every dimension of a rectangular prism is multiplied by 3, by what factor does its volume change?',
  '3','9','6','27',
  'D',
  'Volume scales with the cube of the linear factor: 3³=27.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_009',
  'medium',
  'What is the volume of a rectangular prism with dimensions 11 × 5 × 5?',
  '275','270','21','60',
  'A',
  'V=lwh=11×5×5=275.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_010',
  'medium',
  'A prism has base area 72 square units and height 8 units. What is its volume?',
  '80','576','1152','72',
  'B',
  'Volume = base area × height = 72×8=576.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_011',
  'medium',
  'A rectangular prism has volume 104 cubic units, length 13, and width 2. What is its height?',
  '13','2','4','26',
  'C',
  'h=V÷(lw)=104÷26=4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_012',
  'medium',
  'If every dimension of a rectangular prism is multiplied by 4, by what factor does its volume change?',
  '4','16','8','64',
  'D',
  'Volume scales with the cube of the linear factor: 4³=64.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_013',
  'medium',
  'What is the volume of a rectangular prism with dimensions 15 × 4 × 3?',
  '180','234','22','63',
  'A',
  'V=lwh=15×4×3=180.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_014',
  'medium',
  'A prism has base area 80 square units and height 6 units. What is its volume?',
  '86','480','960','80',
  'B',
  'Volume = base area × height = 80×6=480.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_015',
  'medium',
  'A rectangular prism has volume 204 cubic units, length 17, and width 6. What is its height?',
  '17','6','2','102',
  'C',
  'h=V÷(lw)=204÷102=2.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_016',
  'medium',
  'If every dimension of a rectangular prism is multiplied by 5, by what factor does its volume change?',
  '5','25','10','125',
  'D',
  'Volume scales with the cube of the linear factor: 5³=125.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_017',
  'medium',
  'What is the volume of a rectangular prism with dimensions 19 × 3 × 8?',
  '456','466','30','65',
  'A',
  'V=lwh=19×3×8=456.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_018',
  'medium',
  'A prism has base area 80 square units and height 4 units. What is its volume?',
  '84','320','640','80',
  'B',
  'Volume = base area × height = 80×4=320.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_019',
  'medium',
  'A rectangular prism has volume 735 cubic units, length 21, and width 5. What is its height?',
  '21','5','7','105',
  'C',
  'h=V÷(lw)=735÷105=7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_020',
  'challenge',
  'If every dimension of a rectangular prism is multiplied by 6, by what factor does its volume change?',
  '6','36','12','216',
  'D',
  'Volume scales with the cube of the linear factor: 6³=216.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_021',
  'challenge',
  'What is the volume of a rectangular prism with dimensions 23 × 2 × 6?',
  '276','392','31','52',
  'A',
  'V=lwh=23×2×6=276.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_022',
  'challenge',
  'A prism has base area 72 square units and height 2 units. What is its volume?',
  '74','144','288','72',
  'B',
  'Volume = base area × height = 72×2=144.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_023',
  'challenge',
  'A rectangular prism has volume 500 cubic units, length 25, and width 4. What is its height?',
  '25','4','5','100',
  'C',
  'h=V÷(lw)=500÷100=5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_024',
  'challenge',
  'If every dimension of a rectangular prism is multiplied by 7, by what factor does its volume change?',
  '7','49','14','343',
  'D',
  'Volume scales with the cube of the linear factor: 7³=343.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_GEOMETRY_VOLUME_025',
  'challenge',
  'What is the volume of a rectangular prism with dimensions 27 × 6 × 4?',
  '648','588','37','166',
  'A',
  'V=lwh=27×6×4=648.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='VOLUME';

-- STATISTICS / MEAN — Mean

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_001',
  'easy',
  'What is the mean of 3, 5, 7, 9?',
  '6','24','7','8',
  'A',
  'Add the values (24) and divide by 4 to get 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_002',
  'easy',
  'The mean of four numbers is 7. Three numbers are 5, 6, and 8. What is the fourth number?',
  '7','9','28','11',
  'B',
  'The total needed is 7×4=28; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_003',
  'easy',
  'Which expression correctly computes the mean of 5, 9, 13, and 17?',
  '(5 + 17) ÷ 2','44 ÷ 3','(5 + 9 + 13 + 17) ÷ 4','17 - 5',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_004',
  'easy',
  'A student''s four quiz scores are 6, 11, 16, 21. What average score did the student earn?',
  '21','6','15','13.5',
  'D',
  'Average = total ÷ 4 = 13.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_005',
  'easy',
  'What is the mean of 7, 13, 19, 25?',
  '16','18','64','17',
  'A',
  'Add the values (64) and divide by 4 to get 16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_006',
  'easy',
  'The mean of four numbers is 11. Three numbers are 9, 10, and 12. What is the fourth number?',
  '11','13','44','15',
  'B',
  'The total needed is 11×4=44; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_007',
  'easy',
  'Which expression correctly computes the mean of 9, 17, 25, and 33?',
  '(9 + 33) ÷ 2','84 ÷ 3','(9 + 17 + 25 + 33) ÷ 4','33 - 9',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_008',
  'easy',
  'A student''s four quiz scores are 10, 19, 28, 37. What average score did the student earn?',
  '37','10','27','23.5',
  'D',
  'Average = total ÷ 4 = 23.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_009',
  'medium',
  'What is the mean of 11, 21, 31, 41?',
  '26','30','104','27',
  'A',
  'Add the values (104) and divide by 4 to get 26.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_010',
  'medium',
  'The mean of four numbers is 15. Three numbers are 13, 14, and 16. What is the fourth number?',
  '15','17','60','19',
  'B',
  'The total needed is 15×4=60; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_011',
  'medium',
  'Which expression correctly computes the mean of 13, 25, 37, and 49?',
  '(13 + 49) ÷ 2','124 ÷ 3','(13 + 25 + 37 + 49) ÷ 4','49 - 13',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_012',
  'medium',
  'A student''s four quiz scores are 14, 27, 40, 53. What average score did the student earn?',
  '53','14','39','33.5',
  'D',
  'Average = total ÷ 4 = 33.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_013',
  'medium',
  'What is the mean of 15, 29, 43, 57?',
  '36','42','144','37',
  'A',
  'Add the values (144) and divide by 4 to get 36.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_014',
  'medium',
  'The mean of four numbers is 19. Three numbers are 17, 18, and 20. What is the fourth number?',
  '19','21','76','23',
  'B',
  'The total needed is 19×4=76; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_015',
  'medium',
  'Which expression correctly computes the mean of 17, 33, 49, and 65?',
  '(17 + 65) ÷ 2','164 ÷ 3','(17 + 33 + 49 + 65) ÷ 4','65 - 17',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_016',
  'medium',
  'A student''s four quiz scores are 18, 35, 52, 69. What average score did the student earn?',
  '69','18','51','43.5',
  'D',
  'Average = total ÷ 4 = 43.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_017',
  'medium',
  'What is the mean of 19, 37, 55, 73?',
  '46','54','184','47',
  'A',
  'Add the values (184) and divide by 4 to get 46.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_018',
  'medium',
  'The mean of four numbers is 23. Three numbers are 21, 22, and 24. What is the fourth number?',
  '23','25','92','27',
  'B',
  'The total needed is 23×4=92; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_019',
  'medium',
  'Which expression correctly computes the mean of 21, 41, 61, and 81?',
  '(21 + 81) ÷ 2','204 ÷ 3','(21 + 41 + 61 + 81) ÷ 4','81 - 21',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_020',
  'challenge',
  'A student''s four quiz scores are 22, 43, 64, 85. What average score did the student earn?',
  '85','22','63','53.5',
  'D',
  'Average = total ÷ 4 = 53.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_021',
  'challenge',
  'What is the mean of 23, 45, 67, 89?',
  '56','66','224','57',
  'A',
  'Add the values (224) and divide by 4 to get 56.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_022',
  'challenge',
  'The mean of four numbers is 27. Three numbers are 25, 26, and 28. What is the fourth number?',
  '27','29','108','31',
  'B',
  'The total needed is 27×4=108; subtract the known sum.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_023',
  'challenge',
  'Which expression correctly computes the mean of 25, 49, 73, and 97?',
  '(25 + 97) ÷ 2','244 ÷ 3','(25 + 49 + 73 + 97) ÷ 4','97 - 25',
  'C',
  'Mean = sum of all values divided by the number of values.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_024',
  'challenge',
  'A student''s four quiz scores are 26, 51, 76, 101. What average score did the student earn?',
  '101','26','75','63.5',
  'D',
  'Average = total ÷ 4 = 63.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEAN_025',
  'challenge',
  'What is the mean of 27, 53, 79, 105?',
  '66','78','264','67',
  'A',
  'Add the values (264) and divide by 4 to get 66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEAN';

-- STATISTICS / MEDIAN — Median

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_001',
  'easy',
  'What is the median of 2, 4, 6, 8, 10?',
  '6','8','2','7',
  'A',
  'The ordered middle value is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_002',
  'easy',
  'What is the median of 3, 6, 9, 12?',
  '6','7.5','9','8.5',
  'B',
  'Average the two middle values to get 7.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_003',
  'easy',
  'In an ordered data set with 5 values, which position contains the median?',
  'Position 1','Position 5','Position 3','Position 2',
  'C',
  'With 5 values, the middle position is 3.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_004',
  'easy',
  'The ordered data set is 5, 10, 15, 20, 25. If the largest value increases by 13, what happens to the median?',
  'It increases by 13','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_005',
  'easy',
  'What is the median of 6, 12, 18, 24, 30?',
  '18','24','6','19',
  'A',
  'The ordered middle value is 18.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_006',
  'easy',
  'What is the median of 7, 14, 21, 28?',
  '14','17.5','21','18.5',
  'B',
  'Average the two middle values to get 17.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_007',
  'easy',
  'In an ordered data set with 7 values, which position contains the median?',
  'Position 1','Position 7','Position 4','Position 3',
  'C',
  'With 7 values, the middle position is 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_008',
  'easy',
  'The ordered data set is 9, 18, 27, 36, 45. If the largest value increases by 17, what happens to the median?',
  'It increases by 17','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_009',
  'medium',
  'What is the median of 10, 20, 30, 40, 50?',
  '30','40','10','31',
  'A',
  'The ordered middle value is 30.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_010',
  'medium',
  'What is the median of 11, 22, 33, 44?',
  '22','27.5','33','28.5',
  'B',
  'Average the two middle values to get 27.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_011',
  'medium',
  'In an ordered data set with 9 values, which position contains the median?',
  'Position 1','Position 9','Position 5','Position 4',
  'C',
  'With 9 values, the middle position is 5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_012',
  'medium',
  'The ordered data set is 13, 26, 39, 52, 65. If the largest value increases by 21, what happens to the median?',
  'It increases by 21','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_013',
  'medium',
  'What is the median of 14, 28, 42, 56, 70?',
  '42','56','14','43',
  'A',
  'The ordered middle value is 42.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_014',
  'medium',
  'What is the median of 15, 30, 45, 60?',
  '30','37.5','45','38.5',
  'B',
  'Average the two middle values to get 37.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_015',
  'medium',
  'In an ordered data set with 11 values, which position contains the median?',
  'Position 1','Position 11','Position 6','Position 5',
  'C',
  'With 11 values, the middle position is 6.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_016',
  'medium',
  'The ordered data set is 17, 34, 51, 68, 85. If the largest value increases by 25, what happens to the median?',
  'It increases by 25','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_017',
  'medium',
  'What is the median of 18, 36, 54, 72, 90?',
  '54','72','18','55',
  'A',
  'The ordered middle value is 54.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_018',
  'medium',
  'What is the median of 19, 38, 57, 76?',
  '38','47.5','57','48.5',
  'B',
  'Average the two middle values to get 47.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_019',
  'medium',
  'In an ordered data set with 13 values, which position contains the median?',
  'Position 1','Position 13','Position 7','Position 6',
  'C',
  'With 13 values, the middle position is 7.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_020',
  'challenge',
  'The ordered data set is 21, 42, 63, 84, 105. If the largest value increases by 29, what happens to the median?',
  'It increases by 29','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_021',
  'challenge',
  'What is the median of 22, 44, 66, 88, 110?',
  '66','88','22','67',
  'A',
  'The ordered middle value is 66.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_022',
  'challenge',
  'What is the median of 23, 46, 69, 92?',
  '46','57.5','69','58.5',
  'B',
  'Average the two middle values to get 57.5.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_023',
  'challenge',
  'In an ordered data set with 15 values, which position contains the median?',
  'Position 1','Position 15','Position 8','Position 7',
  'C',
  'With 15 values, the middle position is 8.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_024',
  'challenge',
  'The ordered data set is 25, 50, 75, 100, 125. If the largest value increases by 33, what happens to the median?',
  'It increases by 33','It doubles','It becomes the mean','It stays the same',
  'D',
  'Changing the largest value does not move the middle position.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MEDIAN_025',
  'challenge',
  'What is the median of 26, 52, 78, 104, 130?',
  '78','104','26','79',
  'A',
  'The ordered middle value is 78.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MEDIAN';

-- STATISTICS / MODE — Mode

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_001',
  'easy',
  'What is the mode of 2, 2, 2, 3, 4, 5?',
  '2','3','4','5',
  'A',
  '2 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_002',
  'easy',
  'For the data set 3, 4, 4, 5, 6, which value occurs most often?',
  '3','4','5','6',
  'B',
  '4 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_003',
  'easy',
  'Which values are modes of 4, 4, 5, 5, 6?',
  '4','5','4 and 5','There is no mode',
  'C',
  'Both 4 and 5 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_004',
  'easy',
  'What can you say about the mode of 5, 6, 7, 8?',
  'The mode is 5','The mode is 8','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_005',
  'easy',
  'What is the mode of 6, 6, 6, 7, 8, 9?',
  '6','7','8','3',
  'A',
  '6 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_006',
  'easy',
  'For the data set 7, 8, 8, 9, 10, which value occurs most often?',
  '7','8','9','10',
  'B',
  '8 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_007',
  'easy',
  'Which values are modes of 8, 8, 9, 9, 10?',
  '8','9','8 and 9','There is no mode',
  'C',
  'Both 8 and 9 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_008',
  'easy',
  'What can you say about the mode of 9, 10, 11, 12?',
  'The mode is 9','The mode is 12','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_009',
  'medium',
  'What is the mode of 10, 10, 10, 11, 12, 13?',
  '10','11','12','3',
  'A',
  '10 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_010',
  'medium',
  'For the data set 11, 12, 12, 13, 14, which value occurs most often?',
  '11','12','13','14',
  'B',
  '12 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_011',
  'medium',
  'Which values are modes of 12, 12, 13, 13, 14?',
  '12','13','12 and 13','There is no mode',
  'C',
  'Both 12 and 13 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_012',
  'medium',
  'What can you say about the mode of 13, 14, 15, 16?',
  'The mode is 13','The mode is 16','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_013',
  'medium',
  'What is the mode of 14, 14, 14, 15, 16, 17?',
  '14','15','16','3',
  'A',
  '14 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_014',
  'medium',
  'For the data set 15, 16, 16, 17, 18, which value occurs most often?',
  '15','16','17','18',
  'B',
  '16 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_015',
  'medium',
  'Which values are modes of 16, 16, 17, 17, 18?',
  '16','17','16 and 17','There is no mode',
  'C',
  'Both 16 and 17 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_016',
  'medium',
  'What can you say about the mode of 17, 18, 19, 20?',
  'The mode is 17','The mode is 20','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_017',
  'medium',
  'What is the mode of 18, 18, 18, 19, 20, 21?',
  '18','19','20','3',
  'A',
  '18 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_018',
  'medium',
  'For the data set 19, 20, 20, 21, 22, which value occurs most often?',
  '19','20','21','22',
  'B',
  '20 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_019',
  'medium',
  'Which values are modes of 20, 20, 21, 21, 22?',
  '20','21','20 and 21','There is no mode',
  'C',
  'Both 20 and 21 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_020',
  'challenge',
  'What can you say about the mode of 21, 22, 23, 24?',
  'The mode is 21','The mode is 24','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_021',
  'challenge',
  'What is the mode of 22, 22, 22, 23, 24, 25?',
  '22','23','24','3',
  'A',
  '22 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_022',
  'challenge',
  'For the data set 23, 24, 24, 25, 26, which value occurs most often?',
  '23','24','25','26',
  'B',
  '24 appears twice; the others appear once.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_023',
  'challenge',
  'Which values are modes of 24, 24, 25, 25, 26?',
  '24','25','24 and 25','There is no mode',
  'C',
  'Both 24 and 25 share the highest frequency.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_024',
  'challenge',
  'What can you say about the mode of 25, 26, 27, 28?',
  'The mode is 25','The mode is 28','Every value is the mode','There is no mode',
  'D',
  'Every value occurs exactly once, so there is no mode.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_MODE_025',
  'challenge',
  'What is the mode of 26, 26, 26, 27, 28, 29?',
  '26','27','28','3',
  'A',
  '26 occurs most often.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='MODE';

-- STATISTICS / RANGE — Range

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_001',
  'easy',
  'What is the range of 2, 5, 9, 12?',
  '10','12','2','7',
  'A',
  'Range = greatest - least = 12 - 2 = 10.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_002',
  'easy',
  'A data set has least value 3 and greatest value 16. What is its range?',
  '16','13','3','19',
  'B',
  'Range = 16 - 3 = 13.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_003',
  'easy',
  'The least value in a data set is 4 and the range is 21. What is the greatest value?',
  '21','4','25','20',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_004',
  'easy',
  'A data set has range 19. If both its least and greatest values increase by 6, what is the new range?',
  '25','13','38','19',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_005',
  'easy',
  'What is the range of 6, 13, 21, 28?',
  '22','28','6','17',
  'A',
  'Range = greatest - least = 28 - 6 = 22.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_006',
  'easy',
  'A data set has least value 7 and greatest value 32. What is its range?',
  '32','25','7','39',
  'B',
  'Range = 32 - 7 = 25.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_007',
  'easy',
  'The least value in a data set is 8 and the range is 33. What is the greatest value?',
  '33','8','41','36',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_008',
  'easy',
  'A data set has range 31. If both its least and greatest values increase by 10, what is the new range?',
  '41','21','62','31',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_009',
  'medium',
  'What is the range of 10, 21, 33, 44?',
  '34','44','10','27',
  'A',
  'Range = greatest - least = 44 - 10 = 34.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_010',
  'medium',
  'A data set has least value 11 and greatest value 48. What is its range?',
  '48','37','11','59',
  'B',
  'Range = 48 - 11 = 37.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_011',
  'medium',
  'The least value in a data set is 12 and the range is 45. What is the greatest value?',
  '45','12','57','52',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_012',
  'medium',
  'A data set has range 43. If both its least and greatest values increase by 14, what is the new range?',
  '57','29','86','43',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_013',
  'medium',
  'What is the range of 14, 29, 45, 60?',
  '46','60','14','37',
  'A',
  'Range = greatest - least = 60 - 14 = 46.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_014',
  'medium',
  'A data set has least value 15 and greatest value 64. What is its range?',
  '64','49','15','79',
  'B',
  'Range = 64 - 15 = 49.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_015',
  'medium',
  'The least value in a data set is 16 and the range is 57. What is the greatest value?',
  '57','16','73','68',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_016',
  'medium',
  'A data set has range 55. If both its least and greatest values increase by 18, what is the new range?',
  '73','37','110','55',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_017',
  'medium',
  'What is the range of 18, 37, 57, 76?',
  '58','76','18','47',
  'A',
  'Range = greatest - least = 76 - 18 = 58.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_018',
  'medium',
  'A data set has least value 19 and greatest value 80. What is its range?',
  '80','61','19','99',
  'B',
  'Range = 80 - 19 = 61.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_019',
  'medium',
  'The least value in a data set is 20 and the range is 69. What is the greatest value?',
  '69','20','89','84',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_020',
  'challenge',
  'A data set has range 67. If both its least and greatest values increase by 22, what is the new range?',
  '89','45','134','67',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_021',
  'challenge',
  'What is the range of 22, 45, 69, 92?',
  '70','92','22','57',
  'A',
  'Range = greatest - least = 92 - 22 = 70.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_022',
  'challenge',
  'A data set has least value 23 and greatest value 96. What is its range?',
  '96','73','23','119',
  'B',
  'Range = 96 - 23 = 73.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_023',
  'challenge',
  'The least value in a data set is 24 and the range is 81. What is the greatest value?',
  '81','24','105','100',
  'C',
  'Greatest = least + range.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_024',
  'challenge',
  'A data set has range 79. If both its least and greatest values increase by 26, what is the new range?',
  '105','53','158','79',
  'D',
  'Adding the same amount to both endpoints does not change their difference.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_RANGE_025',
  'challenge',
  'What is the range of 26, 53, 81, 108?',
  '82','108','26','67',
  'A',
  'Range = greatest - least = 108 - 26 = 82.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='RANGE';

-- STATISTICS / DATA_DISPLAYS — Data Displays

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_001',
  'easy',
  'A bar graph shows Red=3, Blue=5, Green=2. Which category has the greatest value?',
  'Blue','Red','Green','They are equal',
  'A',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_002',
  'easy',
  'A frequency table lists 4 Cats, 7 Dogs, and 5 Birds. What is the total frequency?',
  '7','16','18','11',
  'B',
  'Add the frequencies: 4+7+5=16.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_003',
  'easy',
  'A bar graph shows Class A=5 and Class B=9. What is the difference?',
  '14','9','4','5',
  'C',
  'Difference = |9-5| = 4.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_004',
  'easy',
  'A student records temperature once per day for 7 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Number sentence','Multiplication table','Line graph',
  'D',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_005',
  'easy',
  'A graph uses a vertical scale increasing by 1 at each tick. What should a reader check before comparing bar heights?',
  'The axis labels and scale','Only the tallest bar','Only the title','Ignore the tick marks',
  'A',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_006',
  'easy',
  'A bar graph shows Red=8, Blue=15, Green=17. Which category has the greatest value?',
  'Red','Green','Blue','They are equal',
  'B',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_007',
  'easy',
  'A frequency table lists 9 Cats, 17 Dogs, and 20 Birds. What is the total frequency?',
  '20','48','46','26',
  'C',
  'Add the frequencies: 9+17+20=46.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_008',
  'easy',
  'A bar graph shows Class A=10 and Class B=19. What is the difference?',
  '29','19','10','9',
  'D',
  'Difference = |19-10| = 9.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_009',
  'medium',
  'A student records temperature once per day for 12 days and wants to show how it changes over time. Which display is most suitable?',
  'Line graph','Circle graph','Number sentence','Multiplication table',
  'A',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_010',
  'medium',
  'A graph uses a vertical scale increasing by 2 at each tick. What should a reader check before comparing bar heights?',
  'Only the tallest bar','The axis labels and scale','Only the title','Ignore the tick marks',
  'B',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_011',
  'medium',
  'A bar graph shows Red=13, Blue=25, Green=32. Which category has the greatest value?',
  'Red','Blue','Green','They are equal',
  'C',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_012',
  'medium',
  'A frequency table lists 14 Cats, 27 Dogs, and 35 Birds. What is the total frequency?',
  '35','78','41','76',
  'D',
  'Add the frequencies: 14+27+35=76.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_013',
  'medium',
  'A bar graph shows Class A=15 and Class B=29. What is the difference?',
  '14','44','29','15',
  'A',
  'Difference = |29-15| = 14.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_014',
  'medium',
  'A student records temperature once per day for 17 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Line graph','Number sentence','Multiplication table',
  'B',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_015',
  'medium',
  'A graph uses a vertical scale increasing by 3 at each tick. What should a reader check before comparing bar heights?',
  'Only the tallest bar','Only the title','The axis labels and scale','Ignore the tick marks',
  'C',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_016',
  'medium',
  'A bar graph shows Red=18, Blue=35, Green=47. Which category has the greatest value?',
  'Red','Blue','They are equal','Green',
  'D',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_017',
  'medium',
  'A frequency table lists 19 Cats, 37 Dogs, and 50 Birds. What is the total frequency?',
  '106','50','108','56',
  'A',
  'Add the frequencies: 19+37+50=106.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_018',
  'medium',
  'A bar graph shows Class A=20 and Class B=39. What is the difference?',
  '59','19','39','20',
  'B',
  'Difference = |39-20| = 19.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_019',
  'medium',
  'A student records temperature once per day for 22 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Number sentence','Line graph','Multiplication table',
  'C',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_020',
  'challenge',
  'A graph uses a vertical scale increasing by 4 at each tick. What should a reader check before comparing bar heights?',
  'Only the tallest bar','Only the title','Ignore the tick marks','The axis labels and scale',
  'D',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_021',
  'challenge',
  'A bar graph shows Red=23, Blue=45, Green=62. Which category has the greatest value?',
  'Green','Red','Blue','They are equal',
  'A',
  'Compare the displayed values and choose the greatest.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_022',
  'challenge',
  'A frequency table lists 24 Cats, 47 Dogs, and 65 Birds. What is the total frequency?',
  '65','136','138','71',
  'B',
  'Add the frequencies: 24+47+65=136.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_023',
  'challenge',
  'A bar graph shows Class A=25 and Class B=49. What is the difference?',
  '74','49','24','25',
  'C',
  'Difference = |49-25| = 24.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_024',
  'challenge',
  'A student records temperature once per day for 27 days and wants to show how it changes over time. Which display is most suitable?',
  'Circle graph','Number sentence','Multiplication table','Line graph',
  'D',
  'A line graph is well suited to showing change over ordered time points.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,
  'IN_GRADE_6_MATH_STATISTICS_DATA_DISPLAYS_025',
  'challenge',
  'A graph uses a vertical scale increasing by 5 at each tick. What should a reader check before comparing bar heights?',
  'The axis labels and scale','Only the tallest bar','Only the title','Ignore the tick marks',
  'A',
  'Axis labels and scale determine the numerical meaning of the display.',
  1,'grade-math-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS'
  AND st.subtopic_code='DATA_DISPLAYS';

-- Audits
SELECT s.country_code,t.topic_code,st.subtopic_code,
       COUNT(q.id) AS questions,
       SUM(CASE WHEN q.difficulty='easy' THEN 1 ELSE 0 END) AS easy,
       SUM(CASE WHEN q.difficulty='medium' THEN 1 ELSE 0 END) AS medium,
       SUM(CASE WHEN q.difficulty='challenge' THEN 1 ELSE 0 END) AS challenge,
       COUNT(DISTINCT q.question_text) AS unique_texts
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id
JOIN education_subtopics st ON st.topic_id=t.id
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code IN ('US','IN')
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
GROUP BY s.country_code,t.id,st.id
ORDER BY s.country_code,t.sort_order,st.sort_order;

SELECT s.country_code,
       COUNT(q.id) AS questions,
       COUNT(DISTINCT q.question_text) AS unique_texts,
       SUM(CASE WHEN q.difficulty='easy' THEN 1 ELSE 0 END) AS easy,
       SUM(CASE WHEN q.difficulty='medium' THEN 1 ELSE 0 END) AS medium,
       SUM(CASE WHEN q.difficulty='challenge' THEN 1 ELSE 0 END) AS challenge
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code IN ('US','IN')
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND q.active=1
GROUP BY s.country_code
ORDER BY s.country_code;

SELECT q.correct_choice,COUNT(*) AS questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND q.active=1
GROUP BY q.correct_choice
ORDER BY q.correct_choice;
