-- 0116_sat_quality_test_1.sql
-- GYAN SAT Quality Test 1
--
-- Current digital SAT structure:
--   Reading & Writing Module 1 : 27 questions
--   Reading & Writing Module 2 : 27 questions
--   Math Module 1              : 22 questions
--   Math Module 2              : 22 questions
--   Total                      : 98 questions
--
-- GYAN Test 1 remains fixed/non-adaptive for now.
-- Difficulty balance: 24 easy / 50 medium / 24 challenge.
-- Math response mix: 33 MCQ / 11 student-produced numeric response.
-- Scoring: +1 correct, 0 incorrect, 0 unanswered.
--
-- Dedicated Test-1 questions use source_type='gyan-quality-test1'.
-- Existing SAT practice-bank questions remain untouched.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('SAT','FULL','TEST_1','Test 1','MAIN',1,'OPEN',1);

UPDATE education_mock_tests
SET test_name='Test 1',
    access_mode='OPEN',
    published=0,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='SAT'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='SAT'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='MAIN'
    AND version=1
);


-- 01. US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_01',
  'easy',
  'Which choice best states the main idea of the text?',
  'Rooftop gardens can reduce roof temperatures, especially on heat-absorbing roofs.',
  'Dark roofs should always be replaced with metal roofs.',
  'Rooftop gardens work only in winter.',
  'Researchers measured indoor air quality rather than temperature.',
  'A',
  'The text focuses on the cooling effect of rooftop gardens and where it was strongest.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CENTRAL_IDEAS_DETAILS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Researchers observed that rooftop gardens lowered daytime roof temperatures in summer. The effect was strongest on buildings with shallow, dark roofs, which otherwise absorbed substantial heat.',
  NULL,
  '["Rooftop gardens can reduce roof temperatures, especially on heat-absorbing roofs.","Dark roofs should always be replaced with metal roofs.","Rooftop gardens work only in winter.","Researchers measured indoor air quality rather than temperature."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  1,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 02. US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_02',
  'medium',
  'Which choice best summarizes the text?',
  'Women rarely participated in port economies.',
  'Several source types reveal economic activity that shipping records alone miss.',
  'Court petitions are more reliable than every other historical source.',
  'Most voyages were financed by households rather than merchants.',
  'B',
  'The point is that broader evidence changes the picture of women''s economic role.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CENTRAL_IDEAS_DETAILS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A historian studying a nineteenth-century port found that shipping records alone understated women''s economic activity. Household ledgers and court petitions revealed women financing voyages, supplying ships, and collecting debts.',
  NULL,
  '["Women rarely participated in port economies.","Several source types reveal economic activity that shipping records alone miss.","Court petitions are more reliable than every other historical source.","Most voyages were financed by households rather than merchants."]',
  '"B"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  2,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 03. US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_03',
  'challenge',
  'Which choice best states the central idea?',
  'Nighttime carbon uptake is an adaptation that conserves water but can constrain carbon intake.',
  'Desert plants cannot photosynthesize during the day.',
  'Lower nighttime temperatures increase water loss.',
  'All plants store carbon dioxide before photosynthesis.',
  'A',
  'The text presents both the benefit and tradeoff of nighttime stomatal opening.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CENTRAL_IDEAS_DETAILS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Some desert plants open their stomata mainly at night, storing carbon dioxide for use during daylight photosynthesis. This adaptation reduces water loss because nighttime temperatures are lower, though it can limit the rate at which carbon enters the plant.',
  NULL,
  '["Nighttime carbon uptake is an adaptation that conserves water but can constrain carbon intake.","Desert plants cannot photosynthesize during the day.","Lower nighttime temperatures increase water loss.","All plants store carbon dioxide before photosynthesis."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  3,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 04. US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_04',
  'medium',
  'Which choice best states the main idea?',
  'Bus lanes always worsen car travel.',
  'A bus-only corridor improved bus travel without substantially changing car travel times.',
  'Drivers stopped using cars entirely.',
  'Route changes made buses slower.',
  'B',
  'The text highlights improved bus times with little net change for cars.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CENTRAL_IDEAS_DETAILS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A city replaced several traffic lanes with a bus-only corridor. Bus travel times fell, but car travel times changed little because some drivers shifted routes or travel times.',
  NULL,
  '["Bus lanes always worsen car travel.","A bus-only corridor improved bus travel without substantially changing car travel times.","Drivers stopped using cars entirely.","Route changes made buses slower."]',
  '"B"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  4,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 05. US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_05',
  'easy',
  'Which choice best states the main idea?',
  'Mixed habitats were associated with greater bird diversity.',
  'Grassland parks contained no birds.',
  'Shrubs reduce species diversity.',
  'Park size was the only factor studied.',
  'A',
  'The sentence reports a relationship between habitat variety and bird diversity.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CENTRAL_IDEAS_DETAILS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Biologists recorded more bird species in parks that contained both open grass and dense shrubs than in parks dominated by only one habitat type.',
  NULL,
  '["Mixed habitats were associated with greater bird diversity.","Grassland parks contained no birds.","Shrubs reduce species diversity.","Park size was the only factor studied."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  5,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CENTRAL_IDEAS_DETAILS_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 06. US_PROGRAM_SAT_QT1_RW_INFERENCES_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_INFERENCES_01',
  'medium',
  'Which inference is best supported by the text?',
  'Some high-school students likely found Saturday evening access useful.',
  'The library should close on weekdays.',
  'All students prefer evening study.',
  'Weekend staffing costs decreased.',
  'A',
  'The increase in visits supports that the added time was useful to at least some students.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_INFERENCES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'After a library extended weekend hours, visits by high-school students rose most sharply on Saturday evenings.',
  NULL,
  '["Some high-school students likely found Saturday evening access useful.","The library should close on weekdays.","All students prefer evening study.","Weekend staffing costs decreased."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  6,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 07. US_PROGRAM_SAT_QT1_RW_INFERENCES_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_INFERENCES_02',
  'medium',
  'Which inference is best supported?',
  'Glacier position can respond to short-term changes in temperature and snowfall.',
  'One snowy winter permanently reverses climate trends.',
  'Glaciers never retreat in cool regions.',
  'Summer temperature has no effect on glaciers.',
  'A',
  'The observed retreat and partial advance suggest responsiveness to seasonal conditions.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_INFERENCES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A glacier retreated during three warm summers but advanced slightly after an unusually cool, snowy winter.',
  NULL,
  '["Glacier position can respond to short-term changes in temperature and snowfall.","One snowy winter permanently reverses climate trends.","Glaciers never retreat in cool regions.","Summer temperature has no effect on glaciers."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  7,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 08. US_PROGRAM_SAT_QT1_RW_INFERENCES_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_INFERENCES_03',
  'medium',
  'Which inference is most justified?',
  'Software alone may not explain the difference in outcomes.',
  'The second firm''s employees ignored every alert.',
  'Inventory software never works without reorganization.',
  'The first firm had fewer products.',
  'A',
  'The differing organizational practice is a plausible contributing factor, so software alone is insufficient.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_INFERENCES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Two firms adopted the same inventory software. One reduced stockouts substantially; the other did not. The first firm also reorganized how employees reviewed reorder alerts.',
  NULL,
  '["Software alone may not explain the difference in outcomes.","The second firm''s employees ignored every alert.","Inventory software never works without reorganization.","The first firm had fewer products."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  8,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 09. US_PROGRAM_SAT_QT1_RW_INFERENCES_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_INFERENCES_04',
  'medium',
  'Which inference is best supported?',
  'Light spectrum can affect stem elongation without necessarily changing leaf number.',
  'Red light prevents leaves from forming.',
  'Blue light changes plant genetics.',
  'Stem length determines leaf number.',
  'A',
  'The experiment isolates light spectrum and finds a difference in stem length but not leaf count.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_INFERENCES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Plants grown under blue-rich light developed shorter stems than genetically identical plants grown under red-rich light, while leaf number was similar.',
  NULL,
  '["Light spectrum can affect stem elongation without necessarily changing leaf number.","Red light prevents leaves from forming.","Blue light changes plant genetics.","Stem length determines leaf number."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  9,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 10. US_PROGRAM_SAT_QT1_RW_INFERENCES_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_INFERENCES_05',
  'easy',
  'Which inference is best supported?',
  'The free Friday period attracted additional visitors rather than merely shifting all existing visits.',
  'Friday visitors never attended museums before.',
  'Admission price is the only factor affecting attendance.',
  'Other days became less popular.',
  'A',
  'Because other-day attendance stayed stable, the Friday increase appears largely additive.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_INFERENCES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A museum introduced free admission on Friday evenings. Attendance rose, while attendance on other days remained about the same.',
  NULL,
  '["The free Friday period attracted additional visitors rather than merely shifting all existing visits.","Friday visitors never attended museums before.","Admission price is the only factor affecting attendance.","Other days became less popular."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  10,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_INFERENCES_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 11. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_01',
  'easy',
  'Which finding would most directly support the claim?',
  'Blocks with more mature canopy had lower afternoon surface temperatures than nearby blocks with little canopy.',
  'Tree species differed in leaf shape.',
  'Residents preferred flowering trees.',
  'Some streets were wider than others.',
  'A',
  'The selected result bears most directly on the stated causal or interpretive claim.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_TEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A researcher claims that neighborhood trees can reduce summer heat exposure.',
  NULL,
  '["Blocks with more mature canopy had lower afternoon surface temperatures than nearby blocks with little canopy.","Tree species differed in leaf shape.","Residents preferred flowering trees.","Some streets were wider than others."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  11,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 12. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_02',
  'medium',
  'Which evidence would best support the argument?',
  'Later novels use settings and events increasingly unlike those documented in the novelist''s life.',
  'The novelist wrote more slowly later in life.',
  'Critics preferred the early novels.',
  'The novelist traveled frequently.',
  'A',
  'The selected result bears most directly on the stated causal or interpretive claim.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_TEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'An author argues that a novelist''s later works became less autobiographical.',
  NULL,
  '["Later novels use settings and events increasingly unlike those documented in the novelist''s life.","The novelist wrote more slowly later in life.","Critics preferred the early novels.","The novelist traveled frequently."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  12,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 13. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_03',
  'challenge',
  'Which evidence would most strongly support the argument?',
  'Population declines were greatest in rivers where spawning habitat disappeared even though fishing effort remained stable.',
  'Fish prices rose during the same decade.',
  'Some fishers changed equipment.',
  'Habitat restoration was expensive.',
  'A',
  'The selected result bears most directly on the stated causal or interpretive claim.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_TEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A scientist argues that a decline in a fish population was driven more by habitat loss than by fishing pressure.',
  NULL,
  '["Population declines were greatest in rivers where spawning habitat disappeared even though fishing effort remained stable.","Fish prices rose during the same decade.","Some fishers changed equipment.","Habitat restoration was expensive."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  13,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 14. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_04',
  'medium',
  'Which evidence would best support the claim?',
  'After the line opened, towns connected to it shipped a larger share of goods to distant markets than similar unconnected towns.',
  'The rail company printed new schedules.',
  'Some stations had brick walls.',
  'Local newspapers mentioned the opening.',
  'A',
  'The selected result bears most directly on the stated causal or interpretive claim.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_TEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A historian claims that a new rail line altered regional trade patterns.',
  NULL,
  '["After the line opened, towns connected to it shipped a larger share of goods to distant markets than similar unconnected towns.","The rail company printed new schedules.","Some stations had brick walls.","Local newspapers mentioned the opening."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  14,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 15. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_05',
  'challenge',
  'Which result would most strongly support the argument?',
  'After equalizing alertness at test time, participants who slept after learning still remembered more than those who stayed awake.',
  'Sleepers reported feeling less tired.',
  'Alert participants answered faster.',
  'Participants preferred morning tests.',
  'A',
  'The selected result bears most directly on the stated causal or interpretive claim.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_TEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A psychologist argues that sleep improves memory consolidation rather than merely making participants more alert during testing.',
  NULL,
  '["After equalizing alertness at test time, participants who slept after learning still remembered more than those who stayed awake.","Sleepers reported feeling less tired.","Alert participants answered faster.","Participants preferred morning tests."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  15,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_TEXT_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 16. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_01',
  'easy',
  'Which choice best uses the data to support the statement that transit use increased?',
  'Transit use rose by 9 percentage points.',
  'Transit use fell by 9 percentage points.',
  'Transit use more than doubled.',
  'Transit use was unchanged.',
  'A',
  'The correct choice accurately interprets the quantitative evidence without overstating it.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_QUANT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A survey found that 42% of respondents used public transit in 2024 and 51% did so in 2025.',
  NULL,
  '["Transit use rose by 9 percentage points.","Transit use fell by 9 percentage points.","Transit use more than doubled.","Transit use was unchanged."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  16,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 17. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_02',
  'medium',
  'Which statement is best supported by the data?',
  'Average reading time increased at each successive grade level.',
  'Grade 6 had the highest average.',
  'Grades 7 and 8 had equal averages.',
  'The data show individual students read longer every year.',
  'A',
  'The correct choice accurately interprets the quantitative evidence without overstating it.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_QUANT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A school recorded average reading times of 18, 21, 24, and 29 minutes for Grades 6 through 9, respectively.',
  NULL,
  '["Average reading time increased at each successive grade level.","Grade 6 had the highest average.","Grades 7 and 8 had equal averages.","The data show individual students read longer every year."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  17,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 18. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_03',
  'challenge',
  'Which conclusion is best supported?',
  'The reported differences are small relative to the margins of error, so the data do not clearly establish one treatment as superior.',
  'Treatment 2 is certainly best.',
  'Treatment 1 is certainly worst.',
  'Margins of error prove the treatments are identical.',
  'A',
  'The correct choice accurately interprets the quantitative evidence without overstating it.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_QUANT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A study reports mean yields of 4.1, 4.3, and 4.2 tons per hectare for three fertilizer treatments, each with a margin of error of ±0.4.',
  NULL,
  '["The reported differences are small relative to the margins of error, so the data do not clearly establish one treatment as superior.","Treatment 2 is certainly best.","Treatment 1 is certainly worst.","Margins of error prove the treatments are identical."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  18,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 19. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_04',
  'medium',
  'Which choice most accurately describes the trend?',
  'The defect rate declined each quarter.',
  'The defect rate increased overall.',
  'The rate was constant.',
  'The largest decline occurred from Q3 to Q4.',
  'A',
  'The correct choice accurately interprets the quantitative evidence without overstating it.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_QUANT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A company''s quarterly defect rates were 3.2%, 2.8%, 2.5%, and 2.4%.',
  NULL,
  '["The defect rate declined each quarter.","The defect rate increased overall.","The rate was constant.","The largest decline occurred from Q3 to Q4."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  19,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 20. US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_05',
  'challenge',
  'Which statement best compares the changes?',
  'The first town improved by 8 percentage points, twice the second town''s 4-point improvement.',
  'Both improved by 8 points.',
  'The second improved more.',
  'The first rate doubled.',
  'A',
  'The correct choice accurately interprets the quantitative evidence without overstating it.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_COMMAND_EVIDENCE_QUANT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Two towns had recycling rates of 48% and 54%. After campaigns, the rates became 56% and 58%, respectively.',
  NULL,
  '["The first town improved by 8 percentage points, twice the second town''s 4-point improvement.","Both improved by 8 points.","The second improved more.","The first rate doubled."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  20,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_COMMAND_EVIDENCE_QUANT_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 21. US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_01',
  'easy',
  'As used in the text, ''tentative'' most nearly means',
  'provisional',
  'careless',
  'secret',
  'unpopular',
  'A',
  'Context determines the intended meaning of the word.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_WORDS_IN_CONTEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The committee described the proposal as ''tentative,'' emphasizing that it could be revised after public comment.',
  NULL,
  '["provisional","careless","secret","unpopular"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  21,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 22. US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_02',
  'medium',
  'As used in the text, ''robust'' most nearly means',
  'fragile',
  'reliable',
  'unexpected',
  'complex',
  'B',
  'Context determines the intended meaning of the word.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_WORDS_IN_CONTEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The scientist called the result ''robust'' because it remained similar across several alternative analyses.',
  NULL,
  '["fragile","reliable","unexpected","complex"]',
  '"B"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  22,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 23. US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_03',
  'medium',
  'As used in the text, ''qualified'' most nearly means',
  'modified by reservations',
  'professionally certified',
  'confusing',
  'enthusiastic',
  'A',
  'Context determines the intended meaning of the word.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_WORDS_IN_CONTEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The critic says the essay''s argument is ''qualified'': it advances a clear claim but repeatedly marks the limits of the available evidence.',
  NULL,
  '["modified by reservations","professionally certified","confusing","enthusiastic"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  23,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 24. US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_04',
  'medium',
  'As used in the text, ''measured'' most nearly means',
  'restrained',
  'calculated numerically',
  'angry',
  'delayed',
  'A',
  'Context determines the intended meaning of the word.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_WORDS_IN_CONTEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The mayor''s response was ''measured,'' acknowledging the concern without endorsing the most dramatic predictions.',
  NULL,
  '["restrained","calculated numerically","angry","delayed"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  24,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 25. US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_05',
  'medium',
  'As used in the text, ''novel'' most nearly means',
  'new',
  'fictional',
  'lengthy',
  'controversial',
  'A',
  'Context determines the intended meaning of the word.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_WORDS_IN_CONTEXT',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The discovery was ''novel'' because no previous study had documented the phenomenon.',
  NULL,
  '["new","fictional","lengthy","controversial"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  25,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_WORDS_IN_CONTEXT_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 26. US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_01',
  'easy',
  'Which choice best describes the function of the second part of the paragraph?',
  'It presents a solution to a previously identified limitation.',
  'It repeats the problem in different words.',
  'It changes to an unrelated topic.',
  'It provides a historical date only.',
  'A',
  'The function is determined by how the sentence relates to surrounding claims.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TEXT_STRUCTURE_PURPOSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The paragraph first describes a problem with an old method and then introduces a newer method that addresses the problem.',
  NULL,
  '["It presents a solution to a previously identified limitation.","It repeats the problem in different words.","It changes to an unrelated topic.","It provides a historical date only."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  26,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 27. US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_02',
  'medium',
  'The study is introduced primarily to',
  'complicate a broad generalization',
  'prove noise has no effects',
  'define bird diversity',
  'describe a new city law',
  'A',
  'The function is determined by how the sentence relates to surrounding claims.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TEXT_STRUCTURE_PURPOSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A passage opens with the common belief that urban noise always reduces bird diversity, then presents a study finding that some species adapt their songs and persist.',
  NULL,
  '["complicate a broad generalization","prove noise has no effects","define bird diversity","describe a new city law"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  27,
  'RW_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 28. US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_03',
  'challenge',
  'The final observation mainly serves to',
  'question how complete the earlier measure of success is',
  'celebrate the policy',
  'show that excluded groups were unaffected',
  'change the subject to statistics',
  'A',
  'The function is determined by how the sentence relates to surrounding claims.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TEXT_STRUCTURE_PURPOSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'An author recounts an apparently successful policy, then notes that the measured outcome excluded several affected groups.',
  NULL,
  '["question how complete the earlier measure of success is","celebrate the policy","show that excluded groups were unaffected","change the subject to statistics"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  28,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 29. US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_04',
  'medium',
  'The proposed experiment functions primarily to',
  'provide a way to test between the explanations',
  'summarize both explanations without evaluating them',
  'introduce a third unrelated explanation',
  'show experiments are unnecessary',
  'A',
  'The function is determined by how the sentence relates to surrounding claims.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TEXT_STRUCTURE_PURPOSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A text describes two competing explanations for a pattern and ends by proposing an experiment that would distinguish them.',
  NULL,
  '["provide a way to test between the explanations","summarize both explanations without evaluating them","introduce a third unrelated explanation","show experiments are unnecessary"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  29,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 30. US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_05',
  'easy',
  'The example mainly serves to',
  'illustrate the definition',
  'contradict the definition',
  'replace the definition',
  'introduce an unrelated argument',
  'A',
  'The function is determined by how the sentence relates to surrounding claims.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TEXT_STRUCTURE_PURPOSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A writer gives an example immediately after defining a technical term.',
  NULL,
  '["illustrate the definition","contradict the definition","replace the definition","introduce an unrelated argument"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  30,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TEXT_STRUCTURE_PURPOSE_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 31. US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_01',
  'easy',
  'How would the author of Text 2 most likely respond to Text 1?',
  'Agree that gardens can help but note that other uses may also provide community benefits.',
  'Claim vacant lots should never be reused.',
  'Argue produce has no value.',
  'Insist every lot must become housing.',
  'A',
  'The relationship depends on whether the second text supports, qualifies, or challenges the first.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CROSS_TEXT_CONNECTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Text 1: A city should convert vacant lots into community gardens because gardens provide local produce.
Text 2: Vacant lots can also serve as small parks, which may benefit residents who cannot participate in gardening.',
  NULL,
  '["Agree that gardens can help but note that other uses may also provide community benefits.","Claim vacant lots should never be reused.","Argue produce has no value.","Insist every lot must become housing."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  31,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 32. US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_02',
  'medium',
  'What is the main relationship between the texts?',
  'Text 2 qualifies the broad claim in Text 1.',
  'Text 2 repeats Text 1 exactly.',
  'Text 2 discusses an unrelated topic.',
  'Text 2 proves commuting time is irrelevant.',
  'A',
  'The relationship depends on whether the second text supports, qualifies, or challenges the first.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CROSS_TEXT_CONNECTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Text 1 argues that remote work increases productivity by reducing commuting time. Text 2 notes that productivity gains vary by task and depend on coordination costs.',
  NULL,
  '["Text 2 qualifies the broad claim in Text 1.","Text 2 repeats Text 1 exactly.","Text 2 discusses an unrelated topic.","Text 2 proves commuting time is irrelevant."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  32,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 33. US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_03',
  'challenge',
  'Text 2 most directly challenges which assumption in Text 1?',
  'That subscriptions are a reliable proxy for interest in local news.',
  'That digital platforms exist.',
  'That newspapers charge money.',
  'That local news covers cities.',
  'A',
  'The relationship depends on whether the second text supports, qualifies, or challenges the first.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CROSS_TEXT_CONNECTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Text 1 interprets a decline in newspaper subscriptions as evidence that interest in local news has fallen. Text 2 reports that local-news readership moved substantially to free digital platforms during the same period.',
  NULL,
  '["That subscriptions are a reliable proxy for interest in local news.","That digital platforms exist.","That newspapers charge money.","That local news covers cities."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  33,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 34. US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_04',
  'medium',
  'How does Text 2 affect Text 1''s explanation?',
  'It introduces another plausible cause of the attendance increase.',
  'It proves the exhibit had no visitors.',
  'It confirms the exhibit was the sole cause.',
  'It changes the topic to museum architecture.',
  'A',
  'The relationship depends on whether the second text supports, qualifies, or challenges the first.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CROSS_TEXT_CONNECTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Text 1 says a museum''s attendance increase followed a new exhibit. Text 2 notes that the museum also eliminated admission fees that month.',
  NULL,
  '["It introduces another plausible cause of the attendance increase.","It proves the exhibit had no visitors.","It confirms the exhibit was the sole cause.","It changes the topic to museum architecture."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  34,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 35. US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_05',
  'challenge',
  'How would Text 2 most likely be used?',
  'As evidence for an alternative explanation of the range expansion.',
  'As proof that barriers never matter.',
  'As support that temperatures rose.',
  'As evidence the species did not move.',
  'A',
  'The relationship depends on whether the second text supports, qualifies, or challenges the first.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CROSS_TEXT_CONNECTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Text 1 argues that a species'' range expansion reflects warmer temperatures. Text 2 shows that the expansion followed the removal of a physical barrier while temperatures remained stable.',
  NULL,
  '["As evidence for an alternative explanation of the range expansion.","As proof that barriers never matter.","As support that temperatures rose.","As evidence the species did not move."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  35,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_CROSS_TEXT_CONNECTIONS_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 36. US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_01',
  'easy',
  'Which choice most effectively uses the notes to emphasize the panels'' contribution?',
  'Installed in 2024, the solar panels now supply about 35% of the school''s annual electricity.',
  'The school uses electricity.',
  'Night occurs every day.',
  'Solar panels are placed outdoors.',
  'A',
  'The best choice uses the relevant notes to satisfy the stated rhetorical goal.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RHETORICAL_SYNTHESIS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'A student is writing about a solar-powered school. Notes: panels were installed in 2024; they supply about 35% of annual electricity; the school still uses grid power at night.',
  NULL,
  '["Installed in 2024, the solar panels now supply about 35% of the school''s annual electricity.","The school uses electricity.","Night occurs every day.","Solar panels are placed outdoors."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  36,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 37. US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_02',
  'medium',
  'Which choice best emphasizes the study''s result?',
  'In Mei Lin''s comparison of 12 grass species, three native species showed the fastest recovery after watering.',
  'Mei Lin is a botanist.',
  'The study included watering.',
  'Grass species can be native.',
  'A',
  'The best choice uses the relevant notes to satisfy the stated rhetorical goal.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RHETORICAL_SYNTHESIS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Notes: botanist Mei Lin studied drought tolerance; compared 12 grass species; measured recovery after watering; three native species recovered fastest.',
  NULL,
  '["In Mei Lin''s comparison of 12 grass species, three native species showed the fastest recovery after watering.","Mei Lin is a botanist.","The study included watering.","Grass species can be native."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  37,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 38. US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_03',
  'challenge',
  'Which choice best emphasizes how digitization changes research access?',
  'Because volunteers transcribed the letters into searchable text, researchers can now search 18,000 letters by names and places.',
  'The archive contains letters.',
  'The project lasted four years.',
  'Volunteers can read handwriting.',
  'A',
  'The best choice uses the relevant notes to satisfy the stated rhetorical goal.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RHETORICAL_SYNTHESIS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Notes: archive digitized 18,000 letters; project took four years; volunteers transcribed handwriting; searchable text enables name and place searches.',
  NULL,
  '["Because volunteers transcribed the letters into searchable text, researchers can now search 18,000 letters by names and places.","The archive contains letters.","The project lasted four years.","Volunteers can read handwriting."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  38,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 39. US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_04',
  'medium',
  'Which choice best emphasizes continuity between the original and rehabilitated bridge?',
  'The 2019 rehabilitation strengthened the 1932 bridge''s joints while preserving its original steel-truss appearance.',
  'The bridge opened in 1932.',
  'Steel was used in the bridge.',
  '2019 came after 1932.',
  'A',
  'The best choice uses the relevant notes to satisfy the stated rhetorical goal.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RHETORICAL_SYNTHESIS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Notes: bridge opened 1932; steel truss design; rehabilitated 2019; rehabilitation strengthened joints while preserving original appearance.',
  NULL,
  '["The 2019 rehabilitation strengthened the 1932 bridge''s joints while preserving its original steel-truss appearance.","The bridge opened in 1932.","Steel was used in the bridge.","2019 came after 1932."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  39,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 40. US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_05',
  'medium',
  'Which choice best introduces the orchestra?',
  'Founded in 1998, the community orchestra brings amateur and professional musicians together for six concerts each year.',
  'There are twelve months in a year.',
  'Some musicians are professionals.',
  'The orchestra has instruments.',
  'A',
  'The best choice uses the relevant notes to satisfy the stated rhetorical goal.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RHETORICAL_SYNTHESIS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Notes: community orchestra founded 1998; gives six concerts yearly; includes amateur and professional musicians.',
  NULL,
  '["Founded in 1998, the community orchestra brings amateur and professional musicians together for six concerts each year.","There are twelve months in a year.","Some musicians are professionals.","The orchestra has instruments."]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  40,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_RHETORICAL_SYNTHESIS_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 41. US_PROGRAM_SAT_QT1_RW_TRANSITIONS_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TRANSITIONS_01',
  'easy',
  'Which choice completes the text with the most logical transition?',
  'Therefore',
  'For example',
  'Meanwhile',
  'Likewise',
  'A',
  'The correct transition expresses the logical relationship between the sentences.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TRANSITIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The first trial produced no measurable effect. ______, the researchers repeated the experiment with a larger sample.',
  NULL,
  '["Therefore","For example","Meanwhile","Likewise"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  41,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 42. US_PROGRAM_SAT_QT1_RW_TRANSITIONS_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TRANSITIONS_02',
  'medium',
  'Which choice completes the text with the most logical transition?',
  'Nevertheless',
  'Similarly',
  'For instance',
  'Consequently',
  'A',
  'The correct transition expresses the logical relationship between the sentences.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TRANSITIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The material is lightweight. ______, it is strong enough for structural use.',
  NULL,
  '["Nevertheless","Similarly","For instance","Consequently"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  42,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 43. US_PROGRAM_SAT_QT1_RW_TRANSITIONS_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TRANSITIONS_03',
  'medium',
  'Which choice completes the text with the most logical transition?',
  'However',
  'In other words',
  'For example',
  'Accordingly',
  'A',
  'The correct transition expresses the logical relationship between the sentences.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TRANSITIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The two models make similar predictions under ordinary conditions. ______, their predictions diverge sharply at very high temperatures.',
  NULL,
  '["However","In other words","For example","Accordingly"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  43,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 44. US_PROGRAM_SAT_QT1_RW_TRANSITIONS_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TRANSITIONS_04',
  'medium',
  'Which choice completes the text with the most logical transition?',
  'However',
  'Therefore',
  'For example',
  'Likewise',
  'A',
  'The correct transition expresses the logical relationship between the sentences.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TRANSITIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The survey found strong support for expanding bus service. ______, respondents were divided about how to fund the expansion.',
  NULL,
  '["However","Therefore","For example","Likewise"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  44,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 45. US_PROGRAM_SAT_QT1_RW_TRANSITIONS_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_TRANSITIONS_05',
  'easy',
  'Which choice completes the text with the most logical transition?',
  'In addition',
  'Instead',
  'Nevertheless',
  'By contrast',
  'A',
  'The correct transition expresses the logical relationship between the sentences.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TRANSITIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The seed coat protects the embryo. ______, it can help delay germination until conditions are favorable.',
  NULL,
  '["In addition","Instead","Nevertheless","By contrast"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  45,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_TRANSITIONS_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 46. US_PROGRAM_SAT_QT1_RW_BOUNDARIES_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_BOUNDARIES_01',
  'easy',
  'Which choice completes the text so that it conforms to Standard English?',
  ';',
  ' ,',
  ' because',
  ' although',
  'A',
  'The correct answer creates a grammatically complete and properly punctuated sentence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_BOUNDARIES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The laboratory closed for renovation ______ it reopened three months later.',
  NULL,
  '[";"," ,"," because"," although"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  46,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 47. US_PROGRAM_SAT_QT1_RW_BOUNDARIES_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_BOUNDARIES_02',
  'medium',
  'Which choice completes the text so that it conforms to Standard English?',
  'collects',
  'collect',
  'collecting',
  'have collected',
  'A',
  'The correct answer creates a grammatically complete and properly punctuated sentence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_BOUNDARIES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The telescope, which was installed in 2018, ______ data every clear night.',
  NULL,
  '["collects","collect","collecting","have collected"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  47,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 48. US_PROGRAM_SAT_QT1_RW_BOUNDARIES_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_BOUNDARIES_03',
  'challenge',
  'Which choice completes the text so that it conforms to Standard English?',
  ',',
  ';',
  ':',
  '— and',
  'A',
  'The correct answer creates a grammatically complete and properly punctuated sentence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_BOUNDARIES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The committee reviewed three proposals ______ each of which addressed a different part of the transit plan.',
  NULL,
  '[",",";",":","— and"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  48,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 49. US_PROGRAM_SAT_QT1_RW_BOUNDARIES_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_BOUNDARIES_04',
  'medium',
  'Which choice completes the text so that it conforms to Standard English?',
  ';',
  ' , and',
  ' because of',
  ' despite',
  'A',
  'The correct answer creates a grammatically complete and properly punctuated sentence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_BOUNDARIES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The river has changed course several times ______ its present channel formed only two centuries ago.',
  NULL,
  '[";"," , and"," because of"," despite"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  49,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 50. US_PROGRAM_SAT_QT1_RW_BOUNDARIES_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_BOUNDARIES_05',
  'easy',
  'Which choice completes the text so that it conforms to Standard English?',
  'and',
  'but',
  'or',
  'although',
  'A',
  'The correct answer creates a grammatically complete and properly punctuated sentence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_BOUNDARIES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The samples were labeled carefully ______ then stored at -20°C.',
  NULL,
  '["and","but","or","although"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  50,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_BOUNDARIES_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 51. US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_01',
  'easy',
  'Which choice completes the text so that it conforms to Standard English?',
  'were',
  'was',
  'is',
  'be',
  'A',
  'The answer agrees with the subject and fits the sentence''s tense and structure.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='FORM_STRUCTURE_SENSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_FORM_STRUCTURE_SENSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Neither the manager nor the assistants ______ available yesterday.',
  NULL,
  '["were","was","is","be"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  51,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 52. US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_02',
  'medium',
  'Which choice completes the text so that it conforms to Standard English?',
  'had read',
  'readed',
  'have reads',
  'reading',
  'A',
  'The answer agrees with the subject and fits the sentence''s tense and structure.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='FORM_STRUCTURE_SENSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_FORM_STRUCTURE_SENSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'By the time the lecture began, the students ______ the assigned article.',
  NULL,
  '["had read","readed","have reads","reading"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  52,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 53. US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_03',
  'challenge',
  'Which choice completes the text so that it conforms to Standard English?',
  'is displayed',
  'are displayed',
  'display',
  'have displayed',
  'A',
  'The answer agrees with the subject and fits the sentence''s tense and structure.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='FORM_STRUCTURE_SENSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_FORM_STRUCTURE_SENSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'The collection of early maps, along with several navigation instruments, ______ in the east gallery.',
  NULL,
  '["is displayed","are displayed","display","have displayed"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  53,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 54. US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_04',
  'medium',
  'Which choice completes the text so that it conforms to Standard English?',
  'measure',
  'measures',
  'measuring',
  'has measured',
  'A',
  'The answer agrees with the subject and fits the sentence''s tense and structure.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='FORM_STRUCTURE_SENSE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_FORM_STRUCTURE_SENSE',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'TEXT',
  'Researchers who study coral reefs often ______ temperature and acidity at the same sites for many years.',
  NULL,
  '["measure","measures","measuring","has measured"]',
  '"A"',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  54,
  'RW_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_RW_FORM_STRUCTURE_SENSE_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 55. US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_01',
  'medium',
  'If 4x+3=19, what is x?',
  '4',
  '',
  '',
  '',
  'A',
  '4x=16, so x=4.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_1VAR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_EQ_1VAR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["4"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  55,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_01'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 56. US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_02',
  'medium',
  'A gym charges a $25 signup fee plus $18 per month. If the total after m months is $151, what is m?',
  '7',
  '',
  '',
  '',
  'A',
  '25+18m=151, so 18m=126 and m=7.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_1VAR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_EQ_1VAR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["7"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  56,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_02'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 57. US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_03',
  'medium',
  'The line 2x+3y=12 passes through (3,y). What is y?',
  '2',
  '',
  '',
  '',
  'A',
  '6+3y=12, so y=2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_2VAR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_EQ_2VAR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["2"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  57,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_03'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 58. US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_04',
  'challenge',
  'A line passes through (2,7) and (6,15). Which equation represents the line?',
  'y=2x+3',
  'y=3x+1',
  'y=2x-3',
  'y=x+5',
  'A',
  'Slope=(15-7)/(6-2)=2; using (2,7) gives b=3.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_2VAR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_EQ_2VAR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["y=2x+3","y=3x+1","y=2x-3","y=x+5"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  58,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_2VAR_04'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 59. US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_05',
  'easy',
  'For f(x)=3x-2, what is f(5)?',
  '13',
  '',
  '',
  '',
  'A',
  'f(5)=15-2=13.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_FUNCTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["13"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  59,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_05'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 60. US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_06
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_06',
  'medium',
  'A linear function has f(2)=7 and f(5)=16. What is its slope?',
  '3',
  '',
  '',
  '',
  'A',
  'Slope=(16-7)/(5-2)=3.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_FUNCTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_06';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["3"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_06';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  60,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_06'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 61. US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_07
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_07',
  'medium',
  'If x+y=10 and x-y=4, what is x?',
  '7',
  '',
  '',
  '',
  'A',
  'Adding gives 2x=14, so x=7.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='SYSTEMS_LINEAR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_SYSTEMS_LINEAR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_07';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["7"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_07';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  61,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_07'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 62. US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_08
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_08',
  'challenge',
  'Tickets cost $8 for students and $12 for adults. A total of 50 tickets brought in $520. How many adult tickets were sold?',
  '20',
  '25',
  '30',
  '35',
  'C',
  's+a=50 and 8s+12a=520; substituting gives a=30.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='SYSTEMS_LINEAR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_SYSTEMS_LINEAR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_08';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["20","25","30","35"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_08';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  62,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_SYSTEMS_LINEAR_08'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 63. US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_09
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_09',
  'easy',
  'Which value satisfies 3x-2>10?',
  '2',
  '3',
  '4',
  '5',
  'D',
  '3x>12, so x>4; among choices only 5 works.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_INEQUALITIES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_09';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["2","3","4","5"]',
  '["D"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_09';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  63,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_09'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 64. US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_10
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_10',
  'medium',
  'If -2x+5≤13, which inequality is equivalent?',
  'x≥-4',
  'x≤-4',
  'x≥4',
  'x≤4',
  'A',
  '-2x≤8; dividing by -2 reverses inequality: x≥-4.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_INEQUALITIES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_10';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["x≥-4","x≤-4","x≥4","x≤4"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_10';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  64,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_INEQUALITIES_10'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 65. US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_11
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_11',
  'challenge',
  'If 5/(x-1)=2, what is x?',
  '2.5',
  '3',
  '3.5',
  '4',
  'C',
  '5=2(x-1), so 2x=7 and x=3.5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_1VAR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_EQ_1VAR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_11';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["2.5","3","3.5","4"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_11';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  65,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_EQ_1VAR_11'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 66. US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_12
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_12',
  'medium',
  'A quantity decreases linearly from 74 at t=2 to 50 at t=8. What is its value at t=5?',
  '56',
  '60',
  '62',
  '66',
  'C',
  'Slope=-24/6=-4; three units after t=2 gives 74-12=62.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINEAR_FUNCTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_12';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["56","60","62","66"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_12';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  66,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINEAR_FUNCTIONS_12'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 67. US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_13
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_13',
  'easy',
  'Which expression is equivalent to 3(x+4)-2x?',
  'x+12',
  'x+4',
  '5x+12',
  'x+2',
  'A',
  'Expand: 3x+12-2x=x+12.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='EQUIVALENT_EXPRESSIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_EQUIVALENT_EXPRESSIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_13';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["x+12","x+4","5x+12","x+2"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_13';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  67,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_13'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 68. US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_14
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_14',
  'medium',
  'Which expression is equivalent to (x²-9)/(x-3) for x≠3?',
  'x-3',
  'x+3',
  'x²+3',
  '1',
  'B',
  'Factor numerator as (x-3)(x+3).',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='EQUIVALENT_EXPRESSIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_EQUIVALENT_EXPRESSIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_14';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["x-3","x+3","x²+3","1"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_14';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  68,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_14'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 69. US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_15
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_15',
  'medium',
  'What are the solutions to x²-7x+12=0?',
  '3 and 4',
  '2 and 6',
  '-3 and -4',
  '1 and 12',
  'A',
  'Factor as (x-3)(x-4).',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_NONLINEAR_EQUATIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_15';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["3 and 4","2 and 6","-3 and -4","1 and 12"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_15';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  69,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_15'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 70. US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_16
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_16',
  'challenge',
  'If x²=6x+16, what is the positive solution?',
  '2',
  '4',
  '8',
  '10',
  'C',
  'x²-6x-16=(x-8)(x+2), so positive solution is 8.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_NONLINEAR_EQUATIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_16';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["2","4","8","10"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_16';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  70,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_EQUATIONS_16'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 71. US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_17
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_17',
  'easy',
  'For g(x)=2x²+1, what is g(3)?',
  '19',
  '',
  '',
  '',
  'A',
  '2(9)+1=19.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_NONLINEAR_FUNCTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_17';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["19"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_17';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  71,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_17'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 72. US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_18
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_18',
  'medium',
  'The function h(x)=200(0.8)^x models a quantity. What percent decrease occurs each time x increases by 1?',
  '8%',
  '20%',
  '80%',
  '120%',
  'B',
  'A factor of 0.8 means 20% decrease.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_NONLINEAR_FUNCTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_18';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["8%","20%","80%","120%"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_18';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  72,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_18'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 73. US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_19
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_19',
  'challenge',
  'If x>0, which expression is equivalent to sqrt(50x²)?',
  '5x√2',
  '10x',
  '25x√2',
  'x√50',
  'A',
  'sqrt(50x²)=sqrt(25·2)x=5x√2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='EQUIVALENT_EXPRESSIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_EQUIVALENT_EXPRESSIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_19';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["5x√2","10x","25x√2","x√50"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_19';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  73,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_EQUIVALENT_EXPRESSIONS_19'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 74. US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_20
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_20',
  'challenge',
  'A parabola has vertex (2,-3) and passes through (3,-1). Which equation represents it?',
  'y=2(x-2)²-3',
  'y=(x-2)²-3',
  'y=2(x+2)²-3',
  'y=(x-3)²-2',
  'A',
  'Using vertex form y=a(x-2)²-3 and point (3,-1) gives a=2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_NONLINEAR_FUNCTIONS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_20';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["y=2(x-2)²-3","y=(x-2)²-3","y=2(x+2)²-3","y=(x-3)²-2"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_20';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  74,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_NONLINEAR_FUNCTIONS_20'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 75. US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_21
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_21',
  'easy',
  'A car travels 180 miles in 3 hours at a constant rate. What is the rate in miles per hour?',
  '60',
  '',
  '',
  '',
  'A',
  '180/3=60.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='RATIOS_RATES_UNITS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RATIOS_RATES_UNITS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_21';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["60"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_21';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  75,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_21'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 76. US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_22
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_22',
  'medium',
  'A recipe uses 3 cups of flour for 8 servings. How many cups are needed for 20 servings?',
  '6',
  '7.5',
  '8',
  '9',
  'B',
  '3/8 × 20 = 7.5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='RATIOS_RATES_UNITS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RATIOS_RATES_UNITS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_22';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["6","7.5","8","9"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_22';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  76,
  'MATH_M1',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_RATIOS_RATES_UNITS_22'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 77. US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_23
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_23',
  'medium',
  'A $50 item is discounted 20%. What is the sale price?',
  '$10',
  '$30',
  '$40',
  '$45',
  'C',
  '20% of 50 is 10, so price is 40.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PERCENTAGES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_PERCENTAGES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_23';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["$10","$30","$40","$45"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_23';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  77,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_23'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 78. US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_24
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_24',
  'challenge',
  'A value increases by 20% and then decreases by 20%. Compared with the original value, the final value is',
  '4% lower',
  'unchanged',
  '4% higher',
  '8% lower',
  'A',
  '1.2×0.8=0.96, which is 4% lower.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PERCENTAGES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_PERCENTAGES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_24';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["4% lower","unchanged","4% higher","8% lower"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_24';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  78,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_PERCENTAGES_24'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 79. US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_25
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_25',
  'easy',
  'What is the median of 2, 4, 7, 9, 12?',
  '4',
  '7',
  '8',
  '9',
  'B',
  'The middle value is 7.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='ONE_VARIABLE_DATA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_ONE_VARIABLE_DATA',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_25';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["4","7","8","9"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_25';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  79,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_25'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 80. US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_26
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_26',
  'medium',
  'A data set has mean 12 for 5 values. If four values sum to 44, what is the fifth value?',
  '16',
  '',
  '',
  '',
  'A',
  'Total is 60, so fifth value is 16.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='ONE_VARIABLE_DATA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_ONE_VARIABLE_DATA',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_26';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["16"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_26';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  80,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_ONE_VARIABLE_DATA_26'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 81. US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_27
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_27',
  'medium',
  'A scatterplot shows points closely following an upward-sloping line. Which description is most appropriate?',
  'Strong positive association',
  'Strong negative association',
  'No association',
  'Perfectly horizontal association',
  'A',
  'An upward linear pattern indicates positive association.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='TWO_VARIABLE_DATA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TWO_VARIABLE_DATA',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_27';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["Strong positive association","Strong negative association","No association","Perfectly horizontal association"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_27';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  81,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_27'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 82. US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_28
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_28',
  'challenge',
  'A regression line predicts y=42 when x=10. The observed y is 47. What is the residual?',
  '-5',
  '5',
  '37',
  '89',
  'B',
  'Residual=observed-predicted=47-42=5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='TWO_VARIABLE_DATA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_TWO_VARIABLE_DATA',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_28';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["-5","5","37","89"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_28';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  82,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_TWO_VARIABLE_DATA_28'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 83. US_PROGRAM_SAT_QT1_MATH_PROBABILITY_29
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_PROBABILITY_29',
  'medium',
  'A bag contains 4 red and 6 blue marbles. What is the probability of selecting a red marble?',
  '2/5',
  '3/5',
  '1/4',
  '2/3',
  'A',
  '4/10=2/5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_PROBABILITY',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PROBABILITY_29';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["2/5","3/5","1/4","2/3"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PROBABILITY_29';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  83,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_PROBABILITY_29'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 84. US_PROGRAM_SAT_QT1_MATH_PROBABILITY_30
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_PROBABILITY_30',
  'medium',
  'If P(A)=0.6, P(B)=0.5, and P(A and B)=0.3, what is P(A or B)?',
  '0.2',
  '0.3',
  '0.8',
  '1.1',
  'C',
  '0.6+0.5-0.3=0.8.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_PROBABILITY',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PROBABILITY_30';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["0.2","0.3","0.8","1.1"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_PROBABILITY_30';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  84,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_PROBABILITY_30'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 85. US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_31
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_31',
  'medium',
  'A poll estimates 52% support with a margin of error of ±3 percentage points. Which value is within the reported interval?',
  '47%',
  '49%',
  '56%',
  '60%',
  'B',
  'The interval is 49% to 55%.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='INFERENCE_MARGIN_ERROR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_INFERENCE_MARGIN_ERROR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_31';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["47%","49%","56%","60%"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_31';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  85,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_31'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 86. US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_32
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_32',
  'challenge',
  'Which change generally reduces the margin of error of a sample estimate, all else equal?',
  'Increasing sample size',
  'Decreasing sample size',
  'Using fewer observations',
  'Increasing response variability deliberately',
  'A',
  'Larger samples generally reduce sampling uncertainty.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='INFERENCE_MARGIN_ERROR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_INFERENCE_MARGIN_ERROR',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_32';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["Increasing sample size","Decreasing sample size","Using fewer observations","Increasing response variability deliberately"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_32';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  86,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_INFERENCE_MARGIN_ERROR_32'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 87. US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_33
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_33',
  'medium',
  'Researchers randomly assign participants to two diets and compare outcomes. Which conclusion is most justified if groups differ significantly?',
  'The diet assignment may have caused the difference.',
  'The study can only show correlation.',
  'Random assignment guarantees no measurement error.',
  'The result applies to every population.',
  'A',
  'Random assignment supports causal inference within the study.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='STATISTICAL_CLAIMS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_STATISTICAL_CLAIMS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_33';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["The diet assignment may have caused the difference.","The study can only show correlation.","Random assignment guarantees no measurement error.","The result applies to every population."]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_33';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  87,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_33'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 88. US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_34
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_34',
  'challenge',
  'A survey about commuting is posted voluntarily on a cycling website. What is the main concern?',
  'Selection bias',
  'Arithmetic error',
  'Random assignment',
  'Unit conversion',
  'A',
  'Visitors who choose to respond may not represent all commuters.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='STATISTICAL_CLAIMS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_STATISTICAL_CLAIMS',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_34';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["Selection bias","Arithmetic error","Random assignment","Unit conversion"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_34';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  88,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_STATISTICAL_CLAIMS_34'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 89. US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_35
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_35',
  'easy',
  'A rectangle has length 8 and width 5. What is its area?',
  '40',
  '',
  '',
  '',
  'A',
  '8×5=40.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='AREA_VOLUME';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_AREA_VOLUME',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_35';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["40"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_35';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  89,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_35'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 90. US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_36
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_36',
  'medium',
  'A cylinder has radius 3 and height 5. What is its volume?',
  '15π',
  '30π',
  '45π',
  '90π',
  'C',
  'πr²h=π·9·5=45π.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='AREA_VOLUME';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_AREA_VOLUME',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_36';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["15π","30π","45π","90π"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_36';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  90,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_AREA_VOLUME_36'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 91. US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_37
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_37',
  'easy',
  'Two angles of a triangle are 50° and 60°. What is the third angle?',
  '60°',
  '70°',
  '80°',
  '90°',
  'B',
  '180-110=70.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINES_ANGLES_TRIANGLES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_37';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["60°","70°","80°","90°"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_37';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  91,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_37'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 92. US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_38
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_38',
  'medium',
  'Two parallel lines are cut by a transversal. If one acute angle is 38°, what is each obtuse angle?',
  '38°',
  '52°',
  '142°',
  '152°',
  'C',
  'Supplementary angle is 180-38=142.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINES_ANGLES_TRIANGLES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_38';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["38°","52°","142°","152°"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_38';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  92,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_38'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 93. US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_39
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_39',
  'challenge',
  'A triangle has side lengths 7, 9, and x. Which value could x be?',
  '1',
  '2',
  '15',
  '17',
  'C',
  'Triangle inequality requires 2<x<16, so 15 works.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_LINES_ANGLES_TRIANGLES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_39';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["1","2","15","17"]',
  '["C"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_39';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  93,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_LINES_ANGLES_TRIANGLES_39'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 94. US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_40
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_40',
  'medium',
  'A right triangle has legs 6 and 8. What is the hypotenuse?',
  '10',
  '12',
  '14',
  '15',
  'A',
  '6²+8²=100, so hypotenuse 10.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='RIGHT_TRIANGLES_TRIG';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RIGHT_TRIANGLES_TRIG',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_40';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["10","12","14","15"]',
  '["A"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_40';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  94,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_40'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 95. US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_41
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_41',
  'challenge',
  'In a right triangle, sin θ=3/5. If the side opposite θ is 12, what is the hypotenuse?',
  '15',
  '20',
  '24',
  '30',
  'B',
  '12/h=3/5, so h=20.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='RIGHT_TRIANGLES_TRIG';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_RIGHT_TRIANGLES_TRIG',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_41';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["15","20","24","30"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_41';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  95,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_RIGHT_TRIANGLES_TRIG_41'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 96. US_PROGRAM_SAT_QT1_MATH_CIRCLES_42
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_CIRCLES_42',
  'easy',
  'A circle has radius 4. What is its circumference?',
  '4π',
  '8π',
  '16π',
  '32π',
  'B',
  'Circumference=2πr=8π.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CIRCLES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_42';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["4π","8π","16π","32π"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_42';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  96,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_42'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 97. US_PROGRAM_SAT_QT1_MATH_CIRCLES_43
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_CIRCLES_43',
  'medium',
  'A circle has area 49π. What is its radius?',
  '7',
  '',
  '',
  '',
  'A',
  'πr²=49π, so r=7.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CIRCLES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_43';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["7"]',
  0,
  0,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_43';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  97,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_43'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 98. US_PROGRAM_SAT_QT1_MATH_CIRCLES_44
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_QT1_MATH_CIRCLES_44',
  'challenge',
  'A central angle of 90° intercepts an arc in a circle of radius 8. What is the arc length?',
  '2π',
  '4π',
  '8π',
  '16π',
  'B',
  'One quarter of circumference 16π is 4π.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'SAT_2026',
  'REVIEWED',
  'QUALITY_TEST1_CIRCLES',
  'GYAN SAT Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_44';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["2π","4π","8π","16π"]',
  '["B"]',
  0,
  NULL,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_44';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  98,
  'MATH_M2',
  1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_SAT_QT1_MATH_CIRCLES_44'
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- Publish only if the full fixed structure exists.
UPDATE education_mock_tests
SET access_mode='OPEN',
    published=CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      )=98 THEN 1
      ELSE 0
    END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='SAT'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

-- Audits
SELECT
  mt.id,
  mt.program_code,
  mt.test_code,
  mt.version,
  mt.published,
  COUNT(mtq.question_id) AS question_count
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id,mt.program_code,mt.test_code,mt.version,mt.published;

SELECT
  mtq.section_code,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mtq.section_code
ORDER BY MIN(mtq.question_order);

SELECT
  q.difficulty,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY q.difficulty
ORDER BY CASE q.difficulty
  WHEN 'easy' THEN 1
  WHEN 'medium' THEN 2
  WHEN 'challenge' THEN 3
  ELSE 4
END;

SELECT
  rd.response_type,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_question_response_details rd
  ON rd.question_id=mtq.question_id
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY rd.response_type
ORDER BY rd.response_type;

SELECT
  s.subject_code,
  t.topic_code,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY s.subject_code,t.topic_code
ORDER BY s.sort_order,t.sort_order;
