-- 0033_create_daily_analytics.sql
-- Privacy-friendly daily traffic analytics.
-- Stores coarse Cloudflare geography only, never browser GPS.

CREATE TABLE IF NOT EXISTS daily_analytics (
  analytics_date TEXT NOT NULL,
  country_code TEXT NOT NULL DEFAULT '',
  region TEXT NOT NULL DEFAULT '',
  city TEXT NOT NULL DEFAULT '',
  latitude REAL,
  longitude REAL,
  unique_visitors INTEGER NOT NULL DEFAULT 0,
  visits INTEGER NOT NULL DEFAULT 0,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (analytics_date, country_code, region, city)
);

CREATE INDEX IF NOT EXISTS idx_daily_analytics_date
ON daily_analytics (analytics_date);

CREATE INDEX IF NOT EXISTS idx_daily_analytics_geo
ON daily_analytics (country_code, region, city, analytics_date);

CREATE TABLE IF NOT EXISTS daily_analytics_visitors (
  analytics_date TEXT NOT NULL,
  visitor_hash TEXT NOT NULL,
  country_code TEXT NOT NULL DEFAULT '',
  region TEXT NOT NULL DEFAULT '',
  city TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (analytics_date, visitor_hash)
);

CREATE INDEX IF NOT EXISTS idx_daily_analytics_visitors_created
ON daily_analytics_visitors (analytics_date);