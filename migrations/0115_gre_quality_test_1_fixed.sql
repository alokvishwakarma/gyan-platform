-- 0115_gre_quality_test_1.sql
-- GYAN GRE Quality Test 1 — rebuilt fixed set
--
-- Current scored GRE structure represented here:
--   Verbal 1 : 12
--   Verbal 2 : 15
--   Quant 1  : 12
--   Quant 2  : 15
--   Total    : 54
--
-- GYAN Test 1 is intentionally fixed (non-adaptive) for now.
-- Difficulty balance: 14 easy / 26 medium / 14 advanced (hard tier).
-- Scoring: +1 correct, 0 incorrect, 0 unanswered.
--
-- This migration REPLACES the existing GRE FULL TEST_1 v1 mappings.
-- Existing practice-bank questions remain untouched.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('GRE','FULL','TEST_1','Test 1','MAIN',1,'OPEN',1);

UPDATE education_mock_tests
SET test_name='Test 1',
    access_mode='OPEN',
    published=1,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='GRE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id FROM education_mock_tests
  WHERE program_code='GRE'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='MAIN'
    AND version=1
);


-- 01. US_PROGRAM_GRE_QT1_V01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V01',
  'easy',
  'Which choice best states the main point of the passage?',
  'Tree planting is too expensive for most cities.',
  'Tree-planting programs should be evaluated by outcomes, not planting totals alone.',
  'Young trees should never be planted in hot neighborhoods.',
  'Storm-water control is the primary benefit of urban trees.',
  'B',
  'The passage acknowledges several benefits but argues that planting counts can overstate success when survival and cooling outcomes are poor.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Cities often respond to hotter summers by planting more trees. The policy is attractive because tree canopy can lower surface temperatures, absorb storm water, and improve neighborhood air quality. Yet citywide planting targets can conceal an important limitation: young trees provide little shade for years, and survival rates vary sharply with soil quality, irrigation, and maintenance. A program measured only by the number of trees planted may therefore appear successful while producing little cooling where heat exposure is greatest.',
  NULL,
  '["Tree planting is too expensive for most cities.","Tree-planting programs should be evaluated by outcomes, not planting totals alone.","Young trees should never be planted in hot neighborhoods.","Storm-water control is the primary benefit of urban trees.","Soil quality is more important than irrigation in every city."]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V01';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Cities often respond to hotter summers by planting more trees. The policy is attractive because tree canopy can lower surface temperatures, absorb storm water, and improve neighborhood air quality. Yet citywide planting targets can conceal an important limitation: young trees provide little shade for years, and survival rates vary sharply with soil quality, irrigation, and maintenance. A program measured only by the number of trees planted may therefore appear successful while producing little cooling where heat exposure is greatest.',
  NULL,
  '["Tree planting is too expensive for most cities.","Tree-planting programs should be evaluated by outcomes, not planting totals alone.","Young trees should never be planted in hot neighborhoods.","Storm-water control is the primary benefit of urban trees.","Soil quality is more important than irrigation in every city."]',
  '["B"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,1,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V01'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 02. US_PROGRAM_GRE_QT1_V02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V02',
  'medium',
  'The passage most strongly suggests that two neighborhoods receiving the same number of new trees may experience different cooling benefits because',
  'residents in hotter neighborhoods generally oppose tree planting',
  'surface temperature is unrelated to tree survival',
  'local growing conditions and maintenance can differ',
  'mature trees absorb less storm water than young trees',
  'C',
  'The passage explicitly links survival and eventual canopy benefits to soil, irrigation, and maintenance.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Cities often respond to hotter summers by planting more trees. The policy is attractive because tree canopy can lower surface temperatures, absorb storm water, and improve neighborhood air quality. Yet citywide planting targets can conceal an important limitation: young trees provide little shade for years, and survival rates vary sharply with soil quality, irrigation, and maintenance. A program measured only by the number of trees planted may therefore appear successful while producing little cooling where heat exposure is greatest.',
  NULL,
  '["residents in hotter neighborhoods generally oppose tree planting","surface temperature is unrelated to tree survival","local growing conditions and maintenance can differ","mature trees absorb less storm water than young trees","citywide planting targets require identical species"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V02';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Cities often respond to hotter summers by planting more trees. The policy is attractive because tree canopy can lower surface temperatures, absorb storm water, and improve neighborhood air quality. Yet citywide planting targets can conceal an important limitation: young trees provide little shade for years, and survival rates vary sharply with soil quality, irrigation, and maintenance. A program measured only by the number of trees planted may therefore appear successful while producing little cooling where heat exposure is greatest.',
  NULL,
  '["residents in hotter neighborhoods generally oppose tree planting","surface temperature is unrelated to tree survival","local growing conditions and maintenance can differ","mature trees absorb less storm water than young trees","citywide planting targets require identical species"]',
  '["C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,2,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V02'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 03. US_PROGRAM_GRE_QT1_V03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V03',
  'advanced',
  'Which TWO findings would most strengthen the author''s criticism of using planting totals as the main measure of success?',
  'A large fraction of newly planted trees in the hottest districts die within three years.',
  'Residents report that mature trees make streets more attractive.',
  'Cooling gains are strongly associated with surviving canopy rather than initial planting counts.',
  '',
  'A',
  'Both findings show why initial planting totals can diverge from the outcome the policy is intended to produce.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_MULTI_SELECT',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'PASSAGE',
  'Cities often respond to hotter summers by planting more trees. The policy is attractive because tree canopy can lower surface temperatures, absorb storm water, and improve neighborhood air quality. Yet citywide planting targets can conceal an important limitation: young trees provide little shade for years, and survival rates vary sharply with soil quality, irrigation, and maintenance. A program measured only by the number of trees planted may therefore appear successful while producing little cooling where heat exposure is greatest.',
  'Select exactly two answers.',
  '["A large fraction of newly planted trees in the hottest districts die within three years.","Residents report that mature trees make streets more attractive.","Cooling gains are strongly associated with surviving canopy rather than initial planting counts."]',
  '["A","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V03';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'VERBAL',
  'PASSAGE',
  'Cities often respond to hotter summers by planting more trees. The policy is attractive because tree canopy can lower surface temperatures, absorb storm water, and improve neighborhood air quality. Yet citywide planting targets can conceal an important limitation: young trees provide little shade for years, and survival rates vary sharply with soil quality, irrigation, and maintenance. A program measured only by the number of trees planted may therefore appear successful while producing little cooling where heat exposure is greatest.',
  'Select exactly two answers.',
  '["A large fraction of newly planted trees in the hottest districts die within three years.","Residents report that mature trees make streets more attractive.","Cooling gains are strongly associated with surviving canopy rather than initial planting counts."]',
  '["A","C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,3,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V03'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 04. US_PROGRAM_GRE_QT1_V04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V04',
  'easy',
  'Because the committee''s final report summarized the evidence clearly and avoided unnecessary jargon, even non-specialists found it ______.',
  'accessible',
  'cryptic',
  'partisan',
  'tentative',
  'A',
  'Accessible fits both the clarity and the non-specialist audience.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '["accessible","cryptic","partisan","tentative","derivative"]',
  '["A"]',
  1,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V04';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["accessible","cryptic","partisan","tentative","derivative"]',
  '["A"]',
  1,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,4,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V04'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 05. US_PROGRAM_GRE_QT1_V05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V05',
  'medium',
  'The historian was neither (i) ______ toward the disputed memoir nor eager to dismiss it; instead, she treated it with (ii) ______ skepticism.',
  'credulous',
  'hostile',
  'indifferent',
  'methodical',
  'A',
  'The contrast requires someone not automatically trusting or rejecting the memoir, but evaluating it with disciplined skepticism.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["credulous","hostile","indifferent"],"blank2":["methodical","careless","reflexive"]}',
  '{"blank1":"A","blank2":"A"}',
  2,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V05';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["credulous","hostile","indifferent"],"blank2":["methodical","careless","reflexive"]}',
  '{"blank1":"A","blank2":"A"}',
  2,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,5,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V05'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 06. US_PROGRAM_GRE_QT1_V06
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V06',
  'medium',
  'The editor praised the essay for being ______: it expressed a complicated argument in remarkably few words.',
  'succinct',
  'ornate',
  'terse',
  'digressive',
  'A',
  'Succinct and terse both mean brief and concise, producing equivalent sentence meanings.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SENTENCE_EQUIVALENCE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V06';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["succinct","ornate","terse","digressive","ambiguous","laborious"]',
  '["A","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V06';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["succinct","ornate","terse","digressive","ambiguous","laborious"]',
  '["A","C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V06';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,6,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V06'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 07. US_PROGRAM_GRE_QT1_V07
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V07',
  'medium',
  'The passage is primarily concerned with',
  'showing that modern restorers lack the technical skill of earlier restorers',
  'explaining why museums increasingly prefer repairs that are unobtrusive yet identifiable',
  'arguing that all restoration should be visible from ordinary viewing distance',
  'comparing the market value of restored and unrestored paintings',
  'B',
  'The passage explains the ethical reasoning behind the newer restoration standard.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V07';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Conservators once tried to make restored paintings look visually seamless, retouching damaged regions until repairs were nearly indistinguishable from the artist''s original work. Many museums now favor a different principle: from ordinary viewing distance a repair should not distract, but under close inspection it should remain identifiable. The shift reflects not poorer craftsmanship but a change in ethical priorities. A reversible, detectable intervention allows future conservators to separate later additions from original material and to revise a treatment when better methods become available.',
  NULL,
  '["showing that modern restorers lack the technical skill of earlier restorers","explaining why museums increasingly prefer repairs that are unobtrusive yet identifiable","arguing that all restoration should be visible from ordinary viewing distance","comparing the market value of restored and unrestored paintings","describing chemical methods used to reverse old varnish"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V07';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Conservators once tried to make restored paintings look visually seamless, retouching damaged regions until repairs were nearly indistinguishable from the artist''s original work. Many museums now favor a different principle: from ordinary viewing distance a repair should not distract, but under close inspection it should remain identifiable. The shift reflects not poorer craftsmanship but a change in ethical priorities. A reversible, detectable intervention allows future conservators to separate later additions from original material and to revise a treatment when better methods become available.',
  NULL,
  '["showing that modern restorers lack the technical skill of earlier restorers","explaining why museums increasingly prefer repairs that are unobtrusive yet identifiable","arguing that all restoration should be visible from ordinary viewing distance","comparing the market value of restored and unrestored paintings","describing chemical methods used to reverse old varnish"]',
  '["B"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V07';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,7,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V07'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 08. US_PROGRAM_GRE_QT1_V08
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V08',
  'easy',
  'According to the passage, a detectable repair is valuable partly because it',
  'makes the painting more dramatic',
  'allows later conservators to distinguish added material from original material',
  'guarantees that a treatment will never need revision',
  'eliminates the need for reversible materials',
  'B',
  'The final sentence states this reason directly.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V08';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Conservators once tried to make restored paintings look visually seamless, retouching damaged regions until repairs were nearly indistinguishable from the artist''s original work. Many museums now favor a different principle: from ordinary viewing distance a repair should not distract, but under close inspection it should remain identifiable. The shift reflects not poorer craftsmanship but a change in ethical priorities. A reversible, detectable intervention allows future conservators to separate later additions from original material and to revise a treatment when better methods become available.',
  NULL,
  '["makes the painting more dramatic","allows later conservators to distinguish added material from original material","guarantees that a treatment will never need revision","eliminates the need for reversible materials","increases the amount of original pigment"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V08';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Conservators once tried to make restored paintings look visually seamless, retouching damaged regions until repairs were nearly indistinguishable from the artist''s original work. Many museums now favor a different principle: from ordinary viewing distance a repair should not distract, but under close inspection it should remain identifiable. The shift reflects not poorer craftsmanship but a change in ethical priorities. A reversible, detectable intervention allows future conservators to separate later additions from original material and to revise a treatment when better methods become available.',
  NULL,
  '["makes the painting more dramatic","allows later conservators to distinguish added material from original material","guarantees that a treatment will never need revision","eliminates the need for reversible materials","increases the amount of original pigment"]',
  '["B"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V08';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,8,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V08'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 09. US_PROGRAM_GRE_QT1_V09
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V09',
  'advanced',
  'The author''s reference to ''not poorer craftsmanship'' serves mainly to',
  'reject the assumption that visible detectability necessarily reflects inferior skill',
  'claim that older conservators were ethically careless',
  'suggest that seamless restoration is technically impossible',
  'show that museum visitors prefer obvious repairs',
  'A',
  'The phrase anticipates and corrects a possible misreading of the change in visual practice.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V09';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Conservators once tried to make restored paintings look visually seamless, retouching damaged regions until repairs were nearly indistinguishable from the artist''s original work. Many museums now favor a different principle: from ordinary viewing distance a repair should not distract, but under close inspection it should remain identifiable. The shift reflects not poorer craftsmanship but a change in ethical priorities. A reversible, detectable intervention allows future conservators to separate later additions from original material and to revise a treatment when better methods become available.',
  NULL,
  '["reject the assumption that visible detectability necessarily reflects inferior skill","claim that older conservators were ethically careless","suggest that seamless restoration is technically impossible","show that museum visitors prefer obvious repairs","argue that craftsmanship is irrelevant to restoration"]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V09';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Conservators once tried to make restored paintings look visually seamless, retouching damaged regions until repairs were nearly indistinguishable from the artist''s original work. Many museums now favor a different principle: from ordinary viewing distance a repair should not distract, but under close inspection it should remain identifiable. The shift reflects not poorer craftsmanship but a change in ethical priorities. A reversible, detectable intervention allows future conservators to separate later additions from original material and to revise a treatment when better methods become available.',
  NULL,
  '["reject the assumption that visible detectability necessarily reflects inferior skill","claim that older conservators were ethically careless","suggest that seamless restoration is technically impossible","show that museum visitors prefer obvious repairs","argue that craftsmanship is irrelevant to restoration"]',
  '["A"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V09';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,9,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V09'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 10. US_PROGRAM_GRE_QT1_V10
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V10',
  'advanced',
  'Although the biographer had access to an unusually rich archive, the resulting portrait was surprisingly (i) ______: rather than allowing contradictory evidence to (ii) ______ her account, she selected only documents that (iii) ______ her initial thesis.',
  'nuanced',
  'one-sided',
  'provisional',
  'complicate',
  'B',
  'Selective use of evidence makes the portrait one-sided; contradictory evidence would complicate it, while the chosen documents confirmed the thesis.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V10';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["nuanced","one-sided","provisional"],"blank2":["complicate","vindicate","popularize"],"blank3":["undermined","confirmed","qualified"]}',
  '{"blank1":"B","blank2":"A","blank3":"B"}',
  3,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V10';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["nuanced","one-sided","provisional"],"blank2":["complicate","vindicate","popularize"],"blank3":["undermined","confirmed","qualified"]}',
  '{"blank1":"B","blank2":"A","blank3":"B"}',
  3,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V10';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,10,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V10'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 11. US_PROGRAM_GRE_QT1_V11
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V11',
  'medium',
  'Far from being spontaneous, the speaker''s apparently casual remarks were carefully ______ weeks in advance.',
  'improvised',
  'rehearsed',
  'planned',
  'forgotten',
  'B',
  'Rehearsed and planned both convey deliberate preparation.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SENTENCE_EQUIVALENCE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V11';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["improvised","rehearsed","planned","forgotten","softened","abandoned"]',
  '["B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V11';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["improvised","rehearsed","planned","forgotten","softened","abandoned"]',
  '["B","C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V11';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,11,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V11'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 12. US_PROGRAM_GRE_QT1_V12
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V12',
  'medium',
  'The new evidence does not ______ the earlier theory; it merely shows that the theory applies under a narrower range of conditions than researchers first assumed.',
  'corroborate',
  'invalidate',
  'publicize',
  'simplify',
  'B',
  'If the theory still applies under narrower conditions, the evidence does not invalidate it.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V12';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '["corroborate","invalidate","publicize","simplify","duplicate"]',
  '["B"]',
  1,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V12';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["corroborate","invalidate","publicize","simplify","duplicate"]',
  '["B"]',
  1,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V12';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,12,'VERBAL_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V12'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 13. US_PROGRAM_GRE_QT1_V13
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V13',
  'easy',
  'The passage mainly argues that',
  'drought always causes permanent grassland damage',
  'resistance and resilience are distinct dimensions of ecosystem stability',
  'resilient ecosystems never change during drought',
  'short droughts are more damaging than long droughts',
  'B',
  'The passage defines the two properties, explains their independence, and warns against conflating them.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V13';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Ecologists studying grasslands often distinguish resistance from resilience. A resistant ecosystem changes little during a drought; a resilient one may change substantially but returns rapidly toward its prior state after rainfall resumes. Because these properties can vary independently, a grassland that appears fragile during a drought may nonetheless recover quickly, while one that initially changes little may recover slowly after a threshold is crossed. Short monitoring periods can therefore misclassify ecosystem stability.',
  NULL,
  '["drought always causes permanent grassland damage","resistance and resilience are distinct dimensions of ecosystem stability","resilient ecosystems never change during drought","short droughts are more damaging than long droughts","rainfall is the only factor controlling recovery"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V13';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Ecologists studying grasslands often distinguish resistance from resilience. A resistant ecosystem changes little during a drought; a resilient one may change substantially but returns rapidly toward its prior state after rainfall resumes. Because these properties can vary independently, a grassland that appears fragile during a drought may nonetheless recover quickly, while one that initially changes little may recover slowly after a threshold is crossed. Short monitoring periods can therefore misclassify ecosystem stability.',
  NULL,
  '["drought always causes permanent grassland damage","resistance and resilience are distinct dimensions of ecosystem stability","resilient ecosystems never change during drought","short droughts are more damaging than long droughts","rainfall is the only factor controlling recovery"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V13';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,13,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V13'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 14. US_PROGRAM_GRE_QT1_V14
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V14',
  'medium',
  'Which situation is most consistent with a grassland having LOW resistance but HIGH resilience?',
  'It changes markedly during drought but rapidly returns after rain.',
  'It changes little during drought and returns rapidly after rain.',
  'It changes little during drought but never returns after rain.',
  'It changes markedly during drought and remains altered for decades.',
  'A',
  'Low resistance means substantial change during disturbance; high resilience means rapid recovery afterward.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V14';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Ecologists studying grasslands often distinguish resistance from resilience. A resistant ecosystem changes little during a drought; a resilient one may change substantially but returns rapidly toward its prior state after rainfall resumes. Because these properties can vary independently, a grassland that appears fragile during a drought may nonetheless recover quickly, while one that initially changes little may recover slowly after a threshold is crossed. Short monitoring periods can therefore misclassify ecosystem stability.',
  NULL,
  '["It changes markedly during drought but rapidly returns after rain.","It changes little during drought and returns rapidly after rain.","It changes little during drought but never returns after rain.","It changes markedly during drought and remains altered for decades.","It does not experience drought."]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V14';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Ecologists studying grasslands often distinguish resistance from resilience. A resistant ecosystem changes little during a drought; a resilient one may change substantially but returns rapidly toward its prior state after rainfall resumes. Because these properties can vary independently, a grassland that appears fragile during a drought may nonetheless recover quickly, while one that initially changes little may recover slowly after a threshold is crossed. Short monitoring periods can therefore misclassify ecosystem stability.',
  NULL,
  '["It changes markedly during drought but rapidly returns after rain.","It changes little during drought and returns rapidly after rain.","It changes little during drought but never returns after rain.","It changes markedly during drought and remains altered for decades.","It does not experience drought."]',
  '["A"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V14';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,14,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V14'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 15. US_PROGRAM_GRE_QT1_V15
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V15',
  'advanced',
  'Which TWO observations would best support the author''s warning about short monitoring periods?',
  'A site that changed little during drought declined sharply several months later.',
  'Two grassland species differ in average height.',
  'A heavily altered site returned close to its prior condition within a year.',
  '',
  'A',
  'Both observations show that initial response alone can misrepresent longer-term stability.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_MULTI_SELECT',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V15';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'PASSAGE',
  'Ecologists studying grasslands often distinguish resistance from resilience. A resistant ecosystem changes little during a drought; a resilient one may change substantially but returns rapidly toward its prior state after rainfall resumes. Because these properties can vary independently, a grassland that appears fragile during a drought may nonetheless recover quickly, while one that initially changes little may recover slowly after a threshold is crossed. Short monitoring periods can therefore misclassify ecosystem stability.',
  'Select exactly two answers.',
  '["A site that changed little during drought declined sharply several months later.","Two grassland species differ in average height.","A heavily altered site returned close to its prior condition within a year."]',
  '["A","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V15';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'VERBAL',
  'PASSAGE',
  'Ecologists studying grasslands often distinguish resistance from resilience. A resistant ecosystem changes little during a drought; a resilient one may change substantially but returns rapidly toward its prior state after rainfall resumes. Because these properties can vary independently, a grassland that appears fragile during a drought may nonetheless recover quickly, while one that initially changes little may recover slowly after a threshold is crossed. Short monitoring periods can therefore misclassify ecosystem stability.',
  'Select exactly two answers.',
  '["A site that changed little during drought declined sharply several months later.","Two grassland species differ in average height.","A heavily altered site returned close to its prior condition within a year."]',
  '["A","C"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V15';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,15,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V15'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 16. US_PROGRAM_GRE_QT1_V16
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V16',
  'easy',
  'The instructions were so ______ that first-time users completed the setup without assistance.',
  'opaque',
  'intuitive',
  'contradictory',
  'technical',
  'B',
  'Intuitive instructions fit the ease with which first-time users completed the task.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V16';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '["opaque","intuitive","contradictory","technical","fragmentary"]',
  '["B"]',
  1,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V16';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["opaque","intuitive","contradictory","technical","fragmentary"]',
  '["B"]',
  1,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V16';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,16,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V16'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 17. US_PROGRAM_GRE_QT1_V17
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V17',
  'medium',
  'The scientist''s public reputation for certainty concealed a much more ______ private style of reasoning; her notebooks are filled with qualifications and alternative explanations.',
  'dogmatic',
  'tentative',
  'provisional',
  'reckless',
  'B',
  'Tentative and provisional both fit the qualifications and alternatives.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SENTENCE_EQUIVALENCE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V17';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["dogmatic","tentative","provisional","reckless","ornamental","decisive"]',
  '["B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V17';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["dogmatic","tentative","provisional","reckless","ornamental","decisive"]',
  '["B","C"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V17';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,17,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V17'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 18. US_PROGRAM_GRE_QT1_V18
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V18',
  'medium',
  'Because the policy was introduced gradually, its effects were initially (i) ______; only after several years did a clear pattern (ii) ______.',
  'conspicuous',
  'subtle',
  'uniform',
  'emerge',
  'B',
  'Gradual introduction implies subtle early effects, with a pattern emerging later.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V18';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["conspicuous","subtle","uniform"],"blank2":["emerge","vanish","fragment"]}',
  '{"blank1":"B","blank2":"A"}',
  2,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V18';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["conspicuous","subtle","uniform"],"blank2":["emerge","vanish","fragment"]}',
  '{"blank1":"B","blank2":"A"}',
  2,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V18';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,18,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V18'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 19. US_PROGRAM_GRE_QT1_V19
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V19',
  'medium',
  'The passage''s main purpose is to',
  'argue that famous inventors contributed little to computing',
  'explain why recent histories include social and organizational factors alongside invention',
  'show that clerical workers designed most early computers',
  'claim technical capability never influences adoption',
  'B',
  'The passage explains a broader historical framework that retains invention but adds institutional and labor explanations.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V19';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Early histories of computing often centered on a small number of famous inventors and machines. More recent scholarship has widened the frame to include operators, clerical workers, maintenance staff, and institutions that determined how machines were actually used. This broader account does not diminish invention; rather, it changes what counts as explanation. A machine''s technical capabilities do not by themselves explain why one application spread while another failed. Training practices, organizational routines, and labor arrangements can be equally consequential.',
  NULL,
  '["argue that famous inventors contributed little to computing","explain why recent histories include social and organizational factors alongside invention","show that clerical workers designed most early computers","claim technical capability never influences adoption","compare two specific computing machines"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V19';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Early histories of computing often centered on a small number of famous inventors and machines. More recent scholarship has widened the frame to include operators, clerical workers, maintenance staff, and institutions that determined how machines were actually used. This broader account does not diminish invention; rather, it changes what counts as explanation. A machine''s technical capabilities do not by themselves explain why one application spread while another failed. Training practices, organizational routines, and labor arrangements can be equally consequential.',
  NULL,
  '["argue that famous inventors contributed little to computing","explain why recent histories include social and organizational factors alongside invention","show that clerical workers designed most early computers","claim technical capability never influences adoption","compare two specific computing machines"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V19';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,19,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V19'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 20. US_PROGRAM_GRE_QT1_V20
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V20',
  'easy',
  'According to the passage, which factor can help explain whether an application spreads?',
  'Only processor speed',
  'Training practices',
  'The inventor''s fame alone',
  'The age of the building housing the machine',
  'B',
  'Training practices are explicitly named as consequential.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V20';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Early histories of computing often centered on a small number of famous inventors and machines. More recent scholarship has widened the frame to include operators, clerical workers, maintenance staff, and institutions that determined how machines were actually used. This broader account does not diminish invention; rather, it changes what counts as explanation. A machine''s technical capabilities do not by themselves explain why one application spread while another failed. Training practices, organizational routines, and labor arrangements can be equally consequential.',
  NULL,
  '["Only processor speed","Training practices","The inventor''s fame alone","The age of the building housing the machine","Whether the machine was visually attractive"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V20';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Early histories of computing often centered on a small number of famous inventors and machines. More recent scholarship has widened the frame to include operators, clerical workers, maintenance staff, and institutions that determined how machines were actually used. This broader account does not diminish invention; rather, it changes what counts as explanation. A machine''s technical capabilities do not by themselves explain why one application spread while another failed. Training practices, organizational routines, and labor arrangements can be equally consequential.',
  NULL,
  '["Only processor speed","Training practices","The inventor''s fame alone","The age of the building housing the machine","Whether the machine was visually attractive"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V20';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,20,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V20'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 21. US_PROGRAM_GRE_QT1_V21
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V21',
  'advanced',
  'The sentence ''This broader account does not diminish invention'' primarily serves to',
  'concede that invention is irrelevant',
  'prevent the broader framework from being mistaken for a rejection of technical innovation',
  'show that all historians agree about invention',
  'introduce a chronological list of machines',
  'B',
  'It qualifies the broader account and heads off a false either/or interpretation.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V21';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'Early histories of computing often centered on a small number of famous inventors and machines. More recent scholarship has widened the frame to include operators, clerical workers, maintenance staff, and institutions that determined how machines were actually used. This broader account does not diminish invention; rather, it changes what counts as explanation. A machine''s technical capabilities do not by themselves explain why one application spread while another failed. Training practices, organizational routines, and labor arrangements can be equally consequential.',
  NULL,
  '["concede that invention is irrelevant","prevent the broader framework from being mistaken for a rejection of technical innovation","show that all historians agree about invention","introduce a chronological list of machines","argue that labor arrangements are always more important than technology"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V21';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'Early histories of computing often centered on a small number of famous inventors and machines. More recent scholarship has widened the frame to include operators, clerical workers, maintenance staff, and institutions that determined how machines were actually used. This broader account does not diminish invention; rather, it changes what counts as explanation. A machine''s technical capabilities do not by themselves explain why one application spread while another failed. Training practices, organizational routines, and labor arrangements can be equally consequential.',
  NULL,
  '["concede that invention is irrelevant","prevent the broader framework from being mistaken for a rejection of technical innovation","show that all historians agree about invention","introduce a chronological list of machines","argue that labor arrangements are always more important than technology"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V21';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,21,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V21'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 22. US_PROGRAM_GRE_QT1_V22
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V22',
  'advanced',
  'The review was (i) ______ in tone but (ii) ______ in substance: its courteous language could not disguise the fact that it (iii) ______ nearly every major claim in the book.',
  'acerbic',
  'measured',
  'chaotic',
  'laudatory',
  'B',
  'Courteous or measured tone contrasts with devastating substance, which challenged the book''s claims.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V22';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["acerbic","measured","chaotic"],"blank2":["laudatory","devastating","irrelevant"],"blank3":["endorsed","challenged","ignored"]}',
  '{"blank1":"B","blank2":"B","blank3":"B"}',
  3,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V22';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1":["acerbic","measured","chaotic"],"blank2":["laudatory","devastating","irrelevant"],"blank3":["endorsed","challenged","ignored"]}',
  '{"blank1":"B","blank2":"B","blank3":"B"}',
  3,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V22';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,22,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V22'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 23. US_PROGRAM_GRE_QT1_V23
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V23',
  'medium',
  'The mayor''s proposal was initially dismissed as ______, but a detailed cost analysis showed that it could be implemented within the existing budget.',
  'feasible',
  'impractical',
  'unworkable',
  'innovative',
  'B',
  'Impractical and unworkable are equivalent and contrast with later evidence of feasibility.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SENTENCE_EQUIVALENCE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V23';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["feasible","impractical","unworkable","innovative","modest","routine"]',
  '["B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V23';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["feasible","impractical","unworkable","innovative","modest","routine"]',
  '["B","C"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V23';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,23,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V23'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 24. US_PROGRAM_GRE_QT1_V24
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V24',
  'easy',
  'Rather than ______ the disagreement, the new data helped both teams identify the assumption on which their interpretations diverged.',
  'clarify',
  'intensify',
  'resolve',
  'document',
  'B',
  'The sentence says the data exposed the source of disagreement rather than worsening it; ''intensify'' creates the intended contrast? Actually ''rather than intensify'' fits: data helped clarify divergence.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION'
  AND st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_TEXT_COMPLETION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V24';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'NONE',
  NULL,
  NULL,
  '["clarify","intensify","resolve","document","anticipate"]',
  '["B"]',
  1,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V24';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["clarify","intensify","resolve","document","anticipate"]',
  '["B"]',
  1,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V24';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,24,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V24'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 25. US_PROGRAM_GRE_QT1_V25
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V25',
  'medium',
  'The passage suggests that simply making procurement documents publicly available may be insufficient to increase bidding if',
  'firms are already profitable',
  'the documents are difficult to search and use',
  'the city has many contracts',
  'registration rules are simple',
  'B',
  'The contrast between searchable data and scanned documents supports this inference.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V25';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'A study of municipal procurement found that publishing contract data increased the number of firms submitting bids, but only in cities where the data were released in standardized, searchable formats. Posting scanned documents online produced little change. The researchers caution, however, that format may not be the sole cause: cities adopting searchable systems also tended to simplify registration rules. The study therefore supports an association between usable transparency and competition, but it does not fully isolate the mechanism.',
  NULL,
  '["firms are already profitable","the documents are difficult to search and use","the city has many contracts","registration rules are simple","contracts are awarded annually"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V25';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'A study of municipal procurement found that publishing contract data increased the number of firms submitting bids, but only in cities where the data were released in standardized, searchable formats. Posting scanned documents online produced little change. The researchers caution, however, that format may not be the sole cause: cities adopting searchable systems also tended to simplify registration rules. The study therefore supports an association between usable transparency and competition, but it does not fully isolate the mechanism.',
  NULL,
  '["firms are already profitable","the documents are difficult to search and use","the city has many contracts","registration rules are simple","contracts are awarded annually"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V25';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,25,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V25'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 26. US_PROGRAM_GRE_QT1_V26
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V26',
  'advanced',
  'Which finding would most help determine whether searchable data themselves, rather than simplified registration, increased competition?',
  'Cities that changed data format without changing registration rules also experienced more bids.',
  'Large cities issue more contracts than small cities.',
  'Some firms prefer paper records.',
  'Registration rules vary across countries.',
  'A',
  'Holding registration rules constant while changing data format helps isolate the effect of searchable data.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION'
  AND st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_READING_COMPREHENSION',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V26';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'PASSAGE',
  'A study of municipal procurement found that publishing contract data increased the number of firms submitting bids, but only in cities where the data were released in standardized, searchable formats. Posting scanned documents online produced little change. The researchers caution, however, that format may not be the sole cause: cities adopting searchable systems also tended to simplify registration rules. The study therefore supports an association between usable transparency and competition, but it does not fully isolate the mechanism.',
  NULL,
  '["Cities that changed data format without changing registration rules also experienced more bids.","Large cities issue more contracts than small cities.","Some firms prefer paper records.","Registration rules vary across countries.","Searchable systems cost money to maintain."]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V26';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'PASSAGE',
  'A study of municipal procurement found that publishing contract data increased the number of firms submitting bids, but only in cities where the data were released in standardized, searchable formats. Posting scanned documents online produced little change. The researchers caution, however, that format may not be the sole cause: cities adopting searchable systems also tended to simplify registration rules. The study therefore supports an association between usable transparency and competition, but it does not fully isolate the mechanism.',
  NULL,
  '["Cities that changed data format without changing registration rules also experienced more bids.","Large cities issue more contracts than small cities.","Some firms prefer paper records.","Registration rules vary across countries.","Searchable systems cost money to maintain."]',
  '["A"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V26';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,26,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V26'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 27. US_PROGRAM_GRE_QT1_V27
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_V27',
  'medium',
  'Although the novelist''s plots are intricate, her prose is notably ______, avoiding both ornament and needless abstraction.',
  'spare',
  'lucid',
  'baroque',
  'convoluted',
  'A',
  'Spare and plain both convey an unornamented style; lucid is related but does not create as close an equivalent meaning.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SENTENCE_EQUIVALENCE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V27';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["spare","lucid","baroque","convoluted","plain","verbose"]',
  '["A","E"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V27';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  'Select two answer choices that complete the sentence and produce sentences alike in meaning.',
  '["spare","lucid","baroque","convoluted","plain","verbose"]',
  '["A","E"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_V27';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,27,'VERBAL_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_V27'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 28. US_PROGRAM_GRE_QT1_Q01
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q01',
  'easy',
  'Quantity A: 30% of 80
Quantity B: 1/4 of 96',
  'Quantity A is greater.',
  'Quantity B is greater.',
  'The two quantities are equal.',
  'The relationship cannot be determined from the information given.',
  'C',
  '30% of 80 is 24, and one-fourth of 96 is also 24.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC'
  AND st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_QUANT_COMPARISON',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q01';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,28,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q01'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 29. US_PROGRAM_GRE_QT1_Q02
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q02',
  'medium',
  'If 3x - 7 = 2x + 5, what is x?',
  '10',
  '12',
  '14',
  '-12',
  'B',
  'Subtract 2x and add 7 to obtain x = 12.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["10","12","14","-12","-2"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q02';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["10","12","14","-12","-2"]',
  '["B"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,29,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q02'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 30. US_PROGRAM_GRE_QT1_Q03
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q03',
  'medium',
  'The five numbers 4, 7, 9, 10, and x have mean 8. What is x?',
  '10',
  '',
  '',
  '',
  'A',
  'Their total must be 40; the known numbers total 30, so x = 10.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS'
  AND st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','NUMERICAL','GRE_2026','REVIEWED',
  'QUALITY_TEST1_NUMERIC_ENTRY',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["10"]',
  0,
  0,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q03';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["10"]',
  0,
  0,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,30,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q03'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 31. US_PROGRAM_GRE_QT1_Q04
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q04',
  'easy',
  'Which of the following is divisible by both 6 and 8?',
  '18',
  '24',
  '36',
  '42',
  'B',
  'A number divisible by both 6 and 8 must be a multiple of lcm(6,8)=24.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC'
  AND st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["18","24","36","42","54"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q04';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["18","24","36","42","54"]',
  '["B"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,31,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q04'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 32. US_PROGRAM_GRE_QT1_Q05
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q05',
  'advanced',
  'If |x - 3| < 5, which of the following values could be x? Select ALL that apply.',
  '-3',
  '-1',
  '0',
  '7',
  'B',
  '|x-3|<5 gives -2 < x < 8, so -1, 0, and 7 qualify.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_MULTI_SELECT',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  'Select all answers that apply.',
  '["-3","-1","0","7","9"]',
  '["B","C","D"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q05';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'QUANT',
  'NONE',
  NULL,
  'Select all answers that apply.',
  '["-3","-1","0","7","9"]',
  '["B","C","D"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,32,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q05'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 33. US_PROGRAM_GRE_QT1_Q06
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q06',
  'medium',
  'A pump fills a tank at 12 liters per minute. A drain removes water at 3 liters per minute. Starting empty, how many minutes are required for the tank to contain 135 liters while both operate?',
  '9',
  '12',
  '15',
  '18',
  'C',
  'The net rate is 9 liters per minute, so 135/9 = 15 minutes.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC'
  AND st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q06';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["9","12","15","18","45"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q06';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["9","12","15","18","45"]',
  '["C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q06';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,33,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q06'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 34. US_PROGRAM_GRE_QT1_Q07
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q07',
  'easy',
  'A triangle has angles measuring 45° and 65°. What is the measure, in degrees, of the third angle?',
  '70',
  '',
  '',
  '',
  'A',
  'Triangle angles sum to 180°, so the third angle is 180-45-65=70.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','NUMERICAL','GRE_2026','REVIEWED',
  'QUALITY_TEST1_NUMERIC_ENTRY',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q07';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["70"]',
  0,
  0,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q07';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["70"]',
  0,
  0,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q07';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,34,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q07'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 35. US_PROGRAM_GRE_QT1_Q08
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q08',
  'medium',
  'A bag contains 3 red, 2 blue, and 5 green marbles. One marble is selected at random. What is the probability that it is NOT green?',
  '1/5',
  '3/10',
  '1/2',
  '2/3',
  'C',
  'There are 5 non-green marbles out of 10 total, so the probability is 1/2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS'
  AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q08';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["1/5","3/10","1/2","2/3","7/10"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q08';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["1/5","3/10","1/2","2/3","7/10"]',
  '["C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q08';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,35,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q08'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 36. US_PROGRAM_GRE_QT1_Q09
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q09',
  'advanced',
  'For f(x)=x^2-4x+7, Quantity A: f(1)
Quantity B: f(3)',
  'Quantity A is greater.',
  'Quantity B is greater.',
  'The two quantities are equal.',
  'The relationship cannot be determined from the information given.',
  'C',
  'f(1)=1-4+7=4 and f(3)=9-12+7=4.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_QUANT_COMPARISON',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q09';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q09';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q09';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,36,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q09'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 37. US_PROGRAM_GRE_QT1_Q10
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q10',
  'medium',
  'A circle has circumference 10π. What is its area?',
  '5π',
  '10π',
  '20π',
  '25π',
  'D',
  '2πr=10π gives r=5, so area=πr²=25π.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q10';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["5π","10π","20π","25π","100π"]',
  '["D"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q10';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["5π","10π","20π","25π","100π"]',
  '["D"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q10';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,37,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q10'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 38. US_PROGRAM_GRE_QT1_Q11
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q11',
  'advanced',
  'A committee of 2 people is chosen from 5 people. If two particular people cannot both serve on the committee, how many possible committees are there?',
  '9',
  '',
  '',
  '',
  'A',
  'There are C(5,2)=10 pairs; exclude the one forbidden pair, leaving 9.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS'
  AND st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','NUMERICAL','GRE_2026','REVIEWED',
  'QUALITY_TEST1_NUMERIC_ENTRY',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q11';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["9"]',
  0,
  0,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q11';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["9"]',
  0,
  0,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q11';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,38,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q11'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 39. US_PROGRAM_GRE_QT1_Q12
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q12',
  'medium',
  'What is the slope of the line through (2,5) and (6,13)?',
  '1/2',
  '1',
  '2',
  '4',
  'C',
  'Slope=(13-5)/(6-2)=8/4=2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q12';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["1/2","1","2","4","8"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q12';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["1/2","1","2","4","8"]',
  '["C"]',
  0,
  NULL,
  0,
  1,
  'BASE',
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q12';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,39,'QUANT_1',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q12'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 40. US_PROGRAM_GRE_QT1_Q13
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q13',
  'easy',
  'A jacket originally priced at $80 is discounted by 25%. What is the sale price?',
  '$20',
  '$55',
  '$60',
  '$65',
  'C',
  '25% of 80 is 20, so the sale price is 60.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC'
  AND st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q13';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["$20","$55","$60","$65","$75"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q13';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["$20","$55","$60","$65","$75"]',
  '["C"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q13';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,40,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q13'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 41. US_PROGRAM_GRE_QT1_Q14
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q14',
  'medium',
  'If x+y=11 and x-y=3, what is x?',
  '7',
  '',
  '',
  '',
  'A',
  'Adding the equations gives 2x=14, so x=7.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','NUMERICAL','GRE_2026','REVIEWED',
  'QUALITY_TEST1_NUMERIC_ENTRY',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q14';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
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
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q14';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["7"]',
  0,
  0,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q14';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,41,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q14'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 42. US_PROGRAM_GRE_QT1_Q15
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q15',
  'medium',
  'A rectangle has perimeter 34 and length 10. What is its area?',
  '60',
  '70',
  '80',
  '120',
  'B',
  '2(10+w)=34 gives w=7, so area=70.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q15';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["60","70","80","120","140"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q15';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["60","70","80","120","140"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q15';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,42,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q15'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 43. US_PROGRAM_GRE_QT1_Q16
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q16',
  'easy',
  'Quantity A: 2^5
Quantity B: 4^2',
  'Quantity A is greater.',
  'Quantity B is greater.',
  'The two quantities are equal.',
  'The relationship cannot be determined from the information given.',
  'A',
  '2^5=32 and 4^2=16.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC'
  AND st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_QUANT_COMPARISON',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q16';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q16';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["A"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q16';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,43,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q16'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 44. US_PROGRAM_GRE_QT1_Q17
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q17',
  'medium',
  'A store sold 120 units in January, 150 in February, 135 in March, and 195 in April. What was the median monthly number of units sold?',
  '142.5',
  '',
  '',
  '',
  'A',
  'Ordered values are 120,135,150,195; median=(135+150)/2=142.5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS'
  AND st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','NUMERICAL','GRE_2026','REVIEWED',
  'QUALITY_TEST1_NUMERIC_ENTRY',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q17';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["142.5"]',
  0,
  0,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q17';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["142.5"]',
  0,
  0,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q17';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,44,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q17'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 45. US_PROGRAM_GRE_QT1_Q18
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q18',
  'advanced',
  'If x is an integer and 2 < (x+1)/3 ≤ 5, how many possible values of x are there?',
  '9',
  '',
  '',
  '',
  'A',
  '6 < x+1 ≤15 gives 5 < x ≤14. Integers 6 through 14 give 9 values.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','NUMERICAL','GRE_2026','REVIEWED',
  'QUALITY_TEST1_NUMERIC_ENTRY',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q18';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["9"]',
  0,
  0,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q18';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["9"]',
  0,
  0,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q18';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,45,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q18'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 46. US_PROGRAM_GRE_QT1_Q19
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q19',
  'easy',
  'A rectangular box has dimensions 2, 3, and 5. What is its volume?',
  '10',
  '15',
  '20',
  '30',
  'D',
  'Volume=2×3×5=30.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q19';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["10","15","20","30","60"]',
  '["D"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q19';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["10","15","20","30","60"]',
  '["D"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q19';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,46,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q19'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 47. US_PROGRAM_GRE_QT1_Q20
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q20',
  'medium',
  'Two fair six-sided dice are rolled. What is the probability that the sum is 7?',
  '1/12',
  '1/9',
  '1/6',
  '1/4',
  'C',
  'Six of the 36 equally likely ordered outcomes sum to 7, giving 6/36=1/6.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS'
  AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q20';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["1/12","1/9","1/6","1/4","1/3"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q20';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["1/12","1/9","1/6","1/4","1/3"]',
  '["C"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q20';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,47,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q20'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 48. US_PROGRAM_GRE_QT1_Q21
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q21',
  'advanced',
  'A sequence is defined by a1=2 and a(n+1)=2a(n)+1. What is a4?',
  '9',
  '15',
  '17',
  '23',
  'D',
  'a2=5, a3=11, a4=23.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q21';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["9","15","17","23","31"]',
  '["D"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q21';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["9","15","17","23","31"]',
  '["D"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q21';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,48,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q21'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 49. US_PROGRAM_GRE_QT1_Q22
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q22',
  'medium',
  'Car A travels 180 miles in 3 hours. Car B travels 220 miles in 4 hours. Quantity A: Car A''s average speed
Quantity B: Car B''s average speed',
  'Quantity A is greater.',
  'Quantity B is greater.',
  'The two quantities are equal.',
  'The relationship cannot be determined from the information given.',
  'A',
  'Car A averages 60 mph; Car B averages 55 mph.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC'
  AND st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_QUANT_COMPARISON',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q22';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q22';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'QUANT_COMPARISON',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["Quantity A is greater.","Quantity B is greater.","The two quantities are equal.","The relationship cannot be determined from the information given."]',
  '["A"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q22';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,49,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q22'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 50. US_PROGRAM_GRE_QT1_Q23
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q23',
  'easy',
  'The median of the ordered data set 3, 5, 8, 12, 17 is',
  '5',
  '8',
  '9',
  '12',
  'B',
  'With five ordered values, the median is the middle value, 8.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS'
  AND st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q23';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["5","8","9","12","17"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q23';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["5","8","9","12","17"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q23';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,50,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q23'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 51. US_PROGRAM_GRE_QT1_Q24
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q24',
  'advanced',
  'A right triangle has legs of lengths x and x+7 and hypotenuse 17. What is x?',
  '8',
  '',
  '',
  '',
  'A',
  'x²+(x+7)²=289 gives 2x²+14x-240=0, or x²+7x-120=0, so x=8.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','NUMERICAL','GRE_2026','REVIEWED',
  'QUALITY_TEST1_NUMERIC_ENTRY',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q24';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["8"]',
  0,
  0,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q24';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["8"]',
  0,
  0,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q24';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,51,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q24'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 52. US_PROGRAM_GRE_QT1_Q25
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q25',
  'medium',
  'A 4-digit code is formed using digits 1,2,3,4,5 without repetition. How many such codes are possible?',
  '20',
  '60',
  '120',
  '240',
  'C',
  'The number is 5×4×3×2=120.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS'
  AND st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q25';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["20","60","120","240","625"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q25';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["20","60","120","240","625"]',
  '["C"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q25';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,52,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q25'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 53. US_PROGRAM_GRE_QT1_Q26
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q26',
  'advanced',
  'Which of the following integers have exactly THREE positive divisors? Select ALL that apply.',
  '4',
  '8',
  '9',
  '16',
  'A',
  'Exactly three positive divisors occurs for squares of primes: 4=2², 9=3², 25=5².',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC'
  AND st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','MULTI_SELECT','GRE_2026','REVIEWED',
  'QUALITY_TEST1_MULTI_SELECT',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q26';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  'Select all answers that apply.',
  '["4","8","9","16","25"]',
  '["A","C","E"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q26';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'QUANT',
  'NONE',
  NULL,
  'Select all answers that apply.',
  '["4","8","9","16","25"]',
  '["A","C","E"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q26';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,53,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q26'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 54. US_PROGRAM_GRE_QT1_Q27
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QT1_Q27',
  'medium',
  'The line y=mx+4 passes through (3,10). What is m?',
  '1',
  '2',
  '3',
  '4',
  'B',
  '10=3m+4 gives 3m=6 and m=2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT
  q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
  'QUALITY_TEST1_SINGLE_CHOICE',
  'GYAN GRE Quality Test 1'
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q27';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["1","2","3","4","6"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q27';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["1","2","3","4","6"]',
  '["B"]',
  0,
  NULL,
  0,
  2,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_GRE_QT1_Q27';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,q.id,54,'QUANT_2',1,0,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='US_PROGRAM_GRE_QT1_Q27'
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- ------------------------------------------------------------
-- Publication guard + audits
-- ------------------------------------------------------------

UPDATE education_mock_tests
SET access_mode='OPEN',
    published=CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      )=54 THEN 1
      ELSE 0
    END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='GRE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

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
WHERE mt.program_code='GRE'
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
WHERE mt.program_code='GRE'
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
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY q.difficulty
ORDER BY CASE q.difficulty
  WHEN 'easy' THEN 1
  WHEN 'medium' THEN 2
  WHEN 'advanced' THEN 3
  ELSE 4
END;

SELECT
  rd.response_type,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_question_response_details rd
  ON rd.question_id=mtq.question_id
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY rd.response_type
ORDER BY rd.response_type;
