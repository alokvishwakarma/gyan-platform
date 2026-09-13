-- 0161_admin_modified_timestamps.sql
--
-- Separate human/admin edits from generic system updated_at activity.
-- Existing rows remain NULL until an administrator explicitly edits them.

ALTER TABLE education_live_tests
  ADD COLUMN admin_modified_at TEXT;

ALTER TABLE education_live_class_schedule
  ADD COLUMN admin_modified_at TEXT;

-- Verification
SELECT
  name
FROM pragma_table_info('education_live_tests')
WHERE name = 'admin_modified_at';

SELECT
  name
FROM pragma_table_info('education_live_class_schedule')
WHERE name = 'admin_modified_at';
