-- 0148_seed_synthetic_load_testers.sql
--
-- GYAN Live Test synthetic participants.
--
-- IMPORTANT:
--   * These are NOT public GYAN accounts.
--   * Do not allocate 4- or 5-character synthetic codes.
--   * 4-character public GYAN IDs remain the current compact namespace.
--   * 5-character public GYAN IDs remain reserved for future expansion /
--     compact Version-1 QR testing.
--   * Synthetic participants intentionally use only 6- and 7-character codes.
--
-- Safe to run more than once because synthetic_code is UNIQUE and all inserts
-- use INSERT OR IGNORE.

INSERT OR IGNORE INTO education_synthetic_participants (
  synthetic_code,
  ability_band,
  program_pool,
  initial_timezone,
  starting_gems,
  active
)
VALUES
  ('BOT001',  4, 'NEET', 'Asia/Kolkata',            25, 1),
  ('BOT002',  5, 'NEET', 'Asia/Kolkata',            25, 1),
  ('BOT003',  6, 'NEET', 'Asia/Kolkata',            25, 1),
  ('BOT004',  7, 'NEET', 'Asia/Kolkata',            25, 1),
  ('BOT005',  5, 'NEET', 'America/Los_Angeles',     25, 1),

  ('BOT0006', 4, 'NEET', 'America/New_York',        25, 1),
  ('BOT0007', 5, 'NEET', 'Europe/London',           25, 1),
  ('BOT0008', 6, 'NEET', 'Asia/Singapore',          25, 1),
  ('BOT0009', 7, 'NEET', 'Asia/Kolkata',            25, 1),
  ('BOT0010', 6, 'NEET', 'Asia/Kolkata',            25, 1);

SELECT
  id,
  synthetic_code,
  length(synthetic_code) AS code_length,
  ability_band,
  program_pool,
  initial_timezone,
  starting_gems,
  active
FROM education_synthetic_participants
WHERE synthetic_code IN (
  'BOT001',
  'BOT002',
  'BOT003',
  'BOT004',
  'BOT005',
  'BOT0006',
  'BOT0007',
  'BOT0008',
  'BOT0009',
  'BOT0010'
)
ORDER BY
  length(synthetic_code),
  synthetic_code;
