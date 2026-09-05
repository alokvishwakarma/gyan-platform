-- 0102_sat_2026_expand_to_five_per_skill.sql
-- Adds questions 003-005 for every SAT skill.
-- After this migration: 30 skills x 5 questions = 150 active SAT questions.

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_003',
  'medium',
  'Which choice best states the main idea of the text?',
  'Urban wetlands can provide several practical environmental benefits.','All cities should replace roads with wetlands.','Wetlands are useful only for recreation.','Flooding occurs only where wetlands are absent.',
  'A',
  'The text presents several environmental benefits of urban wetlands.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Urban wetlands can slow storm-water runoff, provide habitat for wildlife, and filter some pollutants before water enters rivers. Cities that preserve or restore these areas may gain several environmental benefits.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_004',
  'medium',
  'According to the text, what happened after the library extended weekend hours?',
  'Weekend attendance increased.','Weekday attendance ended.','The library reduced its collection.','The building closed earlier.',
  'A',
  'The passage directly states that weekend attendance increased.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'A neighborhood library extended its Saturday hours by three hours. During the next two months, average Saturday attendance increased by 37 percent.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_005',
  'medium',
  'Which choice best summarizes the text?',
  'Some species adjust migration timing in response to changing conditions.','Migration always begins on the same date.','Temperature has no relationship to migration.','Scientists cannot observe long-term migration patterns.',
  'A',
  'The passage links migration timing to changing spring conditions.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='CENTRAL_IDEAS_DETAILS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Long-term observations of several bird populations show that arrival dates tend to be earlier in unusually warm springs and later in cooler springs. The pattern suggests that migration timing can respond to environmental conditions.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_003',
  'medium',
  'Which inference is best supported by the text?',
  'The coating may reduce heat transfer.','The coating increases the weight of every building.','The coating works only in winter.','The coating produces electricity.',
  'A',
  'Lower heat loss after treatment supports the inference that the coating reduces heat transfer.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Engineers applied a thin coating to several wall panels. Under identical indoor and outdoor temperatures, treated panels lost less heat than untreated panels.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_004',
  'medium',
  'What can reasonably be inferred about the seeds?',
  'Cold exposure may improve germination for this species.','The seeds cannot survive low temperatures.','The seeds germinate only in darkness.','The seeds require salt water.',
  'A',
  'The refrigerated group had the higher germination rate.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'One group of seeds was stored at room temperature and another was refrigerated for six weeks. After planting, 44 percent of the room-temperature seeds germinated, compared with 72 percent of the refrigerated seeds.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_005',
  'medium',
  'Which inference is best supported?',
  'The new route may have made commuting easier for some riders.','The new route eliminated all traffic.','The route operates only at night.','No one used the route.',
  'A',
  'Higher-than-expected ridership and shorter reported commutes support that inference.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='INFERENCES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'After a direct bus route opened between two neighborhoods and downtown, weekday ridership exceeded projections. Surveyed riders also reported shorter average commute times.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_003',
  'medium',
  'Which detail best supports the claim that the program increased participation?',
  'Attendance rose from 18 to 41 people per session.','The program began in April.','Sessions were held on Tuesdays.','The building is downtown.',
  'A',
  'The change in attendance directly measures increased participation.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'A community center began free evening technology workshops in April. Average attendance increased from 18 people per session before the program to 41 afterward.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_004',
  'medium',
  'Which detail most directly supports the claim that the intervention improved completion?',
  'Completion increased from 61% to 79%.','Participants received weekly reminders.','The course lasted eight weeks.','The course was online.',
  'A',
  'The higher completion rate directly supports the claim.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'An online course began sending weekly progress reminders. In the next session, completion increased from 61 percent to 79 percent.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_005',
  'medium',
  'Which quotation best supports the idea that the animal changes behavior seasonally?',
  '''In winter it hunts mainly at dusk, while in summer it is often active before dawn.''','''The fox has thick fur.''','''Adults weigh several kilograms.''','''The species lives across a wide region.''',
  'A',
  'The quotation directly describes a seasonal change in activity.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_TEXT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Researchers used motion-sensitive cameras to study fox activity throughout the year.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_003',
  'medium',
  'Which choice best uses the data to support the claim that Plant B grew more rapidly than Plant A?',
  'Plant A grew 6 cm while Plant B grew 10 cm.','Both plants began at 5 cm.','Plant A ended at 11 cm.','Plant B was measured after four weeks.',
  'A',
  'The increases directly compare growth over the same interval.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TABLE',
  'Plant height (cm)
Week 0: A=5, B=5
Week 4: A=11, B=15',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_004',
  'medium',
  'Which statement is best supported by the table?',
  'Rail ridership increased more than bus ridership from 2022 to 2024.','Bus ridership decreased every year.','Rail ridership was highest in 2022.','Bus and rail ridership were equal in 2023.',
  'A',
  'Rail increased by 19 thousand; bus increased by 6 thousand.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TABLE',
  'Annual ridership (thousands)
2022: Bus 72, Rail 48
2023: Bus 75, Rail 59
2024: Bus 78, Rail 67',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_005',
  'medium',
  'Which statement best supports the claim that Group X improved more than Group Y?',
  'Group X increased by 12 points while Group Y increased by 5.','Group X started with a lower score.','Both groups took the same test.','Group Y ended at 80.',
  'A',
  'The amount of increase directly measures improvement.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND st.subtopic_code='COMMAND_EVIDENCE_QUANT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TABLE',
  'Mean scores
Group X: 62 before, 74 after
Group Y: 75 before, 80 after',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_003',
  'medium',
  'As used in the text, ''robust'' most nearly means',
  'strong','noisy','brief','round',
  'A',
  'Here ''robust'' means strong or resilient.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'The model remained robust even when researchers removed several observations from the data set.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_004',
  'medium',
  'As used in the text, ''marked'' most nearly means',
  'noticeable','written on','damaged','graded',
  'A',
  'A ''marked improvement'' is a noticeable improvement.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'After the software update, users reported a marked improvement in loading speed.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_005',
  'medium',
  'As used in the text, ''conventional'' most nearly means',
  'traditional','dangerous','temporary','secret',
  'A',
  'Conventional means traditional or commonly used.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='WORDS_IN_CONTEXT';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Instead of using a conventional battery, the prototype stores energy in a rotating flywheel.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_003',
  'medium',
  'What is the purpose of the second sentence?',
  'To provide an example of the first sentence','To contradict the first sentence','To introduce an unrelated topic','To define a technical term',
  'A',
  'The second sentence illustrates the general claim.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Some desert plants conserve water by reducing exposed leaf area. For example, certain cacti have spines instead of broad leaves.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_004',
  'medium',
  'The text is primarily structured as',
  'a problem followed by a possible solution','a chronological biography','a list of synonyms','a comparison of unrelated inventions',
  'A',
  'The first sentence presents a problem; the second presents a response.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Traditional streetlights can waste electricity by shining at full brightness when roads are empty. Some cities are testing lights that dim automatically when sensors detect no nearby traffic.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_005',
  'medium',
  'Why does the author mention the 2019 experiment?',
  'To provide evidence for a broader claim','To define photosynthesis','To criticize all experiments','To shift to an unrelated topic',
  'A',
  'The experiment is evidence that supports the broader claim.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Some insects can learn to associate colors with food rewards. In a 2019 experiment, bees repeatedly chose a color that researchers had paired with a sugar solution.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_003',
  'medium',
  'How would the author of Text 2 most likely respond to the claim in Text 1?',
  'By arguing that productivity effects depend on the kind of work','By saying remote work always increases productivity','By claiming offices should be eliminated','By denying that collaboration matters',
  'A',
  'Text 2 qualifies the claim by emphasizing task differences.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'PASSAGE_PAIR',
  'Text 1: A company reported higher output after allowing employees to work remotely three days per week.

Text 2: Studies suggest that individual tasks may improve with fewer interruptions, while highly collaborative tasks can become more difficult.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_004',
  'medium',
  'The authors of both texts would most likely agree that',
  'vehicle impacts should be evaluated across multiple stages','electric vehicles have no environmental costs','battery production is the only source of emissions','gasoline vehicles are always cleaner',
  'A',
  'Both texts consider impacts beyond a single stage.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'PASSAGE_PAIR',
  'Text 1: Electric vehicles produce no tailpipe emissions, but manufacturing batteries requires energy and raw materials.

Text 2: Comparing vehicle emissions requires considering both production and energy use during years of operation.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_005',
  'medium',
  'Text 2 most directly challenges which assumption in Text 1?',
  'That yield alone determines the best crop variety','That plants need water','That farms grow crops','That yields can be measured',
  'A',
  'Text 2 introduces water use as another criterion.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND st.subtopic_code='CROSS_TEXT_CONNECTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'PASSAGE_PAIR',
  'Text 1: Variety A produced the highest yield in the trial.

Text 2: Variety A also required substantially more irrigation than the other varieties.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_003',
  'medium',
  'Which choice most effectively uses the notes to emphasize the study''s duration?',
  'Researchers tracked monarch butterflies for twelve consecutive years.','The study examined monarch butterflies.','Monarch butterflies migrate long distances.','Researchers work at several universities.',
  'A',
  'It directly emphasizes duration.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'STUDENT_NOTES',
  'Notes:
• Researchers tracked monarch butterflies.
• Data were collected every year from 2014 through 2025.
• Six monitoring sites were used.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_004',
  'medium',
  'Which choice most effectively uses the notes to compare the materials?',
  'Material X is lighter than Material Y but withstands less heat.','Material X and Material Y were tested.','Engineers use many materials.','Material Y was tested in a laboratory.',
  'A',
  'It states both dimensions of comparison.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'STUDENT_NOTES',
  'Notes:
• Material X mass: 1.8 kg per panel.
• Material Y mass: 2.4 kg per panel.
• X heat tolerance: 180°C.
• Y heat tolerance: 240°C.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_005',
  'medium',
  'Which choice best emphasizes the magnitude of the change?',
  'Enrollment increased by 48% in three years.','The school tracks enrollment.','Enrollment was measured annually.','The school has several programs.',
  'A',
  'The percentage directly emphasizes magnitude.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='RHETORICAL_SYNTHESIS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'STUDENT_NOTES',
  'Notes:
• Enrollment 2022: 500.
• Enrollment 2025: 740.
• Increase: 48%.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_003',
  'medium',
  'Which transition best completes the text?',
  'Therefore,','However,','For example,','Similarly,',
  'A',
  'The second sentence gives a consequence.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'The bridge inspection revealed several weakened support bolts. ___ engineers closed one lane until repairs could be completed.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_004',
  'medium',
  'Which transition best completes the text?',
  'In contrast,','For instance,','Consequently,','Likewise,',
  'A',
  'The second sentence contrasts with the first.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Most lizards in the study were active during the hottest part of the day. ___ the closely related desert gecko emerged mainly after sunset.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_005',
  'medium',
  'Which transition best completes the text?',
  'For example,','However,','Instead,','Meanwhile,',
  'A',
  'The second sentence gives an example.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Several mammals use tools. ___ sea otters may use stones to open shellfish.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_003',
  'medium',
  'Which choice completes the sentence correctly?',
  'samples; the','samples, the','samples the','samples: and the',
  'A',
  'A semicolon correctly joins two independent clauses.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'The researchers collected the ___ laboratory analyzed them the same day.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_004',
  'medium',
  'Which choice completes the sentence correctly?',
  'river, which','river which','river; which','river: which',
  'A',
  'The nonrestrictive clause is set off with a comma.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'The trail follows the ___ was restored in 2022, for nearly two miles.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_005',
  'medium',
  'Which choice completes the sentence correctly?',
  'forest and','forest, and','forest; and','forest: and',
  'A',
  'No comma is needed between two compound objects joined by ''and.''',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='BOUNDARIES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'The survey documented bird species in the wetland ___ nearby grassland.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_003',
  'medium',
  'Which choice completes the sentence correctly?',
  'is','are','were','have',
  'A',
  'The singular subject ''number'' takes ''is.''',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='FORM_STRUCTURE_SENSE';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'The number of applications ___ increasing each month.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_004',
  'medium',
  'Which choice completes the sentence correctly?',
  'has','have','having','were',
  'A',
  'The subject ''Each'' is singular.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='FORM_STRUCTURE_SENSE';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'Each of the samples ___ been labeled.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_005',
  'medium',
  'Which choice completes the sentence correctly?',
  'shows','show','showing','have shown',
  'A',
  'The singular subject ''analysis'' takes ''shows.''',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND st.subtopic_code='FORM_STRUCTURE_SENSE';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'TEXT',
  'The analysis of the measurements ___ a consistent pattern.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_003',
  'medium',
  'A taxi fare is $4 plus $3 per mile. If the fare is $25, how many miles were traveled?',
  '5','6','7','8',
  'C',
  '4+3m=25, so m=7.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_1VAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_004',
  'medium',
  'If 7x+4=39, what is x?',
  '4','5','6','7',
  'B',
  '7x=35, so x=5.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_1VAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_005',
  'medium',
  'A tank contains 50 liters and drains at 4 liters per minute. After how many minutes will 18 liters remain?',
  '6','7','8','9',
  'C',
  '50-4m=18 gives m=8.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_1VAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_003',
  'medium',
  'What is the slope of 3y=12x-6?',
  '2','3','4','6',
  'C',
  'y=4x-2.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_2VAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_004',
  'medium',
  'A line has slope -2 and y-intercept 5. Which equation represents it?',
  'y=-2x+5','y=2x+5','y=-5x+2','y=5x-2',
  'A',
  'Use y=mx+b.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_2VAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_005',
  'medium',
  'Which point lies on y=3x-4?',
  '(1,0)','(2,2)','(3,4)','(4,9)',
  'B',
  'For x=2, y=2.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_EQ_2VAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_003',
  'medium',
  'A function increases by 6 whenever x increases by 2. What is its slope?',
  '2','3','4','6',
  'B',
  'Slope=6/2=3.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_004',
  'medium',
  'If f(x)=5x-2, what is f(4)?',
  '16','18','20','22',
  'B',
  '20-2=18.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_005',
  'medium',
  'A line passes through (0,7) and (3,16). Which equation represents it?',
  'y=3x+7','y=7x+3','y=3x+16','y=9x+7',
  'A',
  'Slope is 3 and intercept is 7.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_003',
  'medium',
  'Solve x+y=9 and x-y=3.',
  '(3,6)','(6,3)','(5,4)','(7,2)',
  'B',
  'Adding the equations gives 2x=12.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='SYSTEMS_LINEAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_004',
  'medium',
  'Two notebooks and one pen cost $11; one notebook and one pen cost $7. What is the notebook price?',
  '$3','$4','$5','$6',
  'B',
  'Subtract the equations.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='SYSTEMS_LINEAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_005',
  'medium',
  'Solve y=x+2 and y=3x-4.',
  '(2,4)','(3,5)','(4,6)','(5,7)',
  'B',
  'x+2=3x-4 gives x=3, y=5.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='SYSTEMS_LINEAR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_003',
  'medium',
  'Solve 2x+3≤11.',
  'x≤4','x≥4','x<7','x≥7',
  'A',
  '2x≤8.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_INEQUALITIES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_004',
  'medium',
  'A club has $120 and spends $8 per event. Which inequality gives the possible number of events e if at least $40 must remain?',
  '120-8e≥40','120+8e≥40','8e-120≥40','120-8e≤40',
  'A',
  'Remaining funds must be at least 40.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_INEQUALITIES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_005',
  'medium',
  'Which value satisfies 5x+1<21?',
  '3','4','5','6',
  'A',
  '5x<20, so x<4.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND st.subtopic_code='LINEAR_INEQUALITIES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_003',
  'medium',
  'Factor x²+7x+12.',
  '(x+3)(x+4)','(x+2)(x+6)','(x-3)(x-4)','x(x+12)',
  'A',
  '3+4=7 and 3×4=12.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='EQUIVALENT_EXPRESSIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_004',
  'medium',
  'Simplify 3x²+9x.',
  '3x(x+3)','3(x+9)','x(3+9)','9x(x+1)',
  'A',
  'Factor out 3x.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='EQUIVALENT_EXPRESSIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_005',
  'medium',
  'Which expression equals (x+5)²?',
  'x²+25','x²+10x+25','x²+5x+25','x²+10',
  'B',
  'Expand the binomial.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='EQUIVALENT_EXPRESSIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_003',
  'medium',
  'Solve x²=49.',
  '7 only','-7 only','±7','49',
  'C',
  'Both 7 and -7 square to 49.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_EQUATIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_004',
  'medium',
  'What positive x satisfies x²+2x-15=0?',
  '3','5','-3','-5',
  'A',
  '(x+5)(x-3)=0.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_EQUATIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_005',
  'medium',
  'If x²-4x=12, what is a positive solution?',
  '2','4','6','8',
  'C',
  'x²-4x-12=(x-6)(x+2).',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_EQUATIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_003',
  'medium',
  'If f(x)=x²+1, what is f(3)?',
  '8','9','10','12',
  'C',
  '9+1=10.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_004',
  'medium',
  'A quantity triples each hour from an initial value of 5. Which expression models it after t hours?',
  '5(3)^t','15t','3(5)^t','5+3t',
  'A',
  'Each hour multiplies by 3.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_005',
  'medium',
  'For g(x)=|x-4|, what is g(1)?',
  '1','2','3','5',
  'C',
  '|1-4|=3.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND st.subtopic_code='NONLINEAR_FUNCTIONS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_003',
  'medium',
  'A cyclist travels 42 miles in 2.5 hours. What is the average speed?',
  '15.8','16.8','17.8','18.8',
  'B',
  '42/2.5=16.8.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='RATIOS_RATES_UNITS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_004',
  'medium',
  'A map scale is 1 inch=12 miles. How many miles are represented by 3.5 inches?',
  '36','40','42','48',
  'C',
  '3.5×12=42.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='RATIOS_RATES_UNITS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_005',
  'medium',
  'A machine produces 180 parts in 12 minutes. At the same rate, how many parts in 20 minutes?',
  '240','270','300','360',
  'C',
  '15 per minute ×20=300.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='RATIOS_RATES_UNITS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_003',
  'medium',
  'A price rises from $50 to $60. What is the percent increase?',
  '10%','20%','25%','30%',
  'B',
  '10/50=20%.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PERCENTAGES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_004',
  'medium',
  'After a 15% discount, a $120 item costs how much?',
  '$96','$102','$108','$110',
  'B',
  '120×0.85=102.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PERCENTAGES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_005',
  'medium',
  'A value decreases from 80 to 68. What is the percent decrease?',
  '10%','12%','15%','18%',
  'C',
  '12/80=15%.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PERCENTAGES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_003',
  'medium',
  'What is the median of 3,5,7,8,12?',
  '5','7','8','12',
  'B',
  'The middle value is 7.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='ONE_VARIABLE_DATA';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_004',
  'medium',
  'What is the mean of 4,6,8,10?',
  '6','7','8','9',
  'B',
  '28/4=7.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='ONE_VARIABLE_DATA';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_005',
  'medium',
  'Which statistic is generally most resistant to a very large outlier?',
  'Mean','Median','Range','Standard deviation',
  'B',
  'The median is resistant to extreme values.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='ONE_VARIABLE_DATA';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_003',
  'medium',
  'A scatterplot clusters around an upward-sloping line. What does this suggest?',
  'Positive association','Negative association','No association','Constant values',
  'A',
  'As x increases, y tends to increase.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='TWO_VARIABLE_DATA';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_004',
  'medium',
  'For y=1.5x+4, what is predicted y when x=10?',
  '15','17','19','21',
  'C',
  '1.5×10+4=19.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='TWO_VARIABLE_DATA';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_005',
  'medium',
  'A residual is observed y minus predicted y. If observed is 22 and predicted is 18, what is the residual?',
  '-4','0','4','40',
  'C',
  '22-18=4.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='TWO_VARIABLE_DATA';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_003',
  'medium',
  'A bag has 4 red and 6 blue marbles. What is P(red)?',
  '2/5','1/2','3/5','2/3',
  'A',
  '4/10=2/5.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_004',
  'medium',
  'If P(A)=0.3 and P(B)=0.4 and A,B are independent, what is P(A and B)?',
  '0.12','0.3','0.4','0.7',
  'A',
  'Multiply independent probabilities.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_005',
  'medium',
  'A fair die is rolled. What is P(number greater than 4)?',
  '1/6','1/3','1/2','2/3',
  'B',
  'Outcomes 5 and 6: 2/6=1/3.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='PROBABILITY';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_003',
  'medium',
  'A poll gives 48% ±4%. Which interval is consistent?',
  '40–44%','44–52%','48–56%','52–60%',
  'B',
  '48±4 gives 44 to 52.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='INFERENCE_MARGIN_ERROR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_004',
  'medium',
  'All else equal, increasing sample size generally does what to margin of error?',
  'Increases it','Decreases it','Makes it zero','Has no effect',
  'B',
  'Larger samples reduce sampling variability.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='INFERENCE_MARGIN_ERROR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_005',
  'medium',
  'A sample estimate is 35 with margin of error 2. Which interval is implied?',
  '31–33','33–37','35–39','37–41',
  'B',
  '35±2 gives 33 to 37.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='INFERENCE_MARGIN_ERROR';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_003',
  'medium',
  'Random assignment in an experiment most directly supports conclusions about',
  'causation','population size','historical trends','response rate',
  'A',
  'Random assignment helps isolate treatment effects.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='STATISTICAL_CLAIMS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_004',
  'medium',
  'A survey of only volunteers may suffer primarily from',
  'selection bias','perfect randomness','zero variability','causal inference',
  'A',
  'Volunteers may differ systematically from the population.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='STATISTICAL_CLAIMS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_005',
  'medium',
  'Random sampling is especially important when the goal is to',
  'generalize to a population','prove causation','increase treatment effect','remove all error',
  'A',
  'Random samples support population generalization.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND st.subtopic_code='STATISTICAL_CLAIMS';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_003',
  'medium',
  'What is the area of a rectangle 14 by 6?',
  '20','40','72','84',
  'D',
  '14×6=84.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='AREA_VOLUME';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_004',
  'medium',
  'A cylinder has radius 2 and height 7. What is its volume?',
  '14π','28π','32π','56π',
  'B',
  'πr²h=π×4×7.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='AREA_VOLUME';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_005',
  'medium',
  'A cube has side length 5. What is its volume?',
  '25','75','100','125',
  'D',
  '5³=125.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='AREA_VOLUME';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_003',
  'medium',
  'Two supplementary angles include one angle of 68°. What is the other?',
  '22°','68°','112°','122°',
  'C',
  '180-68=112.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_004',
  'medium',
  'A triangle has angles 50° and 60°. What is the third angle?',
  '60°','70°','80°','90°',
  'B',
  '180-110=70.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_005',
  'medium',
  'Two parallel lines are cut by a transversal. If one corresponding angle is 73°, the corresponding angle is',
  '17°','73°','107°','146°',
  'B',
  'Corresponding angles are equal.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_003',
  'medium',
  'A right triangle has legs 5 and 12. What is the hypotenuse?',
  '13','15','17','19',
  'A',
  '5-12-13 triangle.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='RIGHT_TRIANGLES_TRIG';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_004',
  'medium',
  'If sin θ=4/5 and hypotenuse=15, what is the opposite side?',
  '9','10','12','15',
  'C',
  '(4/5)×15=12.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='RIGHT_TRIANGLES_TRIG';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_005',
  'medium',
  'In a right triangle, tan θ=3/4. If adjacent=8, what is opposite?',
  '4','6','8','12',
  'B',
  'opposite/8=3/4, so opposite=6.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='RIGHT_TRIANGLES_TRIG';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_005';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_003',
  'medium',
  'A circle has radius 6. What is its circumference?',
  '6π','12π','18π','36π',
  'B',
  '2πr=12π.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_004',
  'medium',
  'A circle has diameter 10. What is its area?',
  '10π','20π','25π','100π',
  'C',
  'Radius=5, area=25π.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_005',
  'medium',
  'For (x-1)²+(y+2)²=16, what is the radius?',
  '2','4','8','16',
  'B',
  'r²=16, so r=4.',
  1,
  'sat-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND st.subtopic_code='CIRCLES';

INSERT OR REPLACE INTO education_sat_question_details
(question_id,response_type,stimulus_type,stimulus_text,
 stimulus_secondary_text,stimulus_data_json,accepted_answers_json,
 module_number,module_path,calculator_allowed,contextual,updated_at)
SELECT
  q.id,
  'MCQ',
  'NONE',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_005';
