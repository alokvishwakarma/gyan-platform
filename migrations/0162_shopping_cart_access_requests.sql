-- 0162_shopping_cart_access_requests.sql
--
-- Phase 1 manual-access workflow for ShoppingCart.
-- One write when the request is created, one when email status is recorded,
-- and one when the learner verifies the email.

CREATE TABLE IF NOT EXISTS education_shopping_cart_access_requests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  request_code TEXT NOT NULL UNIQUE,

  email TEXT NOT NULL,

  program_code TEXT NOT NULL,

  batch_code TEXT NOT NULL,

  batch_label TEXT NOT NULL,

  access_test INTEGER NOT NULL DEFAULT 0
    CHECK (access_test IN (0,1)),

  access_results INTEGER NOT NULL DEFAULT 0
    CHECK (access_results IN (0,1)),

  access_ai_tips INTEGER NOT NULL DEFAULT 0
    CHECK (access_ai_tips IN (0,1)),

  selected_items_json TEXT NOT NULL,

  selected_item_count INTEGER NOT NULL DEFAULT 0,

  live_test_count INTEGER NOT NULL DEFAULT 0,

  estimated_gems INTEGER NOT NULL DEFAULT 0,

  shop_code TEXT NOT NULL DEFAULT 'GYAN_ONLINE',

  status TEXT NOT NULL DEFAULT 'PENDING_EMAIL'
    CHECK (
      status IN (
        'PENDING_EMAIL',
        'EMAIL_FAILED',
        'VERIFIED',
        'EXPIRED',
        'CONTACTED',
        'FULFILLED',
        'CANCELLED'
      )
    ),

  verification_token_hash TEXT,

  verification_expires_at TEXT,

  email_sent_at TEXT,

  verified_at TEXT,

  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX IF NOT EXISTS
  idx_shopping_cart_access_verify_token
ON education_shopping_cart_access_requests (
  verification_token_hash
)
WHERE verification_token_hash IS NOT NULL;

CREATE INDEX IF NOT EXISTS
  idx_shopping_cart_access_email_status
ON education_shopping_cart_access_requests (
  email,
  status
);

CREATE INDEX IF NOT EXISTS
  idx_shopping_cart_access_created
ON education_shopping_cart_access_requests (
  created_at
);

SELECT
  name
FROM sqlite_master
WHERE
  type = 'table'
  AND name = 'education_shopping_cart_access_requests';
