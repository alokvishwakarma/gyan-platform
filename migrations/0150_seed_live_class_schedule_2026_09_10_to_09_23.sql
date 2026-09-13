-- 0150_seed_live_class_schedule_2026_09_10_to_09_23.sql
PRAGMA foreign_keys = ON;

INSERT INTO education_live_class_schedule (
  schedule_date, program_code, subject_code, topic_code, topic_name,
  class_start_local, class_end_local, schedule_timezone, sequence_number, active
)
VALUES
  ('2026-09-10', 'JEE', 'MATH', 'COORDINATE_GEOMETRY', 'Circles', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-10', 'JEE', 'PHYSICS', 'ROTATIONAL_MOTION', 'Rotational Motion', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-10', 'JEE', 'CHEMISTRY', 'EQUILIBRIUM', 'Ionic Equilibrium', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-11', 'JEE', 'MATH', 'COORDINATE_GEOMETRY', 'Parabola', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-11', 'JEE', 'PHYSICS', 'GRAVITATION', 'Gravitation', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-11', 'JEE', 'CHEMISTRY', 'REDOX_ELECTROCHEMISTRY', 'Redox Reactions', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-14', 'JEE', 'MATH', 'COORDINATE_GEOMETRY', 'Ellipse & Hyperbola', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-14', 'JEE', 'PHYSICS', 'PROPERTIES_SOLIDS_LIQUIDS', 'Properties of Matter', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-14', 'JEE', 'CHEMISTRY', 'SOLUTIONS', 'Solutions', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-15', 'JEE', 'MATH', 'LIMITS_CONTINUITY_DIFFERENTIABILITY', 'Limits', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-15', 'JEE', 'PHYSICS', 'PROPERTIES_SOLIDS_LIQUIDS', 'Fluid Mechanics', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-15', 'JEE', 'CHEMISTRY', 'REDOX_ELECTROCHEMISTRY', 'Electrochemistry', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-16', 'JEE', 'MATH', 'LIMITS_CONTINUITY_DIFFERENTIABILITY', 'Continuity & Differentiability', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-16', 'JEE', 'PHYSICS', 'THERMODYNAMICS', 'Thermal Properties', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-16', 'JEE', 'CHEMISTRY', 'CHEMICAL_KINETICS', 'Chemical Kinetics', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-17', 'JEE', 'MATH', 'LIMITS_CONTINUITY_DIFFERENTIABILITY', 'Differentiation Techniques', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-17', 'JEE', 'PHYSICS', 'THERMODYNAMICS', 'Thermodynamics', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-17', 'JEE', 'CHEMISTRY', 'SURFACE_CHEMISTRY', 'Surface Chemistry', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-18', 'JEE', 'MATH', 'LIMITS_CONTINUITY_DIFFERENTIABILITY', 'Applications of Derivatives', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-18', 'JEE', 'PHYSICS', 'KINETIC_THEORY_GASES', 'Kinetic Theory', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-18', 'JEE', 'CHEMISTRY', 'HYDROGEN_S_BLOCK', 'Hydrogen', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-21', 'JEE', 'MATH', 'INTEGRAL_CALCULUS', 'Indefinite Integration', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-21', 'JEE', 'PHYSICS', 'OSCILLATIONS_WAVES', 'SHM', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-21', 'JEE', 'CHEMISTRY', 'HYDROGEN_S_BLOCK', 's-Block Elements', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-22', 'JEE', 'MATH', 'INTEGRAL_CALCULUS', 'Definite Integration', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-22', 'JEE', 'PHYSICS', 'OSCILLATIONS_WAVES', 'Waves', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-22', 'JEE', 'CHEMISTRY', 'P_BLOCK', 'p-Block Elements I', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-23', 'JEE', 'MATH', 'INTEGRAL_CALCULUS', 'Area Under Curves', '20:30', '21:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-23', 'JEE', 'PHYSICS', 'ELECTROSTATICS', 'Electrostatics', '20:30', '21:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-23', 'JEE', 'CHEMISTRY', 'P_BLOCK', 'p-Block Elements II', '20:30', '21:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-10', 'NEET', 'PHYSICS', 'ROTATIONAL_MOTION', 'Rotational Motion', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-10', 'NEET', 'CHEMISTRY', 'EQUILIBRIUM', 'Ionic Equilibrium', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-10', 'NEET', 'BIOLOGY', 'CELL_STRUCTURE_FUNCTION', 'Biomolecules', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-11', 'NEET', 'PHYSICS', 'GRAVITATION', 'Gravitation', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-11', 'NEET', 'CHEMISTRY', 'REDOX_ELECTROCHEMISTRY', 'Redox Reactions', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-11', 'NEET', 'BIOLOGY', 'CELL_STRUCTURE_FUNCTION', 'Cell Cycle & Cell Division', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-14', 'NEET', 'PHYSICS', 'PROPERTIES_OF_SOLIDS_LIQUIDS', 'Properties of Matter', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-14', 'NEET', 'CHEMISTRY', 'SOLUTIONS', 'Solutions', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-14', 'NEET', 'BIOLOGY', 'PLANT_PHYSIOLOGY', 'Transport in Plants', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-15', 'NEET', 'PHYSICS', 'PROPERTIES_OF_SOLIDS_LIQUIDS', 'Fluid Mechanics', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-15', 'NEET', 'CHEMISTRY', 'REDOX_ELECTROCHEMISTRY', 'Electrochemistry', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-15', 'NEET', 'BIOLOGY', 'PLANT_PHYSIOLOGY', 'Mineral Nutrition', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-16', 'NEET', 'PHYSICS', 'THERMODYNAMICS', 'Thermal Properties', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-16', 'NEET', 'CHEMISTRY', 'CHEMICAL_KINETICS', 'Chemical Kinetics', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-16', 'NEET', 'BIOLOGY', 'PLANT_PHYSIOLOGY', 'Photosynthesis in Higher Plants', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-17', 'NEET', 'PHYSICS', 'THERMODYNAMICS', 'Thermodynamics', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-17', 'NEET', 'CHEMISTRY', NULL, 'Surface Chemistry', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-17', 'NEET', 'BIOLOGY', 'PLANT_PHYSIOLOGY', 'Respiration in Plants', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-18', 'NEET', 'PHYSICS', 'KINETIC_THEORY_OF_GASES', 'Kinetic Theory', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-18', 'NEET', 'CHEMISTRY', NULL, 'Hydrogen', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-18', 'NEET', 'BIOLOGY', 'PLANT_PHYSIOLOGY', 'Plant Growth & Development', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-21', 'NEET', 'PHYSICS', 'OSCILLATIONS_AND_WAVES', 'SHM', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-21', 'NEET', 'CHEMISTRY', NULL, 's-Block Elements', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-21', 'NEET', 'BIOLOGY', 'HUMAN_PHYSIOLOGY', 'Digestion & Absorption', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-22', 'NEET', 'PHYSICS', 'OSCILLATIONS_AND_WAVES', 'Waves', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-22', 'NEET', 'CHEMISTRY', 'P_BLOCK_ELEMENTS', 'p-Block Elements I', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-22', 'NEET', 'BIOLOGY', 'HUMAN_PHYSIOLOGY', 'Breathing & Exchange of Gases', '15:30', '16:00', 'Asia/Kolkata', 3, 1),
  ('2026-09-23', 'NEET', 'PHYSICS', 'ELECTROSTATICS', 'Electrostatics', '15:30', '16:00', 'Asia/Kolkata', 1, 1),
  ('2026-09-23', 'NEET', 'CHEMISTRY', 'P_BLOCK_ELEMENTS', 'p-Block Elements II', '15:30', '16:00', 'Asia/Kolkata', 2, 1),
  ('2026-09-23', 'NEET', 'BIOLOGY', 'HUMAN_PHYSIOLOGY', 'Body Fluids & Circulation', '15:30', '16:00', 'Asia/Kolkata', 3, 1)
ON CONFLICT(schedule_date, program_code, subject_code, sequence_number) DO UPDATE SET
  topic_code = excluded.topic_code,
  topic_name = excluded.topic_name,
  class_start_local = excluded.class_start_local,
  class_end_local = excluded.class_end_local,
  schedule_timezone = excluded.schedule_timezone,
  active = excluded.active,
  updated_at = CURRENT_TIMESTAMP;

SELECT schedule_date, program_code, COUNT(*) AS class_slots,
  GROUP_CONCAT(subject_code || ':' || COALESCE(topic_code, '[subject fallback]') || ' (' || topic_name || ')', ' | ') AS schedule
FROM education_live_class_schedule
WHERE schedule_date >= '2026-09-10' AND schedule_date <= '2026-09-23'
  AND program_code IN ('JEE','NEET') AND active = 1
GROUP BY schedule_date, program_code
ORDER BY schedule_date, program_code;
