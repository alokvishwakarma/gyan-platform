-- Link Education learner records to the unified GYAN account.
-- Existing student_code values and all attempt history are preserved.

ALTER TABLE education_students
ADD COLUMN gyan_account_id INTEGER;

CREATE INDEX IF NOT EXISTS
idx_education_students_gyan_account_id
ON education_students (gyan_account_id);
