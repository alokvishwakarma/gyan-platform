-- 0151_admin_live_test_schedule_controls.sql
--
-- Admin visibility override for generated Live Tests.
--
-- AUTO = hourly scheduler decides.
-- SHOW = administrator forces visible.
-- HIDE = administrator forces hidden.

PRAGMA foreign_keys = ON;

ALTER TABLE education_live_tests
ADD COLUMN visibility_mode TEXT NOT NULL DEFAULT 'AUTO'
CHECK (
  visibility_mode IN (
    'AUTO',
    'SHOW',
    'HIDE'
  )
);

CREATE INDEX IF NOT EXISTS idx_live_tests_admin_schedule
ON education_live_tests (
  program_code,
  source_schedule_date,
  visibility_mode,
  visible
);

SELECT
  public_code,
  program_code,
  source_schedule_date,
  visible,
  visibility_mode,
  starts_at_utc,
  duration_minutes
FROM education_live_tests
WHERE
  COALESCE(
    event_kind,
    'WEEKDAY'
  ) <> 'ADMIN_TEST'
ORDER BY
  source_schedule_date,
  program_code;
