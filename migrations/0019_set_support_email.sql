-- 0019_set_support_email.sql
--
-- Routes public online-service notifications for the SUPP intake shop
-- to the GYAN administrator mailbox.

UPDATE shops
SET
  email_address = 'admin@gyan.cc',
  updated_at = CURRENT_TIMESTAMP
WHERE code = 'SUPP';
