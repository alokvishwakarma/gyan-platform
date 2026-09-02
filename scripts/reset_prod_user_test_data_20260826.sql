-- GYAN production user/test-data reset
-- Generated for the current production table set shown on 2026-08-26.
--
-- PURPOSE:
--   Remove test/user-generated data while preserving schema, catalogs,
--   puzzle definitions, education question banks, services/configuration,
--   and migration history.
--
-- IMPORTANT:
--   Take a D1 export before running this file.
--   This reset intentionally does NOT touch:
--     _cf_KV
--     d1_migrations
--     daily_puzzles
--     education_country_settings
--     education_little_questions
--     education_programs
--     education_questions
--     education_subjects
--     education_subtopics
--     education_topics
--     featured_promotions
--     service_fields
--     service_market_prices
--     service_sections
--     services
--     system_settings

BEGIN TRANSACTION;

-- ---------------------------------------------------------
-- Authentication / admin temporary state
-- ---------------------------------------------------------
DELETE FROM admin_login_codes;
DELETE FROM admin_sessions;
DELETE FROM auth_magic_links;
DELETE FROM user_sessions;

-- ---------------------------------------------------------
-- Chat
-- ---------------------------------------------------------
DELETE FROM chat_messages;
DELETE FROM chat_threads;

-- ---------------------------------------------------------
-- Education learner/user data
-- ---------------------------------------------------------
DELETE FROM education_attempt_answers;
DELETE FROM education_attempts;
DELETE FROM education_topic_mastery;
DELETE FROM education_child_words;
DELETE FROM education_little_attempts;
DELETE FROM student_invite_codes;
DELETE FROM education_students;

-- ---------------------------------------------------------
-- Puzzle/player data
-- ---------------------------------------------------------
DELETE FROM gem_transactions;
DELETE FROM puzzle_winners;
DELETE FROM puzzle_guest_names;
DELETE FROM puzzle_results;

-- ---------------------------------------------------------
-- GYAN safety / recovery data
-- ---------------------------------------------------------
DELETE FROM gyan_emergency_messages;
DELETE FROM gyan_emergency_profiles;
DELETE FROM gyan_lost_found_messages;
DELETE FROM gyan_lost_found_profiles;
DELETE FROM gyan_recovery_emails;
DELETE FROM gyan_safety_resources;

-- ---------------------------------------------------------
-- Printing / calendar-account data
-- ---------------------------------------------------------
DELETE FROM print_request_files;
DELETE FROM print_requests;
DELETE FROM calendar_guest_sessions;
DELETE FROM calendar_access_codes;

-- ---------------------------------------------------------
-- Shops / service-request data
-- ---------------------------------------------------------
DELETE FROM shop_featured_services;
DELETE FROM shop_services;
DELETE FROM local_service_requests;
DELETE FROM service_request_files;
DELETE FROM service_requests;
DELETE FROM offline_shop_codes;
DELETE FROM shops;

-- ---------------------------------------------------------
-- Advertising/user submissions
-- ---------------------------------------------------------
DELETE FROM advertisement_submissions;

-- ---------------------------------------------------------
-- Analytics / abuse counters
-- Start real launch metrics from zero.
-- ---------------------------------------------------------
DELETE FROM daily_analytics_visitors;
DELETE FROM daily_analytics;
DELETE FROM anonymous_request_usage;
DELETE FROM request_guard_alerts;

-- ---------------------------------------------------------
-- Users LAST, after dependent/user-owned rows
-- ---------------------------------------------------------
DELETE FROM users;

COMMIT;

-- ---------------------------------------------------------
-- OPTIONAL: reset AUTOINCREMENT counters for mutable tables
-- so a fresh launch starts near ID 1 again.
-- Safe to remove this block if you prefer monotonically
-- increasing IDs across resets.
-- ---------------------------------------------------------
DELETE FROM sqlite_sequence
WHERE name IN (
  'admin_login_codes',
  'admin_sessions',
  'advertisement_submissions',
  'anonymous_request_usage',
  'auth_magic_links',
  'calendar_access_codes',
  'calendar_guest_sessions',
  'chat_messages',
  'chat_threads',
  'daily_analytics',
  'daily_analytics_visitors',
  'education_attempt_answers',
  'education_attempts',
  'education_child_words',
  'education_little_attempts',
  'education_students',
  'education_topic_mastery',
  'gem_transactions',
  'gyan_emergency_messages',
  'gyan_emergency_profiles',
  'gyan_lost_found_messages',
  'gyan_lost_found_profiles',
  'gyan_recovery_emails',
  'gyan_safety_resources',
  'local_service_requests',
  'offline_shop_codes',
  'print_request_files',
  'print_requests',
  'puzzle_guest_names',
  'puzzle_results',
  'puzzle_winners',
  'request_guard_alerts',
  'service_request_files',
  'service_requests',
  'shop_featured_services',
  'shop_services',
  'shops',
  'student_invite_codes',
  'user_sessions',
  'users'
);

-- ---------------------------------------------------------
-- Verification: every count below should be 0
-- ---------------------------------------------------------
SELECT 'users' AS table_name, COUNT(*) AS row_count FROM users
UNION ALL SELECT 'user_sessions', COUNT(*) FROM user_sessions
UNION ALL SELECT 'calendar_access_codes', COUNT(*) FROM calendar_access_codes
UNION ALL SELECT 'education_students', COUNT(*) FROM education_students
UNION ALL SELECT 'education_attempts', COUNT(*) FROM education_attempts
UNION ALL SELECT 'puzzle_results', COUNT(*) FROM puzzle_results
UNION ALL SELECT 'puzzle_winners', COUNT(*) FROM puzzle_winners
UNION ALL SELECT 'gyan_safety_resources', COUNT(*) FROM gyan_safety_resources
UNION ALL SELECT 'gyan_emergency_messages', COUNT(*) FROM gyan_emergency_messages
UNION ALL SELECT 'gyan_lost_found_messages', COUNT(*) FROM gyan_lost_found_messages
UNION ALL SELECT 'gyan_recovery_emails', COUNT(*) FROM gyan_recovery_emails
UNION ALL SELECT 'shops', COUNT(*) FROM shops
UNION ALL SELECT 'service_requests', COUNT(*) FROM service_requests
UNION ALL SELECT 'print_requests', COUNT(*) FROM print_requests
UNION ALL SELECT 'chat_threads', COUNT(*) FROM chat_threads
UNION ALL SELECT 'daily_analytics', COUNT(*) FROM daily_analytics;
