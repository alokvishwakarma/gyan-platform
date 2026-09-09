-- 0136_nearby_search_intelligence.sql
--
-- Anonymous nearby-search cache + service popularity analytics.
--
-- Privacy:
--   * no user/account/browser identifiers are stored
--   * no IP addresses are stored
--   * GPS search coordinates are rounded by the Worker to
--     2 decimal places before persistence
--
-- Geoapify / OSM attribution remains in response_json when
-- provider results are stored and later reused.

CREATE TABLE IF NOT EXISTS nearby_search_cache (
  search_key TEXT PRIMARY KEY,

  service_code TEXT NOT NULL,

  location_mode TEXT NOT NULL
    CHECK (
      location_mode IN (
        'gps',
        'city'
      )
    ),

  city TEXT,
  state TEXT,

  latitude_bucket REAL,
  longitude_bucket REAL,

  search_count INTEGER NOT NULL
    DEFAULT 1,

  registered_result_count INTEGER NOT NULL
    DEFAULT 0,

  external_result_count INTEGER NOT NULL
    DEFAULT 0,

  response_json TEXT NOT NULL,

  first_searched_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  last_searched_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  expires_at TEXT NOT NULL
);


CREATE INDEX IF NOT EXISTS
  idx_nearby_search_cache_service
ON nearby_search_cache (
  service_code,
  last_searched_at DESC
);


CREATE INDEX IF NOT EXISTS
  idx_nearby_search_cache_popularity
ON nearby_search_cache (
  search_count DESC,
  service_code
);


CREATE TABLE IF NOT EXISTS nearby_discovered_places (
  provider TEXT NOT NULL,

  provider_place_id TEXT NOT NULL,

  name TEXT NOT NULL,

  address TEXT NOT NULL
    DEFAULT '',

  latitude REAL,
  longitude REAL,

  phone_number TEXT,
  website TEXT,

  categories_json TEXT NOT NULL
    DEFAULT '[]',

  first_seen_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  last_seen_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  seen_count INTEGER NOT NULL
    DEFAULT 1,

  PRIMARY KEY (
    provider,
    provider_place_id
  )
);


CREATE INDEX IF NOT EXISTS
  idx_nearby_discovered_places_recent
ON nearby_discovered_places (
  last_seen_at DESC
);


CREATE INDEX IF NOT EXISTS
  idx_nearby_discovered_places_seen
ON nearby_discovered_places (
  seen_count DESC
);


CREATE TABLE IF NOT EXISTS nearby_discovered_place_services (
  provider TEXT NOT NULL,

  provider_place_id TEXT NOT NULL,

  service_code TEXT NOT NULL,

  seen_count INTEGER NOT NULL
    DEFAULT 1,

  first_seen_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  last_seen_at TEXT NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (
    provider,
    provider_place_id,
    service_code
  )
);


CREATE INDEX IF NOT EXISTS
  idx_nearby_place_services_service
ON nearby_discovered_place_services (
  service_code,
  seen_count DESC,
  last_seen_at DESC
);
