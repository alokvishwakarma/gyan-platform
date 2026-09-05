-- 0101_sat_2026_starter_bank.sql
-- 60-question high-quality SAT starter bank: 2 questions per skill.
-- Uses the official-domain/skill catalog created by 0099.
-- SAT-specific stimuli are stored in education_sat_question_details.

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_001',
  'medium',
  'Which choice best states the main idea of the text?',
  'Urban trees mainly reduce traffic noise.','Urban trees can provide several environmental benefits.','Cities should replace buildings with parks.','Air pollution is caused mostly by a lack of trees.',
  'B',
  'The text emphasizes several benefits of urban trees, not only one specific effect.',
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
  'Researchers studying city neighborhoods have found that tree canopies can lower surface temperatures, capture some airborne particles, and slow storm-water runoff. These benefits vary by species and location, but together they can improve urban environmental conditions.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_002',
  'easy',
  'According to the text, why did the researchers repeat the measurements in several seasons?',
  'To compare different instruments','To account for seasonal changes','To reduce the number of study sites','To avoid measuring rainfall',
  'B',
  'The text directly states that repeating measurements helped account for seasonal variation.',
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
  'A team measured water quality at the same six stream sites in spring, summer, autumn, and winter. By repeating the measurements, the team could account for seasonal changes that might otherwise distort comparisons among the sites.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_CENTRAL_IDEAS_DETAILS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_001',
  'medium',
  'Which conclusion is best supported by the text?',
  'The museum will permanently close its print gallery.','Visitors strongly prefer paintings to photographs.','The museum is experimenting with ways to broaden access.','Online exhibitions always attract more visitors than in-person exhibitions.',
  'C',
  'Offering both an online version and extended evening hours suggests the museum is trying multiple ways to broaden access.',
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
  'After a photography exhibition attracted more visitors than expected, the museum created an online version of the exhibition and extended gallery hours on two evenings each week.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_002',
  'medium',
  'What can reasonably be inferred about the seeds?',
  'They require complete darkness to germinate.','They may germinate better after exposure to cooler temperatures.','They cannot survive winter conditions.','They germinate only in laboratory soil.',
  'B',
  'The refrigerated seeds germinated at a higher rate, supporting the inference that cooler exposure may improve germination.',
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
  'Two sets of seeds were stored for six weeks. One set remained at room temperature; the other was refrigerated. When planted under the same conditions, 42% of the room-temperature seeds germinated, compared with 71% of the refrigerated seeds.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_INFERENCES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_001',
  'medium',
  'Which quotation from the text best supports the claim that the species can adapt its feeding behavior?',
  '''The birds inhabit several coastal islands.''','''Their beaks are short and strong.''','''During unusually dry years, they shift from soft seeds to harder seeds.''','''Researchers have observed the population for decades.''',
  'C',
  'A shift in food choice under changed conditions directly supports behavioral adaptability.',
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
  'The island birds usually eat small, soft seeds. During unusually dry years, those seeds become scarce, and the birds shift to larger, harder seeds. Researchers have observed this pattern during several droughts.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_002',
  'easy',
  'Which detail most directly supports the idea that the library''s program increased participation?',
  'The library is located downtown.','The program began in April.','Attendance rose from 18 people per session to 41.','The sessions were held on Tuesdays.',
  'C',
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
  'In April, the library began offering free evening technology workshops. Average attendance rose from 18 people per session in March to 41 people per session in May.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_TEXT_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_001',
  'medium',
  'Which choice best uses the data to support the student''s claim that Plant B grew more rapidly than Plant A?',
  'Plant A grew from 5 cm to 11 cm, while Plant B grew from 5 cm to 15 cm.','Both plants began at 5 cm.','Plant A reached 11 cm after four weeks.','Plant B was taller than Plant A at the start.',
  'A',
  'The increase was 6 cm for A and 10 cm for B, so the data support faster growth for B.',
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
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_002',
  'medium',
  'Which statement is best supported by the table?',
  'Bus ridership decreased every year.','Rail ridership increased more than bus ridership between 2022 and 2024.','Bus and rail ridership were equal in 2023.','Rail ridership was highest in 2022.',
  'B',
  'Rail increased from 48 to 67 (+19), while bus increased from 72 to 78 (+6).',
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
WHERE q.question_key='US_PROGRAM_SAT_RW_INFO_IDEAS_COMMAND_EVIDENCE_QUANT_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_001',
  'medium',
  'As used in the text, the word ''sustained'' most nearly means',
  'continued','lifted','argued','supported physically',
  'A',
  'In context, ''sustained'' means continued over time.',
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
  'The research team observed a sustained increase in bee activity throughout the six-week flowering period.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_002',
  'medium',
  'As used in the text, ''marked'' most nearly means',
  'written on','noticeable','graded','damaged',
  'B',
  'A ''marked improvement'' is a noticeable or significant improvement.',
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
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_WORDS_IN_CONTEXT_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_001',
  'medium',
  'What is the main purpose of the second sentence?',
  'To provide an example that illustrates the first sentence','To contradict the first sentence','To introduce an unrelated topic','To define a scientific term',
  'A',
  'The second sentence gives a concrete example of the general claim in the first.',
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
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_002',
  'medium',
  'The text is primarily structured as',
  'a problem followed by a possible solution','a chronological biography','a comparison of two unrelated inventions','a definition followed by a list of synonyms',
  'A',
  'The first sentence describes a problem; the second presents a design response.',
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
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_TEXT_STRUCTURE_PURPOSE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_001',
  'medium',
  'How would the author of Text 2 most likely respond to the claim in Text 1?',
  'By agreeing that remote work always increases productivity','By arguing that productivity effects depend on the kind of work being done','By claiming that offices should be eliminated','By denying that collaboration matters',
  'B',
  'Text 2 qualifies Text 1 by emphasizing task-specific differences.',
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

Text 2: Studies of remote work suggest that individual tasks may improve with fewer interruptions, while highly collaborative tasks can become more difficult.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_002',
  'medium',
  'The authors of both texts would most likely agree that',
  'electric vehicles have no environmental costs','battery production is the only source of vehicle emissions','the environmental impact of vehicles should be evaluated across multiple stages','gasoline vehicles are always cleaner than electric vehicles',
  'C',
  'Both texts consider impacts beyond a single stage of vehicle use.',
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
  'Text 1: Electric vehicles produce no tailpipe emissions, but manufacturing their batteries requires energy and raw materials.

Text 2: Comparing vehicle emissions requires considering both production and the energy used during years of operation.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_CRAFT_STRUCTURE_CROSS_TEXT_CONNECTIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_001',
  'medium',
  'Which choice most effectively uses the notes to emphasize the study''s duration?',
  'The study examined monarch butterflies.','Researchers tracked monarch butterflies for twelve consecutive years.','Monarch butterflies migrate long distances.','Researchers work at several universities.',
  'B',
  'It directly emphasizes the twelve-year duration.',
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
• Data were collected each year from 2014 through 2025.
• The project included six monitoring sites.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_002',
  'medium',
  'Which choice most effectively uses the notes to compare the two materials?',
  'Material X and Material Y were tested.','Material X is lighter than Material Y but withstands less heat.','Engineers use many materials.','Material Y was tested in a laboratory.',
  'B',
  'It clearly states both dimensions of comparison given in the notes.',
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
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_RHETORICAL_SYNTHESIS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_001',
  'easy',
  'Which choice completes the text with the most logical transition?',
  'However,','Similarly,','Therefore,','For example,',
  'C',
  'The second sentence states a result of the first, so ''Therefore'' is appropriate.',
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
  'The bridge inspection revealed several weakened support bolts. ___, engineers closed one lane until repairs could be completed.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_002',
  'medium',
  'Which choice completes the text with the most logical transition?',
  'In contrast,','For instance,','Consequently,','Likewise,',
  'A',
  'The second sentence contrasts the two species'' activity patterns.',
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
  'Most of the lizards in the study were active during the hottest part of the day. ___, the closely related desert gecko emerged mainly after sunset.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_EXPRESSION_IDEAS_TRANSITIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_001',
  'medium',
  'Which choice completes the text so that it conforms to Standard English conventions?',
  'however the results','however, the results','however; the results','however: the results',
  'B',
  'After a semicolon or period before ''however,'' the conjunctive adverb is followed by a comma; in this sentence the preceding punctuation is already supplied.',
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
  'The first trial produced little change; ___ were different in the second trial.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_002',
  'medium',
  'Which choice completes the sentence correctly?',
  'forest, and','forest and','forest; and','forest: and',
  'B',
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
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_BOUNDARIES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_001',
  'medium',
  'Which choice completes the text so that it conforms to Standard English conventions?',
  'have','has','having','were',
  'B',
  'The subject ''collection'' is singular, so ''has'' agrees with it.',
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
  'The collection of early maps ___ been digitized by the university library.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_002',
  'medium',
  'Which choice completes the text so that it conforms to Standard English conventions?',
  'were','was','be','have been',
  'B',
  'The subject ''Neither the director nor the assistant'' takes the verb agreeing with the nearer singular noun ''assistant'': was.',
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
  'Neither the director nor the assistant ___ available when the delivery arrived.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  1,
  1,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='US_PROGRAM_SAT_RW_STANDARD_ENGLISH_FORM_STRUCTURE_SENSE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_001',
  'easy',
  'A streaming service charges a one-time setup fee of $12 plus $8 per month. If a customer paid $60 total, for how many months did the customer subscribe?',
  '4','5','6','7',
  'C',
  '12 + 8m = 60, so 8m = 48 and m = 6.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_002',
  'medium',
  'If 3(2x - 5) = 4x + 7, what is the value of x?',
  '8','9','10','11',
  'D',
  '6x - 15 = 4x + 7, so 2x = 22 and x = 11.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_1VAR_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_001',
  'medium',
  'The equation y = 4x + 7 represents a line. Which equation represents a line with the same slope and a y-intercept 5 less?',
  'y = 4x + 2','y = 5x + 2','y = 4x + 12','y = -4x + 2',
  'A',
  'Same slope means coefficient 4; 7 - 5 = 2.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_002',
  'medium',
  'A line passes through (2, 5) and (6, 13). What is its slope?',
  '1','2','3','4',
  'B',
  'Slope = (13-5)/(6-2)=8/4=2.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_EQ_2VAR_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_001',
  'medium',
  'For the function f(x)=18-3x, what does the value -3 represent in a context where f(x) is the amount of fuel remaining after x hours?',
  'The initial amount of fuel','The fuel used each hour','The number of hours until empty','The maximum fuel capacity',
  'B',
  'The coefficient of x is the rate of change: fuel decreases by 3 units per hour.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_002',
  'medium',
  'A linear function g satisfies g(2)=9 and g(5)=18. What is g(0)?',
  '1','2','3','4',
  'C',
  'Slope=(18-9)/(5-2)=3. Thus g(x)=3x+3, so g(0)=3.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_FUNCTIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_001',
  'medium',
  'At a school event, adult tickets cost $8 and student tickets cost $5. A total of 40 tickets were sold for $260. How many adult tickets were sold?',
  '15','20','25','30',
  'B',
  'a+s=40 and 8a+5s=260. Substitution gives 3a=60, so a=20.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_002',
  'medium',
  'What is the solution to the system y=2x+1 and y=-x+10?',
  '(2,5)','(3,7)','(4,9)','(5,11)',
  'B',
  'Set expressions equal: 2x+1=-x+10, so 3x=9, x=3 and y=7.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_SYSTEMS_LINEAR_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_001',
  'medium',
  'A gym charges $25 to join and $15 per month. Which inequality represents the number of months m a person can remain a member if the total cost must be at most $100?',
  '25+15m<100','25+15m≤100','15+25m≤100','25m+15≥100',
  'B',
  '''At most'' means less than or equal to.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_002',
  'medium',
  'Which value of x satisfies 4x - 7 > 17?',
  '5','6','7','4',
  'C',
  '4x>24, so x>6; among the choices, 7 satisfies the inequality.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ALGEBRA_LINEAR_INEQUALITIES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_001',
  'medium',
  'Which expression is equivalent to x² - 9?',
  '(x-9)(x+1)','(x-3)(x+3)','(x-3)²','x(x-9)',
  'B',
  'x²-9 is a difference of squares: (x-3)(x+3).',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_002',
  'medium',
  'Which expression is equivalent to (2x²+6x)/2x for x≠0?',
  'x+3','2x+3','x+6','2x+6',
  'A',
  'Factor 2x(x+3) and divide by 2x.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_EQUIVALENT_EXPRESSIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_001',
  'medium',
  'What are the solutions to x² - 5x + 6 = 0?',
  '1 and 6','2 and 3','-2 and -3','3 and 6',
  'B',
  'Factor as (x-2)(x-3)=0.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_002',
  'medium',
  'The equations y=x² and y=4x intersect at x=0 and at what other x-value?',
  '2','3','4','8',
  'C',
  'Set x²=4x: x(x-4)=0, so x=0 or 4.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_EQUATIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_001',
  'medium',
  'For h(x)=2(3)^x, what is h(2)?',
  '12','18','24','36',
  'B',
  'h(2)=2×3²=18.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_002',
  'medium',
  'A bacteria culture doubles every 3 hours. If it begins with 200 bacteria, which expression gives the population after t hours?',
  '200(2)^(t/3)','200(3)^(t/2)','400t/3','200+2t',
  'A',
  'Each 3-hour interval multiplies the population by 2.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_ADVANCED_MATH_NONLINEAR_FUNCTIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_001',
  'easy',
  'A car travels 180 miles in 3 hours at a constant rate. What is its speed in miles per hour?',
  '45','50','60','90',
  'C',
  '180/3=60 miles per hour.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_002',
  'medium',
  'A recipe uses flour and sugar in a ratio of 5:2. If 15 cups of flour are used, how many cups of sugar are needed?',
  '4','5','6','7',
  'C',
  '15 is 3 times 5, so sugar is 3×2=6.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_RATIOS_RATES_UNITS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_001',
  'easy',
  'A $80 jacket is discounted by 25%. What is the sale price?',
  '$55','$60','$65','$70',
  'B',
  '25% of 80 is 20, so sale price is 60.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_002',
  'medium',
  'A population increases from 1,200 to 1,500. What is the percent increase?',
  '20%','25%','30%','35%',
  'B',
  'Increase=300; 300/1200=0.25=25%.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PERCENTAGES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_001',
  'medium',
  'For the data set 4, 6, 6, 8, 11, what is the median?',
  '6','7','8','11',
  'A',
  'The middle value of the ordered set is 6.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_002',
  'medium',
  'Which measure is most affected by a single extremely large outlier?',
  'Mean','Median','Mode','Interquartile range',
  'A',
  'The mean uses every value directly and is sensitive to extreme observations.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_ONE_VARIABLE_DATA_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_001',
  'medium',
  'A scatterplot shows points closely clustered around an upward-sloping line. Which description is most appropriate?',
  'Strong positive association','Strong negative association','No association','Perfect nonlinear association',
  'A',
  'An upward trend with tight clustering indicates a strong positive association.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_002',
  'medium',
  'A line of best fit for a data set is y=2.5x+10. According to the model, what is the predicted y-value when x=8?',
  '20','25','30','35',
  'C',
  '2.5(8)+10=30.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_TWO_VARIABLE_DATA_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_001',
  'medium',
  'A bag contains 3 red, 5 blue, and 2 green marbles. One marble is chosen at random. What is the probability it is blue?',
  '1/5','1/3','1/2','2/3',
  'C',
  'There are 10 marbles total and 5 are blue, so probability=5/10=1/2.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_002',
  'medium',
  'If P(A)=0.4, P(B)=0.5, and A and B are independent, what is P(A and B)?',
  '0.2','0.4','0.5','0.9',
  'A',
  'For independent events, multiply: 0.4×0.5=0.2.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_PROBABILITY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_001',
  'medium',
  'A poll estimates that 52% of voters support a proposal, with a margin of error of ±3 percentage points. Which interval is consistent with the estimate?',
  '46% to 52%','49% to 55%','52% to 58%','55% to 61%',
  'B',
  '52±3 gives 49% to 55%.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_002',
  'medium',
  'All else equal, increasing a random sample size generally has what effect on the margin of error?',
  'It increases it','It decreases it','It makes it exactly zero','It has no effect',
  'B',
  'Larger random samples generally reduce sampling variability and margin of error.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_INFERENCE_MARGIN_ERROR_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_001',
  'medium',
  'Researchers randomly assign volunteers to either a treatment group or a control group. This design most directly supports conclusions about',
  'causation','population size','historical trends','survey nonresponse',
  'A',
  'Random assignment helps isolate the effect of the treatment, supporting causal conclusions.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_002',
  'medium',
  'A school surveys only students who attend an optional after-school club about homework habits. What is the main concern?',
  'The sample may not represent all students','The survey uses too many students','Random assignment was used','The margin of error must be zero',
  'A',
  'Club participants may differ systematically from the full student population.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_PROBLEM_SOLVING_DATA_STATISTICAL_CLAIMS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_001',
  'easy',
  'A rectangular room is 12 feet long and 9 feet wide. What is its area?',
  '21','42','96','108',
  'D',
  'Area=12×9=108 square feet.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_002',
  'medium',
  'A cylinder has radius 3 and height 5. What is its volume?',
  '15π','30π','45π','90π',
  'C',
  'V=πr²h=π(9)(5)=45π.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_AREA_VOLUME_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_001',
  'medium',
  'Two parallel lines are cut by a transversal. If one acute angle measures 62°, what is the measure of an adjacent obtuse angle?',
  '28°','62°','118°','128°',
  'C',
  'Adjacent supplementary angles sum to 180°, so 180-62=118°.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_002',
  'medium',
  'The angles of a triangle are in the ratio 2:3:4. What is the measure of the largest angle?',
  '60°','70°','80°','90°',
  'C',
  'Nine ratio parts total 180°, so each part is 20°; largest=4×20=80°.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_LINES_ANGLES_TRIANGLES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_001',
  'medium',
  'A right triangle has legs 6 and 8. What is the length of the hypotenuse?',
  '10','12','14','15',
  'A',
  'By the Pythagorean theorem, sqrt(36+64)=10.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_002',
  'medium',
  'In a right triangle, sin θ = 3/5. If the hypotenuse is 20, what is the length of the side opposite θ?',
  '8','10','12','15',
  'C',
  'Opposite/hypotenuse=3/5, so opposite=(3/5)(20)=12.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_RIGHT_TRIANGLES_TRIG_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_001',
  'medium',
  'A circle has radius 7. What is its circumference?',
  '7π','14π','28π','49π',
  'B',
  'Circumference=2πr=14π.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_002',
  'medium',
  'A circle has equation (x-2)²+(y+3)²=25. What is its radius?',
  '2','3','5','25',
  'C',
  'The radius squared is 25, so the radius is 5.',
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
WHERE q.question_key='US_PROGRAM_SAT_MATH_GEOMETRY_TRIG_CIRCLES_002';
