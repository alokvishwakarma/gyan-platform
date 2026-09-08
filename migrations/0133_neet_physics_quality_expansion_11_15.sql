-- 0133_neet_physics_quality_expansion_11_15.sql
-- NEET 2026 Physics quality rebuild: topics 11-15.
-- Adds 18 DRAFT questions to each topic.
-- Target: 25 active / 25 tracked per topic.
PRAGMA foreign_keys = ON;


INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_008',
  'easy',
  'The SI unit of electric charge is:',
  'coulomb','volt','ampere','farad',
  'A',
  'Electric charge is measured in coulombs.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_009',
  'easy',
  'Coulomb''s law states that the force between two point charges varies inversely as:',
  'the square of their separation','their separation','the cube of their separation','the product of their masses',
  'A',
  'For point charges, F=kq1q2/r^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_010',
  'easy',
  'Electric field at a point is defined as force per unit:',
  'positive test charge','mass','potential','current',
  'A',
  'E=F/q for a small positive test charge.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_011',
  'easy',
  'The electric field inside a conductor in electrostatic equilibrium is:',
  'zero','maximum','uniform and nonzero','infinite',
  'A',
  'Free charges rearrange until the internal electric field vanishes.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_012',
  'easy',
  'Electric potential is a:',
  'scalar quantity','vector quantity','tensor only','dimensionless quantity',
  'A',
  'Potential has magnitude but no direction.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_013',
  'easy',
  'The SI unit of electric potential is:',
  'volt','newton','tesla','weber',
  'A',
  'Potential difference is measured in volts.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_014',
  'medium',
  'Two equal positive charges are placed symmetrically about the origin. The electric field at the origin is:',
  'zero','toward either charge','infinite','along the perpendicular bisector',
  'A',
  'Equal and opposite field contributions cancel.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_015',
  'medium',
  'The electric field due to a point charge q at distance r is:',
  'kq/r^2','kq/r','kr/q','qr^2/k',
  'A',
  'E=kq/r^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_016',
  'medium',
  'The electric potential due to point charge q at distance r is:',
  'kq/r','kq/r^2','qr/k','kr/q',
  'A',
  'V=kq/r.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_017',
  'medium',
  'Work done in moving a charge along an equipotential surface is:',
  'zero','positive','negative','maximum',
  'A',
  'There is no potential difference along an equipotential surface.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_018',
  'medium',
  'The flux through a closed surface enclosing charge q is, by Gauss''s law:',
  'q/epsilon0','q epsilon0','4pi q','zero always',
  'A',
  'Gauss''s law gives integral E·dA=q_enclosed/epsilon0.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_019',
  'medium',
  'For a parallel-plate capacitor with plate area A and separation d in vacuum, capacitance is:',
  'epsilon0 A/d','epsilon0 d/A','A/(epsilon0 d)','epsilon0 Ad',
  'A',
  'C=epsilon0 A/d.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_020',
  'medium',
  'If the separation between capacitor plates is doubled, capacitance becomes:',
  'half','double','four times','unchanged',
  'A',
  'For fixed A, C is inversely proportional to d.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_021',
  'medium',
  'Energy stored in a capacitor of capacitance C at voltage V is:',
  '1/2 CV^2','CV','C/V','2CV^2',
  'A',
  'Stored electrostatic energy is U=1/2 CV^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_022',
  'medium',
  'A dielectric of relative permittivity K completely fills a capacitor. Its capacitance becomes:',
  'K times','1/K times','unchanged','K^2 times',
  'A',
  'Capacitance increases by the dielectric constant K.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_023',
  'challenge',
  'Two capacitors C and 2C are connected in series. Their equivalent capacitance is:',
  '2C/3','3C','C/3','3C/2',
  'A',
  '1/Ceq=1/C+1/(2C)=3/(2C), hence Ceq=2C/3.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_024',
  'challenge',
  'A charge q is placed at the centre of a cube. The electric flux through one face is:',
  'q/(6epsilon0)','q/epsilon0','q/(4epsilon0)','zero',
  'A',
  'By symmetry total flux q/epsilon0 is equally shared by six faces.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_025',
  'challenge',
  'A capacitor remains connected to a battery while a dielectric K is inserted fully. The stored energy becomes:',
  'K times','1/K times','unchanged','K^2 times',
  'A',
  'With fixed V, U=1/2 CV^2 and C increases by K.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROSTATICS_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROSTATICS_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_008',
  'easy',
  'Electric current is defined as rate of flow of:',
  'charge','energy','mass','potential',
  'A',
  'I=dq/dt.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_009',
  'easy',
  'The SI unit of resistance is:',
  'ohm','ampere','volt','watt',
  'A',
  'Resistance is measured in ohms.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_010',
  'easy',
  'Ohm''s law for an ohmic conductor is:',
  'V=IR','V=I/R','R=VI','I=VR',
  'A',
  'Voltage is proportional to current with resistance as constant.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_011',
  'easy',
  'Resistivity is a property mainly of the:',
  'material','length only','area only','shape only',
  'A',
  'Resistivity depends on material and temperature.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_012',
  'easy',
  'For metallic conductors, resistance generally increases when temperature:',
  'increases','decreases','remains unchanged','becomes zero',
  'A',
  'Metallic resistance usually has a positive temperature coefficient.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_013',
  'easy',
  'Electrical power in a resistor can be written as:',
  'I^2R','IR','I/R','R/I',
  'A',
  'P=VI=I^2R.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_014',
  'medium',
  'A 10 ohm resistor carries 2 A. The potential difference across it is:',
  '20 V','5 V','10 V','40 V',
  'A',
  'V=IR=2×10=20 V.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_015',
  'medium',
  'Two resistors 3 ohm and 6 ohm in series have equivalent resistance:',
  '9 ohm','2 ohm','3 ohm','18 ohm',
  'A',
  'Series resistances add.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_016',
  'medium',
  'Two resistors 3 ohm and 6 ohm in parallel have equivalent resistance:',
  '2 ohm','9 ohm','4.5 ohm','18 ohm',
  'A',
  '1/R=1/3+1/6=1/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_017',
  'medium',
  'A wire''s resistance is R. If its length doubles with same area and material, resistance becomes:',
  '2R','R/2','4R','R',
  'A',
  'R=rho L/A.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_018',
  'medium',
  'A cell of emf E and internal resistance r supplies current I. Terminal voltage during discharge is:',
  'E-Ir','E+Ir','Ir-E','E/r',
  'A',
  'Terminal voltage is reduced by the internal drop Ir.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_019',
  'medium',
  'Kirchhoff''s junction rule follows conservation of:',
  'charge','energy','momentum','mass',
  'A',
  'The algebraic sum of currents at a node is zero due to charge conservation.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_020',
  'medium',
  'Kirchhoff''s loop rule follows conservation of:',
  'energy','charge','mass','momentum',
  'A',
  'The algebraic sum of potential changes around a closed loop is zero.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_021',
  'medium',
  'Drift velocity of electrons in a metal is proportional to:',
  'electric field','resistivity only','wire length only','temperature only',
  'A',
  'v_d is proportional to electric field for ohmic conduction.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_022',
  'medium',
  'Current density J is related to drift velocity v_d by:',
  'J=nqv_d','J=q/(nv_d)','J=nv_d/q','J=nq/v_d',
  'A',
  'J=nqv_d in magnitude.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_023',
  'challenge',
  'A 12 V battery with internal resistance 1 ohm is connected to 5 ohm external resistance. Current is:',
  '2 A','3 A','1 A','6 A',
  'A',
  'I=E/(R+r)=12/6=2 A.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_024',
  'challenge',
  'Three identical resistors R are connected so two are parallel and this combination is in series with the third. Equivalent resistance is:',
  '3R/2','R/3','2R','R/2',
  'A',
  'Parallel pair gives R/2, then add R to get 3R/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_025',
  'challenge',
  'A wire of resistance R is stretched to twice its original length, volume constant. New resistance is:',
  '4R','2R','R/2','R',
  'A',
  'Area halves when length doubles; R''=rho(2L)/(A/2)=4R.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'CURRENT_ELECTRICITY_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_CURRENT_ELECTRICITY_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_008',
  'easy',
  'The SI unit of magnetic field is:',
  'tesla','weber','henry','gauss',
  'A',
  'Magnetic flux density B is measured in tesla.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_009',
  'easy',
  'A moving charge in a magnetic field experiences force qvB sin theta. The force is zero when velocity is:',
  'parallel to the field','perpendicular to the field','at 45 degrees','opposite to charge sign',
  'A',
  'sin theta is zero for parallel or antiparallel motion.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_010',
  'easy',
  'The magnetic force on a charged particle is always perpendicular to its:',
  'instantaneous velocity','mass','charge','energy',
  'A',
  'Lorentz magnetic force q(v×B) is perpendicular to v.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_011',
  'easy',
  'A current-carrying straight wire produces magnetic field lines that are:',
  'concentric circles','radial straight lines','ellipses only','parallel lines',
  'A',
  'Around a long straight wire, field lines are circular.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_012',
  'easy',
  'The magnetic field at the centre of a circular loop carrying current I is proportional to:',
  'I/R','IR','R/I','I R^2',
  'A',
  'For one turn, B=mu0 I/(2R).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_013',
  'easy',
  'A freely suspended bar magnet aligns approximately along:',
  'Earth''s magnetic north-south direction','east-west direction','vertical only','any random direction',
  'A',
  'Earth''s field exerts a torque aligning the magnet.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_014',
  'medium',
  'Force on a straight wire of length L carrying current I in field B at angle theta is:',
  'BIL sin theta','BIL cos theta','BI/L','BL/I',
  'A',
  'Magnetic force on a current element is I L×B.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_015',
  'medium',
  'A charge q moves perpendicular to uniform B with speed v. Radius of circular path is:',
  'mv/(qB)','qB/(mv)','mB/(qv)','qv/(mB)',
  'A',
  'Magnetic force provides centripetal force: qvB=mv^2/r.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_016',
  'medium',
  'Cyclotron frequency of a particle of charge q and mass m is proportional to:',
  'qB/m','mB/q','q/(mB)','m/(qB)',
  'A',
  'omega=qB/m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_017',
  'medium',
  'The magnetic field due to a long straight wire varies with distance r as:',
  '1/r','1/r^2','r','r^2',
  'A',
  'B=mu0 I/(2pi r).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_018',
  'medium',
  'Two parallel currents in the same direction:',
  'attract','repel','do not interact','rotate each other only',
  'A',
  'Parallel currents in the same direction attract.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_019',
  'medium',
  'Torque on a magnetic dipole m in uniform field B is:',
  'mB sin theta','mB cos theta','m/B','B/m',
  'A',
  'tau=m×B.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_020',
  'medium',
  'The magnetic moment of a current loop is:',
  'IA','I/A','A/I','I^2A',
  'A',
  'm=IA for a single loop.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_021',
  'medium',
  'A diamagnetic material has magnetic susceptibility that is:',
  'small and negative','large and positive','zero always','infinite',
  'A',
  'Diamagnets weakly oppose an applied field.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_022',
  'medium',
  'A paramagnetic material is weakly:',
  'attracted by a magnetic field','repelled strongly','unaffected','a perfect conductor',
  'A',
  'Paramagnets have small positive susceptibility.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_023',
  'challenge',
  'A proton and alpha particle enter the same uniform magnetic field perpendicular to B with the same speed. The ratio of their radii r_alpha/r_p is:',
  '2','1','4','1/2',
  'A',
  'r=mv/(qB); alpha has mass 4mp and charge 2e, giving factor 2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_024',
  'challenge',
  'A wire carries current I along +x in a magnetic field along +y. The force direction is:',
  '+z','-z','+x','-y',
  'A',
  'I L×B gives x cross y = z.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_025',
  'challenge',
  'A magnetic dipole with moment m is rotated from parallel to antiparallel orientation in uniform B. Increase in potential energy is:',
  '2mB','mB','0','4mB',
  'A',
  'U=-mB cos theta; change from -mB to +mB is 2mB.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_AND_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_AND_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'MAGNETIC_EFFECTS_AND_MAGNETISM_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_MAGNETIC_EFFECTS_AND_MAGNETISM_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_008',
  'easy',
  'Faraday''s law relates induced emf to the rate of change of:',
  'magnetic flux','electric charge','resistance','capacitance',
  'A',
  'Induced emf equals negative rate of change of magnetic flux.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_009',
  'easy',
  'Lenz''s law gives the direction of induced current so as to oppose the:',
  'change producing it','magnetic field always','current source only','electric potential only',
  'A',
  'The induced effect opposes the change in flux.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_010',
  'easy',
  'The SI unit of magnetic flux is:',
  'weber','tesla','henry','volt',
  'A',
  'Magnetic flux is measured in webers.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_011',
  'easy',
  'Self-inductance is measured in:',
  'henry','weber','tesla','ohm',
  'A',
  'The SI unit of inductance is henry.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_012',
  'easy',
  'In a purely resistive AC circuit, current and voltage are:',
  'in phase','90 degrees out of phase','180 degrees out of phase','unrelated',
  'A',
  'For a resistor, voltage and current reach maxima together.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_013',
  'easy',
  'The rms value of a sinusoidal current with peak I0 is:',
  'I0/sqrt(2)','sqrt(2) I0','I0/2','2I0',
  'A',
  'I_rms=I0/sqrt2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_014',
  'medium',
  'The induced emf in a coil of N turns is:',
  '-N dPhi/dt','-dPhi/(Ndt)','N Phi','Phi/N',
  'A',
  'Faraday''s law for N identical turns is e=-N dPhi/dt.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_015',
  'medium',
  'Energy stored in an inductor L carrying current I is:',
  '1/2 LI^2','LI','L/I','2LI^2',
  'A',
  'Magnetic energy stored is U=1/2 LI^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_016',
  'medium',
  'Inductive reactance is:',
  'omega L','1/(omega L)','omega C','1/(omega C)',
  'A',
  'X_L=omega L.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_017',
  'medium',
  'Capacitive reactance is:',
  '1/(omega C)','omega C','omega L','1/(omega L)',
  'A',
  'X_C=1/(omega C).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_018',
  'medium',
  'In a purely inductive AC circuit, current:',
  'lags voltage by 90 degrees','leads voltage by 90 degrees','is in phase','lags by 180 degrees',
  'A',
  'For an ideal inductor, current lags voltage by pi/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_019',
  'medium',
  'In a purely capacitive AC circuit, current:',
  'leads voltage by 90 degrees','lags voltage by 90 degrees','is in phase','lags by 180 degrees',
  'A',
  'For an ideal capacitor, current leads voltage by pi/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_020',
  'medium',
  'The resonance condition for a series LCR circuit is:',
  'X_L=X_C','R=X_L','R=X_C','X_L=0 only',
  'A',
  'At resonance the inductive and capacitive reactances cancel.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_021',
  'medium',
  'At resonance in a series LCR circuit, impedance is:',
  'minimum and equal to R','maximum','zero always','equal to X_L+X_C',
  'A',
  'Reactive parts cancel, leaving Z=R.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_022',
  'medium',
  'A transformer works on the principle of:',
  'mutual induction','electrostatic induction','resistance heating','photoelectric effect',
  'A',
  'Changing current in one coil induces emf in another.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_023',
  'challenge',
  'A coil of 100 turns experiences flux change from 0.02 Wb to zero in 0.1 s. Average induced emf magnitude is:',
  '20 V','2 V','200 V','0.2 V',
  'A',
  'e=N DeltaPhi/Delta t=100×0.02/0.1=20 V.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_024',
  'challenge',
  'For a series LCR circuit at resonance, the power factor is:',
  '1','0','1/2','sqrt(2)',
  'A',
  'Voltage and current are in phase at resonance.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_025',
  'challenge',
  'A transformer has Np:Ns=10:1 and primary voltage 220 V. Ideal secondary voltage is:',
  '22 V','2200 V','2.2 V','110 V',
  'A',
  'Vs/Vp=Ns/Np=1/10.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_INDUCTION_AC'
  AND st.subtopic_code='ELECTROMAGNETIC_INDUCTION_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_INDUCTION_AC_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_INDUCTION_AC_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_008',
  'easy',
  'Electromagnetic waves can propagate through:',
  'vacuum','only solids','only liquids','only gases',
  'A',
  'EM waves do not require a material medium.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_009',
  'easy',
  'In an electromagnetic wave, electric and magnetic fields are:',
  'perpendicular to each other','parallel','always zero','antiparallel only',
  'A',
  'E and B are mutually perpendicular.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_010',
  'easy',
  'Electromagnetic waves are:',
  'transverse','longitudinal','stationary only','mechanical',
  'A',
  'Their field oscillations are transverse to propagation.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_011',
  'easy',
  'The speed of electromagnetic waves in vacuum is approximately:',
  '3×10^8 m/s','3×10^6 m/s','3×10^10 m/s','3×10^4 m/s',
  'A',
  'The vacuum speed of light is about 3×10^8 m/s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_012',
  'easy',
  'Visible light is part of the:',
  'electromagnetic spectrum','sound spectrum','matter-wave spectrum only','gravitational spectrum',
  'A',
  'Visible light is electromagnetic radiation.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_013',
  'easy',
  'Among radio waves, microwaves, visible light and X-rays, the highest frequency is generally:',
  'X-rays','radio waves','microwaves','visible light',
  'A',
  'X-rays have much higher frequency than visible and radio-frequency radiation.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_014',
  'medium',
  'For an electromagnetic wave in vacuum, E0/B0 equals:',
  'c','1/c','c^2','epsilon0',
  'A',
  'The field amplitudes satisfy E0=cB0.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_015',
  'medium',
  'Frequency f, wavelength lambda and wave speed c satisfy:',
  'c=f lambda','c=f/lambda','c=lambda/f','c=f+lambda',
  'A',
  'Wave speed equals frequency times wavelength.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_016',
  'medium',
  'If frequency of an EM wave doubles in vacuum, its wavelength becomes:',
  'half','double','four times','unchanged',
  'A',
  'Since c is fixed, lambda=c/f.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_017',
  'medium',
  'Which radiation is commonly used in radar systems?',
  'microwaves','gamma rays','ultraviolet only','infrared only',
  'A',
  'Radar commonly uses microwave frequencies.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_018',
  'medium',
  'Which part of the spectrum is commonly associated with thermal radiation from warm objects?',
  'infrared','X-rays','gamma rays','ultraviolet only',
  'A',
  'Warm bodies emit strongly in the infrared.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_019',
  'medium',
  'Ultraviolet radiation has frequency generally:',
  'higher than visible','lower than radio','equal to microwaves','lower than infrared',
  'A',
  'UV lies above visible in frequency.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_020',
  'medium',
  'X-rays are useful in medical imaging largely because they:',
  'penetrate soft tissue more than visible light','are sound waves','carry no energy','move slower than sound',
  'A',
  'Their short wavelength and penetration enable radiographic imaging.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_021',
  'medium',
  'Gamma rays have wavelengths generally:',
  'shorter than X-rays','longer than radio waves','equal to microwaves','longer than infrared',
  'A',
  'Gamma rays occupy the shortest-wavelength end of the EM spectrum.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_022',
  'medium',
  'The energy of a photon is proportional to:',
  'frequency','wavelength','inverse frequency','speed squared only',
  'A',
  'Photon energy is E=hf.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_023',
  'challenge',
  'An EM wave has frequency 6×10^14 Hz in vacuum. Its wavelength is approximately:',
  '5×10^-7 m','2×10^-6 m','5×10^-5 m','2×10^-8 m',
  'A',
  'lambda=c/f=3×10^8/(6×10^14)=5×10^-7 m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_024',
  'challenge',
  'If the electric-field amplitude of an EM wave doubles, its average intensity becomes:',
  'four times','twice','half','unchanged',
  'A',
  'Intensity is proportional to E0^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_025',
  'challenge',
  'The momentum of a photon of energy E is:',
  'E/c','Ec','E/c^2','c/E',
  'A',
  'For a photon, E=pc.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROMAGNETIC_WAVES'
  AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTROMAGNETIC_WAVES_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTROMAGNETIC_WAVES_025';

-- Verification
SELECT
  t.sort_order,
  t.topic_code,
  COUNT(q.id) AS active_questions,
  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
      THEN 1 ELSE 0
    END
  ) AS tracked_neet_2026,
  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
       AND qm.quality_status='REVIEWED'
      THEN 1 ELSE 0
    END
  ) AS reviewed,
  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
       AND qm.quality_status='DRAFT'
      THEN 1 ELSE 0
    END
  ) AS draft
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
JOIN education_subtopics st ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
LEFT JOIN education_question_metadata qm ON qm.question_id=q.id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code IN ('ELECTROSTATICS','CURRENT_ELECTRICITY','MAGNETIC_EFFECTS_AND_MAGNETISM','ELECTROMAGNETIC_INDUCTION_AC','ELECTROMAGNETIC_WAVES')
GROUP BY t.id,t.sort_order,t.topic_code
ORDER BY t.sort_order;

SELECT COUNT(q.id) AS active_questions_topics_11_15
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND q.active=1
  AND t.topic_code IN ('ELECTROSTATICS','CURRENT_ELECTRICITY','MAGNETIC_EFFECTS_AND_MAGNETISM','ELECTROMAGNETIC_INDUCTION_AC','ELECTROMAGNETIC_WAVES');
