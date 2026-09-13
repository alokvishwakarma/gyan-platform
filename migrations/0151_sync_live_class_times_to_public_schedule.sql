-- 0151_sync_live_class_times_to_public_schedule.sql
--
-- Make education_live_class_schedule the single timing source for both:
--   /class?category=iit-jee
--   /class?category=neet
--   /admin/live-tests
--
-- Source-of-truth schedule supplied for Sep/Oct 2026:
-- JEE:  Math 15:30-16:00, Physics 16:00-16:30, Chemistry 16:30-17:00 IST
-- NEET: Physics 15:30-16:00, Chemistry 16:00-16:30, Biology 16:30-17:30 IST

UPDATE education_live_class_schedule
SET
  class_start_local = CASE
    WHEN program_code = 'JEE' AND subject_code IN ('MATH', 'MATHEMATICS') THEN '15:30'
    WHEN program_code = 'JEE' AND subject_code = 'PHYSICS' THEN '16:00'
    WHEN program_code = 'JEE' AND subject_code = 'CHEMISTRY' THEN '16:30'
    WHEN program_code = 'NEET' AND subject_code = 'PHYSICS' THEN '15:30'
    WHEN program_code = 'NEET' AND subject_code = 'CHEMISTRY' THEN '16:00'
    WHEN program_code = 'NEET' AND subject_code = 'BIOLOGY' THEN '16:30'
    ELSE class_start_local
  END,

  class_end_local = CASE
    WHEN program_code = 'JEE' AND subject_code IN ('MATH', 'MATHEMATICS') THEN '16:00'
    WHEN program_code = 'JEE' AND subject_code = 'PHYSICS' THEN '16:30'
    WHEN program_code = 'JEE' AND subject_code = 'CHEMISTRY' THEN '17:00'
    WHEN program_code = 'NEET' AND subject_code = 'PHYSICS' THEN '16:00'
    WHEN program_code = 'NEET' AND subject_code = 'CHEMISTRY' THEN '16:30'
    WHEN program_code = 'NEET' AND subject_code = 'BIOLOGY' THEN '17:30'
    ELSE class_end_local
  END,

  schedule_timezone = 'Asia/Kolkata',
  updated_at = CURRENT_TIMESTAMP

WHERE
  program_code IN ('JEE', 'NEET')
  AND schedule_date >= '2026-08-31'
  AND schedule_date <= '2026-10-23';
