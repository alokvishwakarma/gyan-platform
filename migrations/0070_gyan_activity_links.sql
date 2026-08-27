-- 0070_gyan_activity_links.sql
-- Link Puzzle and Service Request activity to unified GYAN accounts.

ALTER TABLE puzzle_results
ADD COLUMN gyan_account_id INTEGER;

ALTER TABLE service_requests
ADD COLUMN gyan_account_id INTEGER;

CREATE INDEX IF NOT EXISTS
idx_puzzle_results_gyan_account
ON puzzle_results (
  gyan_account_id,
  puzzle_number,
  stage
);

CREATE INDEX IF NOT EXISTS
idx_service_requests_gyan_account
ON service_requests (
  gyan_account_id,
  created_at
);
