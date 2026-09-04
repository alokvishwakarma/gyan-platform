-- 0096_neet_2026_core_subtopics_and_starters.sql
-- Creates one CORE subtopic for every NEET 2026 topic.
-- Seeds 5 starter questions in Kinematics, Basic Concepts Chemistry,
-- and Cell Structure & Function to verify the full NEET practice pipeline.
PRAGMA foreign_keys = ON;

-- ================================================================
-- PHYSICS CORE SUBTOPICS
-- ================================================================

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PHYSICS_AND_MEASUREMENT_CORE',
  'Physics and Measurement',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'PHYSICS_AND_MEASUREMENT';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'KINEMATICS_CORE',
  'Kinematics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINEMATICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'LAWS_OF_MOTION_CORE',
  'Laws of Motion',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'LAWS_OF_MOTION';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'WORK_ENERGY_POWER_CORE',
  'Work, Energy and Power',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'WORK_ENERGY_POWER';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ROTATIONAL_MOTION_CORE',
  'Rotational Motion',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ROTATIONAL_MOTION';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'GRAVITATION_CORE',
  'Gravitation',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'GRAVITATION';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PROPERTIES_OF_SOLIDS_LIQUIDS_CORE',
  'Properties of Solids and Liquids',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'PROPERTIES_OF_SOLIDS_LIQUIDS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'THERMODYNAMICS_CORE',
  'Thermodynamics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'THERMODYNAMICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'KINETIC_THEORY_OF_GASES_CORE',
  'Kinetic Theory of Gases',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINETIC_THEORY_OF_GASES';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'OSCILLATIONS_AND_WAVES_CORE',
  'Oscillations and Waves',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'OSCILLATIONS_AND_WAVES';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ELECTROSTATICS_CORE',
  'Electrostatics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ELECTROSTATICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CURRENT_ELECTRICITY_CORE',
  'Current Electricity',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'CURRENT_ELECTRICITY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'MAGNETIC_EFFECTS_AND_MAGNETISM_CORE',
  'Magnetic Effects of Current and Magnetism',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'MAGNETIC_EFFECTS_AND_MAGNETISM';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ELECTROMAGNETIC_INDUCTION_AC_CORE',
  'Electromagnetic Induction and Alternating Currents',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ELECTROMAGNETIC_INDUCTION_AC';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ELECTROMAGNETIC_WAVES_CORE',
  'Electromagnetic Waves',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ELECTROMAGNETIC_WAVES';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'OPTICS_CORE',
  'Optics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'OPTICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'DUAL_NATURE_CORE',
  'Dual Nature of Matter and Radiation',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'DUAL_NATURE';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ATOMS_AND_NUCLEI_CORE',
  'Atoms and Nuclei',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ATOMS_AND_NUCLEI';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ELECTRONIC_DEVICES_CORE',
  'Electronic Devices',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'ELECTRONIC_DEVICES';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'EXPERIMENTAL_SKILLS_CORE',
  'Experimental Skills',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'EXPERIMENTAL_SKILLS';

-- ================================================================
-- CHEMISTRY CORE SUBTOPICS
-- ================================================================

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'SOME_BASIC_CONCEPTS_CHEMISTRY_CORE',
  'Some Basic Concepts in Chemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ATOMIC_STRUCTURE_CORE',
  'Atomic Structure',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'ATOMIC_STRUCTURE';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CHEMICAL_BONDING_CORE',
  'Chemical Bonding and Molecular Structure',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'CHEMICAL_BONDING';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CHEMICAL_THERMODYNAMICS_CORE',
  'Chemical Thermodynamics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'CHEMICAL_THERMODYNAMICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'SOLUTIONS_CORE',
  'Solutions',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOLUTIONS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'EQUILIBRIUM_CORE',
  'Equilibrium',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'EQUILIBRIUM';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'REDOX_ELECTROCHEMISTRY_CORE',
  'Redox Reactions and Electrochemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'REDOX_ELECTROCHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CHEMICAL_KINETICS_CORE',
  'Chemical Kinetics',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'CHEMICAL_KINETICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CLASSIFICATION_PERIODICITY_CORE',
  'Classification of Elements and Periodicity in Properties',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'CLASSIFICATION_PERIODICITY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'P_BLOCK_ELEMENTS_CORE',
  'P-Block Elements',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'P_BLOCK_ELEMENTS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'D_F_BLOCK_ELEMENTS_CORE',
  'd- and f-Block Elements',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'D_F_BLOCK_ELEMENTS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'COORDINATION_COMPOUNDS_CORE',
  'Coordination Compounds',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'COORDINATION_COMPOUNDS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PURIFICATION_ORGANIC_CORE',
  'Purification and Characterisation of Organic Compounds',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PURIFICATION_ORGANIC';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'BASIC_PRINCIPLES_ORGANIC_CORE',
  'Some Basic Principles of Organic Chemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'BASIC_PRINCIPLES_ORGANIC';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'HYDROCARBONS_CORE',
  'Hydrocarbons',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'HYDROCARBONS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ORGANIC_HALOGENS_CORE',
  'Organic Compounds Containing Halogens',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'ORGANIC_HALOGENS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ORGANIC_OXYGEN_CORE',
  'Organic Compounds Containing Oxygen',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'ORGANIC_OXYGEN';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ORGANIC_NITROGEN_CORE',
  'Organic Compounds Containing Nitrogen',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'ORGANIC_NITROGEN';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'BIOMOLECULES_CORE',
  'Biomolecules',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'BIOMOLECULES';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PRACTICAL_CHEMISTRY_CORE',
  'Principles Related to Practical Chemistry',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'PRACTICAL_CHEMISTRY';

-- ================================================================
-- BIOLOGY CORE SUBTOPICS
-- ================================================================

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'DIVERSITY_IN_LIVING_WORLD_CORE',
  'Diversity in Living World',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'DIVERSITY_IN_LIVING_WORLD';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'STRUCTURAL_ORGANISATION_CORE',
  'Structural Organisation in Animals and Plants',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'STRUCTURAL_ORGANISATION';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'CELL_STRUCTURE_FUNCTION_CORE',
  'Cell Structure and Function',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'PLANT_PHYSIOLOGY_CORE',
  'Plant Physiology',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'PLANT_PHYSIOLOGY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'HUMAN_PHYSIOLOGY_CORE',
  'Human Physiology',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'HUMAN_PHYSIOLOGY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'REPRODUCTION_CORE',
  'Reproduction',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'REPRODUCTION';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'GENETICS_AND_EVOLUTION_CORE',
  'Genetics and Evolution',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'GENETICS_AND_EVOLUTION';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'BIOLOGY_HUMAN_WELFARE_CORE',
  'Biology and Human Welfare',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOLOGY_HUMAN_WELFARE';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'BIOTECHNOLOGY_CORE',
  'Biotechnology and Its Applications',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'BIOTECHNOLOGY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, sort_order, enabled)
SELECT
  t.id,
  'ECOLOGY_ENVIRONMENT_CORE',
  'Ecology and Environment',
  1,
  1
FROM education_topics t
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'ECOLOGY_ENVIRONMENT';

-- ================================================================
-- STARTER QUESTIONS: PHYSICS / KINEMATICS
-- ================================================================

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_001',
  'easy',
  'A car moves with constant speed 20 m/s for 5 s. What distance does it cover?',
  '4 m',
  '25 m',
  '100 m',
  '400 m',
  'C',
  'For uniform motion, distance = speed × time = 20 × 5 = 100 m.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINEMATICS'
  AND st.subtopic_code = 'KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'KINEMATICS_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_002',
  'easy',
  'The slope of a displacement-time graph represents:',
  'Acceleration',
  'Velocity',
  'Force',
  'Momentum',
  'B',
  'The rate of change of displacement with time is velocity.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINEMATICS'
  AND st.subtopic_code = 'KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'KINEMATICS_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_003',
  'medium',
  'An object starts from rest and accelerates uniformly at 2 m/s² for 4 s. Its final speed is:',
  '2 m/s',
  '4 m/s',
  '8 m/s',
  '16 m/s',
  'C',
  'Using v = u + at, v = 0 + 2 × 4 = 8 m/s.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINEMATICS'
  AND st.subtopic_code = 'KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'KINEMATICS_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_004',
  'medium',
  'A projectile is launched horizontally from a height. Neglecting air resistance, its horizontal acceleration is:',
  'g',
  'g/2',
  'Zero',
  'Dependent on speed',
  'C',
  'Gravity acts vertically, so horizontal acceleration is zero.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINEMATICS'
  AND st.subtopic_code = 'KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'KINEMATICS_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_005',
  'medium',
  'For uniform circular motion, which quantity continuously changes?',
  'Speed only',
  'Velocity direction',
  'Mass',
  'Time period',
  'B',
  'The speed may remain constant, but the direction of velocity continuously changes.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'PHYSICS'
  AND t.topic_code = 'KINEMATICS'
  AND st.subtopic_code = 'KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'KINEMATICS_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_005';

-- ================================================================
-- STARTER QUESTIONS: CHEMISTRY / SOME_BASIC_CONCEPTS_CHEMISTRY
-- ================================================================

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_001',
  'easy',
  'One mole of any substance contains approximately:',
  '3.011 × 10²³ entities',
  '6.022 × 10²³ entities',
  '9.8 × 10²³ entities',
  '1.602 × 10⁻¹⁹ entities',
  'B',
  'One mole contains Avogadro''s number, approximately 6.022 × 10²³ entities.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'SOME_BASIC_CONCEPTS_CHEMISTRY_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_002',
  'easy',
  'The molar mass of O₂ is approximately:',
  '16 g/mol',
  '18 g/mol',
  '32 g/mol',
  '64 g/mol',
  'C',
  'An oxygen atom is about 16 u, so O₂ has molar mass about 32 g/mol.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'SOME_BASIC_CONCEPTS_CHEMISTRY_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_003',
  'medium',
  'How many moles are present in 18 g of water (H₂O), whose molar mass is 18 g/mol?',
  '0.5 mol',
  '1 mol',
  '2 mol',
  '18 mol',
  'B',
  'Moles = mass / molar mass = 18 / 18 = 1 mol.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'SOME_BASIC_CONCEPTS_CHEMISTRY_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_004',
  'medium',
  'Which law states that mass is neither created nor destroyed in a chemical reaction?',
  'Law of multiple proportions',
  'Law of conservation of mass',
  'Avogadro''s law',
  'Boyle''s law',
  'B',
  'The law of conservation of mass states that total mass remains constant during a chemical reaction.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'SOME_BASIC_CONCEPTS_CHEMISTRY_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_005',
  'medium',
  'If 2 mol of H₂ reacts completely according to 2H₂ + O₂ → 2H₂O, how many moles of H₂O form?',
  '1 mol',
  '2 mol',
  '3 mol',
  '4 mol',
  'B',
  'The coefficients show a 2:2 mole ratio between H₂ and H₂O.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'CHEMISTRY'
  AND t.topic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code = 'SOME_BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'SOME_BASIC_CONCEPTS_CHEMISTRY_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_005';

-- ================================================================
-- STARTER QUESTIONS: BIOLOGY / CELL_STRUCTURE_FUNCTION
-- ================================================================

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_001',
  'easy',
  'Which organelle is commonly called the powerhouse of the cell?',
  'Golgi apparatus',
  'Mitochondrion',
  'Lysosome',
  'Ribosome',
  'B',
  'Mitochondria generate most cellular ATP through aerobic respiration.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_01',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_002',
  'easy',
  'Ribosomes are primarily involved in:',
  'Lipid storage',
  'Protein synthesis',
  'DNA replication only',
  'Cell movement',
  'B',
  'Ribosomes translate messenger RNA to synthesize proteins.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_02',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_003',
  'medium',
  'Which structure is present in plant cells but absent in typical animal cells?',
  'Plasma membrane',
  'Ribosome',
  'Cell wall',
  'Mitochondrion',
  'C',
  'Plant cells have a cellulose cell wall outside the plasma membrane.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_03',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_004',
  'medium',
  'The fluid mosaic model describes the structure of the:',
  'Cell wall',
  'Plasma membrane',
  'Nucleolus',
  'Chromosome',
  'B',
  'The fluid mosaic model describes proteins embedded in a dynamic phospholipid bilayer.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_04',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_005',
  'medium',
  'Which organelle contains hydrolytic enzymes used in intracellular digestion?',
  'Lysosome',
  'Centrosome',
  'Nucleolus',
  'Smooth ER',
  'A',
  'Lysosomes contain hydrolytic enzymes that digest macromolecules and cellular debris.',
  1,
  'neet-starter-v1'
FROM education_subtopics st
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
  AND s.subject_code = 'BIOLOGY'
  AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code = 'CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'REVIEWED',
  'CELL_STRUCTURE_FUNCTION_STARTER_05',
  'GYAN NEET 2026 starter bank'
FROM education_questions q
WHERE q.question_key = 'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_005';
