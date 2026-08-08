ALTER TABLE featured_promotions
ADD COLUMN offer_text TEXT;

ALTER TABLE featured_promotions
ADD COLUMN discount_percent REAL;

CREATE INDEX IF NOT EXISTS
  idx_featured_promotions_ranking
ON featured_promotions (
  enabled,
  priority,
  discount_percent
);