-- 0172_jee_live_243J_guided.sql
-- Rebuild JEE Live Test #243J (2026-09-15) as a Guided weekday test.
--
-- Keeps the scheduler's intended topics:
--   MATH      -> LIMITS_CONTINUITY_DIFFERENTIABILITY
--   PHYSICS   -> PROPERTIES_SOLIDS_LIQUIDS
--   CHEMISTRY -> REDOX_ELECTROCHEMISTRY
--
-- Difficulty mix:
--   easy 2 · medium 4 · challenge 2
--
-- Every question has:
--   explanation · Tip · 50/50 elimination reasons
--
-- IMPORTANT:
-- Run before real attempts begin for #243J.
-- This migration deliberately refuses to replace the paper if attempts
-- already exist for this live test.

-- ---------------------------------------------------------------------------
-- D1-safe protection:
-- Do not replace the #243J paper if an attempt already exists.
--
-- Cloudflare D1 rejects CREATE TEMP TABLE with SQLITE_AUTH, so this migration
-- uses NOT EXISTS guards on the paper replacement statements instead.
-- The new question rows may still be created, but they will remain unused if
-- #243J already has an attempt.
-- ---------------------------------------------------------------------------

-- ===========================================================================
-- 1. MATH · easy
-- Topic inherited from existing scheduled question #1.
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id,
  question_key,
  difficulty,
  question_text,
  choice_a,
  choice_b,
  choice_c,
  choice_d,
  correct_choice,
  explanation,
  active,
  source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_001',
  'easy',
  'Evaluate lim(x→0) (1-cos 2x)/x².',
  '1',
  '2',
  '4',
  '0',
  'B',
  'Use 1-cos 2x = 2 sin²x. Then (1-cos 2x)/x² = 2(sin x/x)² → 2.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_002';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,
  exam_level,
  question_format,
  syllabus_version,
  quality_status,
  archetype_code,
  source_note
)
SELECT
  q.id,
  'MAIN',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'GUIDED_LIVE_243J_MATH_01',
  'GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_001';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,
  tip_text,
  tip_status,
  fifty_fifty_choice_1,
  fifty_fifty_reason_1,
  fifty_fifty_choice_2,
  fifty_fifty_reason_2
)
SELECT
  q.id,
  'Rewrite the numerator with a standard trigonometric identity so that sin x / x appears.',
  'READY',
  'A',
  'The small-angle expansion gives a coefficient larger than 1 here because the angle is 2x.',
  'D',
  'The numerator and denominator are both second order in x, so the limit is finite and nonzero.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_001';


-- ===========================================================================
-- 2. MATH · medium
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id, question_key, difficulty, question_text,
  choice_a, choice_b, choice_c, choice_d,
  correct_choice, explanation, active, source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_002',
  'medium',
  'If f(x)=x²e^x, then f''(0) equals:',
  '0',
  '1',
  '2',
  '4',
  'C',
  'f''(x)=e^x(x²+4x+2), so f''(0)=2.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_003';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,exam_level,question_format,syllabus_version,
  quality_status,archetype_code,source_note
)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_LIVE_243J_MATH_02','GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_002';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,tip_text,tip_status,
  fifty_fifty_choice_1,fifty_fifty_reason_1,
  fifty_fifty_choice_2,fifty_fifty_reason_2
)
SELECT
  q.id,
  'Differentiate with the product rule twice; simplify only after taking the derivatives.',
  'READY',
  'A',
  'Although f(0)=0, the second derivative need not vanish.',
  'D',
  'A factor of 4 appears in the x-term of f'', not as the constant term at x=0.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_002';


-- ===========================================================================
-- 3. MATH · challenge
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id, question_key, difficulty, question_text,
  choice_a, choice_b, choice_c, choice_d,
  correct_choice, explanation, active, source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_003',
  'challenge',
  'Let f(x)=(x²-1)/(x-1) for x≠1 and f(1)=k. For f to be differentiable at x=1, k must be:',
  '0',
  '1',
  '2',
  'No value of k',
  'C',
  'For x≠1, f(x)=x+1. Continuity at x=1 therefore requires k=2; the resulting function is x+1 and is differentiable there.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_004';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,exam_level,question_format,syllabus_version,
  quality_status,archetype_code,source_note
)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_LIVE_243J_MATH_03','GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_003';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,tip_text,tip_status,
  fifty_fifty_choice_1,fifty_fifty_reason_1,
  fifty_fifty_choice_2,fifty_fifty_reason_2
)
SELECT
  q.id,
  'Differentiability first requires continuity. Simplify the expression for x≠1 before evaluating the limiting value.',
  'READY',
  'A',
  'The limiting value near x=1 is not zero after cancellation.',
  'D',
  'The apparent discontinuity is removable; an appropriate definition at x=1 can make the function smooth.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_003';


-- ===========================================================================
-- 4. PHYSICS · easy
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id, question_key, difficulty, question_text,
  choice_a, choice_b, choice_c, choice_d,
  correct_choice, explanation, active, source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_004',
  'easy',
  'A force of 200 N acts normally on an area of 4×10⁻⁴ m². The normal stress is:',
  '5×10³ Pa',
  '5×10⁴ Pa',
  '5×10⁵ Pa',
  '8×10⁵ Pa',
  'C',
  'Stress = F/A = 200/(4×10⁻⁴) = 5×10⁵ Pa.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_006';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,exam_level,question_format,syllabus_version,
  quality_status,archetype_code,source_note
)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_LIVE_243J_PHYSICS_01','GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_004';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,tip_text,tip_status,
  fifty_fifty_choice_1,fifty_fifty_reason_1,
  fifty_fifty_choice_2,fifty_fifty_reason_2
)
SELECT
  q.id,
  'Start from stress = force / area, and handle the negative power of ten carefully.',
  'READY',
  'A',
  'Dividing by 10⁻⁴ increases the power of ten rather than decreasing it.',
  'D',
  'The numerical factor comes from 200/4 = 50 before accounting for 10⁻⁴.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_004';


-- ===========================================================================
-- 5. PHYSICS · medium
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id, question_key, difficulty, question_text,
  choice_a, choice_b, choice_c, choice_d,
  correct_choice, explanation, active, source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_005',
  'medium',
  'A liquid experiences an increase in pressure of 2×10⁶ Pa and its volume decreases by 0.1%. Its bulk modulus is:',
  '2×10⁶ Pa',
  '2×10⁷ Pa',
  '2×10⁸ Pa',
  '2×10⁹ Pa',
  'D',
  'Bulk modulus B = ΔP/(|ΔV|/V). Here 0.1%=10⁻³, so B=2×10⁶/10⁻³=2×10⁹ Pa.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_007';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,exam_level,question_format,syllabus_version,
  quality_status,archetype_code,source_note
)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_LIVE_243J_PHYSICS_02','GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_005';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,tip_text,tip_status,
  fifty_fifty_choice_1,fifty_fifty_reason_1,
  fifty_fifty_choice_2,fifty_fifty_reason_2
)
SELECT
  q.id,
  'Convert the percentage volume change into a fraction before using B = pressure change / fractional volume change.',
  'READY',
  'A',
  'Bulk modulus is not simply the pressure change; it is divided by the fractional compression.',
  'B',
  'A 0.1% change corresponds to 10⁻³, not 10⁻¹.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_005';


-- ===========================================================================
-- 6. PHYSICS · medium
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id, question_key, difficulty, question_text,
  choice_a, choice_b, choice_c, choice_d,
  correct_choice, explanation, active, source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_006',
  'medium',
  'Water rises to height h in a capillary tube of radius r. If the radius is changed to r/2 under identical conditions, the new rise is:',
  'h/4',
  'h/2',
  '2h',
  '4h',
  'C',
  'Capillary rise h = 2T cosθ/(ρgr), hence h∝1/r. Halving r doubles the rise.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_008';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,exam_level,question_format,syllabus_version,
  quality_status,archetype_code,source_note
)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_LIVE_243J_PHYSICS_03','GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_006';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,tip_text,tip_status,
  fifty_fifty_choice_1,fifty_fifty_reason_1,
  fifty_fifty_choice_2,fifty_fifty_reason_2
)
SELECT
  q.id,
  'Recall how capillary rise depends on tube radius when surface tension, density and contact angle stay fixed.',
  'READY',
  'A',
  'Capillary rise varies inversely with radius, not with radius squared.',
  'B',
  'Reducing the radius increases the rise rather than decreasing it.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_006';


-- ===========================================================================
-- 7. CHEMISTRY · medium
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id, question_key, difficulty, question_text,
  choice_a, choice_b, choice_c, choice_d,
  correct_choice, explanation, active, source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_007',
  'medium',
  'For the galvanic cell Zn|Zn²⁺ || Cu²⁺|Cu, E°(Cu²⁺/Cu)=+0.34 V and E°(Zn²⁺/Zn)=-0.76 V. The standard cell potential is:',
  '-1.10 V',
  '-0.42 V',
  '+0.42 V',
  '+1.10 V',
  'D',
  'E°cell = E°cathode - E°anode = 0.34 - (-0.76) = 1.10 V.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_007';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,exam_level,question_format,syllabus_version,
  quality_status,archetype_code,source_note
)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_LIVE_243J_CHEMISTRY_01','GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_007';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,tip_text,tip_status,
  fifty_fifty_choice_1,fifty_fifty_reason_1,
  fifty_fifty_choice_2,fifty_fifty_reason_2
)
SELECT
  q.id,
  'Identify the cathode and anode first, then use reduction potentials in E°cell = E°cathode - E°anode.',
  'READY',
  'A',
  'A spontaneous galvanic cell under standard conditions should have a positive E°cell.',
  'C',
  'Subtracting a negative anode potential gives a sum of magnitudes, not their difference.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_007';


-- ===========================================================================
-- 8. CHEMISTRY · challenge
-- ===========================================================================

INSERT OR IGNORE INTO education_questions (
  subtopic_id, question_key, difficulty, question_text,
  choice_a, choice_b, choice_c, choice_d,
  correct_choice, explanation, active, source_type
)
SELECT
  src.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_LIVE_243J_008',
  'challenge',
  'At 298 K, for a cell reaction involving n=2 electrons, E°cell=0.30 V and reaction quotient Q=100. Using E=E°-(0.0591/n)log Q, Ecell is closest to:',
  '0.18 V',
  '0.24 V',
  '0.30 V',
  '0.36 V',
  'B',
  'log 100=2. Thus correction=(0.0591/2)×2=0.0591 V and E≈0.30-0.0591=0.241 V.',
  1,
  'gyan-guided-live'
FROM education_questions src
WHERE src.question_key =
  'IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_008';

INSERT OR REPLACE INTO education_question_metadata (
  question_id,exam_level,question_format,syllabus_version,
  quality_status,archetype_code,source_note
)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_LIVE_243J_CHEMISTRY_02','GYAN JEE Guided Live Test 243J'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_008';

INSERT OR REPLACE INTO education_question_guidance (
  question_id,tip_text,tip_status,
  fifty_fifty_choice_1,fifty_fifty_reason_1,
  fifty_fifty_choice_2,fifty_fifty_reason_2
)
SELECT
  q.id,
  'Evaluate log Q first. Notice that Q>1 makes the Nernst correction subtract from E°.',
  'READY',
  'C',
  'Because Q is not 1, the Nernst correction is not zero.',
  'D',
  'For Q>1 the logarithmic term is positive and is subtracted, so E must be below E°.'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_008';


-- ===========================================================================
-- Replace #243J question paper with the eight Guided questions.
-- ===========================================================================

DELETE FROM education_live_test_questions
WHERE live_test_id = (
  SELECT id
  FROM education_live_tests
  WHERE public_code='243J'
  LIMIT 1
)
AND NOT EXISTS (
  SELECT 1
  FROM education_live_attempts a
  JOIN education_live_tests lt2
    ON lt2.id = a.live_test_id
  WHERE lt2.public_code='243J'
);

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  1,
  'MATH',
  'MATH',
  'LIMITS_CONTINUITY_DIFFERENTIABILITY'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_001'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  2,
  'MATH',
  'MATH',
  'LIMITS_CONTINUITY_DIFFERENTIABILITY'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_002'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  3,
  'MATH',
  'MATH',
  'LIMITS_CONTINUITY_DIFFERENTIABILITY'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_003'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  4,
  'PHYSICS',
  'PHYSICS',
  'PROPERTIES_SOLIDS_LIQUIDS'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_004'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  5,
  'PHYSICS',
  'PHYSICS',
  'PROPERTIES_SOLIDS_LIQUIDS'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_005'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  6,
  'PHYSICS',
  'PHYSICS',
  'PROPERTIES_SOLIDS_LIQUIDS'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_006'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  7,
  'CHEMISTRY',
  'CHEMISTRY',
  'REDOX_ELECTROCHEMISTRY'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_007'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

INSERT INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code
)
SELECT
  lt.id,
  q.id,
  8,
  'CHEMISTRY',
  'CHEMISTRY',
  'REDOX_ELECTROCHEMISTRY'
FROM education_live_tests lt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_LIVE_243J_008'
WHERE lt.public_code='243J'
  AND NOT EXISTS (
    SELECT 1
    FROM education_live_attempts a
    WHERE a.live_test_id = lt.id
  );

-- ===========================================================================
-- Verification
-- ===========================================================================

SELECT
  lt.public_code,
  lt.source_schedule_date,
  lt.duration_minutes,
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM education_live_attempts a
      WHERE a.live_test_id = lt.id
    )
    THEN 'SKIPPED_EXISTING_ATTEMPT'
    ELSE 'REBUILT'
  END AS rebuild_status,
  COUNT(lq.question_id) AS questions,
  SUM(
    CASE
      WHEN COALESCE(g.tip_text,'') <> ''
       AND UPPER(COALESCE(g.tip_status,''))='READY'
      THEN 1 ELSE 0
    END
  ) AS tips,
  SUM(
    CASE
      WHEN g.fifty_fifty_choice_1 IS NOT NULL
       AND g.fifty_fifty_choice_2 IS NOT NULL
      THEN 1 ELSE 0
    END
  ) AS fifty_fifty,
  SUM(CASE WHEN q.difficulty='easy' THEN 1 ELSE 0 END) AS easy,
  SUM(CASE WHEN q.difficulty='medium' THEN 1 ELSE 0 END) AS medium,
  SUM(CASE WHEN q.difficulty='challenge' THEN 1 ELSE 0 END) AS challenge
FROM education_live_tests lt
JOIN education_live_test_questions lq
  ON lq.live_test_id=lt.id
JOIN education_questions q
  ON q.id=lq.question_id
LEFT JOIN education_question_guidance g
  ON g.question_id=q.id
WHERE lt.public_code='243J'
GROUP BY
  lt.id,
  lt.public_code,
  lt.source_schedule_date,
  lt.duration_minutes;

SELECT
  lq.question_order,
  lq.section_code,
  q.difficulty,
  q.question_key,
  q.question_text,
  g.tip_status,
  CASE
    WHEN g.fifty_fifty_choice_1 IS NOT NULL
     AND g.fifty_fifty_choice_2 IS NOT NULL
    THEN 1 ELSE 0
  END AS has_fifty_fifty
FROM education_live_tests lt
JOIN education_live_test_questions lq
  ON lq.live_test_id=lt.id
JOIN education_questions q
  ON q.id=lq.question_id
LEFT JOIN education_question_guidance g
  ON g.question_id=q.id
WHERE lt.public_code='243J'
ORDER BY lq.question_order;
