-- 0170_jee_guided_test1_repair_and_fifty_fifty.sql
-- Repairs the 3 missing JEE Guided Test 1 questions and adds 50/50 guidance support.
-- Apply AFTER 0167 and 0168.

PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------
-- 1. Extend guidance for a second assistance type: 50/50.
--    Only meaningful for SINGLE_CHOICE questions.
-- ------------------------------------------------------------

ALTER TABLE education_question_guidance
ADD COLUMN fifty_fifty_choice_1 TEXT;

ALTER TABLE education_question_guidance
ADD COLUMN fifty_fifty_reason_1 TEXT;

ALTER TABLE education_question_guidance
ADD COLUMN fifty_fifty_choice_2 TEXT;

ALTER TABLE education_question_guidance
ADD COLUMN fifty_fifty_reason_2 TEXT;

-- ------------------------------------------------------------
-- 2. Repair missing Q22.
--    Anchor from existing generated Q21 so we do not depend on
--    the missing historical QT1_NUM_02 anchor.
-- ------------------------------------------------------------

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_022',
  'medium',
  'The sum of the first 10 positive integers is:',
  '55','','','',
  'A',
  '10·11/2=55.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_021'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_022',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["55"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use the formula n(n+1)/2.','READY',1,
       'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022';

INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,22,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1;

-- ------------------------------------------------------------
-- 3. Repair missing Q25.
--    Anchor from existing generated Q24.
-- ------------------------------------------------------------

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_025',
  'challenge',
  'If vectors a=(2,1,-1) and b=(1,3,2), enter a·b.',
  '3','','','',
  'A',
  'a·b=2·1+1·3+(-1)·2=3.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_024'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_025',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["3"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,
       'Multiply corresponding components, including the sign of the last component.',
       'READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025';

INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,25,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1;

-- ------------------------------------------------------------
-- 4. Repair missing Q71.
--    Anchor from existing generated Q72.
-- ------------------------------------------------------------

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_071',
  'medium',
  'Enter the number of moles in 44 g of CO₂. (Molar mass 44 g/mol)',
  '1','','','',
  'A',
  'n=m/M=44/44=1 mol.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_072'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_071',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["1"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use moles = given mass / molar mass.','READY',1,
       'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071';

INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,71,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1;

-- ------------------------------------------------------------
-- 5. Seed 50/50 for today's #242J candidate.
--    We store TWO wrong options and why each can be rejected.
-- ------------------------------------------------------------

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='C',
  fifty_fifty_reason_1='5/4 is greater than 1, but an ellipse has eccentricity less than 1.',
  fifty_fifty_choice_2='D',
  fifty_fifty_reason_2='2/5 does not follow from c²=a²-b² for this ellipse.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_01'
);

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='C',
  fifty_fifty_reason_1='4 is the semi-major axis, not the latus-rectum length.',
  fifty_fifty_choice_2='D',
  fifty_fifty_reason_2='8 results from multiplying rather than using 2b²/a.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_02'
);

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='C',
  fifty_fifty_reason_1='3/5 is less than 1, while a hyperbola must have eccentricity greater than 1.',
  fifty_fifty_choice_2='D',
  fifty_fifty_reason_2='5/4 uses the wrong denominator; eccentricity is c/a.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_03'
);

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='A',
  fifty_fifty_reason_1='This multiplies stress and strain-like terms instead of taking stress divided by strain.',
  fifty_fifty_choice_2='C',
  fifty_fifty_reason_2='The dimensions do not reduce to pressure, which Young''s modulus must have.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_04'
);

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='A',
  fifty_fifty_reason_1='Viscosity resists relative motion within a fluid; it is not the main cause of capillary rise.',
  fifty_fifty_choice_2='C',
  fifty_fifty_reason_2='Bulk modulus describes compressibility, not the upward surface force in a capillary.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_05'
);

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='A',
  fifty_fifty_reason_1='Halving speed as well as area would reduce the flow rate instead of conserving it.',
  fifty_fifty_choice_2='D',
  fifty_fifty_reason_2='A fourfold speed increase would overcompensate for the area being halved.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_06'
);

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='C',
  fifty_fifty_reason_1='Faraday''s law concerns electrolysis, not vapour pressure of liquid mixtures.',
  fifty_fifty_choice_2='D',
  fifty_fifty_reason_2='Arrhenius relationships describe temperature dependence/rates, not ideal-solution vapour pressure.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_07'
);

UPDATE education_question_guidance
SET
  fifty_fifty_choice_1='A',
  fifty_fifty_reason_1='One litre is a volume unit; molality is defined using mass of solvent.',
  fifty_fifty_choice_2='C',
  fifty_fifty_reason_2='Molality uses kilograms of solvent, not kilograms of the final solution.',
  updated_at=CURRENT_TIMESTAMP
WHERE question_id=(
  SELECT id FROM education_questions
  WHERE question_key='IN_PROGRAM_JEE_LIVE_242J_GUIDED_08'
);

-- ------------------------------------------------------------
-- 6. Verification.
-- ------------------------------------------------------------

SELECT
  mt.program_code,
  mt.test_code,
  mt.exam_level,
  COUNT(*) AS questions,
  SUM(CASE WHEN g.tip_status='READY' AND COALESCE(g.tip_text,'')<>'' THEN 1 ELSE 0 END) AS tips
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
JOIN education_questions q
  ON q.id=mtq.question_id
LEFT JOIN education_question_guidance g
  ON g.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id;

SELECT
  lt.public_code,
  COUNT(*) AS questions,
  SUM(CASE WHEN COALESCE(g.tip_text,'')<>'' THEN 1 ELSE 0 END) AS tips,
  SUM(
    CASE
      WHEN g.fifty_fifty_choice_1 IS NOT NULL
       AND g.fifty_fifty_choice_2 IS NOT NULL
      THEN 1 ELSE 0
    END
  ) AS fifty_fifty
FROM education_live_tests lt
JOIN education_live_test_questions lq
  ON lq.live_test_id=lt.id
LEFT JOIN education_question_guidance g
  ON g.question_id=lq.question_id
WHERE lt.public_code='242J'
GROUP BY lt.id;
