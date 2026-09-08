-- 0134_neet_physics_quality_expansion_16_20.sql
-- NEET 2026 Physics quality rebuild: topics 16-20.
-- Adds 18 DRAFT questions to each topic.
-- Target: 25 active / 25 tracked per topic.
PRAGMA foreign_keys = ON;


INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_008',
  'easy',
  'The refractive index of a medium is defined as the ratio of:',
  'speed of light in vacuum to speed in the medium','speed in medium to speed in vacuum','wavelength in medium to frequency','frequency to wavelength',
  'A',
  'Refractive index n=c/v.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_009',
  'easy',
  'According to the law of reflection, angle of incidence is:',
  'equal to angle of reflection','twice the angle of reflection','half the angle of reflection','independent of reflection angle',
  'A',
  'The angle of incidence equals the angle of reflection.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_010',
  'easy',
  'A convex lens in air is generally:',
  'converging','diverging','plane reflecting','opaque',
  'A',
  'A convex lens usually converges parallel rays in air.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_011',
  'easy',
  'A concave lens forms, for a real object, an image that is generally:',
  'virtual, erect and diminished','real and inverted','real and magnified','virtual and magnified always',
  'A',
  'A concave lens is diverging and forms a virtual erect diminished image.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_012',
  'easy',
  'The SI unit of power of a lens is:',
  'dioptre','tesla','weber','candela',
  'A',
  'Lens power P=1/f with f in metres, measured in dioptres.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_013',
  'easy',
  'Total internal reflection can occur when light travels from:',
  'denser to rarer medium','rarer to denser medium only','vacuum to any medium at normal incidence','air to glass at all angles',
  'A',
  'TIR requires incidence from optically denser to rarer medium above the critical angle.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_014',
  'medium',
  'A lens has focal length 0.50 m. Its power is:',
  '2 D','0.5 D','5 D','20 D',
  'A',
  'P=1/f=1/0.50=2 D.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_015',
  'medium',
  'For a spherical mirror, focal length f and radius of curvature R are related by:',
  'f=R/2','f=2R','f=R^2','f=1/R',
  'A',
  'For paraxial rays, f=R/2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_016',
  'medium',
  'A ray enters glass from air. Its speed generally:',
  'decreases','increases','remains unchanged','becomes zero',
  'A',
  'Light travels slower in glass than in air.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_017',
  'medium',
  'The critical angle C for a medium of refractive index n relative to air satisfies:',
  'sin C=1/n','cos C=1/n','tan C=n','sin C=n',
  'A',
  'At critical incidence, refracted angle is 90 degrees, giving sinC=1/n.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_018',
  'medium',
  'The magnification produced by a plane mirror is:',
  '+1','-1','0','greater than 1 always',
  'A',
  'Plane mirrors form virtual, erect, same-size images.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_019',
  'medium',
  'Two thin lenses of powers +2 D and +3 D are in contact. Equivalent power is:',
  '+5 D','+1 D','+6 D','-1 D',
  'A',
  'P_eq=P1+P2=5 D.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_020',
  'medium',
  'When an object is placed at 2F of a convex lens, the image is formed:',
  'at 2F on the other side','at F','at infinity','between lens and F',
  'A',
  'At 2F, a convex lens gives a real inverted same-size image at 2F.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_021',
  'medium',
  'A prism deviates light because of:',
  'refraction at its two surfaces','reflection only','diffraction only','polarization only',
  'A',
  'Angular deviation arises from refraction at entry and exit faces.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_022',
  'medium',
  'Dispersion by a prism occurs because refractive index depends on:',
  'wavelength','intensity only','amplitude only','source distance only',
  'A',
  'Different wavelengths experience different refractive indices.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_023',
  'challenge',
  'A convex lens of focal length 20 cm forms a real image of an object placed 30 cm from it. The image distance is:',
  '60 cm','30 cm','20 cm','15 cm',
  'A',
  'Using 1/f=1/v-1/u with u=-30 cm gives 1/20=1/v+1/30, so v=60 cm.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_024',
  'challenge',
  'A person sees clearly up to 50 cm but not beyond. The eye defect is corrected using a lens that is:',
  'concave','convex','cylindrical only','plane glass',
  'A',
  'Myopia is corrected with a diverging concave lens.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_OPTICS_025',
  'challenge',
  'In Young''s double-slit experiment, if slit separation is doubled while other quantities remain fixed, fringe width becomes:',
  'half','double','four times','unchanged',
  'A',
  'Fringe width beta=lambda D/d, so doubling d halves beta.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'OPTICS_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_OPTICS_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_008',
  'easy',
  'The photoelectric effect demonstrates the particle nature of:',
  'light','sound','gravity','heat only',
  'A',
  'Photoelectric emission is explained by photons.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_009',
  'easy',
  'The energy of a photon is:',
  'hf','h/f','f/h','hc f',
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
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_010',
  'easy',
  'The momentum of a photon is:',
  'h/lambda','h lambda','lambda/h','zero',
  'A',
  'Photon momentum p=h/lambda.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_011',
  'easy',
  'Matter waves are associated with:',
  'moving material particles','only photons','only charged particles','stationary macroscopic bodies only',
  'A',
  'de Broglie proposed wavelength for moving matter particles.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_012',
  'easy',
  'The de Broglie wavelength is inversely proportional to:',
  'momentum','mass only','charge','time',
  'A',
  'lambda=h/p.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_013',
  'easy',
  'In the photoelectric effect, below threshold frequency photoemission:',
  'does not occur regardless of intensity','always occurs at high intensity','occurs only at zero voltage','occurs after long delay',
  'A',
  'Each photon must have at least the work-function energy.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_014',
  'medium',
  'Einstein''s photoelectric equation is:',
  'Kmax=hf-phi','Kmax=phi-hf','Kmax=hf+phi','Kmax=h/f',
  'A',
  'Photon energy supplies work function plus maximum kinetic energy.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_015',
  'medium',
  'Stopping potential V0 is related to maximum photoelectron kinetic energy by:',
  'eV0=Kmax','V0=eKmax','e/V0=Kmax','Kmax=V0/e^2',
  'A',
  'The stopping field removes kinetic energy eV0.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_016',
  'medium',
  'Increasing light intensity above threshold frequency primarily increases:',
  'photoelectric current','maximum kinetic energy','stopping potential','work function',
  'A',
  'More photons per second produce more emitted electrons, while photon energy is unchanged.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_017',
  'medium',
  'Increasing frequency of incident light above threshold generally increases:',
  'maximum photoelectron kinetic energy','number of electrons only','work function','electron charge',
  'A',
  'Higher photon energy increases Kmax.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_018',
  'medium',
  'An electron accelerated through potential V has de Broglie wavelength proportional to:',
  '1/sqrt(V)','sqrt(V)','V','1/V^2',
  'A',
  'p=sqrt(2meV), so lambda=h/p proportional to 1/sqrt(V).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_019',
  'medium',
  'The threshold frequency f0 for work function phi is:',
  'phi/h','h/phi','h phi','phi^2/h',
  'A',
  'At threshold hf0=phi.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_020',
  'medium',
  'If photon wavelength is halved, photon energy becomes:',
  'double','half','four times','unchanged',
  'A',
  'E=hc/lambda.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_021',
  'medium',
  'If particle momentum doubles, its de Broglie wavelength becomes:',
  'half','double','four times','unchanged',
  'A',
  'lambda=h/p.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_022',
  'medium',
  'The wave nature of electrons was experimentally demonstrated by:',
  'electron diffraction','photoelectric emission','alpha scattering','thermionic emission',
  'A',
  'Electron diffraction experiments confirmed matter waves.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_023',
  'challenge',
  'A metal has work function 2 eV and is illuminated by 5 eV photons. Maximum photoelectron kinetic energy is:',
  '3 eV','7 eV','2.5 eV','10 eV',
  'A',
  'Kmax=5-2=3 eV.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_024',
  'challenge',
  'Two particles have equal de Broglie wavelengths. Therefore they have equal:',
  'momentum','mass','speed','kinetic energy necessarily',
  'A',
  'lambda=h/p, so equal wavelengths imply equal momenta.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_025',
  'challenge',
  'A photon and an electron have the same wavelength. Their momenta are:',
  'equal','photon momentum greater','electron momentum greater','unrelated',
  'A',
  'For both, p=h/lambda.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'DUAL_NATURE_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_DUAL_NATURE_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_008',
  'easy',
  'Rutherford''s alpha-scattering experiment established that most of an atom is:',
  'empty space','positive charge uniformly spread','solid matter','negative nucleus',
  'A',
  'Most alpha particles passed through undeflected, implying mostly empty space.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_009',
  'easy',
  'In Bohr''s model of hydrogen, electron angular momentum is:',
  'quantized','continuous','always zero','infinite',
  'A',
  'Bohr postulated mvr=nh/(2pi).',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_010',
  'easy',
  'The ground state of hydrogen corresponds to principal quantum number:',
  'n=1','n=0','n=2','n=infinity',
  'A',
  'The lowest allowed Bohr orbit has n=1.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_011',
  'easy',
  'An atomic nucleus contains:',
  'protons and neutrons','electrons only','protons only','neutrons only',
  'A',
  'Nuclei are made of nucleons: protons and neutrons.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_012',
  'easy',
  'The atomic number Z equals the number of:',
  'protons','neutrons','nucleons','electrons plus neutrons',
  'A',
  'Z is defined as proton number.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_013',
  'easy',
  'Radioactive decay is generally:',
  'spontaneous and probabilistic','caused only by heating','stopped completely by pressure','periodic and deterministic for each nucleus',
  'A',
  'Individual decay events are spontaneous and random.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_014',
  'medium',
  'The energy of the nth Bohr level of hydrogen is proportional to:',
  '-1/n^2','-n^2','1/n','n',
  'A',
  'Hydrogen energy levels follow E_n=-13.6 eV/n^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_015',
  'medium',
  'A transition from n=3 to n=2 in hydrogen results in:',
  'emission of a photon','absorption of a photon','no energy change','nuclear decay',
  'A',
  'Dropping to a lower energy level emits a photon.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_016',
  'medium',
  'The half-life is the time in which the number of undecayed nuclei becomes:',
  'half','double','one-fourth','zero',
  'A',
  'By definition N=N0/2 after one half-life.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_017',
  'medium',
  'After two half-lives, the fraction of radioactive nuclei remaining is:',
  '1/4','1/2','1/8','3/4',
  'A',
  'Each half-life halves the population: (1/2)^2=1/4.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_018',
  'medium',
  'The relation between decay constant lambda and half-life T1/2 is:',
  'T1/2=ln2/lambda','T1/2=lambda ln2','T1/2=1/(lambda ln2)','T1/2=lambda/ln2',
  'A',
  'Solving N=N0e^-lambda t at N=N0/2 gives T1/2=ln2/lambda.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_019',
  'medium',
  'Mass defect of a nucleus is associated with its:',
  'binding energy','electric potential only','temperature','half-life only',
  'A',
  'Binding energy equals mass defect times c^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_020',
  'medium',
  'Binding energy per nucleon is a measure of nuclear:',
  'stability','charge','atomic radius only','radioactive activity only',
  'A',
  'Higher binding energy per nucleon generally indicates greater stability.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_021',
  'medium',
  'Nuclear fission involves:',
  'splitting a heavy nucleus','joining light nuclei','electron emission only','photon reflection',
  'A',
  'Fission divides a heavy nucleus into lighter fragments.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_022',
  'medium',
  'Nuclear fusion involves:',
  'combining light nuclei','splitting heavy nuclei','chemical combustion','electron capture only',
  'A',
  'Fusion joins light nuclei and can release large energy.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_023',
  'challenge',
  'A radioactive sample has half-life 10 days. Fraction remaining after 30 days is:',
  '1/8','1/3','1/6','1/9',
  'A',
  'Thirty days is three half-lives, so remaining fraction is (1/2)^3=1/8.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_024',
  'challenge',
  'The hydrogen atom energy changes from -3.4 eV to -13.6 eV. The photon energy emitted is:',
  '10.2 eV','17.0 eV','3.4 eV','13.6 eV',
  'A',
  'Energy released is (-3.4)-(-13.6)=10.2 eV.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_025',
  'challenge',
  'A nucleus has mass defect 0.01 u. Using 1 u c^2 approximately 931.5 MeV, binding energy is approximately:',
  '9.3 MeV','93.2 MeV','0.93 MeV','931.5 MeV',
  'A',
  'Binding energy=0.01×931.5≈9.3 MeV.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_AND_NUCLEI'
  AND st.subtopic_code='ATOMS_AND_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ATOMS_AND_NUCLEI_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ATOMS_AND_NUCLEI_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_008',
  'easy',
  'A semiconductor has electrical conductivity generally between that of:',
  'conductors and insulators','two perfect conductors','vacuum and superconductors only','metals only',
  'A',
  'Semiconductors have intermediate conductivity.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_009',
  'easy',
  'Pure silicon is an example of an:',
  'intrinsic semiconductor','n-type semiconductor only','p-type semiconductor only','insulator',
  'A',
  'Undoped semiconductor material is intrinsic.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_010',
  'easy',
  'Doping silicon with a pentavalent impurity generally produces:',
  'n-type semiconductor','p-type semiconductor','insulator','superconductor',
  'A',
  'Pentavalent dopants donate extra electrons.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_011',
  'easy',
  'Doping silicon with a trivalent impurity generally produces:',
  'p-type semiconductor','n-type semiconductor','metal','vacuum',
  'A',
  'Trivalent dopants create holes as majority carriers.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_012',
  'easy',
  'A p-n junction diode allows substantial current mainly when:',
  'forward biased','reverse biased','unbiased always','cooled to zero kelvin',
  'A',
  'Forward bias lowers the junction barrier.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_013',
  'easy',
  'An LED emits light when it is:',
  'forward biased','reverse biased strongly','open circuited','shorted without current limit',
  'A',
  'Electron-hole recombination under forward bias releases photons.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_014',
  'medium',
  'In an n-type semiconductor, majority charge carriers are:',
  'electrons','holes','protons','ions only',
  'A',
  'Donor doping supplies conduction electrons.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_015',
  'medium',
  'In a p-type semiconductor, majority carriers are:',
  'holes','electrons','neutrons','photons',
  'A',
  'Acceptor doping makes holes the majority carriers.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_016',
  'medium',
  'The depletion region of a p-n junction contains mainly:',
  'immobile ions','free majority carriers only','neutral atoms only','photons',
  'A',
  'Diffusion leaves behind fixed ionized donor and acceptor atoms.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_017',
  'medium',
  'Forward bias of a p-n junction generally:',
  'reduces barrier potential','increases barrier potential','eliminates all carriers','widens depletion indefinitely',
  'A',
  'Forward voltage opposes the built-in barrier.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_018',
  'medium',
  'Reverse bias of a p-n junction generally:',
  'widens depletion region','narrows depletion region','creates large forward current','makes resistance zero',
  'A',
  'Reverse voltage increases the barrier and depletion width.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_019',
  'medium',
  'A diode used for rectification converts:',
  'AC to pulsating DC','DC to AC','light to sound','heat to magnetic field',
  'A',
  'Rectifiers allow current preferentially in one direction.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_020',
  'medium',
  'A Zener diode is commonly used for:',
  'voltage regulation','mechanical amplification','magnetic storage','frequency generation only',
  'A',
  'Zener breakdown provides an approximately stable voltage.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_021',
  'medium',
  'A photodiode is commonly operated in:',
  'reverse bias','strong forward bias only','zero bias only always','AC saturation',
  'A',
  'Reverse bias allows efficient detection of light-generated carriers.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_022',
  'medium',
  'A transistor used as a switch operates mainly between:',
  'cutoff and saturation','forward and reverse breakdown only','intrinsic and extrinsic states','two optical modes',
  'A',
  'Digital switching uses cutoff for off and saturation for on.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_023',
  'challenge',
  'A silicon diode with approximate forward drop 0.7 V is in series with 1 kΩ across 5 V. Current is about:',
  '4.3 mA','5.0 mA','0.7 mA','7.1 mA',
  'A',
  'Resistor voltage≈4.3 V, so I≈4.3V/1kΩ=4.3 mA.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_024',
  'challenge',
  'A full-wave rectifier supplied with AC frequency 50 Hz produces output ripple frequency:',
  '100 Hz','50 Hz','25 Hz','200 Hz',
  'A',
  'Both half-cycles are rectified, doubling ripple frequency.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_025',
  'challenge',
  'For a transistor with current gain beta=100 and base current 20 microampere, collector current is approximately:',
  '2 mA','0.2 mA','20 mA','200 mA',
  'A',
  'Ic=beta Ib=100×20 microampere=2000 microampere=2 mA.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ELECTRONIC_DEVICES_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ELECTRONIC_DEVICES_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_008',
  'easy',
  'To reduce parallax error while reading an analog scale, the eye should be placed:',
  'normally above the mark','far to one side','below the table','at any angle',
  'A',
  'Viewing perpendicular to the scale minimizes apparent shift.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_009',
  'easy',
  'A repeated measurement primarily helps estimate:',
  'random uncertainty','the exact true value with certainty','unit conversion only','instrument color',
  'A',
  'Scatter among repeated readings indicates random uncertainty.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_010',
  'easy',
  'The least count of an instrument is the:',
  'smallest reliably readable division','largest reading possible','mean reading','zero error only',
  'A',
  'Least count characterizes its smallest measurement increment.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_011',
  'easy',
  'A zero error is an example of a possible:',
  'systematic error','random error only','statistical fluctuation only','unitless constant',
  'A',
  'An offset present in every reading is systematic.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_012',
  'easy',
  'When plotting experimental data, the independent variable is conventionally placed on the:',
  'horizontal axis','vertical axis','both axes simultaneously','legend only',
  'A',
  'The x-axis conventionally represents the independent variable.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_013',
  'easy',
  'A best-fit straight line is used primarily to:',
  'represent the trend in noisy data','connect every point exactly','remove units','guarantee zero error',
  'A',
  'A best-fit line estimates the underlying relationship despite scatter.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_014',
  'medium',
  'If measured length is 10.0±0.1 cm, fractional uncertainty is:',
  '0.01','0.1','1','10',
  'A',
  'Fractional uncertainty=0.1/10.0=0.01.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_015',
  'medium',
  'If A=(5.0±0.1) cm and B=(2.0±0.1) cm, uncertainty in A+B is approximately:',
  '0.2 cm','0.1 cm','0.02 cm','0.01 cm',
  'A',
  'For worst-case addition, absolute uncertainties add.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_016',
  'medium',
  'For a graph y=mx+c, the slope m is found from:',
  'Delta y/Delta x','Delta x/Delta y','xy','x+y',
  'A',
  'Slope is rise over run.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_017',
  'medium',
  'A straight-line graph passing through the origin suggests y is:',
  'directly proportional to x','inversely proportional to x','independent of x','proportional to x^2 necessarily',
  'A',
  'A zero-intercept straight line indicates y=kx.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_018',
  'medium',
  'In a simple pendulum experiment, plotting T^2 against L should ideally give:',
  'a straight line','a circle','an exponential curve','a horizontal line',
  'A',
  'T=2pi sqrt(L/g), so T^2 is proportional to L.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_019',
  'medium',
  'A meter scale marked in millimetres has least count:',
  '1 mm','1 cm','0.1 mm','10 mm',
  'A',
  'Adjacent smallest graduations are 1 mm apart.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_020',
  'medium',
  'The screw-gauge least count equals:',
  'pitch divided by number of circular-scale divisions','pitch times circular divisions','circular divisions divided by pitch','zero error divided by pitch',
  'A',
  'Least count=one linear advance per revolution divided by circular divisions.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_021',
  'medium',
  'If 20 vernier divisions equal 19 main-scale divisions and 1 MSD=1 mm, least count is:',
  '0.05 mm','0.95 mm','1.0 mm','0.5 mm',
  'A',
  '1 VSD=19/20 mm=0.95 mm, so LC=1-0.95=0.05 mm.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_022',
  'medium',
  'A graph of V versus I for an ohmic resistor has slope equal to:',
  'resistance','conductance','power','charge',
  'A',
  'From V=IR, slope DeltaV/DeltaI=R.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_023',
  'challenge',
  'Five measurements are 10.1, 10.2, 10.0, 10.1 and 10.1 cm. Their mean is:',
  '10.1 cm','10.0 cm','10.2 cm','10.5 cm',
  'A',
  'Sum is 50.5 cm; dividing by 5 gives 10.1 cm.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_024',
  'challenge',
  'A measured quantity z=xy has fractional uncertainties 2% in x and 3% in y. Maximum fractional uncertainty in z is approximately:',
  '5%','1%','6%','0.06%',
  'A',
  'For multiplication, maximum percentage uncertainties add: 2%+3%=5%.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_025',
  'challenge',
  'In an experiment, a graph of y against x has slope 4.0±0.2. The percentage uncertainty in slope is:',
  '5%','20%','0.5%','50%',
  'A',
  'Percentage uncertainty=(0.2/4.0)×100=5%.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EXPERIMENTAL_SKILLS'
  AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'EXPERIMENTAL_SKILLS_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_EXPERIMENTAL_SKILLS_025';

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
  AND t.topic_code IN ('OPTICS','DUAL_NATURE','ATOMS_AND_NUCLEI','ELECTRONIC_DEVICES','EXPERIMENTAL_SKILLS')
GROUP BY t.id,t.sort_order,t.topic_code
ORDER BY t.sort_order;

SELECT COUNT(q.id) AS active_questions_topics_16_20
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND q.active=1
  AND t.topic_code IN ('OPTICS','DUAL_NATURE','ATOMS_AND_NUCLEI','ELECTRONIC_DEVICES','EXPERIMENTAL_SKILLS');

SELECT
  COUNT(DISTINCT t.id) AS physics_topics,
  COUNT(q.id) AS active_physics_questions,
  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.exam_level='NEET'
      THEN 1 ELSE 0
    END
  ) AS tracked_neet_2026
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
JOIN education_subtopics st ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
LEFT JOIN education_question_metadata qm ON qm.question_id=q.id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.enabled=1
  AND t.topic_code <> 'PHYSICS';
