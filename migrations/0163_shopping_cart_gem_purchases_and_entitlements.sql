-- 0163_shopping_cart_gem_purchases_and_entitlements.sql
--
-- Direct Gem checkout + durable Live Test access entitlements.

CREATE TABLE IF NOT EXISTS education_shopping_cart_purchases (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  purchase_code TEXT NOT NULL UNIQUE,
  request_key TEXT NOT NULL,
  gyan_account_id INTEGER NOT NULL,
  calendar_access_id INTEGER NOT NULL,
  program_code TEXT,
  batch_code TEXT,
  selected_items_json TEXT NOT NULL,
  access_test INTEGER NOT NULL DEFAULT 0 CHECK (access_test IN (0,1)),
  access_results INTEGER NOT NULL DEFAULT 0 CHECK (access_results IN (0,1)),
  access_ai_tips INTEGER NOT NULL DEFAULT 0 CHECK (access_ai_tips IN (0,1)),
  gem_cost INTEGER NOT NULL DEFAULT 0,
  gem_transaction_reason TEXT,
  status TEXT NOT NULL DEFAULT 'PENDING'
    CHECK (status IN ('PENDING','COMPLETED','INSUFFICIENT_GEMS','CANCELLED')),
  completed_at TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (gyan_account_id, request_key)
);

CREATE INDEX IF NOT EXISTS idx_shopping_cart_purchases_account_created
ON education_shopping_cart_purchases (
  gyan_account_id,
  created_at
);

CREATE TABLE IF NOT EXISTS education_shopping_cart_entitlements (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gyan_account_id INTEGER NOT NULL,
  item_type TEXT NOT NULL CHECK (item_type IN ('LIVE','MOCK','MINI')),
  item_code TEXT NOT NULL,
  access_test INTEGER NOT NULL DEFAULT 0 CHECK (access_test IN (0,1)),
  access_results INTEGER NOT NULL DEFAULT 0 CHECK (access_results IN (0,1)),
  access_ai_tips INTEGER NOT NULL DEFAULT 0 CHECK (access_ai_tips IN (0,1)),
  source_purchase_code TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (gyan_account_id, item_type, item_code)
);

CREATE INDEX IF NOT EXISTS idx_shopping_cart_entitlements_account
ON education_shopping_cart_entitlements (
  gyan_account_id,
  item_type,
  item_code
);

SELECT name
FROM sqlite_master
WHERE type = 'table'
  AND name IN (
    'education_shopping_cart_purchases',
    'education_shopping_cart_entitlements'
  )
ORDER BY name;
