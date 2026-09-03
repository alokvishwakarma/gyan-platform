-- 0090_mock_attempts_compatibility.sql
-- Extend the mock-attempt tables created by the earlier JEE mock schema.
-- Do NOT recreate these tables; preserve all existing rows.

ALTER TABLE education_mock_attempts
ADD COLUMN attempt_number INTEGER;

ALTER TABLE education_mock_attempts
ADD COLUMN elapsed_seconds INTEGER NOT NULL DEFAULT 0;

ALTER TABLE education_mock_attempts
ADD COLUMN save_count INTEGER NOT NULL DEFAULT 0;

ALTER TABLE education_mock_attempt_answers
ADD COLUMN marked_for_review INTEGER NOT NULL DEFAULT 0
  CHECK (marked_for_review IN (0,1));

-- Backfill attempt numbers for any historical student-linked attempts.
-- Ordering is deterministic by created_at, then id.
UPDATE education_mock_attempts AS a
SET attempt_number = (
  SELECT COUNT(*)
  FROM education_mock_attempts AS b
  WHERE b.student_id = a.student_id
    AND b.mock_test_id = a.mock_test_id
    AND (
      b.created_at < a.created_at
      OR (
        b.created_at = a.created_at
        AND b.id <= a.id
      )
    )
)
WHERE a.student_id IS NOT NULL
  AND a.attempt_number IS NULL;

-- Rows without a student identity are not reportable by student.
-- Give them a harmless deterministic value so the column is usable.
UPDATE education_mock_attempts
SET attempt_number = 1
WHERE student_id IS NULL
  AND attempt_number IS NULL;

CREATE UNIQUE INDEX IF NOT EXISTS
  idx_education_mock_attempts_student_test_attempt
ON education_mock_attempts(
  student_id,
  mock_test_id,
  attempt_number
)
WHERE student_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS
  idx_education_mock_attempts_student_submitted
ON education_mock_attempts(
  student_id,
  submitted_at DESC,
  id DESC
);
