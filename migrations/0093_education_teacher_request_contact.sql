-- 0093_education_teacher_request_contact.sql
ALTER TABLE education_teacher_assignments ADD COLUMN request_email TEXT;
ALTER TABLE education_teacher_assignments ADD COLUMN request_phone TEXT;
ALTER TABLE education_teacher_assignments ADD COLUMN request_subjects TEXT;
