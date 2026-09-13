-- 0157_live_test_formula_pricing_and_sunday.sql
--
-- Reprice existing Live Tests because these rows have not yet been used.
--
-- Formula:
--   F(P) = 5 * floor((20 * log10(P)) / 5)
--
-- Stored meanings:
--   entry_gem_cost         = floor(F * 25%)
--   report_gem_cost        = F
--   question_paper_gem_cost = nearest multiple of 3 to F * 15%, minimum 3
--
-- Current supported percentage buckets:
--   5%   F=10  entry=2   report=10  paper=3
--   10%  F=20  entry=5   report=20  paper=3
--   15%  F=20  entry=5   report=20  paper=3
--   20%  F=25  entry=6   report=25  paper=3
--   25%  F=25  entry=6   report=25  paper=3
--   30%  F=25  entry=6   report=25  paper=3
--   40%  F=30  entry=7   report=30  paper=6
--   50%  F=30  entry=7   report=30  paper=6
--   75%  F=35  entry=8   report=35  paper=6
--   100% F=40  entry=10  report=40  paper=6

ALTER TABLE education_live_tests
ADD COLUMN question_paper_gem_cost INTEGER NOT NULL DEFAULT 3
CHECK (question_paper_gem_cost >= 0);

UPDATE education_live_tests
SET
  entry_gem_cost =
    CASE
      WHEN test_fraction_percent < 10 THEN 2
      WHEN test_fraction_percent < 20 THEN 5
      WHEN test_fraction_percent < 40 THEN 6
      WHEN test_fraction_percent < 50 THEN 7
      WHEN test_fraction_percent < 75 THEN 7
      WHEN test_fraction_percent < 100 THEN 8
      ELSE 10
    END,

  report_gem_cost =
    CASE
      WHEN test_fraction_percent < 10 THEN 10
      WHEN test_fraction_percent < 20 THEN 20
      WHEN test_fraction_percent < 40 THEN 25
      WHEN test_fraction_percent < 50 THEN 30
      WHEN test_fraction_percent < 75 THEN 30
      WHEN test_fraction_percent < 100 THEN 35
      ELSE 40
    END,

  question_paper_gem_cost =
    CASE
      WHEN test_fraction_percent < 40 THEN 3
      ELSE 6
    END,

  updated_at =
    CURRENT_TIMESTAMP
WHERE
  COALESCE(event_kind, 'WEEKDAY') <> 'ADMIN_TEST';

SELECT
  test_fraction_percent,
  entry_gem_cost,
  report_gem_cost,
  question_paper_gem_cost,
  COUNT(*) AS tests
FROM education_live_tests
WHERE COALESCE(event_kind, 'WEEKDAY') <> 'ADMIN_TEST'
GROUP BY
  test_fraction_percent,
  entry_gem_cost,
  report_gem_cost,
  question_paper_gem_cost
ORDER BY test_fraction_percent;
