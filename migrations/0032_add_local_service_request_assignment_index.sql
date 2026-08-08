-- migrations/0032_add_local_service_request_assignment_index.sql

CREATE INDEX IF NOT EXISTS
  idx_local_service_requests_assignment
ON local_service_requests (
  assigned_shop_code,
  status
);