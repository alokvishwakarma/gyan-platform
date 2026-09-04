-- 0098_neet_2026_biology_expansion_and_mock1.sql
-- Adds Biology questions 006-010 per topic, then publishes NEET Test 1 and Mini A.
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_006','medium','The five-kingdom classification was proposed by:',
       'R.H. Whittaker','Charles Darwin','Gregor Mendel','Watson and Crick',
       'A','R.H. Whittaker proposed the five-kingdom system.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','DIVERSITY_IN_LIVING_WORLD_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_007','medium','Archaebacteria differ from many eubacteria notably in their:',
       'Cell-wall and membrane chemistry','Presence of a true nucleus','Multicellular body plan','Chloroplasts',
       'A','Archaea have distinctive membrane lipids and cell-wall composition.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','DIVERSITY_IN_LIVING_WORLD_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_008','medium','Fungi obtain nutrition mainly by:',
       'Absorption after extracellular digestion','Photosynthesis','Ingestion through a mouth','Chemosynthesis only',
       'A','Fungi secrete enzymes and absorb soluble products.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','DIVERSITY_IN_LIVING_WORLD_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_009','medium','Viruses are considered acellular because they:',
       'Lack cellular organization','Always contain both DNA and RNA','Have cell walls','Perform independent metabolism',
       'A','Viruses lack cellular structure and depend on host cells.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','DIVERSITY_IN_LIVING_WORLD_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_010','medium','Lichens represent an association mainly between:',
       'A fungus and a photosynthetic partner','Two animal species','A bacterium and a virus','Two fungi only',
       'A','Lichens are mutualistic associations of fungi with algae or cyanobacteria.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  AND st.subtopic_code='DIVERSITY_IN_LIVING_WORLD_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','DIVERSITY_IN_LIVING_WORLD_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_DIVERSITY_IN_LIVING_WORLD_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_006','medium','Meristematic tissue is characterized by cells that:',
       'Actively divide','Are permanently dead','Contain no nucleus always','Transport food only',
       'A','Meristematic cells retain the ability to divide.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','STRUCTURAL_ORGANISATION_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_007','medium','Collenchyma provides support mainly through:',
       'Unevenly thickened primary walls','Lignified dead vessels only','Calcium carbonate shells','Chitinous walls',
       'A','Collenchyma cells have uneven wall thickening and provide flexible support.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','STRUCTURAL_ORGANISATION_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_008','medium','Sclerenchyma cells are typically:',
       'Dead at maturity with thick lignified walls','Living with thin walls only','Without cell walls','Photosynthetic gametes',
       'A','Sclerenchyma provides mechanical strength through thick lignified walls.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','STRUCTURAL_ORGANISATION_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_009','medium','Cardiac muscle is:',
       'Striated and involuntary','Non-striated and voluntary','Striated and voluntary only','Present only in limbs',
       'A','Cardiac muscle is striated but functions involuntarily.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','STRUCTURAL_ORGANISATION_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_010','medium','The matrix of blood is called:',
       'Plasma','Serum only','Lymph','Cytosol',
       'A','Plasma is the fluid extracellular matrix of blood.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='STRUCTURAL_ORGANISATION'
  AND st.subtopic_code='STRUCTURAL_ORGANISATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','STRUCTURAL_ORGANISATION_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_STRUCTURAL_ORGANISATION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_006','medium','The Golgi apparatus is primarily associated with:',
       'Modification and packaging of cellular products','DNA replication','ATP synthesis only','Spindle formation only',
       'A','Golgi stacks modify, sort and package proteins and lipids.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','CELL_STRUCTURE_FUNCTION_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_007','medium','Smooth endoplasmic reticulum is important in:',
       'Lipid synthesis','Ribosomal protein translation','Chromosome segregation','Cell-wall cellulose only',
       'A','Smooth ER participates prominently in lipid synthesis and detoxification.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','CELL_STRUCTURE_FUNCTION_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_008','medium','The nucleolus is the major site of:',
       'rRNA synthesis and ribosome assembly','Glycolysis','Fatty-acid oxidation','Cellulose synthesis',
       'A','The nucleolus produces rRNA and assembles ribosomal subunits.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','CELL_STRUCTURE_FUNCTION_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_009','medium','A selectively permeable membrane allows:',
       'Some substances to cross more readily than others','All substances equally','No molecules to cross','Only proteins to cross',
       'A','Selective permeability regulates molecular movement across membranes.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','CELL_STRUCTURE_FUNCTION_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_010','medium','During mitosis, sister chromatids separate during:',
       'Anaphase','Prophase','Metaphase','Telophase only',
       'A','Sister chromatids move toward opposite poles during anaphase.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  AND st.subtopic_code='CELL_STRUCTURE_FUNCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','CELL_STRUCTURE_FUNCTION_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_006','medium','The enzyme RuBisCO participates directly in:',
       'Carbon fixation in the Calvin cycle','Photolysis of water only','Glycolysis in animals','Nitrogen excretion',
       'A','RuBisCO catalyzes CO2 fixation to RuBP.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','PLANT_PHYSIOLOGY_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_007','medium','C4 plants initially fix CO2 into a four-carbon compound using:',
       'PEP carboxylase','RuBisCO only','ATP synthase','Nitrate reductase',
       'A','PEP carboxylase performs initial CO2 fixation in C4 mesophyll cells.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','PLANT_PHYSIOLOGY_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_008','medium','Water moves upward through xylem largely because of:',
       'Transpiration pull','Phloem loading only','Active pumping by every vessel element','Gravity',
       'A','Cohesion-tension generated by transpiration drives xylem ascent.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','PLANT_PHYSIOLOGY_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_009','medium','Nitrogen is absorbed by most plants mainly as:',
       'Nitrate and ammonium ions','N2 gas directly by all roots','Proteins only','Uric acid',
       'A','Plants commonly absorb inorganic nitrogen as nitrate and ammonium.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','PLANT_PHYSIOLOGY_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_010','medium','Gibberellins commonly promote:',
       'Stem elongation','Blood clotting','Antibody formation','Stomatal closure only',
       'A','Gibberellins stimulate stem elongation and several growth processes.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='PLANT_PHYSIOLOGY'
  AND st.subtopic_code='PLANT_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','PLANT_PHYSIOLOGY_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_PLANT_PHYSIOLOGY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_006','medium','The respiratory pigment haemoglobin is located mainly in:',
       'Red blood cells','Platelets','Plasma proteins only','Neurons',
       'A','Haemoglobin is concentrated in erythrocytes.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','HUMAN_PHYSIOLOGY_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_007','medium','The enzyme pepsin functions primarily in the:',
       'Stomach','Mouth','Large intestine','Kidney',
       'A','Pepsin begins substantial protein digestion in the acidic stomach.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','HUMAN_PHYSIOLOGY_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_008','medium','The loop of Henle contributes importantly to:',
       'Concentrating urine','Producing bile','Ventilating lungs','Conducting nerve impulses',
       'A','Its countercurrent arrangement helps establish the medullary osmotic gradient.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','HUMAN_PHYSIOLOGY_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_009','medium','The neurotransmitter is released from a neuron at the:',
       'Synaptic terminal','Myelin sheath only','Nucleolus','Centromere',
       'A','Synaptic vesicles release neurotransmitters at axon terminals.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','HUMAN_PHYSIOLOGY_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_010','medium','Thyroxine is secreted by the:',
       'Thyroid gland','Pancreas','Adrenal medulla','Pituitary posterior lobe',
       'A','Thyroid follicular cells produce thyroid hormones including thyroxine.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='HUMAN_PHYSIOLOGY'
  AND st.subtopic_code='HUMAN_PHYSIOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','HUMAN_PHYSIOLOGY_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_006','medium','Spermatogenesis occurs in the:',
       'Seminiferous tubules','Prostate gland','Ureter','Epidermis',
       'A','Seminiferous tubules of the testes produce sperm.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','REPRODUCTION_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_007','medium','The corpus luteum primarily secretes:',
       'Progesterone','Insulin','Adrenaline','Thyroxine',
       'A','After ovulation, the corpus luteum secretes progesterone.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','REPRODUCTION_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_008','medium','In flowering plants, the ovule develops into a:',
       'Seed','Fruit wall','Anther','Sepal',
       'A','Following fertilization, the ovule becomes the seed.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','REPRODUCTION_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_009','medium','The endosperm in most angiosperms is formed by:',
       'Triple fusion','Syngamy only','Meiosis of pollen','Vegetative propagation',
       'A','One male gamete fuses with the two polar nuclei to form primary endosperm nucleus.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','REPRODUCTION_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_010','medium','Amniocentesis involves sampling:',
       'Amniotic fluid','Bone marrow only','Saliva only','Gastric juice',
       'A','Amniotic fluid contains fetal cells and biochemical markers.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='REPRODUCTION'
  AND st.subtopic_code='REPRODUCTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','REPRODUCTION_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_006','medium','A test cross is performed by crossing an individual of unknown genotype with a:',
       'Homozygous recessive individual','Homozygous dominant individual only','Heterozygote only','Different species',
       'A','A recessive tester reveals the genotype through offspring ratios.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','GENETICS_AND_EVOLUTION_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_007','medium','The genetic code is called degenerate because:',
       'More than one codon can specify the same amino acid','One codon always specifies many amino acids','Codons contain proteins','It changes in every cell',
       'A','Several amino acids are encoded by multiple synonymous codons.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','GENETICS_AND_EVOLUTION_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_008','medium','Crossing over occurs during:',
       'Prophase I of meiosis','Anaphase of mitosis only','G1 phase','Cytokinesis',
       'A','Homologous chromosomes exchange segments during pachytene of prophase I.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','GENETICS_AND_EVOLUTION_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_009','medium','Hardy-Weinberg equilibrium assumes, among other conditions:',
       'Random mating and no strong evolutionary forces','Only mutation','Only natural selection','No reproduction',
       'A','The equilibrium model assumes random mating and absence of forces changing allele frequencies.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','GENETICS_AND_EVOLUTION_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_010','medium','Analogous structures are usually associated with:',
       'Convergent evolution','Divergent evolution only','Identical ancestry and function','No adaptation',
       'A','Similar functions can evolve independently in unrelated lineages.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='GENETICS_AND_EVOLUTION'
  AND st.subtopic_code='GENETICS_AND_EVOLUTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','GENETICS_AND_EVOLUTION_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_GENETICS_AND_EVOLUTION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_006','medium','Antibodies are produced by differentiated B cells called:',
       'Plasma cells','Neutrophils','Platelets','Erythrocytes',
       'A','Activated B lymphocytes differentiate into antibody-secreting plasma cells.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOLOGY_HUMAN_WELFARE_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_007','medium','Interferons are proteins involved mainly in defense against:',
       'Viral infections','Bone fractures','Vitamin deficiency','Dehydration only',
       'A','Interferons help establish antiviral states in cells.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOLOGY_HUMAN_WELFARE_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_008','medium','The pathogen causing typhoid is:',
       'Salmonella typhi','Plasmodium vivax','HIV','Entamoeba only',
       'A','Typhoid fever is caused by Salmonella typhi.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOLOGY_HUMAN_WELFARE_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_009','medium','Methanogens are useful in production of:',
       'Biogas','Penicillin','Insulin directly','Oxygen from water',
       'A','Methanogenic archaea generate methane in anaerobic digesters.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOLOGY_HUMAN_WELFARE_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_010','medium','Biofertilizers improve soil fertility using organisms such as:',
       'Rhizobium','Influenza virus','Tapeworm','Housefly',
       'A','Rhizobium fixes atmospheric nitrogen in legume root nodules.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  AND st.subtopic_code='BIOLOGY_HUMAN_WELFARE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOLOGY_HUMAN_WELFARE_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOLOGY_HUMAN_WELFARE_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_006','medium','DNA ligase is used in recombinant DNA work to:',
       'Join DNA fragments','Cut DNA at recognition sites','Unwind every chromosome','Translate mRNA',
       'A','DNA ligase forms phosphodiester bonds joining DNA fragments.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOTECHNOLOGY_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_007','medium','Gel electrophoresis separates DNA fragments mainly according to:',
       'Size','Color','Taste','Boiling point',
       'A','Smaller DNA fragments generally migrate faster through agarose gel.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOTECHNOLOGY_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_008','medium','A selectable marker in a cloning vector helps identify:',
       'Cells carrying the vector','Only dead cells','Only plant roots','Water molecules',
       'A','Selectable markers allow selection of successfully transformed cells.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOTECHNOLOGY_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_009','medium','Gene therapy aims to:',
       'Treat disease by modifying genetic material or gene expression','Replace all proteins with lipids','Prevent all cell division','Remove every chromosome',
       'A','Gene therapy introduces or modifies genetic information for therapeutic benefit.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOTECHNOLOGY_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_010','medium','RNA interference can reduce gene expression by targeting:',
       'Specific RNA molecules','Cellulose','ATP directly','Mineral salts',
       'A','RNAi uses small RNAs to guide silencing of complementary RNA.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='BIOTECHNOLOGY'
  AND st.subtopic_code='BIOTECHNOLOGY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','BIOTECHNOLOGY_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_006','medium','The maximum population size an environment can sustain is its:',
       'Carrying capacity','Mutation rate','Trophic level','Biotic potential only',
       'A','Carrying capacity reflects resource-limited sustainable population size.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','ECOLOGY_ENVIRONMENT_BANK_006',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_007','medium','An interaction in which both species benefit is called:',
       'Mutualism','Predation','Parasitism','Competition',
       'A','Mutualism benefits both interacting partners.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','ECOLOGY_ENVIRONMENT_BANK_007',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_008','medium','The pyramid of energy is always:',
       'Upright','Inverted','Horizontal','Absent',
       'A','Energy decreases at successive trophic levels, so the energy pyramid remains upright.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','ECOLOGY_ENVIRONMENT_BANK_008',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_009','medium','Decomposition is accelerated by conditions that are generally:',
       'Warm and moist','Extremely dry and cold','Without decomposers','Completely sterile',
       'A','Microbial decomposition is generally faster under warm, moist conditions.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','ECOLOGY_ENVIRONMENT_BANK_009',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT st.id,'IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_010','medium','In situ conservation protects species:',
       'In their natural habitats','Only in zoos','Only in seed banks','Only in laboratories',
       'A','In situ conservation preserves organisms within their natural ecosystems.',1,'neet-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND t.topic_code='ECOLOGY_ENVIRONMENT'
  AND st.subtopic_code='ECOLOGY_ENVIRONMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'NEET','SINGLE_CHOICE','NEET_2026',
       'REVIEWED','ECOLOGY_ENVIRONMENT_BANK_010',
       'GYAN NEET biology bank expansion'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_010';


INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('NEET','FULL','TEST_1','Test 1','NEET',1,'OPEN',0);

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('NEET','MINI','MINI_A','Mini A','NEET',1,'OPEN',0);

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id FROM education_mock_tests
  WHERE program_code='NEET'
    AND version=1
    AND (
      (test_kind='FULL' AND test_code='TEST_1' AND exam_level='NEET')
      OR
      (test_kind='MINI' AND test_code='MINI_A' AND exam_level='NEET')
    )
);


-- NEET Test 1: Physics 45, Chemistry 45, Biology 90.
WITH ranked AS (
  SELECT
    q.id AS question_id,
    s.subject_code,
    ROW_NUMBER() OVER (
      PARTITION BY s.subject_code
      ORDER BY t.sort_order, q.question_key, q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND q.active=1
),
chosen AS (
  SELECT
    question_id,
    subject_code,
    CASE
      WHEN subject_code='PHYSICS' THEN rn
      WHEN subject_code='CHEMISTRY' THEN 45 + rn
      ELSE 90 + rn
    END AS question_order
  FROM ranked
  WHERE
    (subject_code='PHYSICS' AND rn<=45)
    OR
    (subject_code='CHEMISTRY' AND rn<=45)
    OR
    (subject_code='BIOLOGY' AND rn<=90)
)
INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  c.question_id,
  c.question_order,
  c.subject_code,
  4,
  -1,
  0
FROM chosen c
JOIN education_mock_tests mt
  ON mt.program_code='NEET'
 AND mt.test_kind='FULL'
 AND mt.test_code='TEST_1'
 AND mt.exam_level='NEET'
 AND mt.version=1;


WITH topic_first AS (
  SELECT
    q.id AS question_id,
    s.subject_code,
    t.sort_order AS topic_order,
    ROW_NUMBER() OVER (
      PARTITION BY s.subject_code,t.id
      ORDER BY q.question_key,q.id
    ) AS within_topic
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN'
    AND s.grade_code='PROGRAM_NEET'
    AND s.subject_code IN ('PHYSICS','CHEMISTRY','BIOLOGY')
    AND q.active=1
),
picked AS (
  SELECT
    question_id,
    subject_code,
    ROW_NUMBER() OVER (
      PARTITION BY subject_code
      ORDER BY topic_order,question_id
    ) AS rn
  FROM topic_first
  WHERE within_topic=1
),
chosen AS (
  SELECT
    question_id,
    subject_code,
    CASE
      WHEN subject_code='PHYSICS' THEN rn
      WHEN subject_code='CHEMISTRY' THEN 5 + rn
      ELSE 10 + rn
    END AS question_order
  FROM picked
  WHERE rn<=5
)
INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  c.question_id,
  c.question_order,
  c.subject_code,
  4,
  -1,
  0
FROM chosen c
JOIN education_mock_tests mt
  ON mt.program_code='NEET'
 AND mt.test_kind='MINI'
 AND mt.test_code='MINI_A'
 AND mt.exam_level='NEET'
 AND mt.version=1;


UPDATE education_mock_tests
SET access_mode='OPEN',
    published=CASE
      WHEN test_kind='FULL' AND (
        SELECT COUNT(*) FROM education_mock_test_questions x
        WHERE x.mock_test_id=education_mock_tests.id
      )=180 THEN 1
      WHEN test_kind='MINI' AND (
        SELECT COUNT(*) FROM education_mock_test_questions x
        WHERE x.mock_test_id=education_mock_tests.id
      )=15 THEN 1
      ELSE 0
    END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET'
  AND exam_level='NEET'
  AND version=1
  AND (
    (test_kind='FULL' AND test_code='TEST_1')
    OR
    (test_kind='MINI' AND test_code='MINI_A')
  );
