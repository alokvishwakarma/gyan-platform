-- 0145b_restore_live_test_schedule.sql
--
-- Restore the real Sep 9 IST schedule after local API testing.
--
-- #237N  8:30 PM IST = 2026-09-09 15:00:00 UTC
-- #237J  9:15 PM IST = 2026-09-09 15:45:00 UTC

UPDATE education_live_tests
SET
  starts_at_utc =
    CASE public_code
      WHEN '237N'
      THEN '2026-09-09 15:00:00'

      WHEN '237J'
      THEN '2026-09-09 15:45:00'

      ELSE starts_at_utc
    END,

  duration_minutes = 18,
  updated_at = CURRENT_TIMESTAMP

WHERE public_code IN (
  '237N',
  '237J'
);


SELECT
  public_code,
  starts_at_utc,
  duration_minutes,
  status
FROM education_live_tests
WHERE public_code IN (
  '237N',
  '237J'
)
ORDER BY public_code;
