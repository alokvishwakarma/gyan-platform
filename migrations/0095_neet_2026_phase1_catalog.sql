-- 0095_neet_2026_phase1_catalog.sql
-- NEET-UG 2026 subject/topic catalog for current GYAN schema.
-- Safe to rerun: inserts use WHERE NOT EXISTS.

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'IN','PROGRAM_NEET','PHYSICS','Physics',1,10
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
);

UPDATE education_subjects
SET subject_name='Physics', enabled=1, sort_order=10, updated_at=CURRENT_TIMESTAMP
WHERE country_code='IN'
  AND grade_code='PROGRAM_NEET'
  AND subject_code='PHYSICS';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'IN','PROGRAM_NEET','CHEMISTRY','Chemistry',1,20
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
);

UPDATE education_subjects
SET subject_name='Chemistry', enabled=1, sort_order=20, updated_at=CURRENT_TIMESTAMP
WHERE country_code='IN'
  AND grade_code='PROGRAM_NEET'
  AND subject_code='CHEMISTRY';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'IN','PROGRAM_NEET','BIOLOGY','Biology',1,30
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
);

UPDATE education_subjects
SET subject_name='Biology', enabled=1, sort_order=30, updated_at=CURRENT_TIMESTAMP
WHERE country_code='IN'
  AND grade_code='PROGRAM_NEET'
  AND subject_code='BIOLOGY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'PHYSICS_AND_MEASUREMENT','Physics and Measurement',1,10
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  );

UPDATE education_topics
SET topic_name='Physics and Measurement', enabled=1, sort_order=10, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='PHYSICS_AND_MEASUREMENT';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'KINEMATICS','Kinematics',1,20
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='KINEMATICS'
  );

UPDATE education_topics
SET topic_name='Kinematics', enabled=1, sort_order=20, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='KINEMATICS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'LAWS_OF_MOTION','Laws of Motion',1,30
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='LAWS_OF_MOTION'
  );

UPDATE education_topics
SET topic_name='Laws of Motion', enabled=1, sort_order=30, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='LAWS_OF_MOTION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'WORK_ENERGY_POWER','Work, Energy and Power',1,40
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='WORK_ENERGY_POWER'
  );

UPDATE education_topics
SET topic_name='Work, Energy and Power', enabled=1, sort_order=40, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='WORK_ENERGY_POWER';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ROTATIONAL_MOTION','Rotational Motion',1,50
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ROTATIONAL_MOTION'
  );

UPDATE education_topics
SET topic_name='Rotational Motion', enabled=1, sort_order=50, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='ROTATIONAL_MOTION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'GRAVITATION','Gravitation',1,60
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='GRAVITATION'
  );

UPDATE education_topics
SET topic_name='Gravitation', enabled=1, sort_order=60, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='GRAVITATION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'PROPERTIES_OF_SOLIDS_LIQUIDS','Properties of Solids and Liquids',1,70
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  );

UPDATE education_topics
SET topic_name='Properties of Solids and Liquids', enabled=1, sort_order=70, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'THERMODYNAMICS','Thermodynamics',1,80
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='THERMODYNAMICS'
  );

UPDATE education_topics
SET topic_name='Thermodynamics', enabled=1, sort_order=80, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='THERMODYNAMICS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'KINETIC_THEORY_OF_GASES','Kinetic Theory of Gases',1,90
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='KINETIC_THEORY_OF_GASES'
  );

UPDATE education_topics
SET topic_name='Kinetic Theory of Gases', enabled=1, sort_order=90, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='KINETIC_THEORY_OF_GASES';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'OSCILLATIONS_AND_WAVES','Oscillations and Waves',1,100
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='OSCILLATIONS_AND_WAVES'
  );

UPDATE education_topics
SET topic_name='Oscillations and Waves', enabled=1, sort_order=100, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='OSCILLATIONS_AND_WAVES';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ELECTROSTATICS','Electrostatics',1,110
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ELECTROSTATICS'
  );

UPDATE education_topics
SET topic_name='Electrostatics', enabled=1, sort_order=110, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='ELECTROSTATICS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'CURRENT_ELECTRICITY','Current Electricity',1,120
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='CURRENT_ELECTRICITY'
  );

UPDATE education_topics
SET topic_name='Current Electricity', enabled=1, sort_order=120, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='CURRENT_ELECTRICITY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'MAGNETIC_EFFECTS_AND_MAGNETISM','Magnetic Effects of Current and Magnetism',1,130
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  );

UPDATE education_topics
SET topic_name='Magnetic Effects of Current and Magnetism', enabled=1, sort_order=130, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ELECTROMAGNETIC_INDUCTION_AC','Electromagnetic Induction and Alternating Currents',1,140
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  );

UPDATE education_topics
SET topic_name='Electromagnetic Induction and Alternating Currents', enabled=1, sort_order=140, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='ELECTROMAGNETIC_INDUCTION_AC';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ELECTROMAGNETIC_WAVES','Electromagnetic Waves',1,150
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ELECTROMAGNETIC_WAVES'
  );

UPDATE education_topics
SET topic_name='Electromagnetic Waves', enabled=1, sort_order=150, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='ELECTROMAGNETIC_WAVES';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'OPTICS','Optics',1,160
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='OPTICS'
  );

UPDATE education_topics
SET topic_name='Optics', enabled=1, sort_order=160, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='OPTICS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'DUAL_NATURE','Dual Nature of Matter and Radiation',1,170
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='DUAL_NATURE'
  );

UPDATE education_topics
SET topic_name='Dual Nature of Matter and Radiation', enabled=1, sort_order=170, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='DUAL_NATURE';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ATOMS_AND_NUCLEI','Atoms and Nuclei',1,180
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ATOMS_AND_NUCLEI'
  );

UPDATE education_topics
SET topic_name='Atoms and Nuclei', enabled=1, sort_order=180, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='ATOMS_AND_NUCLEI';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ELECTRONIC_DEVICES','Electronic Devices',1,190
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ELECTRONIC_DEVICES'
  );

UPDATE education_topics
SET topic_name='Electronic Devices', enabled=1, sort_order=190, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='ELECTRONIC_DEVICES';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'EXPERIMENTAL_SKILLS','Experimental Skills',1,200
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='EXPERIMENTAL_SKILLS'
  );

UPDATE education_topics
SET topic_name='Experimental Skills', enabled=1, sort_order=200, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='PHYSICS'
  LIMIT 1
)
AND topic_code='EXPERIMENTAL_SKILLS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'SOME_BASIC_CONCEPTS_CHEMISTRY','Some Basic Concepts in Chemistry',1,10
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='SOME_BASIC_CONCEPTS_CHEMISTRY'
  );

UPDATE education_topics
SET topic_name='Some Basic Concepts in Chemistry', enabled=1, sort_order=10, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='SOME_BASIC_CONCEPTS_CHEMISTRY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ATOMIC_STRUCTURE','Atomic Structure',1,20
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ATOMIC_STRUCTURE'
  );

UPDATE education_topics
SET topic_name='Atomic Structure', enabled=1, sort_order=20, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='ATOMIC_STRUCTURE';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'CHEMICAL_BONDING','Chemical Bonding and Molecular Structure',1,30
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='CHEMICAL_BONDING'
  );

UPDATE education_topics
SET topic_name='Chemical Bonding and Molecular Structure', enabled=1, sort_order=30, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='CHEMICAL_BONDING';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'CHEMICAL_THERMODYNAMICS','Chemical Thermodynamics',1,40
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  );

UPDATE education_topics
SET topic_name='Chemical Thermodynamics', enabled=1, sort_order=40, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='CHEMICAL_THERMODYNAMICS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'SOLUTIONS','Solutions',1,50
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='SOLUTIONS'
  );

UPDATE education_topics
SET topic_name='Solutions', enabled=1, sort_order=50, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='SOLUTIONS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'EQUILIBRIUM','Equilibrium',1,60
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='EQUILIBRIUM'
  );

UPDATE education_topics
SET topic_name='Equilibrium', enabled=1, sort_order=60, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='EQUILIBRIUM';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'REDOX_ELECTROCHEMISTRY','Redox Reactions and Electrochemistry',1,70
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  );

UPDATE education_topics
SET topic_name='Redox Reactions and Electrochemistry', enabled=1, sort_order=70, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='REDOX_ELECTROCHEMISTRY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'CHEMICAL_KINETICS','Chemical Kinetics',1,80
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='CHEMICAL_KINETICS'
  );

UPDATE education_topics
SET topic_name='Chemical Kinetics', enabled=1, sort_order=80, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='CHEMICAL_KINETICS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'CLASSIFICATION_PERIODICITY','Classification of Elements and Periodicity in Properties',1,90
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='CLASSIFICATION_PERIODICITY'
  );

UPDATE education_topics
SET topic_name='Classification of Elements and Periodicity in Properties', enabled=1, sort_order=90, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='CLASSIFICATION_PERIODICITY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'P_BLOCK_ELEMENTS','P-Block Elements',1,100
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='P_BLOCK_ELEMENTS'
  );

UPDATE education_topics
SET topic_name='P-Block Elements', enabled=1, sort_order=100, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='P_BLOCK_ELEMENTS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'D_F_BLOCK_ELEMENTS','d- and f-Block Elements',1,110
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='D_F_BLOCK_ELEMENTS'
  );

UPDATE education_topics
SET topic_name='d- and f-Block Elements', enabled=1, sort_order=110, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='D_F_BLOCK_ELEMENTS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'COORDINATION_COMPOUNDS','Coordination Compounds',1,120
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='COORDINATION_COMPOUNDS'
  );

UPDATE education_topics
SET topic_name='Coordination Compounds', enabled=1, sort_order=120, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='COORDINATION_COMPOUNDS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'PURIFICATION_ORGANIC','Purification and Characterisation of Organic Compounds',1,130
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='PURIFICATION_ORGANIC'
  );

UPDATE education_topics
SET topic_name='Purification and Characterisation of Organic Compounds', enabled=1, sort_order=130, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='PURIFICATION_ORGANIC';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'BASIC_PRINCIPLES_ORGANIC','Some Basic Principles of Organic Chemistry',1,140
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='BASIC_PRINCIPLES_ORGANIC'
  );

UPDATE education_topics
SET topic_name='Some Basic Principles of Organic Chemistry', enabled=1, sort_order=140, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='BASIC_PRINCIPLES_ORGANIC';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'HYDROCARBONS','Hydrocarbons',1,150
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='HYDROCARBONS'
  );

UPDATE education_topics
SET topic_name='Hydrocarbons', enabled=1, sort_order=150, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='HYDROCARBONS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ORGANIC_HALOGENS','Organic Compounds Containing Halogens',1,160
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ORGANIC_HALOGENS'
  );

UPDATE education_topics
SET topic_name='Organic Compounds Containing Halogens', enabled=1, sort_order=160, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='ORGANIC_HALOGENS';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ORGANIC_OXYGEN','Organic Compounds Containing Oxygen',1,170
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ORGANIC_OXYGEN'
  );

UPDATE education_topics
SET topic_name='Organic Compounds Containing Oxygen', enabled=1, sort_order=170, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='ORGANIC_OXYGEN';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ORGANIC_NITROGEN','Organic Compounds Containing Nitrogen',1,180
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ORGANIC_NITROGEN'
  );

UPDATE education_topics
SET topic_name='Organic Compounds Containing Nitrogen', enabled=1, sort_order=180, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='ORGANIC_NITROGEN';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'BIOMOLECULES','Biomolecules',1,190
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='BIOMOLECULES'
  );

UPDATE education_topics
SET topic_name='Biomolecules', enabled=1, sort_order=190, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='BIOMOLECULES';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'PRACTICAL_CHEMISTRY','Principles Related to Practical Chemistry',1,200
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='CHEMISTRY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='PRACTICAL_CHEMISTRY'
  );

UPDATE education_topics
SET topic_name='Principles Related to Practical Chemistry', enabled=1, sort_order=200, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='CHEMISTRY'
  LIMIT 1
)
AND topic_code='PRACTICAL_CHEMISTRY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'DIVERSITY_IN_LIVING_WORLD','Diversity in Living World',1,10
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='DIVERSITY_IN_LIVING_WORLD'
  );

UPDATE education_topics
SET topic_name='Diversity in Living World', enabled=1, sort_order=10, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='DIVERSITY_IN_LIVING_WORLD';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'STRUCTURAL_ORGANISATION','Structural Organisation in Animals and Plants',1,20
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='STRUCTURAL_ORGANISATION'
  );

UPDATE education_topics
SET topic_name='Structural Organisation in Animals and Plants', enabled=1, sort_order=20, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='STRUCTURAL_ORGANISATION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'CELL_STRUCTURE_FUNCTION','Cell Structure and Function',1,30
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='CELL_STRUCTURE_FUNCTION'
  );

UPDATE education_topics
SET topic_name='Cell Structure and Function', enabled=1, sort_order=30, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='CELL_STRUCTURE_FUNCTION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'PLANT_PHYSIOLOGY','Plant Physiology',1,40
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='PLANT_PHYSIOLOGY'
  );

UPDATE education_topics
SET topic_name='Plant Physiology', enabled=1, sort_order=40, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='PLANT_PHYSIOLOGY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'HUMAN_PHYSIOLOGY','Human Physiology',1,50
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='HUMAN_PHYSIOLOGY'
  );

UPDATE education_topics
SET topic_name='Human Physiology', enabled=1, sort_order=50, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='HUMAN_PHYSIOLOGY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'REPRODUCTION','Reproduction',1,60
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='REPRODUCTION'
  );

UPDATE education_topics
SET topic_name='Reproduction', enabled=1, sort_order=60, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='REPRODUCTION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'GENETICS_AND_EVOLUTION','Genetics and Evolution',1,70
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='GENETICS_AND_EVOLUTION'
  );

UPDATE education_topics
SET topic_name='Genetics and Evolution', enabled=1, sort_order=70, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='GENETICS_AND_EVOLUTION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'BIOLOGY_HUMAN_WELFARE','Biology and Human Welfare',1,80
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='BIOLOGY_HUMAN_WELFARE'
  );

UPDATE education_topics
SET topic_name='Biology and Human Welfare', enabled=1, sort_order=80, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='BIOLOGY_HUMAN_WELFARE';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'BIOTECHNOLOGY','Biotechnology and Its Applications',1,90
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='BIOTECHNOLOGY'
  );

UPDATE education_topics
SET topic_name='Biotechnology and Its Applications', enabled=1, sort_order=90, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='BIOTECHNOLOGY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ECOLOGY_ENVIRONMENT','Ecology and Environment',1,100
FROM education_subjects s
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='BIOLOGY'
  AND NOT EXISTS (
    SELECT 1 FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ECOLOGY_ENVIRONMENT'
  );

UPDATE education_topics
SET topic_name='Ecology and Environment', enabled=1, sort_order=100, updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects
  WHERE country_code='IN'
    AND grade_code='PROGRAM_NEET'
    AND subject_code='BIOLOGY'
  LIMIT 1
)
AND topic_code='ECOLOGY_ENVIRONMENT';

UPDATE education_program_catalog
SET canonical_name='NEET',
    grade_code='PROGRAM_NEET',
    experience_type='CBT',
    enabled=1,
    show_questions=1,
    show_mock_tests=1,
    show_reports=1,
    duration_minutes=180,
    question_count=180,
    correct_marks=4,
    incorrect_marks=-1,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET';
