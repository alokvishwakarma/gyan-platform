-- 0153_seed_sat_classes_2026_sep_oct.sql
-- SAT Sep-Oct 2026 batch
-- Weekdays Sep 1-Oct 30, 2026
-- Reading & Writing: 18:30-19:00 America/New_York
-- Math:              19:00-19:30 America/New_York
-- Designed to finish immediately before the standard 19:30 SAT Live Test slot.
--
-- Topic codes use the existing PROGRAM_SAT catalog rebuilt in migration 0099.

INSERT INTO education_live_class_schedule
(
  schedule_date,
  program_code,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone,
  sequence_number,
  active
)
VALUES
  ('2026-09-01', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Words in Context', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-01', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Equations in One Variable', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-02', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Central Ideas and Details', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-02', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Equivalent Expressions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-03', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Boundaries', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-03', 'SAT', 'MATH', 'PROBLEM_SOLVING_DATA', 'Problem-Solving and Data Analysis · Ratios, Rates, Proportions, and Units', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-04', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Rhetorical Synthesis', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-04', 'SAT', 'MATH', 'GEOMETRY_TRIG', 'Geometry and Trigonometry · Area and Volume', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-07', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Text Structure and Purpose', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-07', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Equations in Two Variables', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-08', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Inferences', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-08', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Nonlinear Equations in One Variable', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-09', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Form, Structure, and Sense', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-09', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Functions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-10', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Transitions', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-10', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Systems of Equations in Two Variables', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-11', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Cross-Text Connections', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-11', 'SAT', 'MATH', 'PROBLEM_SOLVING_DATA', 'Problem-Solving and Data Analysis · Percentages', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-14', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Command of Evidence · Textual', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-14', 'SAT', 'MATH', 'GEOMETRY_TRIG', 'Geometry and Trigonometry · Lines, Angles, and Triangles', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-15', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Boundaries', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-15', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Systems of Two Linear Equations', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-16', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Rhetorical Synthesis', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-16', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Nonlinear Functions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-17', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Words in Context', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-17', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Inequalities', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-18', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Command of Evidence · Quantitative', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-18', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Equivalent Expressions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-21', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Form, Structure, and Sense', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-21', 'SAT', 'MATH', 'PROBLEM_SOLVING_DATA', 'Problem-Solving and Data Analysis · One-Variable Data', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-22', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Text Structure and Purpose', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-22', 'SAT', 'MATH', 'GEOMETRY_TRIG', 'Geometry and Trigonometry · Right Triangles and Trigonometry', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-23', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Central Ideas and Details', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-23', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Equations in One Variable', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-24', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Transitions', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-24', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Nonlinear Equations in One Variable', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-25', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Boundaries', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-25', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Equations in Two Variables', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-28', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Cross-Text Connections', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-28', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Systems of Equations in Two Variables', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-29', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Inferences', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-29', 'SAT', 'MATH', 'PROBLEM_SOLVING_DATA', 'Problem-Solving and Data Analysis · Two-Variable Data', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-09-30', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Form, Structure, and Sense', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-09-30', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Functions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-01', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Rhetorical Synthesis', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-01', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Nonlinear Functions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-02', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Words in Context', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-02', 'SAT', 'MATH', 'GEOMETRY_TRIG', 'Geometry and Trigonometry · Circles', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-05', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Command of Evidence · Textual', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-05', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Systems of Two Linear Equations', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-06', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Boundaries', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-06', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Equivalent Expressions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-07', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Transitions', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-07', 'SAT', 'MATH', 'PROBLEM_SOLVING_DATA', 'Problem-Solving and Data Analysis · Probability and Conditional Probability', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-08', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Text Structure and Purpose', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-08', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Inequalities', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-09', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Command of Evidence · Quantitative', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-09', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Nonlinear Equations in One Variable', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-12', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Form, Structure, and Sense', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-12', 'SAT', 'MATH', 'GEOMETRY_TRIG', 'Geometry and Trigonometry · Area and Volume', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-13', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Cross-Text Connections', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-13', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Equations in One Variable', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-14', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Central Ideas and Details', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-14', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Systems of Equations in Two Variables', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-15', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Rhetorical Synthesis', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-15', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Equations in Two Variables', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-16', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Boundaries', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-16', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Nonlinear Functions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-19', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Words in Context', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-19', 'SAT', 'MATH', 'PROBLEM_SOLVING_DATA', 'Problem-Solving and Data Analysis · Inference and Margin of Error', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-20', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Inferences', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-20', 'SAT', 'MATH', 'GEOMETRY_TRIG', 'Geometry and Trigonometry · Lines, Angles, and Triangles', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-21', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Transitions', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-21', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Functions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-22', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Form, Structure, and Sense', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-22', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Equivalent Expressions', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-23', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Text Structure and Purpose', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-23', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Systems of Two Linear Equations', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-26', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Command of Evidence · Textual', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-26', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Nonlinear Equations in One Variable', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-27', 'SAT', 'RW', 'EXPRESSION_IDEAS', 'Expression of Ideas · Rhetorical Synthesis', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-27', 'SAT', 'MATH', 'PROBLEM_SOLVING_DATA', 'Problem-Solving and Data Analysis · Evaluating Statistical Claims', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-28', 'SAT', 'RW', 'STANDARD_ENGLISH', 'Standard English Conventions · Boundaries', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-28', 'SAT', 'MATH', 'GEOMETRY_TRIG', 'Geometry and Trigonometry · Right Triangles and Trigonometry', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-29', 'SAT', 'RW', 'CRAFT_STRUCTURE', 'Craft and Structure · Cross-Text Connections', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-29', 'SAT', 'MATH', 'ALGEBRA', 'Algebra · Linear Inequalities', '19:00', '19:30', 'America/New_York', 2, 1),
  ('2026-10-30', 'SAT', 'RW', 'INFO_IDEAS', 'Information and Ideas · Command of Evidence · Quantitative', '18:30', '19:00', 'America/New_York', 1, 1),
  ('2026-10-30', 'SAT', 'MATH', 'ADVANCED_MATH', 'Advanced Math · Systems of Equations in Two Variables', '19:00', '19:30', 'America/New_York', 2, 1)
ON CONFLICT(schedule_date, program_code, subject_code, sequence_number)
DO UPDATE SET
  topic_code = excluded.topic_code,
  topic_name = excluded.topic_name,
  class_start_local = excluded.class_start_local,
  class_end_local = excluded.class_end_local,
  schedule_timezone = excluded.schedule_timezone,
  active = excluded.active,
  updated_at = CURRENT_TIMESTAMP;

-- Verification summary.
SELECT
  MIN(schedule_date) AS first_class,
  MAX(schedule_date) AS last_class,
  COUNT(*) AS class_rows,
  COUNT(DISTINCT schedule_date) AS class_days
FROM education_live_class_schedule
WHERE program_code = 'SAT'
  AND schedule_date >= '2026-09-01'
  AND schedule_date <= '2026-10-31'
  AND active = 1;

SELECT
  subject_code,
  topic_code,
  COUNT(*) AS sessions
FROM education_live_class_schedule
WHERE program_code = 'SAT'
  AND schedule_date >= '2026-09-01'
  AND schedule_date <= '2026-10-31'
  AND active = 1
GROUP BY subject_code, topic_code
ORDER BY subject_code, topic_code;
