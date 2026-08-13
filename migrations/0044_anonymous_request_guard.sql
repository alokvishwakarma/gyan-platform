-- 0044_anonymous_request_guard.sql
-- Tracks anonymous request volume separately from signed-in requests.
--
-- Rules:
--   1-25/day  : normal
--   26-30/day : accepted, alert shop + GYAN admin
--   >30/day   : blocked
--   500/month : accepted, then future anonymous requests blocked
--
-- Counts begin when this migration/feature is deployed; historical
-- service_requests are intentionally not backfilled.

CREATE TABLE IF NOT EXISTS anonymous_request_usage (
  shop_code TEXT NOT NULL,
  usage_date TEXT NOT NULL,
  request_count INTEGER NOT NULL DEFAULT 0
    CHECK (request_count >= 0),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (
    shop_code,
    usage_date
  ),

  FOREIGN KEY (shop_code)
    REFERENCES shops(code)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
  idx_anonymous_request_usage_shop_date
ON anonymous_request_usage (
  shop_code,
  usage_date
);

CREATE TABLE IF NOT EXISTS request_guard_alerts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  shop_code TEXT NOT NULL,
  alert_key TEXT NOT NULL,
  alert_scope TEXT NOT NULL
    CHECK (
      alert_scope IN (
        'day',
        'month'
      )
    ),
  period_key TEXT NOT NULL,
  request_count INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

  UNIQUE (
    shop_code,
    alert_key,
    period_key
  ),

  FOREIGN KEY (shop_code)
    REFERENCES shops(code)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS
  idx_request_guard_alerts_shop
ON request_guard_alerts (
  shop_code,
  created_at
);
