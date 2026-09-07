-- 0109_gre_2026_starter_bank.sql
-- GYAN GRE starter bank: 54 questions total.
-- 22 Verbal + 32 Quant = 2 questions for each enabled Verbal/Quant skill.
-- Analytical Writing is intentionally excluded from the MCQ bank.
-- Uses education_gre_question_details created by 0108.

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001',
  'medium',
  'A city introduced shaded bus shelters in neighborhoods with the highest summer temperatures. Ridership rose modestly, but the largest change was a decline in heat-related complaints from riders waiting outdoors. Which choice best states the passage''s main point?',
  'The shelters primarily increased bus speed.',
  'The shelters reduced heat exposure for waiting riders.',
  'The shelters caused a major rise in ridership.',
  'The shelters were installed only in wealthy neighborhoods.',
  'B',
  'The passage emphasizes the reduction in heat-related complaints as the largest observed change.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'MAIN_IDEA_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'A city introduced shaded bus shelters in neighborhoods with the highest summer temperatures. Ridership rose modestly, but the largest change was a decline in heat-related complaints from riders waiting outdoors. Which choice best states the passage''s main point?',
  NULL,
  '["The shelters primarily increased bus speed.", "The shelters reduced heat exposure for waiting riders.", "The shelters caused a major rise in ridership.", "The shelters were installed only in wealthy neighborhoods."]',
  '["B"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002',
  'medium',
  'Some historians once treated household account books as trivial records. More recent scholarship shows that such documents can reveal changes in consumption, family roles, and local trade. What is the primary purpose of the passage?',
  'To argue that household records can be historically valuable.',
  'To show that historians should avoid economic evidence.',
  'To prove that family roles never changed.',
  'To compare two accounting methods.',
  'A',
  'The passage argues that records once dismissed as trivial can illuminate broader historical change.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'MAIN_IDEA_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'Some historians once treated household account books as trivial records. More recent scholarship shows that such documents can reveal changes in consumption, family roles, and local trade. What is the primary purpose of the passage?',
  NULL,
  '["To argue that household records can be historically valuable.", "To show that historians should avoid economic evidence.", "To prove that family roles never changed.", "To compare two accounting methods."]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001',
  'medium',
  'In a field study, plots with diverse native plants retained more soil moisture after dry periods than plots planted with a single grass species. Which statement is directly supported?',
  'Native plants always grow faster than grasses.',
  'Plant diversity was associated with greater soil-moisture retention.',
  'Single-species plots received less rainfall.',
  'Soil moisture caused plant diversity.',
  'B',
  'The study directly reports greater moisture retention in the diverse native-plant plots.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DETAIL_EVIDENCE_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'In a field study, plots with diverse native plants retained more soil moisture after dry periods than plots planted with a single grass species. Which statement is directly supported?',
  NULL,
  '["Native plants always grow faster than grasses.", "Plant diversity was associated with greater soil-moisture retention.", "Single-species plots received less rainfall.", "Soil moisture caused plant diversity."]',
  '["B"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002',
  'medium',
  'A survey found that employees using adjustable desks changed posture more often during the day, although total sitting time changed little. Which detail is supported?',
  'Adjustable desks eliminated sitting.',
  'Posture changes increased.',
  'Employees worked fewer hours.',
  'Standing improved productivity.',
  'B',
  'The passage states that posture changes increased while sitting time changed little.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DETAIL_EVIDENCE_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'A survey found that employees using adjustable desks changed posture more often during the day, although total sitting time changed little. Which detail is supported?',
  NULL,
  '["Adjustable desks eliminated sitting.", "Posture changes increased.", "Employees worked fewer hours.", "Standing improved productivity."]',
  '["B"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001',
  'medium',
  'A museum extended evening hours on Fridays. Attendance among working adults increased, while daytime attendance remained stable. Which inference is most reasonable?',
  'Evening access attracted some visitors who could not easily attend during the day.',
  'Daytime visitors stopped coming.',
  'The museum reduced ticket prices.',
  'Working adults dislike museums.',
  'A',
  'The pattern suggests the added evening access served people constrained during daytime hours.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'INFERENCE_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'A museum extended evening hours on Fridays. Attendance among working adults increased, while daytime attendance remained stable. Which inference is most reasonable?',
  NULL,
  '["Evening access attracted some visitors who could not easily attend during the day.", "Daytime visitors stopped coming.", "The museum reduced ticket prices.", "Working adults dislike museums."]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002',
  'medium',
  'Researchers observed that a bird species nested earlier in warmer springs but not in cooler springs. Which inference is best supported?',
  'The birds respond to seasonal temperature cues.',
  'The birds never migrate.',
  'Nest timing is random.',
  'Warmer springs reduce food availability.',
  'A',
  'Earlier nesting specifically in warmer springs supports a response to temperature-related cues.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'INFERENCE_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'Researchers observed that a bird species nested earlier in warmer springs but not in cooler springs. Which inference is best supported?',
  NULL,
  '["The birds respond to seasonal temperature cues.", "The birds never migrate.", "Nest timing is random.", "Warmer springs reduce food availability."]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001',
  'medium',
  'Although the new archive is incomplete, its records are unusually rich and should substantially improve future research. The author''s tone is best described as:',
  'cautiously optimistic',
  'openly hostile',
  'indifferent',
  'sarcastic',
  'A',
  'The author acknowledges a limitation but emphasizes the archive''s promise.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'AUTHOR_PERSPECTIVE_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'Although the new archive is incomplete, its records are unusually rich and should substantially improve future research. The author''s tone is best described as:',
  NULL,
  '["cautiously optimistic", "openly hostile", "indifferent", "sarcastic"]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002',
  'medium',
  'The proposal is ambitious, but its cost estimates rest on assumptions that have not yet been tested. The author''s attitude is primarily:',
  'unqualified enthusiasm',
  'skeptical caution',
  'complete rejection',
  'nostalgic admiration',
  'B',
  'The wording signals caution about unsupported assumptions rather than outright rejection.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'AUTHOR_PERSPECTIVE_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'The proposal is ambitious, but its cost estimates rest on assumptions that have not yet been tested. The author''s attitude is primarily:',
  NULL,
  '["unqualified enthusiasm", "skeptical caution", "complete rejection", "nostalgic admiration"]',
  '["B"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001',
  'medium',
  'Many early studies reported a strong effect. However, later studies using larger samples found a much smaller one. What is the function of the second sentence?',
  'It provides a contrast that qualifies the first claim.',
  'It repeats the first claim.',
  'It defines a technical term.',
  'It gives an unrelated example.',
  'A',
  'The later studies qualify the stronger conclusion suggested by the earlier studies.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'STRUCTURE_FUNCTION_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'Many early studies reported a strong effect. However, later studies using larger samples found a much smaller one. What is the function of the second sentence?',
  NULL,
  '["It provides a contrast that qualifies the first claim.", "It repeats the first claim.", "It defines a technical term.", "It gives an unrelated example."]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002',
  'medium',
  'The theory predicts rapid change under certain conditions. For example, isolated island populations sometimes diverge quickly. The example primarily serves to:',
  'illustrate the theory''s prediction',
  'refute the theory',
  'introduce a new topic',
  'define isolation',
  'A',
  'The example is evidence illustrating the preceding general prediction.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'STRUCTURE_FUNCTION_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'The theory predicts rapid change under certain conditions. For example, isolated island populations sometimes diverge quickly. The example primarily serves to:',
  NULL,
  '["illustrate the theory''s prediction", "refute the theory", "introduce a new topic", "define isolation"]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001',
  'medium',
  'A company claims that a new training program caused higher sales because sales rose after the program began. Which fact would most weaken the claim?',
  'A major seasonal sales campaign began at the same time.',
  'Employees liked the training.',
  'The program lasted two weeks.',
  'Sales had been stable the prior month.',
  'A',
  'A simultaneous campaign provides a competing explanation for the sales increase.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'ARGUMENT_EVALUATION_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'A company claims that a new training program caused higher sales because sales rose after the program began. Which fact would most weaken the claim?',
  NULL,
  '["A major seasonal sales campaign began at the same time.", "Employees liked the training.", "The program lasted two weeks.", "Sales had been stable the prior month."]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001';

-- US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002',
  'medium',
  'A town argues that installing bike lanes reduced traffic because average commute times fell afterward. Which evidence would most strengthen the argument?',
  'Nearby towns without new bike lanes showed no similar decline in commute time.',
  'Some residents dislike cycling.',
  'The lanes were painted blue.',
  'Fuel prices also fell.',
  'A',
  'A comparison group without the intervention supports the claim that the bike lanes contributed to the change.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'ARGUMENT_EVALUATION_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'READING_COMPREHENSION',
  'VERBAL',
  'TEXT',
  'A town argues that installing bike lanes reduced traffic because average commute times fell afterward. Which evidence would most strengthen the argument?',
  NULL,
  '["Nearby towns without new bike lanes showed no similar decline in commute time.", "Some residents dislike cycling.", "The lanes were painted blue.", "Fuel prices also fell."]',
  '["A"]',
  0,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001',
  'medium',
  'The committee''s report was so ______ that even critics praised its careful use of evidence.',
  'rigorous',
  'careless',
  'vague',
  'impulsive',
  'A',
  'Careful use of evidence is consistent with ''rigorous.''',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'SINGLE_BLANK_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["rigorous", "careless", "vague", "impulsive"]',
  '["A"]',
  1,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002',
  'medium',
  'Because the witness had repeatedly changed her account, the jury viewed her testimony with considerable ______.',
  'skepticism',
  'delight',
  'certainty',
  'reverence',
  'A',
  'Repeatedly changing an account naturally leads to skepticism.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'SINGLE_BLANK_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["skepticism", "delight", "certainty", "reverence"]',
  '["A"]',
  1,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001',
  'medium',
  'The scientist was initially ______ about the surprising result, but repeated trials made her increasingly ______ of its validity.',
  '',
  '',
  '',
  '',
  'A',
  'Initial skepticism followed by repeated confirmation leads to becoming convinced.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DOUBLE_BLANK_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1": ["skeptical", "certain", "indifferent"], "blank2": ["convinced", "dismissive", "confused"]}',
  '{"blank1": "A", "blank2": "A"}',
  2,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002',
  'medium',
  'The speech was outwardly ______, yet its underlying message was surprisingly ______.',
  '',
  '',
  '',
  '',
  'A',
  'A measured surface can still carry a critical underlying message.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DOUBLE_BLANK_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1": ["measured", "chaotic", "celebratory"], "blank2": ["critical", "trivial", "unrelated"]}',
  '{"blank1": "A", "blank2": "A"}',
  2,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001',
  'medium',
  'The novel''s style is ______ rather than ornate, its pacing is ______ rather than hurried, and its conclusion is deliberately ______ rather than explicit.',
  '',
  '',
  '',
  '',
  'A',
  'The contrasts point to spare, measured, and ambiguous.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'TRIPLE_BLANK_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1": ["spare", "florid", "technical"], "blank2": ["measured", "frantic", "erratic"], "blank3": ["ambiguous", "obvious", "didactic"]}',
  '{"blank1": "A", "blank2": "A", "blank3": "A"}',
  3,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001';

-- US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002',
  'medium',
  'The manager''s response was ______ in tone, ______ in scope, and ultimately ______ in effect.',
  '',
  '',
  '',
  '',
  'A',
  'The sentence describes a restrained response: conciliatory, narrow, and temporary.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'TRIPLE_BLANK_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'TEXT_COMPLETION',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '{"blank1": ["conciliatory", "combative", "mocking"], "blank2": ["narrow", "unlimited", "random"], "blank3": ["temporary", "permanent", "transformative"]}',
  '{"blank1": "A", "blank2": "A", "blank3": "A"}',
  3,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001',
  'medium',
  'The professor''s explanation was so ______ that even students unfamiliar with the topic could follow it.',
  'lucid',
  'opaque',
  'clear',
  'arcane',
  'A',
  'Lucid and clear both fit the context and produce equivalent meanings.',
  1,
  'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'CONTEXT_MEANING_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["lucid", "opaque", "clear", "arcane", "convoluted", "obscure"]',
  '["A", "C"]',
  1,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002',
  'medium',
  'Far from being ______, the new policy was welcomed by nearly every department.',
  'popular',
  'controversial',
  'contentious',
  'routine',
  'B',
  'Controversial and contentious are equivalent and contrast with broad acceptance.',
  1,
  'gre-starter-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_GRE'
  AND s.subject_code='VERBAL'
  AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'CONTEXT_MEANING_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["popular", "controversial", "contentious", "routine", "effective", "ordinary"]',
  '["B", "C"]',
  1,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001',
  'medium',
  'The critic found the performance unexpectedly ______, praising its freshness and energy.',
  'vital',
  'stale',
  'animated',
  'dreary',
  'A',
  'Vital and animated both match the praise for freshness and energy.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'EQUIVALENT_PAIR_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["vital", "stale", "animated", "dreary", "predictable", "lifeless"]',
  '["A", "C"]',
  1,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001';

-- US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002',
  'medium',
  'Despite its technical subject, the article remained remarkably ______ to nonspecialists.',
  'accessible',
  'impenetrable',
  'approachable',
  'esoteric',
  'A',
  'Accessible and approachable are equivalent in this context.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'EQUIVALENT_PAIR_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SENTENCE_EQUIVALENCE',
  'VERBAL',
  'NONE',
  NULL,
  NULL,
  '["accessible", "impenetrable", "approachable", "esoteric", "dense", "cryptic"]',
  '["A", "C"]',
  1,
  NULL,
  0,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001',
  'medium',
  'What is the greatest common factor of 18 and 30?',
  '3',
  '6',
  '9',
  '12',
  'B',
  '6 is the greatest integer dividing both 18 and 30.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'INTEGERS_FACTORS_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["3", "6", "9", "12"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002',
  'medium',
  'If n is divisible by 6, which must also divide n?',
  '2',
  '4',
  '5',
  '9',
  'A',
  'Every multiple of 6 is divisible by 2 and 3.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'INTEGERS_FACTORS_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["2", "4", "5", "9"]',
  '["A"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001',
  'medium',
  'A price rises from $80 to $92. What is the percent increase?',
  '10%',
  '12%',
  '15%',
  '20%',
  'C',
  'The increase is 12; 12/80 = 0.15 = 15%.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'FRACTIONS_RATIOS_PERCENT_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["10%", "12%", "15%", "20%"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002',
  'medium',
  'The ratio of red to blue marbles is 3:5. If there are 24 marbles total, how many are red?',
  '6',
  '9',
  '12',
  '15',
  'B',
  'There are 8 ratio parts; 24/8=3, so red = 3×3 = 9.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'FRACTIONS_RATIOS_PERCENT_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["6", "9", "12", "15"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001',
  'medium',
  'What is 2^5 × 2^3?',
  '2^8',
  '2^15',
  '4^8',
  '8^2',
  'A',
  'When multiplying equal bases, add exponents.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'EXPONENTS_ROOTS_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["2^8", "2^15", "4^8", "8^2"]',
  '["A"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002',
  'medium',
  'What is √144?',
  '10',
  '11',
  '12',
  '14',
  'C',
  '12×12=144.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'EXPONENTS_ROOTS_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["10", "11", "12", "14"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001',
  'medium',
  'A machine makes 120 parts in 3 hours at a constant rate. How many parts does it make in 5 hours?',
  '160',
  '180',
  '200',
  '240',
  'C',
  'Rate = 40 parts/hour; 5 hours gives 200.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'RATES_WORK_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["160", "180", "200", "240"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001';

-- US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002',
  'medium',
  'At 60 miles per hour, how far does a car travel in 2.5 hours?',
  '120',
  '150',
  '180',
  '210',
  'B',
  'Distance = rate × time = 60×2.5=150.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'RATES_WORK_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["120", "150", "180", "210"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001',
  'medium',
  'If 3x+5=20, what is x?',
  '3',
  '4',
  '5',
  '6',
  'C',
  '3x=15, so x=5.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'EXPRESSIONS_EQUATIONS_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["3", "4", "5", "6"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002',
  'medium',
  'If y=2x+1 and x=4, what is y?',
  '7',
  '8',
  '9',
  '10',
  'C',
  'y=2(4)+1=9.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'EXPRESSIONS_EQUATIONS_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["7", "8", "9", "10"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001',
  'medium',
  'If 2x>10, which must be true?',
  'x>5',
  'x<5',
  'x≥10',
  'x≤2',
  'A',
  'Divide both sides by positive 2.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'INEQUALITIES_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["x>5", "x<5", "x\u226510", "x\u22642"]',
  '["A"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002',
  'medium',
  'Which value satisfies x+3≤7?',
  '5',
  '4',
  '6',
  '8',
  'B',
  'x≤4, so 4 satisfies the inequality.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'INEQUALITIES_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["5", "4", "6", "8"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001',
  'medium',
  'If f(x)=x^2-1, what is f(3)?',
  '6',
  '7',
  '8',
  '9',
  'C',
  '3^2-1=8.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'FUNCTIONS_SEQUENCES_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["6", "7", "8", "9"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002',
  'medium',
  'What is the next term in 2, 5, 8, 11, ...?',
  '12',
  '13',
  '14',
  '15',
  'C',
  'The common difference is 3.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'FUNCTIONS_SEQUENCES_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["12", "13", "14", "15"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001',
  'medium',
  'What is the slope of the line through (1,2) and (3,6)?',
  '1',
  '2',
  '3',
  '4',
  'B',
  '(6-2)/(3-1)=4/2=2.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'COORDINATE_GEOMETRY_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["1", "2", "3", "4"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001';

-- US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002',
  'medium',
  'Which point lies on y=2x+1?',
  '(1,1)',
  '(1,2)',
  '(2,5)',
  '(3,5)',
  'C',
  'For x=2, y=5.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'COORDINATE_GEOMETRY_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["(1,1)", "(1,2)", "(2,5)", "(3,5)"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001',
  'medium',
  'Two angles of a triangle are 50° and 60°. What is the third angle?',
  '60°',
  '70°',
  '80°',
  '90°',
  'B',
  'Triangle angles sum to 180°.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'LINES_ANGLES_TRIANGLES_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["60\u00b0", "70\u00b0", "80\u00b0", "90\u00b0"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002',
  'medium',
  'A right triangle has legs 3 and 4. What is the hypotenuse?',
  '5',
  '6',
  '7',
  '8',
  'A',
  'By the Pythagorean theorem, √(9+16)=5.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'LINES_ANGLES_TRIANGLES_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["5", "6", "7", "8"]',
  '["A"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001',
  'medium',
  'What is the sum of the interior angles of a quadrilateral?',
  '180°',
  '270°',
  '360°',
  '540°',
  'C',
  '(4-2)×180=360°.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'POLYGONS_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["180\u00b0", "270\u00b0", "360\u00b0", "540\u00b0"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002',
  'medium',
  'A rectangle has length 8 and width 5. What is its area?',
  '13',
  '26',
  '40',
  '80',
  'C',
  'Area=8×5=40.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'POLYGONS_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["13", "26", "40", "80"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001',
  'medium',
  'A circle has radius 4. What is its circumference?',
  '4π',
  '8π',
  '16π',
  '32π',
  'B',
  'Circumference=2πr=8π.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'CIRCLES_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["4\u03c0", "8\u03c0", "16\u03c0", "32\u03c0"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002',
  'medium',
  'A circle has diameter 10. What is its radius?',
  '2',
  '5',
  '10',
  '20',
  'B',
  'Radius is half the diameter.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'CIRCLES_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["2", "5", "10", "20"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001',
  'medium',
  'What is the volume of a rectangular solid 2×3×5?',
  '10',
  '20',
  '30',
  '60',
  'C',
  'Volume=2×3×5=30.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'THREE_DIMENSIONAL_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["10", "20", "30", "60"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001';

-- US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002',
  'medium',
  'A cube has side length 4. What is its volume?',
  '16',
  '32',
  '64',
  '128',
  'C',
  'Volume=4^3=64.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'THREE_DIMENSIONAL_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["16", "32", "64", "128"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001',
  'medium',
  'What is the mean of 2, 4, 6, 8?',
  '4',
  '5',
  '6',
  '7',
  'B',
  'Sum=20; 20/4=5.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DESCRIPTIVE_STATISTICS_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["4", "5", "6", "7"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002',
  'medium',
  'What is the median of 1, 3, 7, 9, 12?',
  '3',
  '7',
  '8',
  '9',
  'B',
  'The middle value is 7.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DESCRIPTIVE_STATISTICS_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["3", "7", "8", "9"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001',
  'medium',
  'A fair coin is tossed once. What is the probability of heads?',
  '1/4',
  '1/3',
  '1/2',
  '1',
  'C',
  'There are two equally likely outcomes.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'PROBABILITY_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["1/4", "1/3", "1/2", "1"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002',
  'medium',
  'A fair six-sided die is rolled. What is the probability of rolling an even number?',
  '1/6',
  '1/3',
  '1/2',
  '2/3',
  'C',
  'Even outcomes are 2,4,6: 3 of 6.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'PROBABILITY_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["1/6", "1/3", "1/2", "2/3"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001',
  'medium',
  'How many ways can 2 people be chosen from 5?',
  '5',
  '10',
  '15',
  '20',
  'B',
  'C(5,2)=10.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'COUNTING_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["5", "10", "15", "20"]',
  '["B"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002',
  'medium',
  'How many 2-letter arrangements can be made from A, B, C without repetition?',
  '3',
  '4',
  '6',
  '9',
  'C',
  '3 choices for first letter and 2 for second: 6.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'COUNTING_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["3", "4", "6", "9"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001',
  'medium',
  'A table shows sales of 10, 15, 20, and 25 units over four weeks. What is the total?',
  '60',
  '65',
  '70',
  '75',
  'C',
  '10+15+20+25=70.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DATA_INTERPRETATION_STARTER_01','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["60", "65", "70", "75"]',
  '["C"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001';

-- US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002',
  'medium',
  'A bar graph shows category values 4, 7, 9, and 10. What is the range?',
  '3',
  '4',
  '5',
  '6',
  'D',
  'Range=10-4=6.',
  1,
  'gre-starter-v1'
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
SELECT q.id,'MAIN','SINGLE_CHOICE','GRE_2026','REVIEWED',
       'DATA_INTERPRETATION_STARTER_02','GYAN GRE 2026 starter bank'
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'QUANT',
  'NONE',
  NULL,
  NULL,
  '["3", "4", "5", "6"]',
  '["D"]',
  0,
  NULL,
  1,
  NULL,
  NULL,
  CURRENT_TIMESTAMP
FROM education_questions q WHERE q.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002';

-- Mirror US GRE questions into India by cloning content onto matching IN catalog skills.
-- This keeps the GRE catalog shared across both country portals.

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='MAIN_IDEA';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_MAIN_IDEA_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='DETAIL_EVIDENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_DETAIL_EVIDENCE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='INFERENCE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_INFERENCE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='AUTHOR_PERSPECTIVE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_AUTHOR_PERSPECTIVE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='STRUCTURE_FUNCTION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_STRUCTURE_FUNCTION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='READING_COMPREHENSION'
  AND target_st.subtopic_code='ARGUMENT_EVALUATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_READING_COMPREHENSION_ARGUMENT_EVALUATION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='TEXT_COMPLETION'
  AND target_st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='TEXT_COMPLETION'
  AND target_st.subtopic_code='SINGLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_SINGLE_BLANK_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='TEXT_COMPLETION'
  AND target_st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='TEXT_COMPLETION'
  AND target_st.subtopic_code='DOUBLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_DOUBLE_BLANK_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='TEXT_COMPLETION'
  AND target_st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='TEXT_COMPLETION'
  AND target_st.subtopic_code='TRIPLE_BLANK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_TEXT_COMPLETION_TRIPLE_BLANK_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='SENTENCE_EQUIVALENCE'
  AND target_st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='SENTENCE_EQUIVALENCE'
  AND target_st.subtopic_code='CONTEXT_MEANING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_CONTEXT_MEANING_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='SENTENCE_EQUIVALENCE'
  AND target_st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='VERBAL'
  AND target_t.topic_code='SENTENCE_EQUIVALENCE'
  AND target_st.subtopic_code='EQUIVALENT_PAIR';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_VERBAL_SENTENCE_EQUIVALENCE_EQUIVALENT_PAIR_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='INTEGERS_FACTORS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_INTEGERS_FACTORS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_FRACTIONS_RATIOS_PERCENT_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='EXPONENTS_ROOTS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_EXPONENTS_ROOTS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ARITHMETIC'
  AND target_st.subtopic_code='RATES_WORK';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ARITHMETIC_RATES_WORK_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_EXPRESSIONS_EQUATIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='INEQUALITIES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_INEQUALITIES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='FUNCTIONS_SEQUENCES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_FUNCTIONS_SEQUENCES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='ALGEBRA'
  AND target_st.subtopic_code='COORDINATE_GEOMETRY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_ALGEBRA_COORDINATE_GEOMETRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_LINES_ANGLES_TRIANGLES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='POLYGONS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_POLYGONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_CIRCLES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='GEOMETRY'
  AND target_st.subtopic_code='THREE_DIMENSIONAL';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_GEOMETRY_THREE_DIMENSIONAL_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DESCRIPTIVE_STATISTICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_PROBABILITY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='COUNTING';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_COUNTING_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT
  target_st.id,
  'IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002',
  src.difficulty,src.question_text,src.choice_a,src.choice_b,src.choice_c,src.choice_d,src.correct_choice,src.explanation,src.active,src.source_type
FROM education_questions src
JOIN education_subtopics target_st
JOIN education_topics target_t ON target_t.id=target_st.topic_id
JOIN education_subjects target_s ON target_s.id=target_t.subject_id
WHERE src.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002'
  AND target_s.country_code='IN'
  AND target_s.grade_code='PROGRAM_GRE'
  AND target_s.subject_code='QUANT'
  AND target_t.topic_code='DATA_ANALYSIS'
  AND target_st.subtopic_code='DATA_INTERPRETATION';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,quality_status,archetype_code,source_note)
SELECT inq.id,m.exam_level,m.question_format,m.syllabus_version,m.quality_status,m.archetype_code,m.source_note
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002'
JOIN education_question_metadata m ON m.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002';

INSERT OR REPLACE INTO education_gre_question_details
(question_id,response_type,section_kind,stimulus_type,stimulus_text,directions_text,choices_json,correct_answers_json,blank_count,numeric_tolerance,calculator_allowed,section_number,section_path,updated_at)
SELECT inq.id,d.response_type,d.section_kind,d.stimulus_type,d.stimulus_text,d.directions_text,d.choices_json,d.correct_answers_json,d.blank_count,d.numeric_tolerance,d.calculator_allowed,d.section_number,d.section_path,CURRENT_TIMESTAMP
FROM education_questions inq
JOIN education_questions usq ON usq.question_key='US_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002'
JOIN education_gre_question_details d ON d.question_id=usq.id
WHERE inq.question_key='IN_PROGRAM_GRE_QUANT_DATA_ANALYSIS_DATA_INTERPRETATION_002';

-- Audit: expected 54 active GRE questions per country.
SELECT s.country_code,s.subject_code,COUNT(q.id) AS active_questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.grade_code='PROGRAM_GRE' AND s.country_code IN ('US','IN') AND q.active=1
GROUP BY s.country_code,s.subject_code
ORDER BY s.country_code,s.sort_order;
