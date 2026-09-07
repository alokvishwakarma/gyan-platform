-- 0110_gre_expand_to_five_per_skill.sql
-- Adds questions 003-005 for every GRE Verbal/Quant skill.
-- After 0109 + 0110: 135 active GRE practice questions per country.
-- 55 Verbal + 80 Quant per country.
-- Analytical Writing remains catalog-only for now.

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003','medium','A coastal town restored wetlands that had been drained decades earlier. Flood damage during moderate storms declined, and several native bird species returned. What is the passage mainly about?',
  'The restoration produced ecological and flood-control benefits.','The town eliminated all flooding.','Native birds caused the restoration.','Wetlands are useful only for tourism',
  'A','The passage highlights both reduced flood damage and ecological recovery.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','MAIN_IDEA_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A coastal town restored wetlands that had been drained decades earlier. Flood damage during moderate storms declined, and several native bird species returned. What is the passage mainly about?',NULL,
  '["The restoration produced ecological and flood-control benefits.", "The town eliminated all flooding.", "Native birds caused the restoration.", "Wetlands are useful only for tourism"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004','medium','A university replaced several large introductory lectures with smaller discussion sections. Student attendance improved, though exam scores changed only slightly. What is the passage''s main point?',
  'Smaller sections improved attendance more clearly than exam performance.','Exam scores fell sharply.','Large lectures were eliminated campuswide.','Students preferred online courses',
  'A','The central contrast is improved attendance versus only slight score change.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','MAIN_IDEA_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A university replaced several large introductory lectures with smaller discussion sections. Student attendance improved, though exam scores changed only slightly. What is the passage''s main point?',NULL,
  '["Smaller sections improved attendance more clearly than exam performance.", "Exam scores fell sharply.", "Large lectures were eliminated campuswide.", "Students preferred online courses"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005','medium','Farmers in a dry region adopted soil-cover practices that reduced evaporation. Crop yields became more stable across dry years, although average yields changed little. The passage primarily emphasizes:',
  'greater yield stability under dry conditions','a dramatic increase in average yield','higher irrigation costs','declining crop diversity',
  'A','The passage stresses stability rather than a large increase in average yield.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','MAIN_IDEA_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'Farmers in a dry region adopted soil-cover practices that reduced evaporation. Crop yields became more stable across dry years, although average yields changed little. The passage primarily emphasizes:',NULL,
  '["greater yield stability under dry conditions", "a dramatic increase in average yield", "higher irrigation costs", "declining crop diversity"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003','medium','A study found that commuters who received real-time bus-arrival information reported less uncertainty but did not arrive at work earlier. Which statement is directly supported?',
  'Real-time information reduced reported uncertainty.','Real-time information shortened every commute.','Commuters stopped using buses.','Work start times changed',
  'A','The study directly reports lower uncertainty, not faster arrival.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DETAIL_EVIDENCE_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A study found that commuters who received real-time bus-arrival information reported less uncertainty but did not arrive at work earlier. Which statement is directly supported?',NULL,
  '["Real-time information reduced reported uncertainty.", "Real-time information shortened every commute.", "Commuters stopped using buses.", "Work start times changed"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004','medium','Researchers found that seedlings grown under filtered shade had larger leaves than seedlings in full sun, while plant height differed little. Which detail is supported?',
  'Shade-grown seedlings had larger leaves.','Shade-grown seedlings were much taller.','Full-sun seedlings had no leaves.','Shade always increases plant height',
  'A','The passage directly states that leaf size increased under shade.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DETAIL_EVIDENCE_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'Researchers found that seedlings grown under filtered shade had larger leaves than seedlings in full sun, while plant height differed little. Which detail is supported?',NULL,
  '["Shade-grown seedlings had larger leaves.", "Shade-grown seedlings were much taller.", "Full-sun seedlings had no leaves.", "Shade always increases plant height"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005','medium','A library extended weekend hours and recorded more visits on Saturdays, while weekday visits remained roughly unchanged. Which statement is supported?',
  'Saturday visits increased.','Weekday visits doubled.','The library shortened weekday hours.','Weekend visitors borrowed fewer books',
  'A','Only the increase in Saturday visits is directly reported.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DETAIL_EVIDENCE_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A library extended weekend hours and recorded more visits on Saturdays, while weekday visits remained roughly unchanged. Which statement is supported?',NULL,
  '["Saturday visits increased.", "Weekday visits doubled.", "The library shortened weekday hours.", "Weekend visitors borrowed fewer books"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003','medium','After a company allowed remote work two days per week, employee turnover fell, while salaries and benefits remained unchanged. Which inference is most reasonable?',
  'Work flexibility may have contributed to retention.','Salaries caused the decline in turnover.','Employees worked fewer total hours.','Benefits were reduced',
  'A','With compensation unchanged, flexibility is a plausible contributor.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INFERENCE_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'After a company allowed remote work two days per week, employee turnover fell, while salaries and benefits remained unchanged. Which inference is most reasonable?',NULL,
  '["Work flexibility may have contributed to retention.", "Salaries caused the decline in turnover.", "Employees worked fewer total hours.", "Benefits were reduced"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004','medium','A lake''s water clarity improved after nearby farms reduced fertilizer runoff. Which inference is most reasonable?',
  'Lower nutrient runoff may have improved water quality.','Fertilizer always improves lakes.','The lake received more rainfall.','Farms stopped producing crops',
  'A','Reduced nutrient input plausibly contributed to clearer water.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INFERENCE_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A lake''s water clarity improved after nearby farms reduced fertilizer runoff. Which inference is most reasonable?',NULL,
  '["Lower nutrient runoff may have improved water quality.", "Fertilizer always improves lakes.", "The lake received more rainfall.", "Farms stopped producing crops"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005','medium','Students who used practice quizzes weekly were more likely to complete the course than students who rarely used them. Which inference is best supported?',
  'Regular quiz use is associated with course completion.','Practice quizzes guarantee high grades.','Rare quiz users never completed the course.','The quizzes caused all learning',
  'A','The data support an association, not a guarantee or complete causal claim.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INFERENCE_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'Students who used practice quizzes weekly were more likely to complete the course than students who rarely used them. Which inference is best supported?',NULL,
  '["Regular quiz use is associated with course completion.", "Practice quizzes guarantee high grades.", "Rare quiz users never completed the course.", "The quizzes caused all learning"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003','medium','The new model is elegant, but its predictions have been tested in only a narrow range of cases. The author''s tone is:',
  'qualified approval','unreserved enthusiasm','mockery','complete dismissal',
  'A','The author praises the model while noting limited testing.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','AUTHOR_PERSPECTIVE_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'The new model is elegant, but its predictions have been tested in only a narrow range of cases. The author''s tone is:',NULL,
  '["qualified approval", "unreserved enthusiasm", "mockery", "complete dismissal"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004','medium','The excavation produced intriguing artifacts, although dating them precisely remains difficult. The author''s attitude is best described as:',
  'interested but cautious','angry','indifferent','certain beyond doubt',
  'A','The author finds the evidence intriguing but acknowledges uncertainty.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','AUTHOR_PERSPECTIVE_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'The excavation produced intriguing artifacts, although dating them precisely remains difficult. The author''s attitude is best described as:',NULL,
  '["interested but cautious", "angry", "indifferent", "certain beyond doubt"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005','medium','The policy''s goals are admirable; whether its implementation can meet them is less certain. The tone is:',
  'cautiously supportive','hostile','sarcastic','unquestioningly confident',
  'A','The goals are endorsed while implementation is treated cautiously.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','AUTHOR_PERSPECTIVE_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'The policy''s goals are admirable; whether its implementation can meet them is less certain. The tone is:',NULL,
  '["cautiously supportive", "hostile", "sarcastic", "unquestioningly confident"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003','medium','Early reports suggested the treatment was highly effective. Subsequent controlled trials, however, found only a modest benefit. The second sentence serves to:',
  'qualify the earlier reports','repeat the earlier reports','define the treatment','change to an unrelated topic',
  'A','The later controlled trials reduce the strength of the initial claim.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','STRUCTURE_FUNCTION_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'Early reports suggested the treatment was highly effective. Subsequent controlled trials, however, found only a modest benefit. The second sentence serves to:',NULL,
  '["qualify the earlier reports", "repeat the earlier reports", "define the treatment", "change to an unrelated topic"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004','medium','The desert appears barren at first glance. Yet after rare rainfall, dormant seeds can produce abundant blooms. The second sentence primarily:',
  'contrasts appearance with hidden biological potential','explains why deserts receive rain','defines dormancy','argues deserts are always wet',
  'A','It contrasts apparent barrenness with latent capacity for growth.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','STRUCTURE_FUNCTION_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'The desert appears barren at first glance. Yet after rare rainfall, dormant seeds can produce abundant blooms. The second sentence primarily:',NULL,
  '["contrasts appearance with hidden biological potential", "explains why deserts receive rain", "defines dormancy", "argues deserts are always wet"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005','medium','The method is inexpensive. More importantly, it can be implemented without specialized equipment. The second sentence:',
  'adds a stronger practical advantage','contradicts the first sentence','provides historical context','defines inexpensive',
  'A','It adds an additional and more important practical benefit.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','STRUCTURE_FUNCTION_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'The method is inexpensive. More importantly, it can be implemented without specialized equipment. The second sentence:',NULL,
  '["adds a stronger practical advantage", "contradicts the first sentence", "provides historical context", "defines inexpensive"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003','medium','A school claims its new tutoring program raised test scores because scores increased after tutoring began. Which fact would most weaken the claim?',
  'The district changed to an easier test that same year.','Students attended tutoring voluntarily.','Tutors were trained teachers.','The program lasted one semester',
  'A','A change in test difficulty is a competing explanation.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','ARGUMENT_EVALUATION_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A school claims its new tutoring program raised test scores because scores increased after tutoring began. Which fact would most weaken the claim?',NULL,
  '["The district changed to an easier test that same year.", "Students attended tutoring voluntarily.", "Tutors were trained teachers.", "The program lasted one semester"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004','medium','A café claims that adding outdoor seating increased revenue. Which evidence would most strengthen the claim?',
  'Revenue rose more on good-weather days after the seating was added than at similar cafés without new seating.','The café changed its logo.','Coffee prices rose slightly.','Nearby traffic increased',
  'A','The comparison specifically links the seating to revenue under conditions when it would be used.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','ARGUMENT_EVALUATION_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A café claims that adding outdoor seating increased revenue. Which evidence would most strengthen the claim?',NULL,
  '["Revenue rose more on good-weather days after the seating was added than at similar caf\u00e9s without new seating.", "The caf\u00e9 changed its logo.", "Coffee prices rose slightly.", "Nearby traffic increased"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005','medium','A city says a recycling campaign reduced landfill waste. Which evidence would most weaken the claim?',
  'A major factory closed during the same period.','Residents saw campaign posters.','Recycling bins were blue.','The campaign lasted six months',
  'A','The factory closure offers an alternative reason for lower landfill waste.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='READING_COMPREHENSION' AND st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','ARGUMENT_EVALUATION_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'READING_COMPREHENSION','VERBAL','TEXT',
  'A city says a recycling campaign reduced landfill waste. Which evidence would most weaken the claim?',NULL,
  '["A major factory closed during the same period.", "Residents saw campaign posters.", "Recycling bins were blue.", "The campaign lasted six months"]','["A"]',0,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003','medium','The biographer avoided sensational claims, preferring a ______ account grounded in documented evidence.',
  'measured','reckless','fantastical','hasty',
  'A','A documented, unsensational account is measured.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','SINGLE_BLANK_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '["measured", "reckless", "fantastical", "hasty"]','["A"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004','medium','Because the data were incomplete, the researchers offered only a ______ conclusion.',
  'tentative','definitive','absolute','dogmatic',
  'A','Incomplete data warrant a tentative conclusion.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','SINGLE_BLANK_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '["tentative", "definitive", "absolute", "dogmatic"]','["A"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005','medium','The editor removed repetitive passages to make the essay more ______.',
  'concise','verbose','rambling','diffuse',
  'A','Removing repetition makes writing more concise.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','SINGLE_BLANK_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '["concise", "verbose", "rambling", "diffuse"]','["A"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003','medium','Although the evidence was initially ______, further experiments made the explanation increasingly ______.',
  'ambiguous','plausible','','',
  'A','Ambiguous evidence can become supportive enough to make an explanation plausible.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DOUBLE_BLANK_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '{"blank1": ["ambiguous", "decisive", "irrelevant"], "blank2": ["plausible", "impossible", "opaque"]}','{"blank1": "A", "blank2": "A"}',2,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004','medium','The mayor''s proposal sounded ______ in principle but proved ______ in practice.',
  'reasonable','difficult','','',
  'A','A reasonable proposal can still be difficult to implement.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DOUBLE_BLANK_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '{"blank1": ["reasonable", "absurd", "hostile"], "blank2": ["difficult", "effortless", "irrelevant"]}','{"blank1": "A", "blank2": "A"}',2,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005','medium','The article is ______ in style yet ______ in argument.',
  'plain','subtle','','',
  'A','Plain style can coexist with a subtle argument.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DOUBLE_BLANK_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '{"blank1": ["plain", "ornate", "obscure"], "blank2": ["subtle", "careless", "empty"]}','{"blank1": "A", "blank2": "A"}',2,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003','medium','The committee''s report was ______ in tone, ______ in evidence, and ______ in its recommendations.',
  'restrained','thorough','practical','',
  'A','The coherent combination is restrained, thorough, and practical.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','TRIPLE_BLANK_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '{"blank1": ["restrained", "furious", "comic"], "blank2": ["thorough", "scant", "random"], "blank3": ["practical", "fantastical", "irrelevant"]}','{"blank1": "A", "blank2": "A", "blank3": "A"}',3,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004','medium','The scientist remained ______ about the early finding, ______ in her testing, and ultimately ______ by the repeated results.',
  'skeptical','methodical','persuaded','',
  'A','Initial skepticism, careful testing, and eventual persuasion fit the progression.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','TRIPLE_BLANK_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '{"blank1": ["skeptical", "certain", "indifferent"], "blank2": ["methodical", "careless", "impulsive"], "blank3": ["persuaded", "confused", "unmoved"]}','{"blank1": "A", "blank2": "A", "blank3": "A"}',3,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005','medium','The essay is ______ in scope, ______ in organization, and ______ in conclusion.',
  'broad','coherent','nuanced','',
  'A','Broad scope, coherent organization, and nuanced conclusion form a consistent positive description.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='TEXT_COMPLETION' AND st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','TRIPLE_BLANK_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'TEXT_COMPLETION','VERBAL','NONE',
  NULL,NULL,
  '{"blank1": ["broad", "tiny", "accidental"], "blank2": ["coherent", "chaotic", "fragmentary"], "blank3": ["nuanced", "simplistic", "unrelated"]}','{"blank1": "A", "blank2": "A", "blank3": "A"}',3,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003','medium','The once-obscure researcher became ______ after the discovery received international attention.',
  'prominent','anonymous','renowned','forgotten',
  'A','Prominent and renowned are equivalent and fit the context.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE' AND st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','CONTEXT_MEANING_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SENTENCE_EQUIVALENCE','VERBAL','NONE',
  NULL,NULL,
  '["prominent", "anonymous", "renowned", "forgotten", "minor", "hidden"]','["A", "C"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004','medium','The instructions were deliberately ______, leaving little room for misinterpretation.',
  'explicit','vague','precise','cryptic',
  'A','Explicit and precise both fit and are equivalent.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE' AND st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','CONTEXT_MEANING_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SENTENCE_EQUIVALENCE','VERBAL','NONE',
  NULL,NULL,
  '["explicit", "vague", "precise", "cryptic", "ambiguous", "oblique"]','["A", "C"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005','medium','The board remained ______ despite intense pressure to change its position.',
  'steadfast','wavering','resolute','uncertain',
  'A','Steadfast and resolute are equivalent and fit resistance to pressure.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE' AND st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','CONTEXT_MEANING_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SENTENCE_EQUIVALENCE','VERBAL','NONE',
  NULL,NULL,
  '["steadfast", "wavering", "resolute", "uncertain", "fickle", "hesitant"]','["A", "C"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003','medium','The lecturer was unusually ______, explaining complex ideas in language accessible to beginners.',
  'lucid','obscure','clear','cryptic',
  'A','Lucid and clear are equivalent.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE' AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EQUIVALENT_PAIR_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SENTENCE_EQUIVALENCE','VERBAL','NONE',
  NULL,NULL,
  '["lucid", "obscure", "clear", "cryptic", "dense", "arcane"]','["A", "C"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004','medium','The evidence for the claim remains ______, consisting mostly of anecdotes rather than systematic data.',
  'tenuous','robust','weak','conclusive',
  'A','Tenuous and weak are equivalent.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE' AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EQUIVALENT_PAIR_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SENTENCE_EQUIVALENCE','VERBAL','NONE',
  NULL,NULL,
  '["tenuous", "robust", "weak", "conclusive", "decisive", "solid"]','["A", "C"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005','medium','The committee considered the schedule ______ because it left almost no time for testing.',
  'impractical','feasible','unworkable','realistic',
  'A','Impractical and unworkable are equivalent.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE' AND st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EQUIVALENT_PAIR_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SENTENCE_EQUIVALENCE','VERBAL','NONE',
  NULL,NULL,
  '["impractical", "feasible", "unworkable", "realistic", "manageable", "sound"]','["A", "C"]',1,NULL,
  0,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003','medium','What is the least common multiple of 6 and 8?',
  '12','18','24','48',
  'C','LCM(6,8)=24.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INTEGERS_FACTORS_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["12", "18", "24", "48"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004','medium','Which number is prime?',
  '21','27','29','33',
  'C','29 has no positive divisors other than 1 and 29.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INTEGERS_FACTORS_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["21", "27", "29", "33"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005','medium','If an integer is divisible by both 4 and 6, it must be divisible by:',
  '8','10','12','24',
  'C','The least common multiple of 4 and 6 is 12.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INTEGERS_FACTORS_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["8", "10", "12", "24"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003','medium','A quantity decreases from 50 to 40. What is the percent decrease?',
  '10%','20%','25%','40%',
  'B','Decrease=10; 10/50=20%.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','FRACTIONS_RATIOS_PERCENT_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["10%", "20%", "25%", "40%"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004','medium','If 2/5 of a number is 18, what is the number?',
  '36','40','45','50',
  'C','n=18×5/2=45.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','FRACTIONS_RATIOS_PERCENT_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["36", "40", "45", "50"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005','medium','A mixture has water to juice in the ratio 4:1. If there are 25 liters total, how many liters are juice?',
  '4','5','10','20',
  'B','There are 5 parts, so each part is 5 liters.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','FRACTIONS_RATIOS_PERCENT_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["4", "5", "10", "20"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003','medium','What is 3^4?',
  '27','54','81','243',
  'C','3×3×3×3=81.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EXPONENTS_ROOTS_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["27", "54", "81", "243"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004','medium','What is √225?',
  '12','15','18','25',
  'B','15²=225.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EXPONENTS_ROOTS_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["12", "15", "18", "25"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005','medium','If x=2, what is x^3+x^2?',
  '8','10','12','16',
  'C','8+4=12.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EXPONENTS_ROOTS_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["8", "10", "12", "16"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003','medium','A pump fills 90 liters in 6 minutes. At the same rate, how many liters in 10 minutes?',
  '120','135','150','180',
  'C','Rate=15 liters/minute; 10 minutes gives 150.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','RATES_WORK_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["120", "135", "150", "180"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004','medium','A cyclist travels 42 miles in 3 hours. What is the average speed?',
  '12','14','16','18',
  'B','42/3=14 mph.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','RATES_WORK_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["12", "14", "16", "18"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005','medium','If 4 workers finish a task in 6 days at a constant combined rate, how many worker-days are required?',
  '10','18','24','30',
  'C','4×6=24 worker-days.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ARITHMETIC' AND st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','RATES_WORK_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["10", "18", "24", "30"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003','medium','Solve 5x-7=18.',
  '3','4','5','6',
  'C','5x=25, so x=5.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EXPRESSIONS_EQUATIONS_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["3", "4", "5", "6"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004','medium','If 2a+3b=18 and a=3, what is b?',
  '2','3','4','6',
  'C','6+3b=18, so b=4.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EXPRESSIONS_EQUATIONS_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["2", "3", "4", "6"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005','medium','If x/4=7, what is x?',
  '11','21','28','32',
  'C','Multiply both sides by 4.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','EXPRESSIONS_EQUATIONS_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["11", "21", "28", "32"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003','medium','If -3x<12, which must be true?',
  'x<-4','x>-4','x<4','x>4',
  'B','Dividing by -3 reverses the inequality: x>-4.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INEQUALITIES_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["x<-4", "x>-4", "x<4", "x>4"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004','medium','Which value satisfies 2x+1≥9?',
  '2','3','4','5',
  'C','2x≥8, so x≥4.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INEQUALITIES_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["2", "3", "4", "5"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005','medium','If x<3 and y=2x, which must be true?',
  'y<6','y>6','y=6','y≥9',
  'A','Multiplying x<3 by positive 2 gives y<6.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','INEQUALITIES_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["y<6", "y>6", "y=6", "y\u22659"]','["A"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003','medium','If g(x)=3x-2, what is g(5)?',
  '10','11','13','15',
  'C','3(5)-2=13.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','FUNCTIONS_SEQUENCES_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["10", "11", "13", "15"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004','medium','The sequence 4, 7, 10, 13, ... has which 6th term?',
  '16','17','18','19',
  'D','Terms increase by 3: 4,7,10,13,16,19.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','FUNCTIONS_SEQUENCES_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["16", "17", "18", "19"]','["D"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005','medium','If f(x)=x^2+2, what is f(-2)?',
  '2','4','6','8',
  'C','(-2)^2+2=6.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','FUNCTIONS_SEQUENCES_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["2", "4", "6", "8"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003','medium','What is the y-intercept of y=3x+4?',
  '1','3','4','7',
  'C','At x=0, y=4.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','COORDINATE_GEOMETRY_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["1", "3", "4", "7"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004','medium','What is the distance between (0,0) and (3,4)?',
  '4','5','6','7',
  'B','Distance=√(3²+4²)=5.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','COORDINATE_GEOMETRY_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["4", "5", "6", "7"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005','medium','A line has slope -2 and passes through (0,5). Which equation represents it?',
  'y=2x+5','y=-2x+5','y=-2x-5','y=5x-2',
  'B','Slope-intercept form is y=mx+b.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='ALGEBRA' AND st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','COORDINATE_GEOMETRY_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["y=2x+5", "y=-2x+5", "y=-2x-5", "y=5x-2"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003','medium','An isosceles triangle has two equal angles of 40°. What is the third angle?',
  '80°','90°','100°','120°',
  'C','180-80=100°.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','LINES_ANGLES_TRIANGLES_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["80\u00b0", "90\u00b0", "100\u00b0", "120\u00b0"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004','medium','What is the area of a triangle with base 10 and height 6?',
  '16','30','60','120',
  'B','Area=1/2×10×6=30.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','LINES_ANGLES_TRIANGLES_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["16", "30", "60", "120"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005','medium','In a right triangle, if the hypotenuse is 13 and one leg is 5, the other leg is:',
  '8','10','12','14',
  'C','5-12-13 is a Pythagorean triple.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','LINES_ANGLES_TRIANGLES_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["8", "10", "12", "14"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003','medium','What is the perimeter of a rectangle with sides 7 and 4?',
  '11','22','28','44',
  'B','Perimeter=2(7+4)=22.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','POLYGONS_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["11", "22", "28", "44"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004','medium','What is the sum of the interior angles of a pentagon?',
  '360°','450°','540°','720°',
  'C','(5-2)×180=540°.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','POLYGONS_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["360\u00b0", "450\u00b0", "540\u00b0", "720\u00b0"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005','medium','A square has area 49. What is its perimeter?',
  '14','21','28','49',
  'C','Side=7, perimeter=28.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','POLYGONS_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["14", "21", "28", "49"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003','medium','A circle has radius 3. What is its area?',
  '3π','6π','9π','18π',
  'C','Area=πr²=9π.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','CIRCLES_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["3\u03c0", "6\u03c0", "9\u03c0", "18\u03c0"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004','medium','If a circle''s radius doubles, its area is multiplied by:',
  '2','3','4','8',
  'C','Area is proportional to r².',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','CIRCLES_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["2", "3", "4", "8"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005','medium','A semicircle has radius 4. What is its area?',
  '4π','8π','16π','32π',
  'B','Half of π(4²)=8π.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','CIRCLES_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["4\u03c0", "8\u03c0", "16\u03c0", "32\u03c0"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003','medium','A rectangular prism has dimensions 4, 5, and 6. What is its volume?',
  '60','90','120','150',
  'C','4×5×6=120.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','THREE_DIMENSIONAL_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["60", "90", "120", "150"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004','medium','A cube has surface area 54. What is its side length?',
  '2','3','4','6',
  'B','6s²=54, so s²=9 and s=3.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','THREE_DIMENSIONAL_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["2", "3", "4", "6"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005','medium','A cylinder has radius 2 and height 5. What is its volume?',
  '10π','20π','25π','40π',
  'B','Volume=πr²h=π×4×5=20π.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='GEOMETRY' AND st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','THREE_DIMENSIONAL_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["10\u03c0", "20\u03c0", "25\u03c0", "40\u03c0"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003','medium','What is the range of 3, 8, 10, 12?',
  '7','8','9','10',
  'C','12-3=9.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DESCRIPTIVE_STATISTICS_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["7", "8", "9", "10"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004','medium','What is the mean of 5, 7, 8, 10?',
  '7','7.5','8','8.5',
  'B','Sum=30; 30/4=7.5.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DESCRIPTIVE_STATISTICS_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["7", "7.5", "8", "8.5"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005','medium','What is the mode of 2, 3, 3, 5, 7?',
  '2','3','5','7',
  'B','3 occurs most often.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DESCRIPTIVE_STATISTICS_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["2", "3", "5", "7"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003','medium','A bag contains 3 red and 2 blue balls. What is the probability of drawing a red ball?',
  '2/5','3/5','1/2','2/3',
  'B','3 of 5 balls are red.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','PROBABILITY_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["2/5", "3/5", "1/2", "2/3"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004','medium','Two fair coins are tossed. What is the probability of two heads?',
  '1/4','1/3','1/2','3/4',
  'A','Only HH among four equally likely outcomes.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','PROBABILITY_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["1/4", "1/3", "1/2", "3/4"]','["A"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005','medium','A die is rolled. What is the probability of a number greater than 4?',
  '1/6','1/3','1/2','2/3',
  'B','Outcomes 5 and 6: 2/6=1/3.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','PROBABILITY_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["1/6", "1/3", "1/2", "2/3"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003','medium','How many ways can 3 books be arranged on a shelf?',
  '3','6','9','12',
  'B','3!=6.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','COUNTING_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["3", "6", "9", "12"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004','medium','How many ways can 1 student be chosen from 8 students?',
  '1','4','8','16',
  'C','There are 8 choices.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','COUNTING_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["1", "4", "8", "16"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005','medium','How many 3-letter arrangements can be formed from A,B,C,D without repetition?',
  '12','18','24','64',
  'C','4×3×2=24.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','COUNTING_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["12", "18", "24", "64"]','["C"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003','medium','Monthly values are 12, 18, 15, and 25. What is their mean?',
  '15','17.5','18','20',
  'B','Total=70; 70/4=17.5.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DATA_INTERPRETATION_STARTER_03','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["15", "17.5", "18", "20"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004','medium','A table lists 8, 11, 14, 17. By how much does the value increase from first to last?',
  '6','7','8','9',
  'D','17-8=9.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DATA_INTERPRETATION_STARTER_04','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["6", "7", "8", "9"]','["D"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005','medium','A chart shows counts 20, 30, 25, and 35. What percent of the total is 30?',
  'about 20%','about 27%','30%','35%',
  'B','Total=110; 30/110≈27.3%.',1,'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND t.topic_code='DATA_ANALYSIS' AND st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED','DATA_INTERPRETATION_STARTER_05','GYAN GRE 2026 expanded bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT q.id,
  'SINGLE_CHOICE','QUANT','NONE',
  NULL,NULL,
  '["about 20%", "about 27%", "30%", "35%"]','["B"]',0,NULL,
  1,NULL,NULL,CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='READING_COMPREHENSION' AND target_st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='TEXT_COMPLETION' AND target_st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='SENTENCE_EQUIVALENCE' AND target_st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='SENTENCE_EQUIVALENCE' AND target_st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='SENTENCE_EQUIVALENCE' AND target_st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='SENTENCE_EQUIVALENCE' AND target_st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='SENTENCE_EQUIVALENCE' AND target_st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL' AND target_t.topic_code='SENTENCE_EQUIVALENCE' AND target_st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ARITHMETIC' AND target_st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='ALGEBRA' AND target_st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='GEOMETRY' AND target_st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005'
  AND target_s.country_code='IN' AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT' AND target_t.topic_code='DATA_ANALYSIS' AND target_st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_005';

-- Audit: expected 55 Verbal and 80 Quant active questions per country.
SELECT s.country_code,s.subject_code,COUNT(q.id) AS active_questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.grade_code='PROGRAM_GRE' AND s.country_code IN ('US','IN') AND q.active=1
GROUP BY s.country_code,s.subject_code
ORDER BY s.country_code,s.sort_order;

-- Audit: expected 5 active questions for every Verbal/Quant skill.
SELECT s.country_code,s.subject_code,t.topic_code,st.subtopic_code,COUNT(q.id) AS question_count
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.grade_code='PROGRAM_GRE' AND s.country_code IN ('US','IN')
  AND s.subject_code IN ('VERBAL','QUANT')
GROUP BY s.country_code,s.subject_code,t.topic_code,st.subtopic_code
ORDER BY s.country_code,s.sort_order,t.sort_order,st.sort_order;
