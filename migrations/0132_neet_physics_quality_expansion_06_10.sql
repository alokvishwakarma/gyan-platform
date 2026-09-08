-- 0132_neet_physics_quality_expansion_06_10.sql
-- NEET 2026 Physics quality rebuild: topics 06-10.
-- Adds 18 DRAFT questions to each of five proper Physics topics.
-- Target after execution: 25 active questions per topic.
PRAGMA foreign_keys = ON;


INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_008',
  'easy',
  'The acceleration due to gravity at Earth''s surface is directed:',
  'towards Earth''s centre','away from Earth''s centre','tangentially eastward','parallel to Earth''s axis',
  'A',
  'Gravity acts approximately radially toward Earth''s centre.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_009',
  'easy',
  'If the distance between two point masses is doubled, their gravitational force becomes:',
  'twice','half','one-fourth','four times',
  'C',
  'Newton''s law gives F proportional to 1/r^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_010',
  'easy',
  'The SI unit of gravitational constant G is:',
  'N m^2 kg^-2','N kg^-1','m s^-2','J kg^-1',
  'A',
  'From F=Gm1m2/r^2, G has unit N m^2 kg^-2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_011',
  'easy',
  'The gravitational potential at infinity is conventionally taken as:',
  'zero','infinite','GM/R','-GM/R',
  'A',
  'The standard reference sets gravitational potential to zero at infinity.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_012',
  'easy',
  'Escape speed from a planet is independent of the projectile''s:',
  'mass','launch speed','planet mass','planet radius',
  'A',
  'v_e=sqrt(2GM/R), so projectile mass cancels.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_013',
  'easy',
  'For a satellite in a circular orbit, gravity provides the required:',
  'centripetal force','centrifugal force','tangential force','frictional force',
  'A',
  'Gravitational attraction acts as the centripetal force.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_014',
  'medium',
  'At a height equal to Earth''s radius above the surface, g is approximately:',
  'g/2','g/3','g/4','g/8',
  'C',
  'Distance from Earth''s centre becomes 2R, hence g''=g/4.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_015',
  'medium',
  'Taking g=9.8 m/s^2 and Earth radius R, the escape speed is related to the first cosmic speed v_o by:',
  'v_e=v_o/2','v_e=v_o','v_e=sqrt(2)v_o','v_e=2v_o',
  'C',
  'Circular orbital speed is sqrt(GM/R); escape speed is sqrt(2GM/R).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_016',
  'medium',
  'A satellite''s orbital speed in a circular orbit of radius r is:',
  'sqrt(GM/r)','GM/r','sqrt(GMr)','GM/r^2',
  'A',
  'Equating GMm/r^2=mv^2/r gives v=sqrt(GM/r).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_017',
  'medium',
  'The gravitational potential energy of masses M and m separated by r is:',
  '+GMm/r','-GMm/r','-GMm/r^2','+GMm/r^2',
  'B',
  'With zero potential energy at infinity, U=-GMm/r.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_018',
  'medium',
  'If Earth''s mass were unchanged but its radius became half, surface g would become:',
  'g/4','g/2','2g','4g',
  'D',
  'g=GM/R^2, so halving R makes g four times.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_019',
  'medium',
  'A geostationary satellite must orbit in the:',
  'equatorial plane','polar plane','any plane','ecliptic plane only',
  'A',
  'It must orbit above the equator in Earth''s rotation direction with a 24-hour period.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_020',
  'medium',
  'The total mechanical energy of a satellite of mass m in a circular orbit radius r is:',
  '-GMm/(2r)','-GMm/r','+GMm/(2r)','+GMm/r',
  'A',
  'For circular orbit K=GMm/(2r) and U=-GMm/r, so E=-GMm/(2r).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_021',
  'medium',
  'If a planet has the same mean density as Earth but twice Earth''s radius, its surface g is:',
  'g/2','g','2g','4g',
  'C',
  'For fixed density, M proportional to R^3, so g=GM/R^2 proportional to R.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_022',
  'medium',
  'At the centre of a uniform spherical Earth, the value of g is:',
  'zero','g','infinite','g/2',
  'A',
  'Inside a uniform sphere, g is proportional to distance from the centre.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_023',
  'challenge',
  'A body is projected vertically from Earth with speed equal to half the escape speed. Ignoring atmosphere, its maximum distance from Earth''s centre is:',
  '4R/3','2R','3R/2','4R',
  'A',
  'Energy: v^2/2-GM/R=-GM/rmax with v^2=v_e^2/4=GM/(2R), giving rmax=4R/3.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_024',
  'challenge',
  'Two identical stars of mass M revolve around their common centre in circular orbits, separation 2r. The angular speed is:',
  'sqrt(GM/(4r^3))','sqrt(GM/(2r^3))','sqrt(GM/r^3)','sqrt(2GM/r^3)',
  'A',
  'Each star moves in radius r; GM^2/(2r)^2=M omega^2 r, hence omega^2=GM/(4r^3).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_GRAVITATION_025',
  'challenge',
  'For a planet, escape speed is 11.2 km/s. If its mass becomes four times and radius twice, the new escape speed is:',
  '11.2 km/s','15.8 km/s','22.4 km/s','44.8 km/s',
  'B',
  'v_e proportional to sqrt(M/R); factor sqrt(4/2)=sqrt2, so 11.2sqrt2≈15.8.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'GRAVITATION_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_GRAVITATION_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_008',
  'easy',
  'Young''s modulus is defined as the ratio of:',
  'longitudinal stress to longitudinal strain','shear stress to shear strain only','pressure to volume','force to area only',
  'A',
  'Young''s modulus relates normal stress to longitudinal strain within the elastic limit.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_009',
  'easy',
  'The SI unit of surface tension is:',
  'N m^-1','N m','Pa m','J m^-2 only',
  'A',
  'Surface tension is force per unit length, N/m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_010',
  'easy',
  'A liquid rises in a capillary mainly because of:',
  'surface tension','viscosity only','gravity only','bulk modulus',
  'A',
  'Capillary action results from surface tension and wetting.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_011',
  'easy',
  'Viscosity is a measure of a fluid''s resistance to:',
  'relative motion between layers','compression only','heating','evaporation',
  'A',
  'Viscosity opposes shear or relative motion between adjacent fluid layers.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_012',
  'easy',
  'For an incompressible fluid in steady flow, the continuity equation is:',
  'A1v1=A2v2','P1v1=P2v2','A1P1=A2P2','v1/r1=v2/r2',
  'A',
  'Conservation of volume flow rate gives Av=constant.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_013',
  'easy',
  'Pressure at a given depth in a static liquid increases with:',
  'depth','surface area of vessel','shape of vessel','container material',
  'A',
  'Hydrostatic pressure is P=P0+rho gh.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_014',
  'medium',
  'A wire of length L and area A extends by ΔL under force F. Young''s modulus is:',
  'FL/(AΔL)','FΔL/(AL)','FA/(LΔL)','AΔL/(FL)',
  'A',
  'Y=(F/A)/(ΔL/L)=FL/(AΔL).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_015',
  'medium',
  'If the radius of a capillary tube is doubled, the capillary rise for the same liquid becomes:',
  'double','half','four times','unchanged',
  'B',
  'h=2T cosθ/(rho g r), so h proportional to 1/r.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_016',
  'medium',
  'A small sphere falls through a viscous liquid at terminal speed. If its radius doubles, Stokes-law terminal speed becomes:',
  '2 times','4 times','8 times','unchanged',
  'B',
  'Terminal speed is proportional to r^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_017',
  'medium',
  'According to Bernoulli''s principle, where the speed of an ideal fluid is higher, its static pressure is generally:',
  'lower','higher','unchanged','zero',
  'A',
  'Along a streamline, P+1/2 rho v^2+rho gh is constant.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_018',
  'medium',
  'A soap bubble of radius r has excess pressure:',
  '2T/r','4T/r','T/r','8T/r',
  'B',
  'A soap bubble has two liquid surfaces, giving ΔP=4T/r.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_019',
  'medium',
  'A liquid drop of radius r has excess pressure:',
  'T/r','2T/r','4T/r','8T/r',
  'B',
  'A drop has one interface, so ΔP=2T/r.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_020',
  'medium',
  'The bulk modulus B is related to compressibility kappa by:',
  'B=1/kappa','B=kappa','B=kappa^2','B=sqrt(kappa)',
  'A',
  'Compressibility is the reciprocal of bulk modulus.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_021',
  'medium',
  'Water flows from a pipe of area 4 cm^2 into one of area 1 cm^2. If speed in the wider section is 2 m/s, speed in the narrow section is:',
  '0.5 m/s','2 m/s','4 m/s','8 m/s',
  'D',
  'A1v1=A2v2 gives v2=4×2=8 m/s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_022',
  'medium',
  'A material returns to its original shape after removal of a small deforming force. This property is:',
  'elasticity','plasticity','viscosity','ductility',
  'A',
  'Elasticity is the ability to recover original shape after removal of deforming force.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_023',
  'challenge',
  'A horizontal pipe narrows from area A to A/2. If speed in the wider part is v, the pressure difference P_wide-P_narrow is:',
  '(1/2)rho v^2','rho v^2','(3/2)rho v^2','2rho v^2',
  'C',
  'Continuity gives v2=2v; Bernoulli gives ΔP=1/2 rho(4v^2-v^2)=3/2 rho v^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_024',
  'challenge',
  'Two soap bubbles of radii r and 2r are connected by a narrow tube. Air initially tends to flow:',
  'from smaller to larger bubble','from larger to smaller bubble','in neither direction','equally both ways',
  'A',
  'Excess pressure 4T/r is greater in the smaller bubble.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_025',
  'challenge',
  'A wire stores elastic energy U when stretched by x within Hooke''s-law region. If extension becomes 2x, stored energy becomes:',
  '2U','4U','U/2','8U',
  'B',
  'Elastic energy is 1/2 kx^2, so doubling x multiplies U by four.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_OF_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_OF_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PROPERTIES_OF_SOLIDS_LIQUIDS_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PROPERTIES_OF_SOLIDS_LIQUIDS_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_008',
  'easy',
  'The first law of thermodynamics expresses conservation of:',
  'energy','momentum','charge only','mass only',
  'A',
  'The first law is an energy-conservation statement.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_009',
  'easy',
  'For an ideal gas undergoing an isothermal process, change in internal energy is:',
  'zero','positive','negative','infinite',
  'A',
  'For an ideal gas internal energy depends only on temperature.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_010',
  'easy',
  'In an adiabatic process, heat exchanged with surroundings is:',
  'zero','positive','negative','equal to work',
  'A',
  'By definition, Q=0 for an adiabatic process.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_011',
  'easy',
  'The SI unit of heat is:',
  'joule','calorie','kelvin','watt',
  'A',
  'Heat is energy and its SI unit is joule.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_012',
  'easy',
  'The zeroth law of thermodynamics provides the basis for defining:',
  'temperature','entropy','work','pressure',
  'A',
  'Thermal equilibrium enables a consistent temperature scale.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_013',
  'easy',
  'For a cyclic thermodynamic process, the net change in internal energy over one cycle is:',
  'zero','positive','negative','equal to heat input',
  'A',
  'Internal energy is a state function, so it returns to its initial value.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_014',
  'medium',
  'Using the convention ΔQ=ΔU+ΔW where W is work done by the gas, in an isochoric process:',
  'W=0','Q=0','ΔU=0','P=0',
  'A',
  'At constant volume, dV=0 and hence boundary work is zero.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_015',
  'medium',
  'An ideal gas expands isothermally. The heat supplied is equal to:',
  'work done by the gas','change in internal energy','zero','negative work',
  'A',
  'ΔU=0 for isothermal ideal-gas change, so Q=W.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_016',
  'medium',
  'For one mole of a monatomic ideal gas, C_V is:',
  '3R/2','5R/2','R','7R/2',
  'A',
  'A monatomic gas has three translational degrees of freedom.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_017',
  'medium',
  'For an ideal gas, Mayer''s relation is:',
  'C_P-C_V=R','C_P+C_V=R','C_P/C_V=R','C_PC_V=R',
  'A',
  'For one mole of ideal gas, C_P-C_V=R.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_018',
  'medium',
  'The efficiency of a heat engine is always less than 100% mainly because:',
  'some heat must be rejected to a sink','work output is always zero','temperature cannot change','pressure must be constant',
  'A',
  'A cyclic heat engine cannot convert all absorbed heat into work.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_019',
  'medium',
  'For a reversible adiabatic process of an ideal gas:',
  'PV^gamma=constant','PV=constant','P/T=constant','V/T=constant',
  'A',
  'The Poisson relation for reversible adiabatic change is PV^gamma=constant.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_020',
  'medium',
  'A gas absorbs 500 J heat and does 200 J work. Its increase in internal energy is:',
  '300 J','700 J','200 J','500 J',
  'A',
  'First law gives ΔU=Q-W=500-200=300 J.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_021',
  'medium',
  'A gas is compressed adiabatically. Its temperature generally:',
  'increases','decreases','remains constant','becomes zero',
  'A',
  'Work done on the gas increases its internal energy and temperature.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_022',
  'medium',
  'The coefficient of performance of a refrigerator is defined as:',
  'heat removed from cold reservoir divided by work input','work output divided by heat input','heat rejected divided by work input only','work input divided by heat removed',
  'A',
  'COP=Q_L/W for a refrigerator.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_023',
  'challenge',
  'One mole of monatomic ideal gas is heated at constant volume through temperature rise ΔT. Heat supplied is:',
  'RΔT','3RΔT/2','5RΔT/2','7RΔT/2',
  'B',
  'At constant volume Q=nC_VΔT=(3/2)RΔT.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_024',
  'challenge',
  'A Carnot engine operates between 500 K and 300 K. Its efficiency is:',
  '20%','40%','60%','80%',
  'B',
  'η=1-Tc/Th=1-300/500=0.40.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_025',
  'challenge',
  'An ideal gas expands adiabatically from V to 2V. If gamma=2, its final temperature is related to initial T by:',
  'T/2','T/4','2T','4T',
  'A',
  'For adiabatic change TV^(gamma-1)=constant; with gamma-1=1, T2=T/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'THERMODYNAMICS_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_THERMODYNAMICS_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_008',
  'easy',
  'According to kinetic theory, gas pressure arises mainly from:',
  'molecular collisions with container walls','molecular weight alone','gravity between molecules','chemical reactions',
  'A',
  'Momentum transfer during wall collisions produces pressure.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_009',
  'easy',
  'The average translational kinetic energy of an ideal-gas molecule depends only on:',
  'absolute temperature','pressure only','volume only','molecular mass only',
  'A',
  'Average translational kinetic energy is 3kT/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_010',
  'easy',
  'At the same temperature, all ideal gases have the same molecular:',
  'mean translational kinetic energy','rms speed','mean momentum','density',
  'A',
  'Mean translational kinetic energy depends only on T.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_011',
  'easy',
  'The rms speed of gas molecules increases when temperature:',
  'increases','decreases','is unchanged','becomes zero only',
  'A',
  'v_rms is proportional to sqrt(T).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_012',
  'easy',
  'The Boltzmann constant k is related to gas constant R by:',
  'k=R/N_A','k=RN_A','k=N_A/R','k=R^2/N_A',
  'A',
  'R=N_A k.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_013',
  'easy',
  'For an ideal gas, intermolecular potential energy is assumed to be:',
  'negligible','very large and positive','very large and negative','equal to kinetic energy',
  'A',
  'Ideal-gas molecules are assumed not to interact except during elastic collisions.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_014',
  'medium',
  'The rms speed of molecules of molar mass M at temperature T is:',
  'sqrt(3RT/M)','sqrt(RT/3M)','3RT/M','sqrt(2RT/M)',
  'A',
  'v_rms=sqrt(3RT/M).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_015',
  'medium',
  'If absolute temperature of an ideal gas becomes four times, rms speed becomes:',
  '2 times','4 times','half','unchanged',
  'A',
  'v_rms proportional to sqrt(T).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_016',
  'medium',
  'At the same temperature, hydrogen molecules compared with oxygen molecules have:',
  'higher rms speed','lower rms speed','same rms speed','zero rms speed',
  'A',
  'At fixed T, v_rms proportional to 1/sqrt(M).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_017',
  'medium',
  'The mean free path of gas molecules generally increases when pressure is:',
  'decreased at fixed temperature','increased at fixed temperature','unchanged','made infinite density',
  'A',
  'Lower number density leads to longer average distance between collisions.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_018',
  'medium',
  'For a monatomic ideal gas, ratio gamma=C_P/C_V is:',
  '5/3','7/5','4/3','3/2',
  'A',
  'C_V=3R/2 and C_P=5R/2, so gamma=5/3.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_019',
  'medium',
  'A rigid diatomic ideal gas at ordinary temperatures has approximately how many active degrees of freedom?',
  '5','3','2','6',
  'A',
  'Three translational plus two rotational degrees of freedom are active.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_020',
  'medium',
  'Pressure of an ideal gas can be written as P=(1/3)rho c_rms^2. If density doubles at same rms speed, pressure becomes:',
  'double','half','four times','unchanged',
  'A',
  'P is directly proportional to density at fixed rms speed.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_021',
  'medium',
  'For one mole of a diatomic ideal gas with five active degrees of freedom, internal energy is:',
  '5RT/2','3RT/2','7RT/2','RT',
  'A',
  'Equipartition gives U=fRT/2 with f=5.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_022',
  'medium',
  'The equipartition theorem assigns average energy per quadratic degree of freedom equal to:',
  'kT/2 per molecule','kT','3kT/2','RT',
  'A',
  'Each independent quadratic degree contributes kT/2 per molecule.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_023',
  'challenge',
  'Two ideal gases A and B at the same temperature have molar masses M and 4M. The ratio v_rms(A):v_rms(B) is:',
  '2:1','1:2','4:1','1:4',
  'A',
  'rms speed varies as 1/sqrt(M), giving sqrt(4)=2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_024',
  'challenge',
  'If pressure and volume of a fixed amount of ideal gas are both doubled, its absolute temperature becomes:',
  '4 times','2 times','unchanged','half',
  'A',
  'PV=nRT, so doubling both P and V multiplies T by four.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_025',
  'challenge',
  'A monatomic ideal gas and a diatomic ideal gas contain equal moles at the same temperature. The ratio of their internal energies U_mono:U_dia is:',
  '3:5','5:3','1:1','3:7',
  'A',
  'U_mono=3nRT/2 and U_dia=5nRT/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_OF_GASES'
  AND st.subtopic_code='KINETIC_THEORY_OF_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINETIC_THEORY_OF_GASES_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINETIC_THEORY_OF_GASES_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_008',
  'easy',
  'In simple harmonic motion, acceleration is proportional to displacement and directed:',
  'opposite to displacement','along displacement','perpendicular to displacement','randomly',
  'A',
  'SHM obeys a=-omega^2 x.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_009',
  'easy',
  'The time period of a simple pendulum for small oscillations is proportional to:',
  'sqrt(L)','L','1/L','L^2',
  'A',
  'T=2pi sqrt(L/g).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_010',
  'easy',
  'At the mean position of an ideal SHM oscillator, speed is:',
  'maximum','zero','minimum but nonzero','undefined',
  'A',
  'Potential energy is minimum and kinetic energy maximum at equilibrium.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_011',
  'easy',
  'At an extreme position in SHM, velocity is:',
  'zero','maximum','equal to omega A','infinite',
  'A',
  'The oscillator reverses direction at an extreme position.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_012',
  'easy',
  'The SI unit of frequency is:',
  'hertz','radian','metre','second',
  'A',
  'Frequency is measured in hertz, equivalent to s^-1.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_013',
  'easy',
  'A transverse mechanical wave has particle vibration:',
  'perpendicular to propagation','parallel to propagation','always circular','absent',
  'A',
  'Transverse displacement is perpendicular to the direction of wave travel.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_014',
  'medium',
  'For SHM x=A cos(omega t), maximum speed is:',
  'A omega','A/omega','A omega^2','omega/A',
  'A',
  'Differentiating gives v=-A omega sin(omega t), so vmax=Aomega.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_015',
  'medium',
  'For a mass m attached to a spring constant k, time period is:',
  '2pi sqrt(m/k)','2pi sqrt(k/m)','sqrt(mk)','2pi mk',
  'A',
  'The angular frequency is sqrt(k/m).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_016',
  'medium',
  'If the length of a simple pendulum is made four times, its period becomes:',
  '2 times','4 times','half','unchanged',
  'A',
  'T proportional to sqrt(L), so factor sqrt4=2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_017',
  'medium',
  'Wave speed v, frequency f and wavelength lambda satisfy:',
  'v=f lambda','v=f/lambda','v=lambda/f','v=f+lambda',
  'A',
  'One wavelength is travelled per oscillation period, so v=fλ.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_018',
  'medium',
  'Two coherent waves of equal amplitude superpose in phase. Resultant amplitude is:',
  'twice','same','zero','half',
  'A',
  'Constructive interference adds equal amplitudes.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_019',
  'medium',
  'For a stretched string, wave speed is:',
  'sqrt(T/mu)','sqrt(mu/T)','T/mu','mu/T',
  'A',
  'Transverse wave speed on a string is sqrt(tension/linear density).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_020',
  'medium',
  'A stationary wave is formed by superposition of two waves of same frequency travelling:',
  'in opposite directions','in same direction only','at right angles only','with unequal speeds in one medium',
  'A',
  'Equal-frequency counter-propagating waves form a standing wave.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_021',
  'medium',
  'Distance between two successive nodes of a standing wave is:',
  'lambda/2','lambda','lambda/4','2lambda',
  'A',
  'Adjacent nodes are separated by half a wavelength.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_022',
  'medium',
  'For a pipe closed at one end, the fundamental wavelength is:',
  '4L','2L','L','L/2',
  'A',
  'A closed pipe has a node at the closed end and antinode at open end, giving L=λ/4.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_023',
  'challenge',
  'An SHM particle has amplitude A. At displacement A/2, its speed is what fraction of maximum speed?',
  'sqrt(3)/2','1/2','1/sqrt(2)','3/4',
  'A',
  'v=omega sqrt(A^2-x^2); at x=A/2, v/vmax=sqrt(3/4)=sqrt3/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_024',
  'challenge',
  'A source of sound approaches a stationary observer. Compared with emitted frequency, observed frequency is:',
  'higher','lower','same','zero',
  'A',
  'The Doppler effect raises frequency when source and observer approach.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_025',
  'challenge',
  'A string fixed at both ends has length L. Its third harmonic wavelength is:',
  '2L/3','3L/2','L/3','6L',
  'A',
  'For fixed ends, λ_n=2L/n; for n=3, λ=2L/3.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_AND_WAVES'
  AND st.subtopic_code='OSCILLATIONS_AND_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OSCILLATIONS_AND_WAVES_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OSCILLATIONS_AND_WAVES_025';

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
  AND t.topic_code IN ('GRAVITATION','PROPERTIES_OF_SOLIDS_LIQUIDS','THERMODYNAMICS','KINETIC_THEORY_OF_GASES','OSCILLATIONS_AND_WAVES')
GROUP BY t.id,t.sort_order,t.topic_code
ORDER BY t.sort_order;

SELECT COUNT(q.id) AS active_questions_topics_06_10
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND q.active=1
  AND t.topic_code IN ('GRAVITATION','PROPERTIES_OF_SOLIDS_LIQUIDS','THERMODYNAMICS','KINETIC_THEORY_OF_GASES','OSCILLATIONS_AND_WAVES');
