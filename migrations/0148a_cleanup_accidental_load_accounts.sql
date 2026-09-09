-- Remove only the 10 accidental public GYAN identities
-- created by the September 9 Live Test load harness.

DELETE FROM calendar_access_codes
WHERE id IN (
  SELECT gl.calendar_access_id
  FROM gyan_account_calendar_links gl
  INNER JOIN gyan_accounts ga
    ON ga.id = gl.gyan_account_id
  WHERE ga.code IN (
    'B7SW',
    '53H5',
    'T86C',
    '39D7',
    'SB8K',
    '43Y7',
    'GZRB',
    '6ECK',
    'QLSK',
    '76F6'
  )
);

DELETE FROM gyan_accounts
WHERE code IN (
  'B7SW',
  '53H5',
  'T86C',
  '39D7',
  'SB8K',
  '43Y7',
  'GZRB',
  '6ECK',
  'QLSK',
  '76F6'
);

SELECT
  id,
  code,
  display_name
FROM gyan_accounts
WHERE code IN (
  'B7SW',
  '53H5',
  'T86C',
  '39D7',
  'SB8K',
  '43Y7',
  'GZRB',
  '6ECK',
  'QLSK',
  '76F6'
);