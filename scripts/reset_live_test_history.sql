-- reset_live_test_history.sql
-- DESTRUCTIVE rehearsal reset requested for the current pre-launch environment.
-- Keeps: class schedules, policies, batch definitions, question bank, mock tests.
-- Clears: Live Test papers, entries, attempts/results, generation logs,
--         synthetic runs, frozen questions, and Live-Test-specific Gem charges.

DELETE FROM gem_transactions
WHERE reason LIKE 'LIVE_TEST_ENTRY:%'
   OR reason LIKE 'LIVE_TEST_REPORT:%';

DELETE FROM education_live_generation_runs;

-- ON DELETE CASCADE clears frozen questions, entries, attempts and synthetic runs.
DELETE FROM education_live_tests;

SELECT
  (SELECT COUNT(*) FROM education_live_tests) AS live_tests,
  (SELECT COUNT(*) FROM education_live_entries) AS live_entries,
  (SELECT COUNT(*) FROM education_live_test_questions) AS live_questions,
  (SELECT COUNT(*) FROM education_live_attempts) AS live_attempts,
  (SELECT COUNT(*) FROM education_live_attempt_answers) AS attempt_answers,
  (SELECT COUNT(*) FROM education_live_generation_runs) AS generation_runs;
