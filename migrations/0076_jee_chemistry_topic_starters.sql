-- GYAN IIT-JEE rebuild Phase 2C
-- 0076_jee_chemistry_topic_starters.sql
-- Exactly 5 distinct starter questions for each of the 26 new JEE Chemistry topics.
-- Topic practice may randomize among these. Named Mock/Mini Tests must use fixed mappings.

PRAGMA foreign_keys = ON;

-- BASIC_CONCEPTS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_001',
'easy',
'How many moles are present in 18 g of water (H2O)?',
'0.5 mol',
'1 mol',
'2 mol',
'18 mol',
'B',
'Molar mass of water is 18 g/mol, so 18 g corresponds to 1 mol.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS'
  AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BASIC_CONCEPTS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_002',
'medium',
'Avogadro''s number is approximately:',
'6.022×10^23 mol^-1',
'3.011×10^23 mol^-1',
'9.8×10^23 mol^-1',
'1.602×10^-19 mol^-1',
'A',
'One mole contains approximately 6.022×10^23 entities.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS'
  AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BASIC_CONCEPTS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_003',
'medium',
'The empirical formula of a compound with molecular formula C6H12O6 is:',
'CH2O',
'C2H4O2',
'C3H6O3',
'C6H12O6',
'A',
'Divide all subscripts by their greatest common factor, 6.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS'
  AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BASIC_CONCEPTS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_004',
'medium',
'What mass of NaOH is present in 0.5 mol? (Molar mass = 40 g/mol)',
'10 g',
'20 g',
'40 g',
'80 g',
'B',
'Mass = moles × molar mass = 0.5×40 = 20 g.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS'
  AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BASIC_CONCEPTS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_005',
'challenge',
'A compound contains 40% C, 6.67% H and 53.33% O by mass. Its empirical formula is:',
'CH2O',
'C2H4O2',
'CHO',
'CH4O',
'A',
'Taking 100 g: C=40/12≈3.33, H=6.67/1=6.67, O=53.33/16≈3.33; ratio ≈1:2:1.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS'
  AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BASIC_CONCEPTS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_005';

-- STATES_OF_MATTER
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_001',
'easy',
'Which law states that pressure is inversely proportional to volume at constant temperature?',
'Charles'' law',
'Boyle''s law',
'Gay-Lussac''s law',
'Avogadro''s law',
'B',
'Boyle''s law gives PV=constant at fixed temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='STATES_OF_MATTER'
  AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'STATES_OF_MATTER_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_002',
'medium',
'At constant pressure, volume of an ideal gas is directly proportional to:',
'absolute temperature',
'pressure',
'molar mass',
'density',
'A',
'Charles'' law states V∝T at constant pressure.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='STATES_OF_MATTER'
  AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'STATES_OF_MATTER_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_003',
'medium',
'The ideal gas equation is:',
'PV=nRT',
'P=nRT/V²',
'V=nP/RT',
'PV=RT/n',
'A',
'The ideal gas law is PV=nRT.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='STATES_OF_MATTER'
  AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'STATES_OF_MATTER_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_004',
'medium',
'Real gases deviate most from ideal behavior at:',
'low pressure, high temperature',
'high pressure, low temperature',
'low pressure, low temperature',
'high temperature only',
'B',
'Intermolecular forces and finite molecular volume matter most at high pressure and low temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='STATES_OF_MATTER'
  AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'STATES_OF_MATTER_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_005',
'challenge',
'If pressure of a fixed amount of ideal gas doubles at constant temperature, its volume becomes:',
'double',
'half',
'four times',
'unchanged',
'B',
'Boyle''s law gives P1V1=P2V2.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='STATES_OF_MATTER'
  AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'STATES_OF_MATTER_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_005';

-- ATOMIC_STRUCTURE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_001',
'easy',
'The charge on an electron is:',
'+1',
'-1',
'0',
'+2',
'B',
'An electron carries one negative elementary charge.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMIC_STRUCTURE_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_002',
'medium',
'The maximum number of electrons in the n=3 shell is:',
'8',
'18',
'32',
'9',
'B',
'Maximum electrons in shell n is 2n²=18.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMIC_STRUCTURE_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_003',
'medium',
'Which quantum number determines orbital shape?',
'principal',
'azimuthal',
'magnetic',
'spin',
'B',
'The azimuthal quantum number l determines subshell and orbital shape.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMIC_STRUCTURE_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_004',
'medium',
'For a 3p electron, the value of l is:',
'0',
'1',
'2',
'3',
'B',
'p-subshell corresponds to l=1.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMIC_STRUCTURE_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_005',
'challenge',
'Which set of quantum numbers is not allowed?',
'n=2,l=1,m=0',
'n=3,l=2,m=-2',
'n=2,l=2,m=0',
'n=4,l=0,m=0',
'C',
'For n=2, l can only be 0 or 1.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ATOMIC_STRUCTURE_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_005';

-- CHEMICAL_BONDING
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_001',
'easy',
'A bond formed by transfer of electrons is typically:',
'covalent',
'ionic',
'metallic only',
'hydrogen',
'B',
'Ionic bonding arises from electron transfer and electrostatic attraction.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_BONDING_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_002',
'medium',
'The shape of CH4 is:',
'linear',
'trigonal planar',
'tetrahedral',
'bent',
'C',
'Four bonding pairs around carbon give tetrahedral geometry.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_BONDING_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_003',
'medium',
'Which molecule is polar?',
'CO2',
'BF3',
'H2O',
'CH4',
'C',
'H2O has polar O-H bonds and a bent shape, giving a net dipole.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_BONDING_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_004',
'medium',
'Hybridization of carbon in ethene (C2H4) is:',
'sp',
'sp2',
'sp3',
'dsp2',
'B',
'Each carbon in ethene is sp2 hybridized.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_BONDING_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_005',
'challenge',
'Which species has the highest bond order?',
'O2',
'O2+',
'O2-',
'O2^2-',
'B',
'Removing an electron from antibonding π* orbital increases bond order from 2 to 2.5.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_BONDING_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_005';

-- CHEMICAL_THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_001',
'easy',
'Enthalpy is represented by the symbol:',
'H',
'S',
'G',
'U only',
'A',
'H denotes enthalpy.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_THERMODYNAMICS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_002',
'medium',
'For an exothermic reaction, ΔH is generally:',
'positive',
'negative',
'zero',
'undefined',
'B',
'Exothermic reactions release heat, so products have lower enthalpy.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_THERMODYNAMICS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_003',
'medium',
'At constant pressure, heat exchanged equals change in:',
'internal energy only',
'enthalpy',
'entropy only',
'Gibbs energy',
'B',
'At constant pressure, qp=ΔH.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_THERMODYNAMICS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_004',
'medium',
'Hess''s law is based on enthalpy being a:',
'path function',
'state function',
'vector',
'dimensionless number',
'B',
'Enthalpy change depends only on initial and final states.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_THERMODYNAMICS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_005',
'challenge',
'A reaction has ΔH=-40 kJ and ΔS=-100 J K^-1 at 300 K. ΔG is:',
'-70 kJ',
'-10 kJ',
'+10 kJ',
'+70 kJ',
'B',
'ΔG=ΔH-TΔS=-40-300(-0.100)=-10 kJ.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_THERMODYNAMICS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_005';

-- EQUILIBRIUM
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_001',
'easy',
'At chemical equilibrium, forward and reverse reaction rates are:',
'zero',
'equal',
'maximum',
'unrelated',
'B',
'Dynamic equilibrium means equal forward and reverse rates.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EQUILIBRIUM_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_002',
'medium',
'For N2+3H2 ⇌ 2NH3, increasing pressure favors:',
'reactants',
'products',
'no change',
'decomposition only',
'B',
'The product side has fewer gas moles, so higher pressure shifts equilibrium right.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EQUILIBRIUM_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_003',
'medium',
'The pH of a neutral aqueous solution at 25°C is approximately:',
'0',
'1',
'7',
'14',
'C',
'At 25°C, neutral water has [H+]=10^-7 M.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EQUILIBRIUM_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_004',
'medium',
'If Ka is large for an acid, the acid is generally:',
'weaker',
'stronger',
'neutral',
'insoluble',
'B',
'Larger Ka means greater ionization and stronger acidity.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EQUILIBRIUM_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_005',
'challenge',
'For a saturated solution of AgCl, Ksp is expressed as:',
'[Ag+]+[Cl-]',
'[Ag+][Cl-]',
'[AgCl]',
'[Ag+]²[Cl-]',
'B',
'For AgCl(s) ⇌ Ag+ + Cl-, Ksp=[Ag+][Cl-].',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'EQUILIBRIUM_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_005';

-- REDOX_ELECTROCHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_001',
'easy',
'Oxidation involves:',
'gain of electrons',
'loss of electrons',
'gain of protons only',
'loss of neutrons',
'B',
'Oxidation is loss of electrons.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'REDOX_ELECTROCHEMISTRY_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_002',
'medium',
'In a galvanic cell, oxidation occurs at the:',
'cathode',
'anode',
'salt bridge',
'electrolyte only',
'B',
'Oxidation always occurs at the anode.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'REDOX_ELECTROCHEMISTRY_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_003',
'medium',
'Standard electrode potentials are measured relative to the:',
'calomel electrode only',
'standard hydrogen electrode',
'platinum electrode only',
'copper electrode',
'B',
'The standard hydrogen electrode is assigned E°=0 V.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'REDOX_ELECTROCHEMISTRY_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_004',
'medium',
'For a spontaneous galvanic cell, E°cell is generally:',
'negative',
'positive',
'zero always',
'infinite',
'B',
'A positive standard cell potential corresponds to spontaneous operation.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'REDOX_ELECTROCHEMISTRY_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_005',
'challenge',
'If E°cathode=+0.34 V and E°anode=-0.76 V, E°cell is:',
'-1.10 V',
'-0.42 V',
'+0.42 V',
'+1.10 V',
'D',
'E°cell=E°cathode-E°anode=0.34-(-0.76)=1.10 V.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'REDOX_ELECTROCHEMISTRY_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_005';

-- CHEMICAL_KINETICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_001',
'easy',
'Reaction rate generally increases when temperature:',
'decreases',
'increases',
'becomes 0 K',
'is unchanged',
'B',
'Higher temperature increases the fraction of molecules exceeding activation energy.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_KINETICS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_002',
'medium',
'A catalyst changes reaction rate mainly by changing:',
'ΔH',
'activation energy',
'equilibrium constant',
'overall stoichiometry',
'B',
'A catalyst provides an alternative pathway with lower activation energy.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_KINETICS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_003',
'medium',
'For a first-order reaction, half-life is:',
'dependent on initial concentration',
'independent of initial concentration',
'always zero',
'proportional to concentration squared',
'B',
'For first order, t1/2=0.693/k.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_KINETICS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_004',
'medium',
'The unit of a first-order rate constant is:',
'mol L^-1 s^-1',
's^-1',
'L mol^-1 s^-1',
'mol² L^-2 s^-1',
'B',
'First-order k has dimensions of inverse time.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_KINETICS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_005',
'challenge',
'If a first-order reaction has k=0.693 min^-1, its half-life is:',
'0.5 min',
'1 min',
'2 min',
'10 min',
'B',
't1/2=0.693/k=1 min.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'CHEMICAL_KINETICS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_005';

-- SOLID_STATE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_001',
'easy',
'A crystalline solid has:',
'long-range order',
'no order',
'only short-range order',
'no definite melting point',
'A',
'Crystalline solids possess long-range periodic order.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE'
  AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLID_STATE_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_002',
'medium',
'The coordination number in a simple cubic lattice is:',
'4',
'6',
'8',
'12',
'B',
'Each atom has six nearest neighbors in simple cubic packing.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE'
  AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLID_STATE_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_003',
'medium',
'The number of atoms per face-centered cubic unit cell is:',
'1',
'2',
'4',
'6',
'C',
'FCC contributes 8 corners×1/8 + 6 faces×1/2 = 4 atoms.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE'
  AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLID_STATE_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_004',
'medium',
'Schottky defect in an ionic crystal involves:',
'interstitial ions only',
'paired vacancies of cations and anions',
'electrons in vacancies',
'replacement by impurity only',
'B',
'Schottky defects maintain neutrality by paired cation and anion vacancies.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE'
  AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLID_STATE_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_005',
'challenge',
'Packing efficiency of an FCC lattice is approximately:',
'52%',
'68%',
'74%',
'100%',
'C',
'FCC/CCP has packing efficiency about 74%.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE'
  AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLID_STATE_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_005';

-- SOLUTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_001',
'easy',
'Molarity is moles of solute per:',
'kg solvent',
'litre of solution',
'litre of solvent',
'mole of solvent',
'B',
'Molarity M = moles of solute / litre of solution.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLUTIONS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_002',
'medium',
'Molality is independent of:',
'amount of solute',
'temperature',
'molar mass',
'solvent identity',
'B',
'Molality uses mass of solvent, so it does not change with temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLUTIONS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_003',
'medium',
'Raoult''s law applies ideally to:',
'ideal solutions',
'only solids',
'only gases',
'electrolytes only',
'A',
'For ideal solutions, partial vapor pressure is proportional to mole fraction.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLUTIONS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_004',
'medium',
'Boiling point elevation is a:',
'colligative property',
'chemical property',
'nuclear property',
'surface-only property',
'A',
'It depends primarily on the number of dissolved particles.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLUTIONS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_005',
'challenge',
'If 1 mol of a nonvolatile solute is dissolved in 1 kg water and Kb=0.512 K kg mol^-1, ΔTb is:',
'0.256 K',
'0.512 K',
'1.024 K',
'1.512 K',
'B',
'For a nonelectrolyte, ΔTb=Kb m=0.512×1.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SOLUTIONS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_005';

-- SURFACE_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_001',
'easy',
'Adsorption is a:',
'bulk phenomenon',
'surface phenomenon',
'nuclear phenomenon',
'gas law',
'B',
'Adsorption occurs at the surface of a material.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SURFACE_CHEMISTRY'
  AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SURFACE_CHEMISTRY_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_002',
'medium',
'Physical adsorption is generally favored by:',
'high temperature',
'low temperature',
'very high activation energy',
'covalent bond formation only',
'B',
'Physisorption is exothermic and is favored at lower temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SURFACE_CHEMISTRY'
  AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SURFACE_CHEMISTRY_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_003',
'medium',
'A catalyst increases reaction rate without being:',
'heated',
'consumed permanently',
'present',
'specific',
'B',
'A catalyst is regenerated overall and is not consumed permanently.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SURFACE_CHEMISTRY'
  AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SURFACE_CHEMISTRY_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_004',
'medium',
'Colloidal particle size is generally intermediate between:',
'atoms and nuclei',
'true solutions and suspensions',
'solids and gases',
'ions and electrons',
'B',
'Colloids have particle sizes between true solutions and coarse suspensions.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SURFACE_CHEMISTRY'
  AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SURFACE_CHEMISTRY_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_005',
'challenge',
'Tyndall effect is due to:',
'absorption of light',
'scattering of light by colloidal particles',
'reflection by mirrors',
'ionization',
'B',
'Colloidal particles scatter incident light, producing the Tyndall effect.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SURFACE_CHEMISTRY'
  AND st.subtopic_code='SURFACE_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'SURFACE_CHEMISTRY_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_005';

-- PERIODICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_001',
'easy',
'Across a period, atomic radius generally:',
'increases',
'decreases',
'stays exactly constant',
'first doubles',
'B',
'Increasing effective nuclear charge generally pulls electrons closer.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PERIODICITY'
  AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PERIODICITY_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_002',
'medium',
'Ionization enthalpy generally increases across a period because:',
'atomic size increases',
'effective nuclear charge increases',
'shielding becomes infinite',
'nuclear charge decreases',
'B',
'Greater effective nuclear attraction makes electron removal harder.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PERIODICITY'
  AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PERIODICITY_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_003',
'medium',
'Which is generally the most electronegative element?',
'F',
'Cl',
'O',
'N',
'A',
'Fluorine is the most electronegative element.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PERIODICITY'
  AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PERIODICITY_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_004',
'medium',
'An alkali metal typically forms ions with charge:',
'+1',
'+2',
'-1',
'-2',
'A',
'Group 1 elements usually lose one valence electron.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PERIODICITY'
  AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PERIODICITY_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_005',
'challenge',
'Which species is smallest?',
'Na',
'Na+',
'Mg',
'Mg2+',
'D',
'Na+ and Mg2+ are isoelectronic; Mg2+ has higher nuclear charge and is smaller.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PERIODICITY'
  AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PERIODICITY_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_005';

-- HYDROGEN_S_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_001',
'easy',
'Hydrogen has how many electrons in its neutral atom?',
'0',
'1',
'2',
'8',
'B',
'Neutral hydrogen has one proton and one electron.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROGEN_S_BLOCK'
  AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROGEN_S_BLOCK_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_002',
'medium',
'Alkali metals belong to group:',
'1',
'2',
'17',
'18',
'A',
'Alkali metals are Group 1 elements.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROGEN_S_BLOCK'
  AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROGEN_S_BLOCK_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_003',
'medium',
'Alkaline earth metals generally form ions of charge:',
'+1',
'+2',
'-1',
'-2',
'B',
'Group 2 metals typically lose two valence electrons.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROGEN_S_BLOCK'
  AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROGEN_S_BLOCK_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_004',
'medium',
'Which hydride is largely ionic?',
'CH4',
'NH3',
'NaH',
'H2O',
'C',
'NaH is a saline/ionic hydride containing H-.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROGEN_S_BLOCK'
  AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROGEN_S_BLOCK_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_005',
'challenge',
'Which alkali metal is expected to have the lowest first ionization enthalpy among Li, Na and K?',
'Li',
'Na',
'K',
'all equal',
'C',
'Ionization enthalpy decreases down Group 1.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROGEN_S_BLOCK'
  AND st.subtopic_code='HYDROGEN_S_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROGEN_S_BLOCK_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_005';

-- P_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_001',
'easy',
'Group 17 elements are called:',
'alkali metals',
'halogens',
'noble gases',
'chalcogens',
'B',
'Group 17 contains the halogens.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK'
  AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'P_BLOCK_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_002',
'medium',
'Which is a noble gas?',
'Cl',
'Ar',
'S',
'P',
'B',
'Argon is a Group 18 noble gas.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK'
  AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'P_BLOCK_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_003',
'medium',
'The common oxidation state of oxygen in most compounds is:',
'+2',
'-2',
'+1',
'0 only',
'B',
'Oxygen is usually -2 except in peroxides, superoxides and a few special cases.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK'
  AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'P_BLOCK_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_004',
'medium',
'NH3 has which molecular shape?',
'trigonal planar',
'trigonal pyramidal',
'linear',
'tetrahedral',
'B',
'Three N-H bonds plus one lone pair give trigonal pyramidal shape.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK'
  AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'P_BLOCK_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_005',
'challenge',
'Which oxide is strongly acidic?',
'Na2O',
'MgO',
'SO3',
'CaO',
'C',
'SO3 is a nonmetal oxide and strongly acidic, forming H2SO4 with water.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK'
  AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'P_BLOCK_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_005';

-- D_F_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_001',
'easy',
'Transition elements are primarily found in the:',
's-block',
'p-block',
'd-block',
'f-block only',
'C',
'Transition metals occupy the d-block.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK'
  AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'D_F_BLOCK_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_002',
'medium',
'Transition-metal compounds are often colored due to:',
'd-d electronic transitions',
'nuclear decay',
'only lattice defects',
'hydrogen bonding',
'A',
'Partially filled d orbitals can absorb visible light through electronic transitions.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK'
  AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'D_F_BLOCK_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_003',
'medium',
'Which is a transition metal?',
'Na',
'Ca',
'Fe',
'Al',
'C',
'Iron is a d-block transition metal.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK'
  AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'D_F_BLOCK_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_004',
'medium',
'Lanthanides belong to the:',
'3d series',
'4f series',
'5p series',
'6d only',
'B',
'Lanthanides involve filling of 4f orbitals.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK'
  AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'D_F_BLOCK_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_005',
'challenge',
'Which oxidation state is especially common for Mn?',
'+1 only',
'+2 and +7 among others',
'-2 only',
'0 only',
'B',
'Manganese exhibits several oxidation states including +2 and +7.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK'
  AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'D_F_BLOCK_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_005';

-- COORDINATION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_001',
'easy',
'A ligand donates at least one:',
'proton only',
'electron pair',
'neutron',
'photon',
'B',
'Ligands act as Lewis bases by donating electron pairs to a metal center.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION'
  AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'COORDINATION_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_002',
'medium',
'In [Cu(NH3)4]2+, NH3 is the:',
'central metal',
'ligand',
'counter ion',
'oxidizing agent only',
'B',
'NH3 coordinates to Cu2+ as a ligand.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION'
  AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'COORDINATION_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_003',
'medium',
'The coordination number in [Co(NH3)6]3+ is:',
'3',
'4',
'6',
'9',
'C',
'Six monodentate NH3 ligands coordinate to Co.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION'
  AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'COORDINATION_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_004',
'medium',
'A complex with a single central metal ion is called:',
'mononuclear',
'polynuclear',
'ionic lattice',
'alloy',
'A',
'One metal center means mononuclear complex.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION'
  AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'COORDINATION_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_005',
'challenge',
'The oxidation state of Fe in [Fe(CN)6]4- is:',
'+1',
'+2',
'+3',
'+4',
'B',
'Let Fe=x: x+6(-1)=-4, so x=+2.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION'
  AND st.subtopic_code='COORDINATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'COORDINATION_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_005';

-- METALLURGY_QUALITATIVE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_001',
'easy',
'Concentration of an ore aims to remove:',
'metal atoms',
'gangue',
'all oxygen',
'all sulfur',
'B',
'Ore concentration removes unwanted earthy impurities called gangue.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='METALLURGY_QUALITATIVE'
  AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'METALLURGY_QUALITATIVE_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_002',
'medium',
'Calcination generally involves heating an ore in:',
'absence or limited supply of air',
'excess oxygen always',
'water only',
'vacuum only',
'A',
'Calcination is usually heating in limited or no air, often for carbonates/hydrated ores.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='METALLURGY_QUALITATIVE'
  AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'METALLURGY_QUALITATIVE_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_003',
'medium',
'Roasting is commonly used for:',
'sulfide ores',
'carbonate ores only',
'noble gases',
'aqueous salts only',
'A',
'Sulfide ores are often roasted in excess air.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='METALLURGY_QUALITATIVE'
  AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'METALLURGY_QUALITATIVE_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_004',
'medium',
'A flux is added during metallurgy to form:',
'slag with gangue',
'pure metal directly',
'electrons',
'alloy only',
'A',
'Flux reacts with gangue to form an easily removable slag.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='METALLURGY_QUALITATIVE'
  AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'METALLURGY_QUALITATIVE_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_005',
'challenge',
'In qualitative cation analysis, group precipitation is based mainly on differences in:',
'radioactivity',
'solubility products',
'atomic mass only',
'color only',
'B',
'Selective precipitation relies on differences in Ksp and reagent conditions.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='METALLURGY_QUALITATIVE'
  AND st.subtopic_code='METALLURGY_QUALITATIVE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'METALLURGY_QUALITATIVE_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_005';

-- ENVIRONMENTAL_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_001',
'easy',
'Ozone in the stratosphere mainly absorbs harmful:',
'infrared radiation',
'ultraviolet radiation',
'radio waves',
'microwaves',
'B',
'The ozone layer absorbs much of the Sun''s harmful UV radiation.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ENVIRONMENTAL_CHEMISTRY'
  AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ENVIRONMENTAL_CHEMISTRY_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_002',
'medium',
'Acid rain is mainly associated with oxides of:',
'sulfur and nitrogen',
'carbon only',
'sodium and potassium',
'helium and neon',
'A',
'SOx and NOx form acids in the atmosphere.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ENVIRONMENTAL_CHEMISTRY'
  AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ENVIRONMENTAL_CHEMISTRY_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_003',
'medium',
'A major greenhouse gas is:',
'CO2',
'He',
'Ne',
'Ar',
'A',
'Carbon dioxide is an important greenhouse gas.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ENVIRONMENTAL_CHEMISTRY'
  AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ENVIRONMENTAL_CHEMISTRY_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_004',
'medium',
'Photochemical smog commonly forms in the presence of sunlight from NOx and:',
'hydrocarbons/VOCs',
'noble gases',
'NaCl',
'water alone',
'A',
'NOx and volatile organic compounds react under sunlight to form photochemical smog.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ENVIRONMENTAL_CHEMISTRY'
  AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ENVIRONMENTAL_CHEMISTRY_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_005',
'challenge',
'Eutrophication of lakes is commonly caused by excess:',
'nutrients such as nitrates and phosphates',
'oxygen only',
'noble gases',
'silica only',
'A',
'Nutrient enrichment can trigger algal blooms and oxygen depletion.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ENVIRONMENTAL_CHEMISTRY'
  AND st.subtopic_code='ENVIRONMENTAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ENVIRONMENTAL_CHEMISTRY_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_005';

-- ORGANIC_PRINCIPLES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_001',
'easy',
'Carbon in methane is:',
'sp hybridized',
'sp2 hybridized',
'sp3 hybridized',
'unhybridized',
'C',
'CH4 has four sigma bonds in tetrahedral geometry, corresponding to sp3 hybridization.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_PRINCIPLES'
  AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ORGANIC_PRINCIPLES_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_002',
'medium',
'An electrophile is generally an electron-pair:',
'donor',
'acceptor',
'neutral atom only',
'radical only',
'B',
'Electrophiles accept electron pairs.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_PRINCIPLES'
  AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ORGANIC_PRINCIPLES_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_003',
'medium',
'A nucleophile is generally an electron-pair:',
'acceptor',
'donor',
'proton only',
'neutron donor',
'B',
'Nucleophiles donate electron pairs.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_PRINCIPLES'
  AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ORGANIC_PRINCIPLES_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_004',
'medium',
'Inductive effect is transmitted primarily through:',
'sigma bonds',
'pi bonds only',
'hydrogen bonds',
'ionic lattice only',
'A',
'The inductive effect is polarization transmitted through sigma bonds.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_PRINCIPLES'
  AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ORGANIC_PRINCIPLES_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_005',
'challenge',
'Which carbocation is generally most stable?',
'methyl',
'primary',
'secondary',
'tertiary',
'D',
'Hyperconjugation and +I effects generally stabilize tertiary carbocations most.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_PRINCIPLES'
  AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'ORGANIC_PRINCIPLES_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_005';

-- HYDROCARBONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_001',
'easy',
'The general formula of an acyclic alkane is:',
'CnH2n+2',
'CnH2n',
'CnH2n-2',
'CnHn',
'A',
'Saturated open-chain alkanes have formula CnH2n+2.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROCARBONS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_002',
'medium',
'Ethene contains a carbon-carbon:',
'single bond',
'double bond',
'triple bond',
'ionic bond',
'B',
'Ethene is an alkene with a C=C double bond.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROCARBONS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_003',
'medium',
'Benzene undergoes mainly:',
'addition',
'electrophilic substitution',
'nucleophilic addition only',
'polymerization only',
'B',
'Aromatic stabilization favors electrophilic substitution over addition.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROCARBONS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_004',
'medium',
'Hydrogenation of an alkene produces an:',
'alkane',
'alkyne',
'alcohol',
'ketone',
'A',
'Adding H2 across C=C converts an alkene to an alkane.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROCARBONS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_005',
'challenge',
'Which reagent can distinguish an alkene from an alkane under ordinary test conditions?',
'bromine water',
'NaCl solution',
'distilled water',
'NH4Cl solution',
'A',
'Alkenes decolorize bromine solution by addition across the double bond.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HYDROCARBONS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_005';

-- HALOGEN_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_001',
'easy',
'Chloroethane is an example of a:',
'haloalkane',
'alcohol',
'aldehyde',
'ketone',
'A',
'It is an alkane derivative containing a halogen substituent.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HALOGEN_COMPOUNDS'
  AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HALOGEN_COMPOUNDS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_002',
'medium',
'In an SN2 reaction, the nucleophile attacks the carbon:',
'from the same side as leaving group',
'from the backside',
'without bond formation',
'after carbocation formation',
'B',
'SN2 proceeds by concerted backside attack.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HALOGEN_COMPOUNDS'
  AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HALOGEN_COMPOUNDS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_003',
'medium',
'SN1 reactions are favored by formation of a relatively stable:',
'carbanion',
'carbocation',
'radical only',
'alkene only',
'B',
'SN1 involves ionization to a carbocation intermediate.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HALOGEN_COMPOUNDS'
  AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HALOGEN_COMPOUNDS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_004',
'medium',
'Alkyl halides react with aqueous KOH mainly to form:',
'alcohols',
'alkenes only',
'aldehydes',
'amines',
'A',
'Aqueous hydroxide promotes nucleophilic substitution to alcohol.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HALOGEN_COMPOUNDS'
  AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HALOGEN_COMPOUNDS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_005',
'challenge',
'Which substrate generally reacts fastest by SN1?',
'methyl chloride',
'ethyl chloride',
'tert-butyl chloride',
'vinyl chloride',
'C',
'A tertiary carbocation is much more stable than primary or methyl carbocations.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HALOGEN_COMPOUNDS'
  AND st.subtopic_code='HALOGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'HALOGEN_COMPOUNDS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HALOGEN_COMPOUNDS_005';

-- OXYGEN_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_001',
'easy',
'The functional group in an alcohol is:',
'-CHO',
'-OH',
'-COOH',
'-NH2',
'B',
'Alcohols contain a hydroxyl (-OH) group.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='OXYGEN_COMPOUNDS'
  AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OXYGEN_COMPOUNDS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_002',
'medium',
'Oxidation of a primary alcohol commonly first gives an:',
'aldehyde',
'ketone',
'alkane',
'amine',
'A',
'Primary alcohols can oxidize first to aldehydes.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='OXYGEN_COMPOUNDS'
  AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OXYGEN_COMPOUNDS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_003',
'medium',
'A ketone contains the group:',
'R-CO-R''',
'R-CHO',
'R-OH',
'R-NH2',
'A',
'Ketones contain a carbonyl group bonded to two carbon groups.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='OXYGEN_COMPOUNDS'
  AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OXYGEN_COMPOUNDS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_004',
'medium',
'Carboxylic acids contain the functional group:',
'-COOH',
'-OH only',
'-CN',
'-O-',
'A',
'The carboxyl group is -COOH.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='OXYGEN_COMPOUNDS'
  AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OXYGEN_COMPOUNDS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_005',
'challenge',
'Which compound gives a positive Tollens'' test?',
'propanone',
'ethanal',
'ethene',
'ethanol only',
'B',
'Aldehydes such as ethanal reduce Tollens'' reagent to metallic silver.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='OXYGEN_COMPOUNDS'
  AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'OXYGEN_COMPOUNDS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_OXYGEN_COMPOUNDS_005';

-- NITROGEN_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_001',
'easy',
'The functional group in a primary amine is:',
'-NH2',
'-NO2',
'-CN',
'-CONH2 only',
'A',
'Primary amines contain an amino group, -NH2.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='NITROGEN_COMPOUNDS'
  AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'NITROGEN_COMPOUNDS_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_002',
'medium',
'Aniline is an aromatic:',
'alcohol',
'amine',
'aldehyde',
'acid',
'B',
'Aniline is aminobenzene, C6H5NH2.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='NITROGEN_COMPOUNDS'
  AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'NITROGEN_COMPOUNDS_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_003',
'medium',
'Diazotization of an aromatic primary amine usually uses NaNO2 and:',
'HCl at low temperature',
'NaOH at high temperature',
'H2SO4 at 200°C',
'NH3 only',
'A',
'Nitrous acid generated from NaNO2/HCl forms diazonium salts at low temperature.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='NITROGEN_COMPOUNDS'
  AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'NITROGEN_COMPOUNDS_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_004',
'medium',
'A nitrile contains the group:',
'-C≡N',
'-N=N-',
'-NH2',
'-NO2',
'A',
'The cyano/nitrile group is -C≡N.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='NITROGEN_COMPOUNDS'
  AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'NITROGEN_COMPOUNDS_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_005',
'challenge',
'Which is generally more basic in aqueous solution?',
'aniline',
'methylamine',
'nitrobenzene',
'benzene',
'B',
'The lone pair on aniline is delocalized into the ring, reducing basicity relative to aliphatic amines such as methylamine.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='NITROGEN_COMPOUNDS'
  AND st.subtopic_code='NITROGEN_COMPOUNDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'NITROGEN_COMPOUNDS_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_NITROGEN_COMPOUNDS_005';

-- BIOMOLECULES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_001',
'easy',
'Glucose is a:',
'carbohydrate',
'protein',
'lipid only',
'nucleic acid',
'A',
'Glucose is a monosaccharide carbohydrate.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BIOMOLECULES'
  AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BIOMOLECULES_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_002',
'medium',
'Proteins are polymers of:',
'amino acids',
'nucleotides',
'monosaccharides',
'fatty acids only',
'A',
'Proteins are polypeptides built from amino acids.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BIOMOLECULES'
  AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BIOMOLECULES_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_003',
'medium',
'DNA contains the sugar:',
'ribose',
'deoxyribose',
'glucose',
'fructose',
'B',
'DNA contains 2-deoxyribose.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BIOMOLECULES'
  AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BIOMOLECULES_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_004',
'medium',
'Enzymes are generally:',
'biological catalysts',
'simple salts only',
'noble gases',
'metals only',
'A',
'Enzymes accelerate biochemical reactions.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BIOMOLECULES'
  AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BIOMOLECULES_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_005',
'challenge',
'Which base is present in RNA but not in DNA?',
'thymine',
'uracil',
'adenine',
'cytosine',
'B',
'RNA uses uracil in place of thymine.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BIOMOLECULES'
  AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'BIOMOLECULES_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BIOMOLECULES_005';

-- POLYMERS_EVERYDAY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_001',
'easy',
'Polyethylene is formed from the monomer:',
'ethene',
'ethyne',
'benzene',
'methane',
'A',
'Addition polymerization of ethene gives polyethylene.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='POLYMERS_EVERYDAY'
  AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'POLYMERS_EVERYDAY_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_002',
'medium',
'Nylon is classified as a:',
'polyamide',
'polyester',
'polyalkene',
'polysaccharide',
'A',
'Nylons contain amide linkages in the polymer chain.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='POLYMERS_EVERYDAY'
  AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'POLYMERS_EVERYDAY_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_003',
'medium',
'Bakelite is a:',
'thermosetting polymer',
'thermoplastic only',
'natural rubber',
'protein',
'A',
'Bakelite is a cross-linked thermosetting phenol-formaldehyde resin.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='POLYMERS_EVERYDAY'
  AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'POLYMERS_EVERYDAY_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_004',
'medium',
'PVC is made from:',
'vinyl chloride',
'vinyl alcohol',
'ethylene glycol',
'styrene only',
'A',
'Polyvinyl chloride is produced from vinyl chloride monomer.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='POLYMERS_EVERYDAY'
  AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'POLYMERS_EVERYDAY_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_005',
'challenge',
'Which polymer is formed by condensation polymerization?',
'polyethylene',
'PVC',
'nylon-6,6',
'polystyrene',
'C',
'Nylon-6,6 forms by condensation of a diamine and a dicarboxylic acid.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='POLYMERS_EVERYDAY'
  AND st.subtopic_code='POLYMERS_EVERYDAY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'POLYMERS_EVERYDAY_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_POLYMERS_EVERYDAY_005';

-- PRACTICAL_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_001',
'easy',
'A burette is commonly used to deliver:',
'a measured variable volume of solution',
'solid samples',
'gases only',
'fixed 25 mL only',
'A',
'Burettes accurately deliver variable liquid volumes, especially in titration.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PRACTICAL_CHEMISTRY'
  AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PRACTICAL_CHEMISTRY_STARTER_01',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_002',
'medium',
'Phenolphthalein is commonly used as an:',
'acid-base indicator',
'oxidizing agent',
'reducing agent',
'salt bridge',
'A',
'Phenolphthalein changes color over a characteristic pH range.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PRACTICAL_CHEMISTRY'
  AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PRACTICAL_CHEMISTRY_STARTER_02',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_003',
'medium',
'During titration, the conical flask is swirled mainly to:',
'mix reactants uniformly',
'increase concentration',
'cool the solution only',
'change indicator chemistry',
'A',
'Swirling ensures thorough mixing as titrant is added.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PRACTICAL_CHEMISTRY'
  AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PRACTICAL_CHEMISTRY_STARTER_03',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_004',
'medium',
'A precipitate is best separated from a liquid by:',
'filtration',
'distillation only',
'sublimation',
'chromatography only',
'A',
'Filtration separates an insoluble solid from a liquid.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PRACTICAL_CHEMISTRY'
  AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PRACTICAL_CHEMISTRY_STARTER_04',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_005',
'challenge',
'In paper chromatography, separation occurs because components differ in their:',
'relative affinity for stationary and mobile phases',
'atomic number only',
'nuclear charge only',
'boiling point alone',
'A',
'Different partition/adsorption behavior causes components to travel different distances.',
1,
'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PRACTICAL_CHEMISTRY'
  AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,
'BOTH',
'SINGLE_CHOICE',
'JEE_2026',
'REVIEWED',
'PRACTICAL_CHEMISTRY_STARTER_05',
'GYAN JEE rebuild starter bank'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PRACTICAL_CHEMISTRY_005';
