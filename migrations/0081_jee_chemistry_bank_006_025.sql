-- GYAN IIT-JEE bank expansion - CHEMISTRY
-- 0081_jee_chemistry_bank_006_025.sql
-- Adds questions 006..025 for each topic.
-- Fixed Mock/Mini mappings are NOT changed.
PRAGMA foreign_keys = ON;

-- BASIC_CONCEPTS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_006', 'medium', 'One mole contains approximately:',
'3.011×10^23', '6.022×10^23 entities', '1.602×10^-19', '9.8×10^23',
'B', 'Avogadro constant is about 6.022×10^23 mol^-1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_007', 'medium', 'Quick check — One mole contains approximately:',
'1.602×10^-19', '3.011×10^23', '6.022×10^23 entities', '9.8×10^23',
'C', 'Avogadro constant is about 6.022×10^23 mol^-1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_008', 'medium', 'JEE concept check — One mole contains approximately:',
'9.8×10^23', '1.602×10^-19', '6.022×10^23 entities', '3.011×10^23',
'C', 'Avogadro constant is about 6.022×10^23 mol^-1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_009', 'medium', 'Choose the best answer — One mole contains approximately:',
'1.602×10^-19', '9.8×10^23', '6.022×10^23 entities', '3.011×10^23',
'C', 'Avogadro constant is about 6.022×10^23 mol^-1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_010', 'medium', 'Moles are calculated from mass divided by:',
'density', 'molar mass', 'temperature', 'pressure',
'B', 'n=m/M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_011', 'medium', 'Quick check — Moles are calculated from mass divided by:',
'density', 'pressure', 'molar mass', 'temperature',
'C', 'n=m/M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_012', 'medium', 'JEE concept check — Moles are calculated from mass divided by:',
'density', 'molar mass', 'pressure', 'temperature',
'B', 'n=m/M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_013', 'medium', 'Choose the best answer — Moles are calculated from mass divided by:',
'pressure', 'temperature', 'molar mass', 'density',
'C', 'n=m/M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_014', 'medium', 'Molar mass of H2O is approximately:',
'36 g/mol', '18 g/mol', '16 g/mol', '20 g/mol',
'B', '2(1)+16=18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_015', 'medium', 'Quick check — Molar mass of H2O is approximately:',
'20 g/mol', '18 g/mol', '16 g/mol', '36 g/mol',
'B', '2(1)+16=18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_016', 'medium', 'JEE concept check — Molar mass of H2O is approximately:',
'16 g/mol', '36 g/mol', '20 g/mol', '18 g/mol',
'D', '2(1)+16=18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_017', 'medium', 'Choose the best answer — Molar mass of H2O is approximately:',
'18 g/mol', '36 g/mol', '20 g/mol', '16 g/mol',
'A', '2(1)+16=18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_018', 'challenge', 'Empirical formula gives the:',
'isotope abundance', 'simplest whole-number atom ratio', 'exact molecular mass always', 'electron configuration',
'B', 'It is the simplest stoichiometric ratio.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_019', 'challenge', 'Quick check — Empirical formula gives the:',
'simplest whole-number atom ratio', 'electron configuration', 'exact molecular mass always', 'isotope abundance',
'A', 'It is the simplest stoichiometric ratio.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_020', 'challenge', 'JEE concept check — Empirical formula gives the:',
'electron configuration', 'exact molecular mass always', 'isotope abundance', 'simplest whole-number atom ratio',
'D', 'It is the simplest stoichiometric ratio.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_021', 'challenge', 'Choose the best answer — Empirical formula gives the:',
'isotope abundance', 'electron configuration', 'simplest whole-number atom ratio', 'exact molecular mass always',
'C', 'It is the simplest stoichiometric ratio.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_022', 'challenge', 'A limiting reagent is consumed:',
'first', 'only after products', 'last', 'never',
'A', 'It limits the maximum product amount.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_023', 'challenge', 'Quick check — A limiting reagent is consumed:',
'only after products', 'last', 'never', 'first',
'D', 'It limits the maximum product amount.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_024', 'challenge', 'JEE concept check — A limiting reagent is consumed:',
'first', 'last', 'only after products', 'never',
'A', 'It limits the maximum product amount.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_025', 'challenge', 'Choose the best answer — A limiting reagent is consumed:',
'never', 'last', 'only after products', 'first',
'D', 'It limits the maximum product amount.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BASIC_CONCEPTS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_025';

-- STATES_OF_MATTER
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_006', 'medium', 'Ideal gas equation is:',
'P/V=nRT', 'P=nVRT', 'PV=nRT', 'PV=RT/n',
'C', 'The ideal-gas law is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_007', 'medium', 'Quick check — Ideal gas equation is:',
'PV=RT/n', 'P/V=nRT', 'P=nVRT', 'PV=nRT',
'D', 'The ideal-gas law is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_008', 'medium', 'JEE concept check — Ideal gas equation is:',
'P=nVRT', 'PV=RT/n', 'P/V=nRT', 'PV=nRT',
'D', 'The ideal-gas law is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_009', 'medium', 'Choose the best answer — Ideal gas equation is:',
'P=nVRT', 'PV=nRT', 'PV=RT/n', 'P/V=nRT',
'B', 'The ideal-gas law is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_010', 'medium', 'Boyle''s law at constant temperature gives P proportional to:',
'1/V', 'n²', 'V', 'T',
'A', 'PV=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_011', 'medium', 'Quick check — Boyle''s law at constant temperature gives P proportional to:',
'V', 'T', 'n²', '1/V',
'D', 'PV=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_012', 'medium', 'JEE concept check — Boyle''s law at constant temperature gives P proportional to:',
'1/V', 'n²', 'V', 'T',
'A', 'PV=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_013', 'medium', 'Choose the best answer — Boyle''s law at constant temperature gives P proportional to:',
'n²', 'V', 'T', '1/V',
'D', 'PV=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_014', 'medium', 'Charles''s law at constant pressure gives V proportional to:',
'T in kelvin', 'P', '1/T', 'molar mass',
'A', 'V/T=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_015', 'medium', 'Quick check — Charles''s law at constant pressure gives V proportional to:',
'1/T', 'T in kelvin', 'molar mass', 'P',
'B', 'V/T=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_016', 'medium', 'JEE concept check — Charles''s law at constant pressure gives V proportional to:',
'1/T', 'molar mass', 'P', 'T in kelvin',
'D', 'V/T=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_017', 'medium', 'Choose the best answer — Charles''s law at constant pressure gives V proportional to:',
'P', 'molar mass', '1/T', 'T in kelvin',
'D', 'V/T=constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_018', 'challenge', 'Real gases approach ideal behavior at:',
'high pressure only', 'low pressure and high temperature', 'low temperature only', 'high pressure and low temperature',
'B', 'Low density reduces intermolecular effects.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_019', 'challenge', 'Quick check — Real gases approach ideal behavior at:',
'high pressure and low temperature', 'low pressure and high temperature', 'low temperature only', 'high pressure only',
'B', 'Low density reduces intermolecular effects.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_020', 'challenge', 'JEE concept check — Real gases approach ideal behavior at:',
'high pressure and low temperature', 'low temperature only', 'high pressure only', 'low pressure and high temperature',
'D', 'Low density reduces intermolecular effects.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_021', 'challenge', 'Choose the best answer — Real gases approach ideal behavior at:',
'low temperature only', 'high pressure only', 'high pressure and low temperature', 'low pressure and high temperature',
'D', 'Low density reduces intermolecular effects.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_022', 'challenge', 'RMS molecular speed increases when temperature:',
'increases', 'decreases', 'is unchanged in all cases', 'becomes 0°C',
'A', 'v_rms∝sqrt(T).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_023', 'challenge', 'Quick check — RMS molecular speed increases when temperature:',
'decreases', 'becomes 0°C', 'increases', 'is unchanged in all cases',
'C', 'v_rms∝sqrt(T).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_024', 'challenge', 'JEE concept check — RMS molecular speed increases when temperature:',
'is unchanged in all cases', 'becomes 0°C', 'decreases', 'increases',
'D', 'v_rms∝sqrt(T).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_025', 'challenge', 'Choose the best answer — RMS molecular speed increases when temperature:',
'becomes 0°C', 'decreases', 'increases', 'is unchanged in all cases',
'C', 'v_rms∝sqrt(T).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='STATES_OF_MATTER' AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATES_OF_MATTER_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_025';

-- ATOMIC_STRUCTURE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_006', 'medium', 'Maximum electrons in shell n is:',
'n²', '2n', 'n+2', '2n²',
'D', 'Shell capacity is 2n².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_007', 'medium', 'Quick check — Maximum electrons in shell n is:',
'n+2', '2n²', '2n', 'n²',
'B', 'Shell capacity is 2n².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_008', 'medium', 'JEE concept check — Maximum electrons in shell n is:',
'n+2', '2n²', '2n', 'n²',
'B', 'Shell capacity is 2n².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_009', 'medium', 'Choose the best answer — Maximum electrons in shell n is:',
'2n²', 'n+2', 'n²', '2n',
'A', 'Shell capacity is 2n².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_010', 'medium', 'A p subshell contains orbitals:',
'7', '5', '3', '1',
'C', 'm_l=-1,0,+1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_011', 'medium', 'Quick check — A p subshell contains orbitals:',
'7', '1', '5', '3',
'D', 'm_l=-1,0,+1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_012', 'medium', 'JEE concept check — A p subshell contains orbitals:',
'3', '5', '1', '7',
'A', 'm_l=-1,0,+1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_013', 'medium', 'Choose the best answer — A p subshell contains orbitals:',
'5', '3', '7', '1',
'B', 'm_l=-1,0,+1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_014', 'medium', 'A d subshell contains orbitals:',
'2', '3', '5', '7',
'C', 'd has five orbitals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_015', 'medium', 'Quick check — A d subshell contains orbitals:',
'7', '5', '2', '3',
'B', 'd has five orbitals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_016', 'medium', 'JEE concept check — A d subshell contains orbitals:',
'7', '2', '5', '3',
'C', 'd has five orbitals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_017', 'medium', 'Choose the best answer — A d subshell contains orbitals:',
'2', '3', '7', '5',
'D', 'd has five orbitals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_018', 'challenge', 'Electron spin quantum number can be:',
'any integer', '+1 only', '+1/2 or -1/2', '0 only',
'C', 'Electron spin projections are ±1/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_019', 'challenge', 'Quick check — Electron spin quantum number can be:',
'0 only', '+1 only', 'any integer', '+1/2 or -1/2',
'D', 'Electron spin projections are ±1/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_020', 'challenge', 'JEE concept check — Electron spin quantum number can be:',
'+1/2 or -1/2', 'any integer', '0 only', '+1 only',
'A', 'Electron spin projections are ±1/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_021', 'challenge', 'Choose the best answer — Electron spin quantum number can be:',
'+1/2 or -1/2', '0 only', 'any integer', '+1 only',
'A', 'Electron spin projections are ±1/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_022', 'challenge', 'de Broglie wavelength varies inversely with:',
'atomic number', 'charge', 'temperature only', 'momentum',
'D', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_023', 'challenge', 'Quick check — de Broglie wavelength varies inversely with:',
'temperature only', 'momentum', 'atomic number', 'charge',
'B', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_024', 'challenge', 'JEE concept check — de Broglie wavelength varies inversely with:',
'atomic number', 'charge', 'temperature only', 'momentum',
'D', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_025', 'challenge', 'Choose the best answer — de Broglie wavelength varies inversely with:',
'momentum', 'atomic number', 'charge', 'temperature only',
'A', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ATOMIC_STRUCTURE' AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMIC_STRUCTURE_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_025';

-- CHEMICAL_BONDING
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_006', 'medium', 'CH4 molecular geometry is:',
'linear', 'tetrahedral', 'square planar', 'bent',
'B', 'Four electron pairs give tetrahedral geometry.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_007', 'medium', 'Quick check — CH4 molecular geometry is:',
'tetrahedral', 'square planar', 'linear', 'bent',
'A', 'Four electron pairs give tetrahedral geometry.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_008', 'medium', 'JEE concept check — CH4 molecular geometry is:',
'square planar', 'tetrahedral', 'linear', 'bent',
'B', 'Four electron pairs give tetrahedral geometry.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_009', 'medium', 'Choose the best answer — CH4 molecular geometry is:',
'linear', 'bent', 'tetrahedral', 'square planar',
'C', 'Four electron pairs give tetrahedral geometry.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_010', 'medium', 'NH3 molecular geometry is:',
'linear', 'trigonal pyramidal', 'trigonal planar', 'square planar',
'B', 'One lone pair changes tetrahedral electron geometry to pyramidal molecule.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_011', 'medium', 'Quick check — NH3 molecular geometry is:',
'trigonal pyramidal', 'square planar', 'linear', 'trigonal planar',
'A', 'One lone pair changes tetrahedral electron geometry to pyramidal molecule.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_012', 'medium', 'JEE concept check — NH3 molecular geometry is:',
'trigonal planar', 'square planar', 'trigonal pyramidal', 'linear',
'C', 'One lone pair changes tetrahedral electron geometry to pyramidal molecule.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_013', 'medium', 'Choose the best answer — NH3 molecular geometry is:',
'trigonal pyramidal', 'square planar', 'linear', 'trigonal planar',
'A', 'One lone pair changes tetrahedral electron geometry to pyramidal molecule.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_014', 'medium', 'CO2 molecular geometry is:',
'pyramidal', 'bent', 'tetrahedral', 'linear',
'D', 'Two electron domains around carbon are 180° apart.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_015', 'medium', 'Quick check — CO2 molecular geometry is:',
'pyramidal', 'tetrahedral', 'bent', 'linear',
'D', 'Two electron domains around carbon are 180° apart.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_016', 'medium', 'JEE concept check — CO2 molecular geometry is:',
'pyramidal', 'bent', 'linear', 'tetrahedral',
'C', 'Two electron domains around carbon are 180° apart.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_017', 'medium', 'Choose the best answer — CO2 molecular geometry is:',
'bent', 'pyramidal', 'linear', 'tetrahedral',
'C', 'Two electron domains around carbon are 180° apart.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_018', 'challenge', 'Hybridization of carbon in ethene is:',
'dsp2', 'sp3', 'sp2', 'sp',
'C', 'Each carbon has three sigma domains.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_019', 'challenge', 'Quick check — Hybridization of carbon in ethene is:',
'sp3', 'sp', 'sp2', 'dsp2',
'C', 'Each carbon has three sigma domains.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_020', 'challenge', 'JEE concept check — Hybridization of carbon in ethene is:',
'sp3', 'dsp2', 'sp', 'sp2',
'D', 'Each carbon has three sigma domains.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_021', 'challenge', 'Choose the best answer — Hybridization of carbon in ethene is:',
'sp', 'sp2', 'sp3', 'dsp2',
'B', 'Each carbon has three sigma domains.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_022', 'challenge', 'A pi bond forms by:',
'head-on overlap', 'metallic bonding', 'electron transfer only', 'sidewise orbital overlap',
'D', 'Lateral overlap produces π bonding.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_023', 'challenge', 'Quick check — A pi bond forms by:',
'head-on overlap', 'sidewise orbital overlap', 'metallic bonding', 'electron transfer only',
'B', 'Lateral overlap produces π bonding.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_024', 'challenge', 'JEE concept check — A pi bond forms by:',
'head-on overlap', 'sidewise orbital overlap', 'metallic bonding', 'electron transfer only',
'B', 'Lateral overlap produces π bonding.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_025', 'challenge', 'Choose the best answer — A pi bond forms by:',
'head-on overlap', 'metallic bonding', 'electron transfer only', 'sidewise orbital overlap',
'D', 'Lateral overlap produces π bonding.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_BONDING' AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_BONDING_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_025';

-- CHEMICAL_THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_006', 'medium', 'For an exothermic reaction, ΔH is usually:',
'undefined', 'negative', 'zero always', 'positive',
'B', 'Heat is released.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_007', 'medium', 'Quick check — For an exothermic reaction, ΔH is usually:',
'zero always', 'negative', 'undefined', 'positive',
'B', 'Heat is released.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_008', 'medium', 'JEE concept check — For an exothermic reaction, ΔH is usually:',
'positive', 'zero always', 'negative', 'undefined',
'C', 'Heat is released.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_009', 'medium', 'Choose the best answer — For an exothermic reaction, ΔH is usually:',
'negative', 'zero always', 'undefined', 'positive',
'A', 'Heat is released.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_010', 'medium', 'At constant T and P, spontaneous change is favored by ΔG:',
'negative', 'always zero', 'positive', 'equal to pressure',
'A', 'Spontaneous processes have ΔG<0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_011', 'medium', 'Quick check — At constant T and P, spontaneous change is favored by ΔG:',
'positive', 'negative', 'always zero', 'equal to pressure',
'B', 'Spontaneous processes have ΔG<0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_012', 'medium', 'JEE concept check — At constant T and P, spontaneous change is favored by ΔG:',
'negative', 'always zero', 'equal to pressure', 'positive',
'A', 'Spontaneous processes have ΔG<0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_013', 'medium', 'Choose the best answer — At constant T and P, spontaneous change is favored by ΔG:',
'equal to pressure', 'positive', 'always zero', 'negative',
'D', 'Spontaneous processes have ΔG<0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_014', 'medium', 'Hess''s law is valid because enthalpy is a:',
'rate constant', 'path function', 'state function', 'vector',
'C', 'ΔH depends only on initial/final states.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_015', 'medium', 'Quick check — Hess''s law is valid because enthalpy is a:',
'state function', 'vector', 'rate constant', 'path function',
'A', 'ΔH depends only on initial/final states.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_016', 'medium', 'JEE concept check — Hess''s law is valid because enthalpy is a:',
'rate constant', 'state function', 'path function', 'vector',
'B', 'ΔH depends only on initial/final states.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_017', 'medium', 'Choose the best answer — Hess''s law is valid because enthalpy is a:',
'rate constant', 'vector', 'path function', 'state function',
'D', 'ΔH depends only on initial/final states.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_018', 'challenge', 'For an ideal gas isothermal process, ΔU is:',
'equal to Q always', 'negative always', 'zero', 'positive always',
'C', 'Ideal-gas U depends only on T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_019', 'challenge', 'Quick check — For an ideal gas isothermal process, ΔU is:',
'negative always', 'equal to Q always', 'positive always', 'zero',
'D', 'Ideal-gas U depends only on T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_020', 'challenge', 'JEE concept check — For an ideal gas isothermal process, ΔU is:',
'negative always', 'zero', 'equal to Q always', 'positive always',
'B', 'Ideal-gas U depends only on T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_021', 'challenge', 'Choose the best answer — For an ideal gas isothermal process, ΔU is:',
'equal to Q always', 'positive always', 'negative always', 'zero',
'D', 'Ideal-gas U depends only on T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_022', 'challenge', 'First law relates internal-energy change to heat and:',
'charge', 'molar mass', 'work', 'atomic number',
'C', 'Energy transfer occurs as heat and work.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_023', 'challenge', 'Quick check — First law relates internal-energy change to heat and:',
'work', 'charge', 'atomic number', 'molar mass',
'A', 'Energy transfer occurs as heat and work.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_024', 'challenge', 'JEE concept check — First law relates internal-energy change to heat and:',
'atomic number', 'molar mass', 'charge', 'work',
'D', 'Energy transfer occurs as heat and work.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_025', 'challenge', 'Choose the best answer — First law relates internal-energy change to heat and:',
'charge', 'atomic number', 'work', 'molar mass',
'C', 'Energy transfer occurs as heat and work.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_THERMODYNAMICS' AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_THERMODYNAMICS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_025';

-- EQUILIBRIUM
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_006', 'medium', 'At dynamic equilibrium, forward and reverse rates are:',
'forward greater', 'zero', 'reverse greater', 'equal',
'D', 'Opposing rates are equal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_007', 'medium', 'Quick check — At dynamic equilibrium, forward and reverse rates are:',
'forward greater', 'zero', 'equal', 'reverse greater',
'C', 'Opposing rates are equal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_008', 'medium', 'JEE concept check — At dynamic equilibrium, forward and reverse rates are:',
'equal', 'reverse greater', 'forward greater', 'zero',
'A', 'Opposing rates are equal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_009', 'medium', 'Choose the best answer — At dynamic equilibrium, forward and reverse rates are:',
'forward greater', 'zero', 'reverse greater', 'equal',
'D', 'Opposing rates are equal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_010', 'medium', 'A catalyst changes equilibrium constant at fixed T:',
'no', 'yes, decreases it', 'only for gases', 'yes, increases it',
'A', 'It changes rates, not K.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_011', 'medium', 'Quick check — A catalyst changes equilibrium constant at fixed T:',
'yes, increases it', 'no', 'yes, decreases it', 'only for gases',
'B', 'It changes rates, not K.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_012', 'medium', 'JEE concept check — A catalyst changes equilibrium constant at fixed T:',
'yes, decreases it', 'no', 'yes, increases it', 'only for gases',
'B', 'It changes rates, not K.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_013', 'medium', 'Choose the best answer — A catalyst changes equilibrium constant at fixed T:',
'yes, increases it', 'no', 'only for gases', 'yes, decreases it',
'B', 'It changes rates, not K.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_014', 'medium', 'At 25°C neutral water has pH about:',
'1', '14', '7', '0',
'C', '[H+]=10^-7 M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_015', 'medium', 'Quick check — At 25°C neutral water has pH about:',
'14', '1', '0', '7',
'D', '[H+]=10^-7 M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_016', 'medium', 'JEE concept check — At 25°C neutral water has pH about:',
'14', '7', '1', '0',
'B', '[H+]=10^-7 M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_017', 'medium', 'Choose the best answer — At 25°C neutral water has pH about:',
'1', '0', '7', '14',
'C', '[H+]=10^-7 M.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_018', 'challenge', 'A buffer primarily resists change in:',
'mass', 'pH', 'atomic number', 'volume',
'B', 'Buffers neutralize small added acid/base.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_019', 'challenge', 'Quick check — A buffer primarily resists change in:',
'atomic number', 'volume', 'mass', 'pH',
'D', 'Buffers neutralize small added acid/base.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_020', 'challenge', 'JEE concept check — A buffer primarily resists change in:',
'atomic number', 'mass', 'volume', 'pH',
'D', 'Buffers neutralize small added acid/base.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_021', 'challenge', 'Choose the best answer — A buffer primarily resists change in:',
'atomic number', 'pH', 'volume', 'mass',
'B', 'Buffers neutralize small added acid/base.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_022', 'challenge', 'For [H+]=10^-3 M, pH is:',
'11', '3', '0.001', '7',
'B', 'pH=-log[H+].', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_023', 'challenge', 'Quick check — For [H+]=10^-3 M, pH is:',
'11', '7', '0.001', '3',
'D', 'pH=-log[H+].', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_024', 'challenge', 'JEE concept check — For [H+]=10^-3 M, pH is:',
'11', '3', '0.001', '7',
'B', 'pH=-log[H+].', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_025', 'challenge', 'Choose the best answer — For [H+]=10^-3 M, pH is:',
'7', '0.001', '3', '11',
'C', 'pH=-log[H+].', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EQUILIBRIUM_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_025';

-- REDOX_ELECTROCHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_006', 'medium', 'Oxidation is:',
'loss of mass', 'gain of neutrons', 'loss of electrons', 'gain of electrons',
'C', 'OIL: oxidation is loss.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_007', 'medium', 'Quick check — Oxidation is:',
'loss of electrons', 'gain of neutrons', 'loss of mass', 'gain of electrons',
'A', 'OIL: oxidation is loss.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_008', 'medium', 'JEE concept check — Oxidation is:',
'loss of mass', 'loss of electrons', 'gain of neutrons', 'gain of electrons',
'B', 'OIL: oxidation is loss.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_009', 'medium', 'Choose the best answer — Oxidation is:',
'gain of electrons', 'loss of electrons', 'gain of neutrons', 'loss of mass',
'B', 'OIL: oxidation is loss.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_010', 'medium', 'Reduction is:',
'loss of electrons', 'gain of electrons', 'gain of protons only', 'loss of neutrons',
'B', 'RIG: reduction is gain.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_011', 'medium', 'Quick check — Reduction is:',
'gain of protons only', 'loss of electrons', 'loss of neutrons', 'gain of electrons',
'D', 'RIG: reduction is gain.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_012', 'medium', 'JEE concept check — Reduction is:',
'loss of neutrons', 'gain of protons only', 'gain of electrons', 'loss of electrons',
'C', 'RIG: reduction is gain.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_013', 'medium', 'Choose the best answer — Reduction is:',
'loss of neutrons', 'gain of protons only', 'loss of electrons', 'gain of electrons',
'D', 'RIG: reduction is gain.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_014', 'medium', 'In a galvanic cell, oxidation occurs at:',
'anode', 'salt bridge', 'voltmeter', 'cathode',
'A', 'AnOx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_015', 'medium', 'Quick check — In a galvanic cell, oxidation occurs at:',
'voltmeter', 'anode', 'salt bridge', 'cathode',
'B', 'AnOx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_016', 'medium', 'JEE concept check — In a galvanic cell, oxidation occurs at:',
'anode', 'salt bridge', 'voltmeter', 'cathode',
'A', 'AnOx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_017', 'medium', 'Choose the best answer — In a galvanic cell, oxidation occurs at:',
'cathode', 'voltmeter', 'anode', 'salt bridge',
'C', 'AnOx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_018', 'challenge', 'In a galvanic cell, reduction occurs at:',
'anode', 'cathode', 'wire only', 'salt bridge',
'B', 'RedCat.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_019', 'challenge', 'Quick check — In a galvanic cell, reduction occurs at:',
'salt bridge', 'anode', 'wire only', 'cathode',
'D', 'RedCat.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_020', 'challenge', 'JEE concept check — In a galvanic cell, reduction occurs at:',
'anode', 'salt bridge', 'cathode', 'wire only',
'C', 'RedCat.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_021', 'challenge', 'Choose the best answer — In a galvanic cell, reduction occurs at:',
'salt bridge', 'anode', 'wire only', 'cathode',
'D', 'RedCat.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_022', 'challenge', 'Standard cell potential is E°cathode minus:',
'temperature', 'E°anode', 'E°cathode', 'Faraday constant',
'B', 'E°cell=E°cat-E°an.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_023', 'challenge', 'Quick check — Standard cell potential is E°cathode minus:',
'E°anode', 'temperature', 'E°cathode', 'Faraday constant',
'A', 'E°cell=E°cat-E°an.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_024', 'challenge', 'JEE concept check — Standard cell potential is E°cathode minus:',
'E°cathode', 'E°anode', 'temperature', 'Faraday constant',
'B', 'E°cell=E°cat-E°an.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_025', 'challenge', 'Choose the best answer — Standard cell potential is E°cathode minus:',
'temperature', 'Faraday constant', 'E°anode', 'E°cathode',
'C', 'E°cell=E°cat-E°an.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='REDOX_ELECTROCHEMISTRY' AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'REDOX_ELECTROCHEMISTRY_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_025';

-- CHEMICAL_KINETICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_006', 'medium', 'A catalyst generally lowers:',
'equilibrium constant', 'activation energy', 'molar mass', 'enthalpy change',
'B', 'It provides a lower-Ea pathway.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_007', 'medium', 'Quick check — A catalyst generally lowers:',
'equilibrium constant', 'molar mass', 'activation energy', 'enthalpy change',
'C', 'It provides a lower-Ea pathway.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_008', 'medium', 'JEE concept check — A catalyst generally lowers:',
'enthalpy change', 'activation energy', 'molar mass', 'equilibrium constant',
'B', 'It provides a lower-Ea pathway.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_009', 'medium', 'Choose the best answer — A catalyst generally lowers:',
'enthalpy change', 'activation energy', 'equilibrium constant', 'molar mass',
'B', 'It provides a lower-Ea pathway.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_010', 'medium', 'Unit of a first-order rate constant is:',
'L mol^-1 s^-1', 's', 'mol L^-1 s^-1', 's^-1',
'D', 'First-order k has inverse-time units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_011', 'medium', 'Quick check — Unit of a first-order rate constant is:',
's', 'mol L^-1 s^-1', 'L mol^-1 s^-1', 's^-1',
'D', 'First-order k has inverse-time units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_012', 'medium', 'JEE concept check — Unit of a first-order rate constant is:',
'L mol^-1 s^-1', 'mol L^-1 s^-1', 's', 's^-1',
'D', 'First-order k has inverse-time units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_013', 'medium', 'Choose the best answer — Unit of a first-order rate constant is:',
's^-1', 'mol L^-1 s^-1', 'L mol^-1 s^-1', 's',
'A', 'First-order k has inverse-time units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_014', 'medium', 'First-order half-life is:',
'zero', 'proportional to initial concentration', 'independent of initial concentration', 'always 1 s',
'C', 't1/2=ln2/k.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_015', 'medium', 'Quick check — First-order half-life is:',
'independent of initial concentration', 'zero', 'proportional to initial concentration', 'always 1 s',
'A', 't1/2=ln2/k.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_016', 'medium', 'JEE concept check — First-order half-life is:',
'always 1 s', 'proportional to initial concentration', 'independent of initial concentration', 'zero',
'C', 't1/2=ln2/k.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_017', 'medium', 'Choose the best answer — First-order half-life is:',
'always 1 s', 'independent of initial concentration', 'zero', 'proportional to initial concentration',
'B', 't1/2=ln2/k.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_018', 'challenge', 'Reaction order is determined:',
'from color', 'from atomic number', 'experimentally', 'only from balanced coefficients',
'C', 'Rate-law exponents are experimental.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_019', 'challenge', 'Quick check — Reaction order is determined:',
'from atomic number', 'from color', 'only from balanced coefficients', 'experimentally',
'D', 'Rate-law exponents are experimental.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_020', 'challenge', 'JEE concept check — Reaction order is determined:',
'from atomic number', 'only from balanced coefficients', 'experimentally', 'from color',
'C', 'Rate-law exponents are experimental.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_021', 'challenge', 'Choose the best answer — Reaction order is determined:',
'from color', 'experimentally', 'only from balanced coefficients', 'from atomic number',
'B', 'Rate-law exponents are experimental.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_022', 'challenge', 'Arrhenius equation relates rate constant to temperature and:',
'density', 'activation energy', 'volume only', 'molar mass only',
'B', 'k=Ae^-Ea/RT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_023', 'challenge', 'Quick check — Arrhenius equation relates rate constant to temperature and:',
'molar mass only', 'density', 'volume only', 'activation energy',
'D', 'k=Ae^-Ea/RT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_024', 'challenge', 'JEE concept check — Arrhenius equation relates rate constant to temperature and:',
'volume only', 'molar mass only', 'activation energy', 'density',
'C', 'k=Ae^-Ea/RT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_025', 'challenge', 'Choose the best answer — Arrhenius equation relates rate constant to temperature and:',
'volume only', 'molar mass only', 'density', 'activation energy',
'D', 'k=Ae^-Ea/RT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='CHEMICAL_KINETICS' AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CHEMICAL_KINETICS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_025';

-- SOLID_STATE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_006', 'medium', 'Simple cubic has atoms per unit cell:',
'8', '4', '2', '1',
'D', '8 corners ×1/8=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_007', 'medium', 'Quick check — Simple cubic has atoms per unit cell:',
'2', '4', '1', '8',
'C', '8 corners ×1/8=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_008', 'medium', 'JEE concept check — Simple cubic has atoms per unit cell:',
'4', '8', '2', '1',
'D', '8 corners ×1/8=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_009', 'medium', 'Choose the best answer — Simple cubic has atoms per unit cell:',
'8', '1', '4', '2',
'B', '8 corners ×1/8=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_010', 'medium', 'BCC has atoms per unit cell:',
'2', '4', '6', '1',
'A', 'Corners contribute 1 plus one body center.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_011', 'medium', 'Quick check — BCC has atoms per unit cell:',
'4', '6', '1', '2',
'D', 'Corners contribute 1 plus one body center.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_012', 'medium', 'JEE concept check — BCC has atoms per unit cell:',
'2', '1', '6', '4',
'A', 'Corners contribute 1 plus one body center.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_013', 'medium', 'Choose the best answer — BCC has atoms per unit cell:',
'4', '6', '1', '2',
'D', 'Corners contribute 1 plus one body center.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_014', 'medium', 'FCC has atoms per unit cell:',
'2', '4', '1', '8',
'B', 'Corners contribute 1 and faces 3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_015', 'medium', 'Quick check — FCC has atoms per unit cell:',
'8', '4', '2', '1',
'B', 'Corners contribute 1 and faces 3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_016', 'medium', 'JEE concept check — FCC has atoms per unit cell:',
'1', '2', '4', '8',
'C', 'Corners contribute 1 and faces 3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_017', 'medium', 'Choose the best answer — FCC has atoms per unit cell:',
'4', '8', '2', '1',
'A', 'Corners contribute 1 and faces 3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_018', 'challenge', 'FCC coordination number is:',
'6', '8', '4', '12',
'D', 'FCC is close-packed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_019', 'challenge', 'Quick check — FCC coordination number is:',
'6', '12', '8', '4',
'B', 'FCC is close-packed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_020', 'challenge', 'JEE concept check — FCC coordination number is:',
'8', '6', '12', '4',
'C', 'FCC is close-packed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_021', 'challenge', 'Choose the best answer — FCC coordination number is:',
'6', '12', '4', '8',
'B', 'FCC is close-packed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_022', 'challenge', 'Schottky defect generally causes density to:',
'become zero', 'stay exactly unchanged always', 'decrease', 'increase',
'C', 'Missing ions reduce mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_023', 'challenge', 'Quick check — Schottky defect generally causes density to:',
'stay exactly unchanged always', 'decrease', 'increase', 'become zero',
'B', 'Missing ions reduce mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_024', 'challenge', 'JEE concept check — Schottky defect generally causes density to:',
'decrease', 'become zero', 'increase', 'stay exactly unchanged always',
'A', 'Missing ions reduce mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_025', 'challenge', 'Choose the best answer — Schottky defect generally causes density to:',
'become zero', 'stay exactly unchanged always', 'decrease', 'increase',
'C', 'Missing ions reduce mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLID_STATE_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_025';

-- SOLUTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_006', 'medium', 'Molarity is moles of solute per litre of:',
'solid', 'solution', 'solvent', 'gas',
'B', 'M=n/V_solution.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_007', 'medium', 'Quick check — Molarity is moles of solute per litre of:',
'solvent', 'gas', 'solution', 'solid',
'C', 'M=n/V_solution.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_008', 'medium', 'JEE concept check — Molarity is moles of solute per litre of:',
'solution', 'solvent', 'gas', 'solid',
'A', 'M=n/V_solution.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_009', 'medium', 'Choose the best answer — Molarity is moles of solute per litre of:',
'solution', 'solid', 'gas', 'solvent',
'A', 'M=n/V_solution.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_010', 'medium', 'Molality is moles of solute per kilogram of:',
'solvent', 'solution', 'gas', 'solute',
'A', 'm=mol/kg solvent.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_011', 'medium', 'Quick check — Molality is moles of solute per kilogram of:',
'solution', 'solute', 'solvent', 'gas',
'C', 'm=mol/kg solvent.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_012', 'medium', 'JEE concept check — Molality is moles of solute per kilogram of:',
'gas', 'solvent', 'solute', 'solution',
'B', 'm=mol/kg solvent.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_013', 'medium', 'Choose the best answer — Molality is moles of solute per kilogram of:',
'solute', 'solution', 'gas', 'solvent',
'D', 'm=mol/kg solvent.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_014', 'medium', 'Raoult''s law relates vapor pressure to:',
'bond order', 'mole fraction', 'activation energy', 'atomic number',
'B', 'Ideal-solution vapor pressure follows mole fraction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_015', 'medium', 'Quick check — Raoult''s law relates vapor pressure to:',
'bond order', 'atomic number', 'mole fraction', 'activation energy',
'C', 'Ideal-solution vapor pressure follows mole fraction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_016', 'medium', 'JEE concept check — Raoult''s law relates vapor pressure to:',
'bond order', 'mole fraction', 'atomic number', 'activation energy',
'B', 'Ideal-solution vapor pressure follows mole fraction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_017', 'medium', 'Choose the best answer — Raoult''s law relates vapor pressure to:',
'atomic number', 'activation energy', 'mole fraction', 'bond order',
'C', 'Ideal-solution vapor pressure follows mole fraction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_018', 'challenge', 'Osmotic pressure is a:',
'colligative property', 'bond angle', 'magnetic quantum number', 'nuclear property',
'A', 'It depends on solute-particle concentration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_019', 'challenge', 'Quick check — Osmotic pressure is a:',
'nuclear property', 'colligative property', 'magnetic quantum number', 'bond angle',
'B', 'It depends on solute-particle concentration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_020', 'challenge', 'JEE concept check — Osmotic pressure is a:',
'nuclear property', 'colligative property', 'bond angle', 'magnetic quantum number',
'B', 'It depends on solute-particle concentration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_021', 'challenge', 'Choose the best answer — Osmotic pressure is a:',
'nuclear property', 'bond angle', 'magnetic quantum number', 'colligative property',
'D', 'It depends on solute-particle concentration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_022', 'challenge', 'Adding nonvolatile solute generally lowers solvent:',
'vapor pressure', 'molar mass', 'boiling point', 'atomic number',
'A', 'Raoult''s law predicts vapor-pressure lowering.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_023', 'challenge', 'Quick check — Adding nonvolatile solute generally lowers solvent:',
'vapor pressure', 'molar mass', 'atomic number', 'boiling point',
'A', 'Raoult''s law predicts vapor-pressure lowering.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_024', 'challenge', 'JEE concept check — Adding nonvolatile solute generally lowers solvent:',
'vapor pressure', 'molar mass', 'boiling point', 'atomic number',
'A', 'Raoult''s law predicts vapor-pressure lowering.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_025', 'challenge', 'Choose the best answer — Adding nonvolatile solute generally lowers solvent:',
'vapor pressure', 'atomic number', 'molar mass', 'boiling point',
'A', 'Raoult''s law predicts vapor-pressure lowering.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SOLUTIONS' AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SOLUTIONS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_025';

-- SURFACE_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_006', 'medium', 'Adsorption is primarily a:',
'surface phenomenon', 'bulk phenomenon only', 'gas law', 'nuclear phenomenon',
'A', 'Species accumulate at a surface.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_007', 'medium', 'Quick check — Adsorption is primarily a:',
'surface phenomenon', 'bulk phenomenon only', 'nuclear phenomenon', 'gas law',
'A', 'Species accumulate at a surface.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_008', 'medium', 'JEE concept check — Adsorption is primarily a:',
'bulk phenomenon only', 'surface phenomenon', 'nuclear phenomenon', 'gas law',
'B', 'Species accumulate at a surface.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_009', 'medium', 'Choose the best answer — Adsorption is primarily a:',
'bulk phenomenon only', 'nuclear phenomenon', 'surface phenomenon', 'gas law',
'C', 'Species accumulate at a surface.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_010', 'medium', 'Physisorption is dominated by:',
'ionic lattice always', 'nuclear force', 'van der Waals forces', 'covalent bonds only',
'C', 'Physical adsorption uses weak intermolecular forces.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_011', 'medium', 'Quick check — Physisorption is dominated by:',
'van der Waals forces', 'ionic lattice always', 'nuclear force', 'covalent bonds only',
'A', 'Physical adsorption uses weak intermolecular forces.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_012', 'medium', 'JEE concept check — Physisorption is dominated by:',
'covalent bonds only', 'ionic lattice always', 'nuclear force', 'van der Waals forces',
'D', 'Physical adsorption uses weak intermolecular forces.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_013', 'medium', 'Choose the best answer — Physisorption is dominated by:',
'nuclear force', 'covalent bonds only', 'van der Waals forces', 'ionic lattice always',
'C', 'Physical adsorption uses weak intermolecular forces.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_014', 'medium', 'Tyndall effect is:',
'radioactivity', 'boiling', 'electrolysis', 'light scattering by colloids',
'D', 'Colloidal particles scatter light.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_015', 'medium', 'Quick check — Tyndall effect is:',
'radioactivity', 'light scattering by colloids', 'electrolysis', 'boiling',
'B', 'Colloidal particles scatter light.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_016', 'medium', 'JEE concept check — Tyndall effect is:',
'electrolysis', 'radioactivity', 'boiling', 'light scattering by colloids',
'D', 'Colloidal particles scatter light.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_017', 'medium', 'Choose the best answer — Tyndall effect is:',
'boiling', 'light scattering by colloids', 'radioactivity', 'electrolysis',
'B', 'Colloidal particles scatter light.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_018', 'challenge', 'Brownian motion is:',
'electron spin', 'random motion of colloidal particles', 'crystal growth', 'nuclear decay',
'B', 'Molecular collisions cause random motion.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_019', 'challenge', 'Quick check — Brownian motion is:',
'random motion of colloidal particles', 'electron spin', 'nuclear decay', 'crystal growth',
'A', 'Molecular collisions cause random motion.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_020', 'challenge', 'JEE concept check — Brownian motion is:',
'nuclear decay', 'crystal growth', 'electron spin', 'random motion of colloidal particles',
'D', 'Molecular collisions cause random motion.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_021', 'challenge', 'Choose the best answer — Brownian motion is:',
'nuclear decay', 'electron spin', 'crystal growth', 'random motion of colloidal particles',
'D', 'Molecular collisions cause random motion.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_022', 'challenge', 'An emulsion is typically:',
'liquid dispersed in liquid', 'solid in solid only', 'gas in gas', 'electron in metal',
'A', 'One liquid is dispersed in another.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_023', 'challenge', 'Quick check — An emulsion is typically:',
'electron in metal', 'liquid dispersed in liquid', 'solid in solid only', 'gas in gas',
'B', 'One liquid is dispersed in another.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_024', 'challenge', 'JEE concept check — An emulsion is typically:',
'liquid dispersed in liquid', 'electron in metal', 'solid in solid only', 'gas in gas',
'A', 'One liquid is dispersed in another.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_025', 'challenge', 'Choose the best answer — An emulsion is typically:',
'solid in solid only', 'liquid dispersed in liquid', 'gas in gas', 'electron in metal',
'B', 'One liquid is dispersed in another.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='SURFACE_CHEMISTRY' AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SURFACE_CHEMISTRY_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_025';

-- PERIODICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_006', 'medium', 'Across a period, atomic radius generally:',
'decreases', 'becomes infinite', 'is constant', 'increases',
'A', 'Effective nuclear charge rises.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_007', 'medium', 'Quick check — Across a period, atomic radius generally:',
'increases', 'is constant', 'becomes infinite', 'decreases',
'D', 'Effective nuclear charge rises.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_008', 'medium', 'JEE concept check — Across a period, atomic radius generally:',
'is constant', 'increases', 'becomes infinite', 'decreases',
'D', 'Effective nuclear charge rises.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_009', 'medium', 'Choose the best answer — Across a period, atomic radius generally:',
'decreases', 'is constant', 'becomes infinite', 'increases',
'A', 'Effective nuclear charge rises.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_010', 'medium', 'Down a group, atomic radius generally:',
'is constant', 'increases', 'decreases', 'becomes zero',
'B', 'Additional shells increase size.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_011', 'medium', 'Quick check — Down a group, atomic radius generally:',
'decreases', 'is constant', 'becomes zero', 'increases',
'D', 'Additional shells increase size.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_012', 'medium', 'JEE concept check — Down a group, atomic radius generally:',
'becomes zero', 'decreases', 'increases', 'is constant',
'C', 'Additional shells increase size.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_013', 'medium', 'Choose the best answer — Down a group, atomic radius generally:',
'increases', 'decreases', 'becomes zero', 'is constant',
'A', 'Additional shells increase size.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_014', 'medium', 'Across a period, ionization energy generally:',
'increases', 'becomes zero', 'is identical', 'decreases',
'A', 'Electrons are held more strongly.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_015', 'medium', 'Quick check — Across a period, ionization energy generally:',
'is identical', 'decreases', 'increases', 'becomes zero',
'C', 'Electrons are held more strongly.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_016', 'medium', 'JEE concept check — Across a period, ionization energy generally:',
'is identical', 'increases', 'decreases', 'becomes zero',
'B', 'Electrons are held more strongly.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_017', 'medium', 'Choose the best answer — Across a period, ionization energy generally:',
'decreases', 'increases', 'is identical', 'becomes zero',
'B', 'Electrons are held more strongly.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_018', 'challenge', 'Fluorine is the most electronegative common element:',
'yes', 'no, sodium is', 'no, neon is', 'no, cesium is',
'A', 'Fluorine has the highest Pauling electronegativity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_019', 'challenge', 'Quick check — Fluorine is the most electronegative common element:',
'no, sodium is', 'no, cesium is', 'no, neon is', 'yes',
'D', 'Fluorine has the highest Pauling electronegativity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_020', 'challenge', 'JEE concept check — Fluorine is the most electronegative common element:',
'no, neon is', 'no, sodium is', 'yes', 'no, cesium is',
'C', 'Fluorine has the highest Pauling electronegativity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_021', 'challenge', 'Choose the best answer — Fluorine is the most electronegative common element:',
'no, cesium is', 'no, neon is', 'no, sodium is', 'yes',
'D', 'Fluorine has the highest Pauling electronegativity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_022', 'challenge', 'A cation is generally smaller than its neutral:',
'atom', 'nucleus', 'anion always', 'isotope',
'A', 'Electron loss reduces repulsion/possibly a shell.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_023', 'challenge', 'Quick check — A cation is generally smaller than its neutral:',
'nucleus', 'anion always', 'isotope', 'atom',
'D', 'Electron loss reduces repulsion/possibly a shell.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_024', 'challenge', 'JEE concept check — A cation is generally smaller than its neutral:',
'isotope', 'anion always', 'nucleus', 'atom',
'D', 'Electron loss reduces repulsion/possibly a shell.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_025', 'challenge', 'Choose the best answer — A cation is generally smaller than its neutral:',
'atom', 'isotope', 'anion always', 'nucleus',
'A', 'Electron loss reduces repulsion/possibly a shell.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PERIODICITY' AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERIODICITY_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_025';

-- HYDROGEN_S_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_006', 'medium', 'Alkali metals are group:',
'2', '1', '18', '17',
'B', 'Group 1 contains alkali metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_007', 'medium', 'Quick check — Alkali metals are group:',
'18', '1', '2', '17',
'B', 'Group 1 contains alkali metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_008', 'medium', 'JEE concept check — Alkali metals are group:',
'1', '17', '2', '18',
'A', 'Group 1 contains alkali metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_009', 'medium', 'Choose the best answer — Alkali metals are group:',
'17', '18', '1', '2',
'C', 'Group 1 contains alkali metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_010', 'medium', 'Alkaline-earth metals are group:',
'18', '1', '2', '16',
'C', 'Group 2 contains alkaline-earth metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_011', 'medium', 'Quick check — Alkaline-earth metals are group:',
'1', '16', '2', '18',
'C', 'Group 2 contains alkaline-earth metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_012', 'medium', 'JEE concept check — Alkaline-earth metals are group:',
'1', '18', '2', '16',
'C', 'Group 2 contains alkaline-earth metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_013', 'medium', 'Choose the best answer — Alkaline-earth metals are group:',
'18', '1', '16', '2',
'D', 'Group 2 contains alkaline-earth metals.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_014', 'medium', 'NaOH is a:',
'strong base', 'noble gas', 'neutral gas', 'strong acid',
'A', 'NaOH dissociates strongly in water.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_015', 'medium', 'Quick check — NaOH is a:',
'neutral gas', 'strong acid', 'strong base', 'noble gas',
'C', 'NaOH dissociates strongly in water.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_016', 'medium', 'JEE concept check — NaOH is a:',
'strong base', 'strong acid', 'noble gas', 'neutral gas',
'A', 'NaOH dissociates strongly in water.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_017', 'medium', 'Choose the best answer — NaOH is a:',
'noble gas', 'strong acid', 'strong base', 'neutral gas',
'C', 'NaOH dissociates strongly in water.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_018', 'challenge', 'NaHCO3 is commonly called:',
'slaked lime', 'baking soda', 'quicklime', 'washing soda',
'B', 'Sodium hydrogen carbonate is baking soda.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_019', 'challenge', 'Quick check — NaHCO3 is commonly called:',
'baking soda', 'slaked lime', 'quicklime', 'washing soda',
'A', 'Sodium hydrogen carbonate is baking soda.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_020', 'challenge', 'JEE concept check — NaHCO3 is commonly called:',
'slaked lime', 'washing soda', 'baking soda', 'quicklime',
'C', 'Sodium hydrogen carbonate is baking soda.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_021', 'challenge', 'Choose the best answer — NaHCO3 is commonly called:',
'slaked lime', 'quicklime', 'washing soda', 'baking soda',
'D', 'Sodium hydrogen carbonate is baking soda.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_022', 'challenge', 'Heavy water formula is:',
'T2O2', 'D2O', 'HDO2', 'H2O2',
'B', 'Heavy water contains deuterium.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_023', 'challenge', 'Quick check — Heavy water formula is:',
'T2O2', 'HDO2', 'H2O2', 'D2O',
'D', 'Heavy water contains deuterium.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_024', 'challenge', 'JEE concept check — Heavy water formula is:',
'D2O', 'T2O2', 'H2O2', 'HDO2',
'A', 'Heavy water contains deuterium.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_025', 'challenge', 'Choose the best answer — Heavy water formula is:',
'H2O2', 'T2O2', 'D2O', 'HDO2',
'C', 'Heavy water contains deuterium.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROGEN_S_BLOCK' AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROGEN_S_BLOCK_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_025';

-- P_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_006', 'medium', 'Carbon belongs to group:',
'13', '16', '15', '14',
'D', 'Carbon family is group 14.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_007', 'medium', 'Quick check — Carbon belongs to group:',
'13', '16', '15', '14',
'D', 'Carbon family is group 14.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_008', 'medium', 'JEE concept check — Carbon belongs to group:',
'15', '13', '16', '14',
'D', 'Carbon family is group 14.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_009', 'medium', 'Choose the best answer — Carbon belongs to group:',
'14', '13', '15', '16',
'A', 'Carbon family is group 14.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_010', 'medium', 'Nitrogen belongs to group:',
'14', '17', '15', '16',
'C', 'Pnictogens are group 15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_011', 'medium', 'Quick check — Nitrogen belongs to group:',
'16', '17', '14', '15',
'D', 'Pnictogens are group 15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_012', 'medium', 'JEE concept check — Nitrogen belongs to group:',
'17', '16', '14', '15',
'D', 'Pnictogens are group 15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_013', 'medium', 'Choose the best answer — Nitrogen belongs to group:',
'16', '14', '15', '17',
'C', 'Pnictogens are group 15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_014', 'medium', 'Oxygen belongs to group:',
'16', '17', '18', '15',
'A', 'Chalcogens are group 16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_015', 'medium', 'Quick check — Oxygen belongs to group:',
'15', '16', '17', '18',
'B', 'Chalcogens are group 16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_016', 'medium', 'JEE concept check — Oxygen belongs to group:',
'18', '17', '16', '15',
'C', 'Chalcogens are group 16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_017', 'medium', 'Choose the best answer — Oxygen belongs to group:',
'17', '18', '15', '16',
'D', 'Chalcogens are group 16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_018', 'challenge', 'Halogens belong to group:',
'1', '16', '17', '18',
'C', 'Halogens are group 17.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_019', 'challenge', 'Quick check — Halogens belong to group:',
'17', '18', '16', '1',
'A', 'Halogens are group 17.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_020', 'challenge', 'JEE concept check — Halogens belong to group:',
'16', '18', '1', '17',
'D', 'Halogens are group 17.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_021', 'challenge', 'Choose the best answer — Halogens belong to group:',
'1', '16', '18', '17',
'D', 'Halogens are group 17.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_022', 'challenge', 'Noble gases belong to group:',
'17', '16', '1', '18',
'D', 'Noble gases are group 18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_023', 'challenge', 'Quick check — Noble gases belong to group:',
'16', '1', '17', '18',
'D', 'Noble gases are group 18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_024', 'challenge', 'JEE concept check — Noble gases belong to group:',
'16', '17', '1', '18',
'D', 'Noble gases are group 18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_025', 'challenge', 'Choose the best answer — Noble gases belong to group:',
'16', '18', '17', '1',
'B', 'Noble gases are group 18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='P_BLOCK' AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'P_BLOCK_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_025';

-- D_F_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_006', 'medium', 'Lanthanides mainly fill:',
'5f', '4f orbitals', '3d', '2p',
'B', 'Lanthanide series fills 4f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_007', 'medium', 'Quick check — Lanthanides mainly fill:',
'4f orbitals', '2p', '3d', '5f',
'A', 'Lanthanide series fills 4f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_008', 'medium', 'JEE concept check — Lanthanides mainly fill:',
'3d', '2p', '5f', '4f orbitals',
'D', 'Lanthanide series fills 4f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_009', 'medium', 'Choose the best answer — Lanthanides mainly fill:',
'4f orbitals', '2p', '5f', '3d',
'A', 'Lanthanide series fills 4f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_010', 'medium', 'Actinides mainly fill:',
'3d', '4f', '2p', '5f orbitals',
'D', 'Actinides fill 5f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_011', 'medium', 'Quick check — Actinides mainly fill:',
'3d', '5f orbitals', '2p', '4f',
'B', 'Actinides fill 5f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_012', 'medium', 'JEE concept check — Actinides mainly fill:',
'5f orbitals', '4f', '2p', '3d',
'A', 'Actinides fill 5f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_013', 'medium', 'Choose the best answer — Actinides mainly fill:',
'2p', '4f', '5f orbitals', '3d',
'C', 'Actinides fill 5f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_014', 'medium', 'Transition metals often show:',
'variable oxidation states', 'only +1', 'no oxidation states', 'only -1',
'A', 'ns and d levels have comparable energies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_015', 'medium', 'Quick check — Transition metals often show:',
'no oxidation states', 'variable oxidation states', 'only -1', 'only +1',
'B', 'ns and d levels have comparable energies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_016', 'medium', 'JEE concept check — Transition metals often show:',
'no oxidation states', 'only +1', 'variable oxidation states', 'only -1',
'C', 'ns and d levels have comparable energies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_017', 'medium', 'Choose the best answer — Transition metals often show:',
'no oxidation states', 'variable oxidation states', 'only -1', 'only +1',
'B', 'ns and d levels have comparable energies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_018', 'challenge', 'KMnO4 contains Mn in oxidation state:',
'+4', '+6', '+2', '+7',
'D', 'Charge balance gives Mn +7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_019', 'challenge', 'Quick check — KMnO4 contains Mn in oxidation state:',
'+2', '+7', '+6', '+4',
'B', 'Charge balance gives Mn +7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_020', 'challenge', 'JEE concept check — KMnO4 contains Mn in oxidation state:',
'+2', '+7', '+6', '+4',
'B', 'Charge balance gives Mn +7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_021', 'challenge', 'Choose the best answer — KMnO4 contains Mn in oxidation state:',
'+4', '+2', '+6', '+7',
'D', 'Charge balance gives Mn +7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_022', 'challenge', 'Paramagnetism is associated with:',
'protons only', 'unpaired electrons', 'no electrons', 'all paired electrons',
'B', 'Unpaired spins give magnetic moment.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_023', 'challenge', 'Quick check — Paramagnetism is associated with:',
'all paired electrons', 'unpaired electrons', 'protons only', 'no electrons',
'B', 'Unpaired spins give magnetic moment.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_024', 'challenge', 'JEE concept check — Paramagnetism is associated with:',
'unpaired electrons', 'all paired electrons', 'no electrons', 'protons only',
'A', 'Unpaired spins give magnetic moment.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_025', 'challenge', 'Choose the best answer — Paramagnetism is associated with:',
'unpaired electrons', 'protons only', 'no electrons', 'all paired electrons',
'A', 'Unpaired spins give magnetic moment.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'D_F_BLOCK_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_025';

-- COORDINATION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_006', 'medium', 'NH3 ligand is named:',
'aqua', 'cyano', 'ammine', 'chloro',
'C', 'Coordinated NH3 is ammine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_007', 'medium', 'Quick check — NH3 ligand is named:',
'cyano', 'ammine', 'aqua', 'chloro',
'B', 'Coordinated NH3 is ammine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_008', 'medium', 'JEE concept check — NH3 ligand is named:',
'chloro', 'ammine', 'cyano', 'aqua',
'B', 'Coordinated NH3 is ammine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_009', 'medium', 'Choose the best answer — NH3 ligand is named:',
'aqua', 'cyano', 'ammine', 'chloro',
'C', 'Coordinated NH3 is ammine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_010', 'medium', 'H2O ligand is named:',
'ammine', 'aqua', 'chloro', 'nitro',
'B', 'Coordinated water is aqua.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_011', 'medium', 'Quick check — H2O ligand is named:',
'ammine', 'chloro', 'aqua', 'nitro',
'C', 'Coordinated water is aqua.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_012', 'medium', 'JEE concept check — H2O ligand is named:',
'ammine', 'aqua', 'nitro', 'chloro',
'B', 'Coordinated water is aqua.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_013', 'medium', 'Choose the best answer — H2O ligand is named:',
'nitro', 'ammine', 'aqua', 'chloro',
'C', 'Coordinated water is aqua.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_014', 'medium', 'Ethylenediamine is:',
'non-ligand', 'monodentate', 'bidentate', 'tridentate',
'C', 'It has two N donor atoms.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_015', 'medium', 'Quick check — Ethylenediamine is:',
'tridentate', 'monodentate', 'non-ligand', 'bidentate',
'D', 'It has two N donor atoms.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_016', 'medium', 'JEE concept check — Ethylenediamine is:',
'bidentate', 'non-ligand', 'tridentate', 'monodentate',
'A', 'It has two N donor atoms.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_017', 'medium', 'Choose the best answer — Ethylenediamine is:',
'monodentate', 'tridentate', 'bidentate', 'non-ligand',
'C', 'It has two N donor atoms.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_018', 'challenge', 'In [Co(NH3)6]3+, coordination number is:',
'3', '6', '9', '2',
'B', 'Six monodentate ligands are attached.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_019', 'challenge', 'Quick check — In [Co(NH3)6]3+, coordination number is:',
'9', '6', '3', '2',
'B', 'Six monodentate ligands are attached.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_020', 'challenge', 'JEE concept check — In [Co(NH3)6]3+, coordination number is:',
'6', '2', '9', '3',
'A', 'Six monodentate ligands are attached.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_021', 'challenge', 'Choose the best answer — In [Co(NH3)6]3+, coordination number is:',
'3', '9', '6', '2',
'C', 'Six monodentate ligands are attached.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_022', 'challenge', 'A chelating ligand binds through:',
'one proton', 'zero donor atoms', 'one neutron', 'two or more donor atoms',
'D', 'Multidentate attachment forms chelate rings.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_023', 'challenge', 'Quick check — A chelating ligand binds through:',
'one neutron', 'zero donor atoms', 'one proton', 'two or more donor atoms',
'D', 'Multidentate attachment forms chelate rings.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_024', 'challenge', 'JEE concept check — A chelating ligand binds through:',
'one proton', 'two or more donor atoms', 'zero donor atoms', 'one neutron',
'B', 'Multidentate attachment forms chelate rings.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_025', 'challenge', 'Choose the best answer — A chelating ligand binds through:',
'one neutron', 'one proton', 'two or more donor atoms', 'zero donor atoms',
'C', 'Multidentate attachment forms chelate rings.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATION_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_025';

-- METALLURGY_QUALITATIVE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_006', 'medium', 'Gangue means:',
'flux', 'pure metal', 'unwanted earthy impurities in ore', 'slag only',
'C', 'Ore concentration removes gangue.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_007', 'medium', 'Quick check — Gangue means:',
'slag only', 'pure metal', 'unwanted earthy impurities in ore', 'flux',
'C', 'Ore concentration removes gangue.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_008', 'medium', 'JEE concept check — Gangue means:',
'slag only', 'flux', 'pure metal', 'unwanted earthy impurities in ore',
'D', 'Ore concentration removes gangue.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_009', 'medium', 'Choose the best answer — Gangue means:',
'unwanted earthy impurities in ore', 'slag only', 'pure metal', 'flux',
'A', 'Ore concentration removes gangue.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_010', 'medium', 'Roasting commonly heats sulfide ore in:',
'water', 'absence of air', 'air/oxygen', 'hydrogen only',
'C', 'Roasting oxidizes sulfides.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_011', 'medium', 'Quick check — Roasting commonly heats sulfide ore in:',
'absence of air', 'hydrogen only', 'water', 'air/oxygen',
'D', 'Roasting oxidizes sulfides.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_012', 'medium', 'JEE concept check — Roasting commonly heats sulfide ore in:',
'absence of air', 'water', 'hydrogen only', 'air/oxygen',
'D', 'Roasting oxidizes sulfides.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_013', 'medium', 'Choose the best answer — Roasting commonly heats sulfide ore in:',
'air/oxygen', 'absence of air', 'hydrogen only', 'water',
'A', 'Roasting oxidizes sulfides.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_014', 'medium', 'Calcination commonly heats ore in:',
'limited or no air', 'liquid nitrogen', 'excess oxygen always', 'water',
'A', 'Carbonate/hydrated ores are decomposed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_015', 'medium', 'Quick check — Calcination commonly heats ore in:',
'excess oxygen always', 'water', 'limited or no air', 'liquid nitrogen',
'C', 'Carbonate/hydrated ores are decomposed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_016', 'medium', 'JEE concept check — Calcination commonly heats ore in:',
'limited or no air', 'water', 'liquid nitrogen', 'excess oxygen always',
'A', 'Carbonate/hydrated ores are decomposed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_017', 'medium', 'Choose the best answer — Calcination commonly heats ore in:',
'limited or no air', 'liquid nitrogen', 'water', 'excess oxygen always',
'A', 'Carbonate/hydrated ores are decomposed.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_018', 'challenge', 'Flux combines with gangue to form:',
'ore', 'gas', 'slag', 'metal',
'C', 'Flux converts gangue into fusible slag.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_019', 'challenge', 'Quick check — Flux combines with gangue to form:',
'slag', 'metal', 'ore', 'gas',
'A', 'Flux converts gangue into fusible slag.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_020', 'challenge', 'JEE concept check — Flux combines with gangue to form:',
'slag', 'gas', 'ore', 'metal',
'A', 'Flux converts gangue into fusible slag.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_021', 'challenge', 'Choose the best answer — Flux combines with gangue to form:',
'slag', 'gas', 'ore', 'metal',
'A', 'Flux converts gangue into fusible slag.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_022', 'challenge', 'Froth flotation is especially useful for:',
'noble gases', 'sulfide ores', 'all salts only', 'pure metals',
'B', 'Sulfide particles preferentially attach to froth.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_023', 'challenge', 'Quick check — Froth flotation is especially useful for:',
'all salts only', 'noble gases', 'sulfide ores', 'pure metals',
'C', 'Sulfide particles preferentially attach to froth.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_024', 'challenge', 'JEE concept check — Froth flotation is especially useful for:',
'all salts only', 'noble gases', 'pure metals', 'sulfide ores',
'D', 'Sulfide particles preferentially attach to froth.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_025', 'challenge', 'Choose the best answer — Froth flotation is especially useful for:',
'noble gases', 'sulfide ores', 'pure metals', 'all salts only',
'B', 'Sulfide particles preferentially attach to froth.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='METALLURGY_QUALITATIVE' AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'METALLURGY_QUALITATIVE_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_025';

-- ENVIRONMENTAL_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_006', 'medium', 'A major greenhouse gas is:',
'O2', 'CO2', 'He', 'N2',
'B', 'CO2 absorbs infrared radiation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_007', 'medium', 'Quick check — A major greenhouse gas is:',
'N2', 'CO2', 'O2', 'He',
'B', 'CO2 absorbs infrared radiation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_008', 'medium', 'JEE concept check — A major greenhouse gas is:',
'CO2', 'O2', 'N2', 'He',
'A', 'CO2 absorbs infrared radiation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_009', 'medium', 'Choose the best answer — A major greenhouse gas is:',
'He', 'CO2', 'O2', 'N2',
'B', 'CO2 absorbs infrared radiation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_010', 'medium', 'Acid rain is associated strongly with:',
'H2 only', 'He and Ne', 'SO2 and NOx', 'O2 and N2',
'C', 'Atmospheric oxidation produces sulfuric/nitric acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_011', 'medium', 'Quick check — Acid rain is associated strongly with:',
'SO2 and NOx', 'He and Ne', 'H2 only', 'O2 and N2',
'A', 'Atmospheric oxidation produces sulfuric/nitric acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_012', 'medium', 'JEE concept check — Acid rain is associated strongly with:',
'O2 and N2', 'H2 only', 'He and Ne', 'SO2 and NOx',
'D', 'Atmospheric oxidation produces sulfuric/nitric acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_013', 'medium', 'Choose the best answer — Acid rain is associated strongly with:',
'He and Ne', 'O2 and N2', 'SO2 and NOx', 'H2 only',
'C', 'Atmospheric oxidation produces sulfuric/nitric acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_014', 'medium', 'Ozone layer is mainly in the:',
'troposphere only', 'mantle', 'core', 'stratosphere',
'D', 'Stratospheric ozone absorbs UV.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_015', 'medium', 'Quick check — Ozone layer is mainly in the:',
'troposphere only', 'mantle', 'core', 'stratosphere',
'D', 'Stratospheric ozone absorbs UV.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_016', 'medium', 'JEE concept check — Ozone layer is mainly in the:',
'core', 'stratosphere', 'mantle', 'troposphere only',
'B', 'Stratospheric ozone absorbs UV.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_017', 'medium', 'Choose the best answer — Ozone layer is mainly in the:',
'core', 'mantle', 'troposphere only', 'stratosphere',
'D', 'Stratospheric ozone absorbs UV.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_018', 'challenge', 'CFCs can deplete ozone by releasing:',
'sodium ions', 'iron atoms', 'chlorine radicals', 'neutrons',
'C', 'Cl radicals catalyze ozone destruction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_019', 'challenge', 'Quick check — CFCs can deplete ozone by releasing:',
'iron atoms', 'chlorine radicals', 'sodium ions', 'neutrons',
'B', 'Cl radicals catalyze ozone destruction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_020', 'challenge', 'JEE concept check — CFCs can deplete ozone by releasing:',
'sodium ions', 'iron atoms', 'chlorine radicals', 'neutrons',
'C', 'Cl radicals catalyze ozone destruction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_021', 'challenge', 'Choose the best answer — CFCs can deplete ozone by releasing:',
'chlorine radicals', 'neutrons', 'iron atoms', 'sodium ions',
'A', 'Cl radicals catalyze ozone destruction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_022', 'challenge', 'BOD is an indicator of:',
'nuclear radiation', 'water color only', 'salt mass', 'organic pollution in water',
'D', 'Biochemical oxygen demand rises with biodegradable organics.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_023', 'challenge', 'Quick check — BOD is an indicator of:',
'salt mass', 'nuclear radiation', 'water color only', 'organic pollution in water',
'D', 'Biochemical oxygen demand rises with biodegradable organics.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_024', 'challenge', 'JEE concept check — BOD is an indicator of:',
'nuclear radiation', 'organic pollution in water', 'water color only', 'salt mass',
'B', 'Biochemical oxygen demand rises with biodegradable organics.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_025', 'challenge', 'Choose the best answer — BOD is an indicator of:',
'nuclear radiation', 'salt mass', 'water color only', 'organic pollution in water',
'D', 'Biochemical oxygen demand rises with biodegradable organics.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ENVIRONMENTAL_CHEMISTRY' AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ENVIRONMENTAL_CHEMISTRY_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_025';

-- ORGANIC_PRINCIPLES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_006', 'medium', 'A nucleophile is an electron-pair:',
'nucleus', 'acceptor', 'donor', 'neutron',
'C', 'Nucleophiles are Lewis bases.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_007', 'medium', 'Quick check — A nucleophile is an electron-pair:',
'neutron', 'nucleus', 'donor', 'acceptor',
'C', 'Nucleophiles are Lewis bases.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_008', 'medium', 'JEE concept check — A nucleophile is an electron-pair:',
'nucleus', 'neutron', 'donor', 'acceptor',
'C', 'Nucleophiles are Lewis bases.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_009', 'medium', 'Choose the best answer — A nucleophile is an electron-pair:',
'neutron', 'acceptor', 'nucleus', 'donor',
'D', 'Nucleophiles are Lewis bases.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_010', 'medium', 'An electrophile is an electron-pair:',
'acceptor', 'neutron', 'radical only', 'donor',
'A', 'Electrophiles are Lewis acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_011', 'medium', 'Quick check — An electrophile is an electron-pair:',
'neutron', 'radical only', 'donor', 'acceptor',
'D', 'Electrophiles are Lewis acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_012', 'medium', 'JEE concept check — An electrophile is an electron-pair:',
'donor', 'neutron', 'acceptor', 'radical only',
'C', 'Electrophiles are Lewis acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_013', 'medium', 'Choose the best answer — An electrophile is an electron-pair:',
'radical only', 'acceptor', 'donor', 'neutron',
'B', 'Electrophiles are Lewis acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_014', 'medium', 'Homolytic bond cleavage forms:',
'radicals', 'salts', 'noble gases', 'only ions',
'A', 'Each fragment takes one electron.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_015', 'medium', 'Quick check — Homolytic bond cleavage forms:',
'only ions', 'salts', 'noble gases', 'radicals',
'D', 'Each fragment takes one electron.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_016', 'medium', 'JEE concept check — Homolytic bond cleavage forms:',
'radicals', 'noble gases', 'only ions', 'salts',
'A', 'Each fragment takes one electron.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_017', 'medium', 'Choose the best answer — Homolytic bond cleavage forms:',
'radicals', 'salts', 'noble gases', 'only ions',
'A', 'Each fragment takes one electron.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_018', 'challenge', 'Heterolytic bond cleavage forms:',
'only radicals', 'isotopes', 'ions', 'nuclei',
'C', 'One fragment takes both bonding electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_019', 'challenge', 'Quick check — Heterolytic bond cleavage forms:',
'ions', 'nuclei', 'only radicals', 'isotopes',
'A', 'One fragment takes both bonding electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_020', 'challenge', 'JEE concept check — Heterolytic bond cleavage forms:',
'only radicals', 'isotopes', 'ions', 'nuclei',
'C', 'One fragment takes both bonding electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_021', 'challenge', 'Choose the best answer — Heterolytic bond cleavage forms:',
'isotopes', 'nuclei', 'only radicals', 'ions',
'D', 'One fragment takes both bonding electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_022', 'challenge', 'Resonance represents:',
'different molecular formulas', 'electron delocalization', 'nuclear motion between structures', 'isotope change',
'B', 'Canonical structures depict delocalized electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_023', 'challenge', 'Quick check — Resonance represents:',
'different molecular formulas', 'electron delocalization', 'nuclear motion between structures', 'isotope change',
'B', 'Canonical structures depict delocalized electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_024', 'challenge', 'JEE concept check — Resonance represents:',
'isotope change', 'different molecular formulas', 'electron delocalization', 'nuclear motion between structures',
'C', 'Canonical structures depict delocalized electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_025', 'challenge', 'Choose the best answer — Resonance represents:',
'different molecular formulas', 'isotope change', 'nuclear motion between structures', 'electron delocalization',
'D', 'Canonical structures depict delocalized electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='ORGANIC_PRINCIPLES' AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ORGANIC_PRINCIPLES_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_025';

-- HYDROCARBONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_006', 'medium', 'Alkanes contain only C-C:',
'single bonds', 'double bonds only', 'ionic bonds', 'triple bonds only',
'A', 'Alkanes are saturated.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_007', 'medium', 'Quick check — Alkanes contain only C-C:',
'double bonds only', 'triple bonds only', 'single bonds', 'ionic bonds',
'C', 'Alkanes are saturated.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_008', 'medium', 'JEE concept check — Alkanes contain only C-C:',
'triple bonds only', 'single bonds', 'ionic bonds', 'double bonds only',
'B', 'Alkanes are saturated.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_009', 'medium', 'Choose the best answer — Alkanes contain only C-C:',
'double bonds only', 'ionic bonds', 'single bonds', 'triple bonds only',
'C', 'Alkanes are saturated.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_010', 'medium', 'Alkenes contain at least one:',
'ionic bond', 'C≡C only', 'C=C bond', 'metal bond',
'C', 'Alkenes contain carbon-carbon double bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_011', 'medium', 'Quick check — Alkenes contain at least one:',
'C≡C only', 'C=C bond', 'metal bond', 'ionic bond',
'B', 'Alkenes contain carbon-carbon double bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_012', 'medium', 'JEE concept check — Alkenes contain at least one:',
'metal bond', 'C≡C only', 'C=C bond', 'ionic bond',
'C', 'Alkenes contain carbon-carbon double bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_013', 'medium', 'Choose the best answer — Alkenes contain at least one:',
'C=C bond', 'C≡C only', 'metal bond', 'ionic bond',
'A', 'Alkenes contain carbon-carbon double bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_014', 'medium', 'Alkynes contain at least one:',
'ionic bond', 'C≡C bond', 'single bonds only', 'C=C only',
'B', 'Alkynes contain carbon-carbon triple bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_015', 'medium', 'Quick check — Alkynes contain at least one:',
'C≡C bond', 'ionic bond', 'single bonds only', 'C=C only',
'A', 'Alkynes contain carbon-carbon triple bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_016', 'medium', 'JEE concept check — Alkynes contain at least one:',
'C≡C bond', 'single bonds only', 'C=C only', 'ionic bond',
'A', 'Alkynes contain carbon-carbon triple bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_017', 'medium', 'Choose the best answer — Alkynes contain at least one:',
'single bonds only', 'C≡C bond', 'ionic bond', 'C=C only',
'B', 'Alkynes contain carbon-carbon triple bonds.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_018', 'challenge', 'Benzene formula is:',
'C5H6', 'C6H12', 'C6H6', 'C6H14',
'C', 'Benzene is aromatic C6H6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_019', 'challenge', 'Quick check — Benzene formula is:',
'C5H6', 'C6H12', 'C6H6', 'C6H14',
'C', 'Benzene is aromatic C6H6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_020', 'challenge', 'JEE concept check — Benzene formula is:',
'C5H6', 'C6H14', 'C6H6', 'C6H12',
'C', 'Benzene is aromatic C6H6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_021', 'challenge', 'Choose the best answer — Benzene formula is:',
'C6H14', 'C5H6', 'C6H12', 'C6H6',
'D', 'Benzene is aromatic C6H6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_022', 'challenge', 'Hydrogenation of an alkene generally gives an:',
'amine', 'ether', 'alkyne', 'alkane',
'D', 'H2 adds across the double bond.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_023', 'challenge', 'Quick check — Hydrogenation of an alkene generally gives an:',
'ether', 'alkyne', 'amine', 'alkane',
'D', 'H2 adds across the double bond.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_024', 'challenge', 'JEE concept check — Hydrogenation of an alkene generally gives an:',
'alkane', 'amine', 'ether', 'alkyne',
'A', 'H2 adds across the double bond.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_025', 'challenge', 'Choose the best answer — Hydrogenation of an alkene generally gives an:',
'alkyne', 'ether', 'amine', 'alkane',
'D', 'H2 adds across the double bond.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HYDROCARBONS' AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HYDROCARBONS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_025';

-- HALOGEN_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_006', 'medium', 'SN1 mechanism proceeds through a:',
'carbocation intermediate', 'metal hydride', 'radical only', 'carbanion only',
'A', 'Ionization gives a carbocation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_007', 'medium', 'Quick check — SN1 mechanism proceeds through a:',
'carbocation intermediate', 'carbanion only', 'metal hydride', 'radical only',
'A', 'Ionization gives a carbocation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_008', 'medium', 'JEE concept check — SN1 mechanism proceeds through a:',
'radical only', 'carbanion only', 'carbocation intermediate', 'metal hydride',
'C', 'Ionization gives a carbocation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_009', 'medium', 'Choose the best answer — SN1 mechanism proceeds through a:',
'radical only', 'carbanion only', 'metal hydride', 'carbocation intermediate',
'D', 'Ionization gives a carbocation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_010', 'medium', 'SN2 mechanism is:',
'equilibrium only', 'concerted', 'two-step through carbocation', 'radical chain only',
'B', 'Bond making/breaking occur together.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_011', 'medium', 'Quick check — SN2 mechanism is:',
'equilibrium only', 'concerted', 'radical chain only', 'two-step through carbocation',
'B', 'Bond making/breaking occur together.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_012', 'medium', 'JEE concept check — SN2 mechanism is:',
'equilibrium only', 'concerted', 'radical chain only', 'two-step through carbocation',
'B', 'Bond making/breaking occur together.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_013', 'medium', 'Choose the best answer — SN2 mechanism is:',
'radical chain only', 'two-step through carbocation', 'equilibrium only', 'concerted',
'D', 'Bond making/breaking occur together.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_014', 'medium', 'Grignard reagent has general form:',
'RMgX', 'RNH2', 'RX2', 'ROH',
'A', 'Organomagnesium halides are Grignard reagents.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_015', 'medium', 'Quick check — Grignard reagent has general form:',
'RX2', 'ROH', 'RMgX', 'RNH2',
'C', 'Organomagnesium halides are Grignard reagents.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_016', 'medium', 'JEE concept check — Grignard reagent has general form:',
'ROH', 'RNH2', 'RX2', 'RMgX',
'D', 'Organomagnesium halides are Grignard reagents.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_017', 'medium', 'Choose the best answer — Grignard reagent has general form:',
'RMgX', 'RX2', 'ROH', 'RNH2',
'A', 'Organomagnesium halides are Grignard reagents.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_018', 'challenge', 'Chlorobenzene is an:',
'alkyl halide', 'aryl halide', 'amine', 'alcohol',
'B', 'Cl is directly bonded to aromatic carbon.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_019', 'challenge', 'Quick check — Chlorobenzene is an:',
'amine', 'alcohol', 'aryl halide', 'alkyl halide',
'C', 'Cl is directly bonded to aromatic carbon.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_020', 'challenge', 'JEE concept check — Chlorobenzene is an:',
'alcohol', 'alkyl halide', 'amine', 'aryl halide',
'D', 'Cl is directly bonded to aromatic carbon.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_021', 'challenge', 'Choose the best answer — Chlorobenzene is an:',
'amine', 'aryl halide', 'alkyl halide', 'alcohol',
'B', 'Cl is directly bonded to aromatic carbon.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_022', 'challenge', 'Chloroform formula is:',
'CH3Cl', 'CCl4', 'CHCl3', 'CH2Cl2',
'C', 'Chloroform is trichloromethane.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_023', 'challenge', 'Quick check — Chloroform formula is:',
'CHCl3', 'CH2Cl2', 'CH3Cl', 'CCl4',
'A', 'Chloroform is trichloromethane.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_024', 'challenge', 'JEE concept check — Chloroform formula is:',
'CH3Cl', 'CCl4', 'CH2Cl2', 'CHCl3',
'D', 'Chloroform is trichloromethane.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_025', 'challenge', 'Choose the best answer — Chloroform formula is:',
'CH2Cl2', 'CCl4', 'CH3Cl', 'CHCl3',
'D', 'Chloroform is trichloromethane.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='HALOGEN_COMPOUNDS' AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'HALOGEN_COMPOUNDS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_025';

-- OXYGEN_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_006', 'medium', 'Alcohol functional group is:',
'-COOH', '-NH2', '-CHO', '-OH',
'D', 'Alcohols contain hydroxyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_007', 'medium', 'Quick check — Alcohol functional group is:',
'-COOH', '-OH', '-CHO', '-NH2',
'B', 'Alcohols contain hydroxyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_008', 'medium', 'JEE concept check — Alcohol functional group is:',
'-NH2', '-COOH', '-OH', '-CHO',
'C', 'Alcohols contain hydroxyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_009', 'medium', 'Choose the best answer — Alcohol functional group is:',
'-COOH', '-OH', '-CHO', '-NH2',
'B', 'Alcohols contain hydroxyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_010', 'medium', 'Aldehyde functional group is:',
'-COOH', '-OH', '-CHO', '-NH2',
'C', 'Aldehydes contain terminal carbonyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_011', 'medium', 'Quick check — Aldehyde functional group is:',
'-COOH', '-CHO', '-OH', '-NH2',
'B', 'Aldehydes contain terminal carbonyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_012', 'medium', 'JEE concept check — Aldehyde functional group is:',
'-CHO', '-NH2', '-COOH', '-OH',
'A', 'Aldehydes contain terminal carbonyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_013', 'medium', 'Choose the best answer — Aldehyde functional group is:',
'-NH2', '-OH', '-COOH', '-CHO',
'D', 'Aldehydes contain terminal carbonyl.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_014', 'medium', 'Carboxylic acid functional group is:',
'-CHO', '-COOH', '-OH only', '-NH2',
'B', 'Carboxyl group is -COOH.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_015', 'medium', 'Quick check — Carboxylic acid functional group is:',
'-OH only', '-COOH', '-NH2', '-CHO',
'B', 'Carboxyl group is -COOH.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_016', 'medium', 'JEE concept check — Carboxylic acid functional group is:',
'-NH2', '-OH only', '-COOH', '-CHO',
'C', 'Carboxyl group is -COOH.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_017', 'medium', 'Choose the best answer — Carboxylic acid functional group is:',
'-COOH', '-CHO', '-NH2', '-OH only',
'A', 'Carboxyl group is -COOH.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_018', 'challenge', 'Oxidation of a secondary alcohol gives a:',
'alkane', 'aldehyde generally', 'ketone', 'amine',
'C', 'Secondary alcohol oxidation yields ketone.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_019', 'challenge', 'Quick check — Oxidation of a secondary alcohol gives a:',
'aldehyde generally', 'alkane', 'amine', 'ketone',
'D', 'Secondary alcohol oxidation yields ketone.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_020', 'challenge', 'JEE concept check — Oxidation of a secondary alcohol gives a:',
'aldehyde generally', 'amine', 'ketone', 'alkane',
'C', 'Secondary alcohol oxidation yields ketone.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_021', 'challenge', 'Choose the best answer — Oxidation of a secondary alcohol gives a:',
'alkane', 'aldehyde generally', 'amine', 'ketone',
'D', 'Secondary alcohol oxidation yields ketone.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_022', 'challenge', 'Tollens'' reagent commonly gives a silver mirror with:',
'alkanes', 'most simple ketones', 'aldehydes', 'ethers',
'C', 'Aldehydes reduce Ag(I).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_023', 'challenge', 'Quick check — Tollens'' reagent commonly gives a silver mirror with:',
'ethers', 'most simple ketones', 'aldehydes', 'alkanes',
'C', 'Aldehydes reduce Ag(I).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_024', 'challenge', 'JEE concept check — Tollens'' reagent commonly gives a silver mirror with:',
'alkanes', 'most simple ketones', 'ethers', 'aldehydes',
'D', 'Aldehydes reduce Ag(I).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_025', 'challenge', 'Choose the best answer — Tollens'' reagent commonly gives a silver mirror with:',
'ethers', 'most simple ketones', 'aldehydes', 'alkanes',
'C', 'Aldehydes reduce Ag(I).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='OXYGEN_COMPOUNDS' AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OXYGEN_COMPOUNDS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_025';

-- NITROGEN_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_006', 'medium', 'Methylamine formula is:',
'CH3CN', 'CH3OH', 'CH3NO2', 'CH3NH2',
'D', 'Methylamine is a primary amine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_007', 'medium', 'Quick check — Methylamine formula is:',
'CH3OH', 'CH3CN', 'CH3NO2', 'CH3NH2',
'D', 'Methylamine is a primary amine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_008', 'medium', 'JEE concept check — Methylamine formula is:',
'CH3OH', 'CH3CN', 'CH3NH2', 'CH3NO2',
'C', 'Methylamine is a primary amine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_009', 'medium', 'Choose the best answer — Methylamine formula is:',
'CH3NH2', 'CH3NO2', 'CH3OH', 'CH3CN',
'A', 'Methylamine is a primary amine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_010', 'medium', 'Aniline formula is:',
'C6H5NO2', 'C6H5OH', 'C6H5NH2', 'C6H6',
'C', 'Aniline is aminobenzene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_011', 'medium', 'Quick check — Aniline formula is:',
'C6H5OH', 'C6H6', 'C6H5NH2', 'C6H5NO2',
'C', 'Aniline is aminobenzene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_012', 'medium', 'JEE concept check — Aniline formula is:',
'C6H5NH2', 'C6H5OH', 'C6H6', 'C6H5NO2',
'A', 'Aniline is aminobenzene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_013', 'medium', 'Choose the best answer — Aniline formula is:',
'C6H6', 'C6H5NH2', 'C6H5OH', 'C6H5NO2',
'B', 'Aniline is aminobenzene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_014', 'medium', 'Amines are basic largely because nitrogen has a:',
'metal bond', 'halogen', 'lone pair', 'nuclear vacancy',
'C', 'The lone pair can accept a proton.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_015', 'medium', 'Quick check — Amines are basic largely because nitrogen has a:',
'lone pair', 'metal bond', 'halogen', 'nuclear vacancy',
'A', 'The lone pair can accept a proton.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_016', 'medium', 'JEE concept check — Amines are basic largely because nitrogen has a:',
'lone pair', 'metal bond', 'nuclear vacancy', 'halogen',
'A', 'The lone pair can accept a proton.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_017', 'medium', 'Choose the best answer — Amines are basic largely because nitrogen has a:',
'halogen', 'nuclear vacancy', 'metal bond', 'lone pair',
'D', 'The lone pair can accept a proton.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_018', 'challenge', 'Azo dyes contain linkage:',
'-N=N-', '-C≡C-', '-O-O-', '-S-S-',
'A', 'Azo group is -N=N-.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_019', 'challenge', 'Quick check — Azo dyes contain linkage:',
'-N=N-', '-C≡C-', '-O-O-', '-S-S-',
'A', 'Azo group is -N=N-.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_020', 'challenge', 'JEE concept check — Azo dyes contain linkage:',
'-O-O-', '-S-S-', '-N=N-', '-C≡C-',
'C', 'Azo group is -N=N-.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_021', 'challenge', 'Choose the best answer — Azo dyes contain linkage:',
'-O-O-', '-N=N-', '-S-S-', '-C≡C-',
'B', 'Azo group is -N=N-.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_022', 'challenge', 'Nitrile functional group is:',
'-NO2', '-NH2', '-C≡N', '-N=N-',
'C', 'Cyano group contains C≡N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_023', 'challenge', 'Quick check — Nitrile functional group is:',
'-N=N-', '-NO2', '-NH2', '-C≡N',
'D', 'Cyano group contains C≡N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_024', 'challenge', 'JEE concept check — Nitrile functional group is:',
'-N=N-', '-NH2', '-C≡N', '-NO2',
'C', 'Cyano group contains C≡N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_025', 'challenge', 'Choose the best answer — Nitrile functional group is:',
'-N=N-', '-C≡N', '-NO2', '-NH2',
'B', 'Cyano group contains C≡N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='NITROGEN_COMPOUNDS' AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'NITROGEN_COMPOUNDS_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_025';

-- BIOMOLECULES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_006', 'medium', 'Glucose is a:',
'protein', 'lipid', 'disaccharide', 'monosaccharide',
'D', 'Glucose is a single sugar unit.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_007', 'medium', 'Quick check — Glucose is a:',
'disaccharide', 'lipid', 'monosaccharide', 'protein',
'C', 'Glucose is a single sugar unit.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_008', 'medium', 'JEE concept check — Glucose is a:',
'disaccharide', 'lipid', 'protein', 'monosaccharide',
'D', 'Glucose is a single sugar unit.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_009', 'medium', 'Choose the best answer — Glucose is a:',
'disaccharide', 'lipid', 'monosaccharide', 'protein',
'C', 'Glucose is a single sugar unit.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_010', 'medium', 'Sucrose is a:',
'amino acid', 'fatty acid', 'disaccharide', 'monosaccharide',
'C', 'Sucrose contains two monosaccharide units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_011', 'medium', 'Quick check — Sucrose is a:',
'fatty acid', 'amino acid', 'disaccharide', 'monosaccharide',
'C', 'Sucrose contains two monosaccharide units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_012', 'medium', 'JEE concept check — Sucrose is a:',
'fatty acid', 'disaccharide', 'monosaccharide', 'amino acid',
'B', 'Sucrose contains two monosaccharide units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_013', 'medium', 'Choose the best answer — Sucrose is a:',
'amino acid', 'fatty acid', 'monosaccharide', 'disaccharide',
'D', 'Sucrose contains two monosaccharide units.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_014', 'medium', 'Proteins are polymers of:',
'monosaccharides only', 'amino acids', 'nucleotides', 'fatty acids only',
'B', 'Peptide bonds join amino acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_015', 'medium', 'Quick check — Proteins are polymers of:',
'amino acids', 'nucleotides', 'fatty acids only', 'monosaccharides only',
'A', 'Peptide bonds join amino acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_016', 'medium', 'JEE concept check — Proteins are polymers of:',
'fatty acids only', 'amino acids', 'monosaccharides only', 'nucleotides',
'B', 'Peptide bonds join amino acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_017', 'medium', 'Choose the best answer — Proteins are polymers of:',
'monosaccharides only', 'nucleotides', 'fatty acids only', 'amino acids',
'D', 'Peptide bonds join amino acids.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_018', 'challenge', 'DNA contains sugar:',
'ribose', 'glucose', 'deoxyribose', 'fructose',
'C', 'DNA uses 2-deoxyribose.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_019', 'challenge', 'Quick check — DNA contains sugar:',
'glucose', 'ribose', 'deoxyribose', 'fructose',
'C', 'DNA uses 2-deoxyribose.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_020', 'challenge', 'JEE concept check — DNA contains sugar:',
'ribose', 'glucose', 'fructose', 'deoxyribose',
'D', 'DNA uses 2-deoxyribose.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_021', 'challenge', 'Choose the best answer — DNA contains sugar:',
'fructose', 'deoxyribose', 'ribose', 'glucose',
'B', 'DNA uses 2-deoxyribose.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_022', 'challenge', 'RNA commonly contains base:',
'iron', 'uracil', 'no bases', 'thymine only',
'B', 'RNA uses uracil in place of thymine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_023', 'challenge', 'Quick check — RNA commonly contains base:',
'no bases', 'thymine only', 'iron', 'uracil',
'D', 'RNA uses uracil in place of thymine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_024', 'challenge', 'JEE concept check — RNA commonly contains base:',
'no bases', 'iron', 'uracil', 'thymine only',
'C', 'RNA uses uracil in place of thymine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_025', 'challenge', 'Choose the best answer — RNA commonly contains base:',
'iron', 'uracil', 'no bases', 'thymine only',
'B', 'RNA uses uracil in place of thymine.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='BIOMOLECULES' AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BIOMOLECULES_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_025';

-- POLYMERS_EVERYDAY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_006', 'medium', 'Polyethylene monomer is:',
'benzene', 'methanol', 'ethyne', 'ethene',
'D', 'Ethene addition polymerizes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_007', 'medium', 'Quick check — Polyethylene monomer is:',
'ethene', 'methanol', 'benzene', 'ethyne',
'A', 'Ethene addition polymerizes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_008', 'medium', 'JEE concept check — Polyethylene monomer is:',
'ethene', 'methanol', 'benzene', 'ethyne',
'A', 'Ethene addition polymerizes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_009', 'medium', 'Choose the best answer — Polyethylene monomer is:',
'ethyne', 'benzene', 'ethene', 'methanol',
'C', 'Ethene addition polymerizes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_010', 'medium', 'PVC monomer is:',
'styrene', 'ethylene glycol', 'tetrafluoroethene', 'vinyl chloride',
'D', 'PVC is poly(vinyl chloride).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_011', 'medium', 'Quick check — PVC monomer is:',
'styrene', 'vinyl chloride', 'tetrafluoroethene', 'ethylene glycol',
'B', 'PVC is poly(vinyl chloride).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_012', 'medium', 'JEE concept check — PVC monomer is:',
'vinyl chloride', 'tetrafluoroethene', 'ethylene glycol', 'styrene',
'A', 'PVC is poly(vinyl chloride).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_013', 'medium', 'Choose the best answer — PVC monomer is:',
'vinyl chloride', 'ethylene glycol', 'tetrafluoroethene', 'styrene',
'A', 'PVC is poly(vinyl chloride).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_014', 'medium', 'PTFE monomer is:',
'styrene', 'vinyl chloride', 'tetrafluoroethene', 'ethene',
'C', 'PTFE forms from CF2=CF2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_015', 'medium', 'Quick check — PTFE monomer is:',
'ethene', 'vinyl chloride', 'styrene', 'tetrafluoroethene',
'D', 'PTFE forms from CF2=CF2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_016', 'medium', 'JEE concept check — PTFE monomer is:',
'styrene', 'ethene', 'tetrafluoroethene', 'vinyl chloride',
'C', 'PTFE forms from CF2=CF2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_017', 'medium', 'Choose the best answer — PTFE monomer is:',
'styrene', 'ethene', 'tetrafluoroethene', 'vinyl chloride',
'C', 'PTFE forms from CF2=CF2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_018', 'challenge', 'Natural rubber is mainly poly:',
'styrene', 'isoprene', 'ethene', 'vinyl chloride',
'B', 'Natural rubber is cis-1,4-polyisoprene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_019', 'challenge', 'Quick check — Natural rubber is mainly poly:',
'ethene', 'isoprene', 'styrene', 'vinyl chloride',
'B', 'Natural rubber is cis-1,4-polyisoprene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_020', 'challenge', 'JEE concept check — Natural rubber is mainly poly:',
'styrene', 'vinyl chloride', 'ethene', 'isoprene',
'D', 'Natural rubber is cis-1,4-polyisoprene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_021', 'challenge', 'Choose the best answer — Natural rubber is mainly poly:',
'styrene', 'isoprene', 'vinyl chloride', 'ethene',
'B', 'Natural rubber is cis-1,4-polyisoprene.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_022', 'challenge', 'Vulcanization commonly uses:',
'sulfur', 'NaCl', 'nitrogen only', 'oxygen only',
'A', 'Sulfur forms cross-links.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_023', 'challenge', 'Quick check — Vulcanization commonly uses:',
'sulfur', 'oxygen only', 'nitrogen only', 'NaCl',
'A', 'Sulfur forms cross-links.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_024', 'challenge', 'JEE concept check — Vulcanization commonly uses:',
'nitrogen only', 'NaCl', 'sulfur', 'oxygen only',
'C', 'Sulfur forms cross-links.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_025', 'challenge', 'Choose the best answer — Vulcanization commonly uses:',
'oxygen only', 'sulfur', 'NaCl', 'nitrogen only',
'B', 'Sulfur forms cross-links.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='POLYMERS_EVERYDAY' AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'POLYMERS_EVERYDAY_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_025';

-- PRACTICAL_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_006', 'medium', 'A burette delivers:',
'accurately measured variable volumes', 'only solids', 'mass directly', 'temperature',
'A', 'Burettes are used in titration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_006', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_007', 'medium', 'Quick check — A burette delivers:',
'mass directly', 'accurately measured variable volumes', 'temperature', 'only solids',
'B', 'Burettes are used in titration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_007', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_008', 'medium', 'JEE concept check — A burette delivers:',
'temperature', 'mass directly', 'only solids', 'accurately measured variable volumes',
'D', 'Burettes are used in titration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_008', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_009', 'medium', 'Choose the best answer — A burette delivers:',
'temperature', 'accurately measured variable volumes', 'mass directly', 'only solids',
'B', 'Burettes are used in titration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_009', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_010', 'medium', 'A pipette commonly transfers:',
'temperature', 'a fixed accurate volume', 'pressure', 'large solid mass',
'B', 'Volumetric pipettes transfer calibrated volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_010', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_011', 'medium', 'Quick check — A pipette commonly transfers:',
'large solid mass', 'pressure', 'a fixed accurate volume', 'temperature',
'C', 'Volumetric pipettes transfer calibrated volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_011', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_012', 'medium', 'JEE concept check — A pipette commonly transfers:',
'temperature', 'large solid mass', 'pressure', 'a fixed accurate volume',
'D', 'Volumetric pipettes transfer calibrated volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_012', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_013', 'medium', 'Choose the best answer — A pipette commonly transfers:',
'temperature', 'a fixed accurate volume', 'pressure', 'large solid mass',
'B', 'Volumetric pipettes transfer calibrated volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_013', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_014', 'medium', 'A volumetric flask prepares solution to a:',
'unknown volume', 'fixed pressure', 'fixed final volume', 'fixed mass only',
'C', 'The calibration mark sets final volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_014', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_015', 'medium', 'Quick check — A volumetric flask prepares solution to a:',
'unknown volume', 'fixed final volume', 'fixed pressure', 'fixed mass only',
'B', 'The calibration mark sets final volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_015', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_016', 'medium', 'JEE concept check — A volumetric flask prepares solution to a:',
'unknown volume', 'fixed final volume', 'fixed mass only', 'fixed pressure',
'B', 'The calibration mark sets final volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_016', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_017', 'medium', 'Choose the best answer — A volumetric flask prepares solution to a:',
'fixed final volume', 'unknown volume', 'fixed pressure', 'fixed mass only',
'A', 'The calibration mark sets final volume.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_017', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_018', 'challenge', 'Filtration separates an insoluble solid from a:',
'vacuum', 'liquid', 'nucleus', 'electron beam',
'B', 'A filter retains insoluble solid.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_018', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_019', 'challenge', 'Quick check — Filtration separates an insoluble solid from a:',
'nucleus', 'electron beam', 'vacuum', 'liquid',
'D', 'A filter retains insoluble solid.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_019', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_020', 'challenge', 'JEE concept check — Filtration separates an insoluble solid from a:',
'liquid', 'electron beam', 'vacuum', 'nucleus',
'A', 'A filter retains insoluble solid.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_020', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_021', 'challenge', 'Choose the best answer — Filtration separates an insoluble solid from a:',
'vacuum', 'electron beam', 'nucleus', 'liquid',
'D', 'A filter retains insoluble solid.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_021', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_022', 'challenge', 'Distillation separates primarily by differences in:',
'atomic numbers', 'nuclear spins', 'boiling points', 'charge only',
'C', 'Different volatilities enable separation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_022', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_023', 'challenge', 'Quick check — Distillation separates primarily by differences in:',
'charge only', 'boiling points', 'atomic numbers', 'nuclear spins',
'B', 'Different volatilities enable separation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_023', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_024', 'challenge', 'JEE concept check — Distillation separates primarily by differences in:',
'boiling points', 'nuclear spins', 'atomic numbers', 'charge only',
'A', 'Different volatilities enable separation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_024', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_025', 'challenge', 'Choose the best answer — Distillation separates primarily by differences in:',
'nuclear spins', 'boiling points', 'atomic numbers', 'charge only',
'B', 'Different volatilities enable separation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY' AND t.topic_code='PRACTICAL_CHEMISTRY' AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PRACTICAL_CHEMISTRY_BANK_025', 'GYAN JEE chemistry bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_025';
