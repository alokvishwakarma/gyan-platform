-- 0138_seed_synthetic_participants.sql
-- Complete reserved namespace: ?4R?, ?5R?, ?6R?, ?7R?
-- 4 bands * 32 * 32 = 4096 synthetic participants.

WITH RECURSIVE
alphabet(position, symbol) AS (
  SELECT 1, substr('23456789ABCDEFGHJKLMNPQRSTUVWXYZ',1,1)
  UNION ALL
  SELECT position+1,
         substr('23456789ABCDEFGHJKLMNPQRSTUVWXYZ',position+1,1)
  FROM alphabet
  WHERE position < 32
),
bands(band) AS (
  VALUES (4),(5),(6),(7)
),
generated AS (
  SELECT
    ((bands.band-4)*1024)+((first.position-1)*32)+last.position AS ordinal,
    first.symbol || CAST(bands.band AS TEXT) || 'R' || last.symbol AS synthetic_code,
    bands.band AS ability_band
  FROM bands
  CROSS JOIN alphabet AS first
  CROSS JOIN alphabet AS last
),
assigned AS (
  SELECT
    ordinal,
    synthetic_code,
    ability_band,
    CASE
      WHEN ordinal <= 1800 THEN 'NEET'
      WHEN ordinal <= 3200 THEN 'JEE'
      WHEN ordinal <= 3800 THEN 'GRE'
      ELSE 'RESERVE'
    END AS program_pool,
    CASE
      WHEN ordinal % 10 IN (0,1,2,3) THEN 'Asia/Kolkata'
      WHEN ordinal % 10 IN (4,5) THEN 'America/Los_Angeles'
      WHEN ordinal % 10 = 6 THEN 'America/New_York'
      WHEN ordinal % 10 = 7 THEN 'Europe/London'
      WHEN ordinal % 10 = 8 THEN 'Asia/Singapore'
      ELSE 'Australia/Sydney'
    END AS initial_timezone,
    CASE
      WHEN ordinal <= 500 THEN 5000
      WHEN ordinal > 3796 THEN 19000
      ELSE 9500
    END AS starting_gems
  FROM generated
)
INSERT OR IGNORE INTO education_synthetic_participants (
  synthetic_code,
  ability_band,
  program_pool,
  initial_timezone,
  starting_gems,
  active
)
SELECT
  synthetic_code,
  ability_band,
  program_pool,
  initial_timezone,
  starting_gems,
  1
FROM assigned
ORDER BY ordinal;
