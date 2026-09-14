-- 0169_jee_live_242J_guided_candidate.sql
-- Monday Sep 14, 2026 JEE Guided Live Test candidate.
-- Scheduled topics:
--   MATH      Coordinate Geometry: Ellipse & Hyperbola
--   PHYSICS   Properties of Matter
--   CHEMISTRY Solutions
--
-- 8 questions = 3 Math / 3 Physics / 2 Chemistry.
-- Tips are stored with each question.
-- Apply LOCAL first and verify before production.
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_live_tests (
  series_number,series_suffix,public_code,program_code,mock_test_id,
  starts_at_utc,schedule_timezone,duration_minutes,entry_gem_cost,
  report_gem_cost,status,test_fraction_percent,event_kind,
  source_schedule_date,visible,visibility_mode,batch_code
)
SELECT
  242,'J','242J','JEE',mt.id,
  '2026-09-14 15:45:00','Asia/Kolkata',60,5,15,
  'SCHEDULED',10,'BATCH_AUTO','2026-09-14',0,'AUTO','2026_SEP_OCT'
FROM education_mock_tests mt
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.exam_level='MAIN'
ORDER BY CASE WHEN mt.test_code='MINI_A' THEN 0 ELSE 1 END,mt.id
LIMIT 1;

UPDATE education_live_tests
SET starts_at_utc='2026-09-14 15:45:00',
    schedule_timezone='Asia/Kolkata',
    duration_minutes=60,
    test_fraction_percent=10,
    source_schedule_date='2026-09-14',
    event_kind='BATCH_AUTO',
    batch_code='2026_SEP_OCT'
WHERE public_code='242J';

-- Replace frozen questions only when there are no submitted attempts.
DELETE FROM education_live_test_questions
WHERE live_test_id IN (
  SELECT lt.id
  FROM education_live_tests lt
  WHERE lt.public_code='242J'
    AND NOT EXISTS (
      SELECT 1 FROM education_live_attempts la
      WHERE la.live_test_id=lt.id
    )
);


-- 1. MATH
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_01','medium','For the ellipse x²/25 + y²/9 = 1, the eccentricity is:',
       '3/5','4/5','5/4','2/5',
       'B','Here a²=25, b²=9, so c²=a²-b²=16 and e=c/a=4/5.',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_01','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["3/5","4/5","5/4","2/5"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_01';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Find c from c²=a²-b² before dividing by the semi-major axis.','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_01';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,1,'MATH','MATH',
       CASE
         WHEN 'MATH'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'MATH'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_01'
WHERE lt.public_code='242J';


-- 2. MATH
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_02','challenge','The length of the latus rectum of x²/16 + y²/4 = 1 is:',
       '1','2','4','8',
       'B','For an ellipse, latus rectum length=2b²/a=2·4/4=2.',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_02','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1","2","4","8"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_02';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Identify a and b first, then use the latus-rectum formula.','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_02';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,2,'MATH','MATH',
       CASE
         WHEN 'MATH'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'MATH'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_02'
WHERE lt.public_code='242J';


-- 3. MATH
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_03','medium','For the hyperbola x²/9 - y²/16 = 1, the eccentricity is:',
       '4/3','5/3','3/5','5/4',
       'B','For a hyperbola c²=a²+b²=25, so c=5 and e=c/a=5/3.',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_03','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["4/3","5/3","3/5","5/4"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_03';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'For a hyperbola the focal relation uses a²+b², not a²-b².','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_03';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,3,'MATH','MATH',
       CASE
         WHEN 'MATH'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'MATH'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_03'
WHERE lt.public_code='242J';


-- 4. PHYSICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_04','medium','A wire of length L and area A extends by ΔL under force F. Young''s modulus is:',
       'FΔL/AL','FL/AΔL','FA/LΔL','AΔL/FL',
       'B','Y=(stress)/(strain)=(F/A)/(ΔL/L)=FL/(AΔL).',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_04','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["FΔL/AL","FL/AΔL","FA/LΔL","AΔL/FL"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_04';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Write stress and strain separately before taking their ratio.','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_04';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,4,'PHYSICS','PHYSICS',
       CASE
         WHEN 'PHYSICS'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'PHYSICS'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_04'
WHERE lt.public_code='242J';


-- 5. PHYSICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_05','medium','Water rises in a capillary tube mainly because of:',
       'viscosity','surface tension','bulk modulus','vapour pressure',
       'B','Capillary rise results from surface tension together with wetting/contact angle.',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_05','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["viscosity","surface tension","bulk modulus","vapour pressure"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_05';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Think about the force acting along the liquid surface at the wall.','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_05';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,5,'PHYSICS','PHYSICS',
       CASE
         WHEN 'PHYSICS'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'PHYSICS'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_05'
WHERE lt.public_code='242J';


-- 6. PHYSICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_06','challenge','For steady incompressible flow through a pipe, if cross-sectional area halves, speed becomes:',
       'half','same','double','four times',
       'C','Continuity gives Av=constant; halving A doubles v.',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_06','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_06';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["half","same","double","four times"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_06';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Apply conservation of volume flow rate.','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_06';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,6,'PHYSICS','PHYSICS',
       CASE
         WHEN 'PHYSICS'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'PHYSICS'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_06'
WHERE lt.public_code='242J';


-- 7. CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_07','medium','For an ideal solution, which relation is obeyed by each volatile component?',
       'Henry''s law only','Raoult''s law','Faraday''s law','Arrhenius law',
       'B','Each component of an ideal solution obeys Raoult''s law over the full composition range.',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_07','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_07';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["Henry''s law only","Raoult''s law","Faraday''s law","Arrhenius law"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_07';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Recall the vapour-pressure relation that defines ideal liquid mixtures.','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_07';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,7,'CHEMISTRY','CHEMISTRY',
       CASE
         WHEN 'CHEMISTRY'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'CHEMISTRY'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_07'
WHERE lt.public_code='242J';


-- 8. CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,correct_choice,explanation,active,source_type)
SELECT anchor.subtopic_id,'IN_PROGRAM_JEE_LIVE_242J_GUIDED_08','challenge','A 1 molal aqueous solution contains 1 mol solute per:',
       '1 L solution','1 L solvent','1 kg solution','1 kg solvent',
       'D','Molality is moles of solute per kilogram of solvent.',1,'gyan-live-guided-v1'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'LIVE_242J_GUIDED_08','GYAN JEE #242J Guided'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_08';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1 L solution","1 L solvent","1 kg solution","1 kg solvent"]','["D"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_08';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Distinguish molality from molarity by focusing on mass of solvent rather than volume of solution.','READY',1,'live-242J-guided',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_08';

INSERT OR IGNORE INTO education_live_test_questions
(live_test_id,question_id,question_order,section_code,
 source_subject_code,source_topic_code,selection_reason)
SELECT lt.id,q.id,8,'CHEMISTRY','CHEMISTRY',
       CASE
         WHEN 'CHEMISTRY'='MATH' THEN 'COORDINATE_GEOMETRY'
         WHEN 'CHEMISTRY'='PHYSICS' THEN 'PROPERTIES_SOLIDS_LIQUIDS'
         ELSE 'SOLUTIONS'
       END,
       'MANUAL'
FROM education_live_tests lt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_08'
WHERE lt.public_code='242J';


SELECT
  lt.public_code,
  lt.source_schedule_date,
  lt.duration_minutes,
  COUNT(lq.question_id) AS questions,
  SUM(CASE WHEN g.tip_status='READY' THEN 1 ELSE 0 END) AS tips
FROM education_live_tests lt
LEFT JOIN education_live_test_questions lq ON lq.live_test_id=lt.id
LEFT JOIN education_question_guidance g ON g.question_id=lq.question_id
WHERE lt.public_code='242J'
GROUP BY lt.id;
