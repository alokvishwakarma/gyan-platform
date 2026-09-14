-- 0165_sat_class_times_edt.sql
--
-- SAT class template timing:
--   Reading & Writing: 4:00 PM - 4:30 PM Eastern
--   Math:              4:30 PM - 5:00 PM Eastern
--
-- America/New_York automatically handles EDT/EST.
-- Recreate the SAT class batch after applying this migration so eligible
-- future automatic class rows are rebuilt from the updated template.

UPDATE education_live_class_template_rows
SET
  class_start_local = '16:00',
  class_end_local = '16:30',
  schedule_timezone = 'America/Los_Angeles'
WHERE
  template_code = 'SAT_STANDARD_38'
  AND subject_code = 'RW';

UPDATE education_live_class_template_rows
SET
  class_start_local = '16:30',
  class_end_local = '17:00',
  schedule_timezone = 'America/Los_Angeles'
WHERE
  template_code = 'SAT_STANDARD_38'
  AND subject_code IN ('MATH', 'MATHEMATICS');

SELECT
  template_code,
  subject_code,
  class_start_local,
  class_end_local,
  schedule_timezone,
  COUNT(*) AS template_rows
FROM education_live_class_template_rows
WHERE template_code = 'SAT_STANDARD_38'
GROUP BY
  template_code,
  subject_code,
  class_start_local,
  class_end_local,
  schedule_timezone
ORDER BY
  MIN(sequence_number),
  subject_code;
