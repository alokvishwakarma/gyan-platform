-- 0145_local_open_live_test_window.sql
--
-- LOCAL TESTING ONLY.
-- Opens #237N and #237J immediately for a short manual test window.
--
-- IMPORTANT:
--   * Run with --local only.
--   * Do NOT run this migration remotely.
--   * Restore the real schedule afterwards with 0145b.
--
-- Both events are opened for 60 minutes from "now" in local D1.

UPDATE education_live_tests
SET
  starts_at_utc = strftime(
    '%Y-%m-%d %H:%M:%S',
    'now',
    '-1 minute'
  ),
  duration_minutes = 60,
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
