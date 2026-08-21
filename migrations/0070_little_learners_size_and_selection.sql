-- 0070_little_learners_size_and_selection.sql
-- Safe follow-up to 0069.
-- Adds visual presentation metadata and replaces misleading elephant/mouse
-- big/small trials with SAME-OBJECT size discrimination.

PRAGMA foreign_keys = ON;

ALTER TABLE education_little_questions
  ADD COLUMN visual_type TEXT;

ALTER TABLE education_little_questions
  ADD COLUMN visual_object TEXT;

ALTER TABLE education_little_questions
  ADD COLUMN option_a_scale TEXT;

ALTER TABLE education_little_questions
  ADD COLUMN option_b_scale TEXT;

ALTER TABLE education_little_questions
  ADD COLUMN option_c_scale TEXT;

-- Disable older big/small rows that compare different real-world objects.
UPDATE education_little_questions
SET active = 0
WHERE
  subtopic_code = 'BIG_SMALL'
  AND (
    option_a <> option_b
    OR option_b IS NULL
  );

-- Same object, very different size.
-- Level 1 = exposure.
INSERT OR IGNORE INTO education_little_questions
(
  skill_code, level, prompt_text, question_type,
  option_a, option_b, option_c,
  correct_option, accepted_words,
  active, sort_order,
  topic_code, topic_name,
  subtopic_code, subtopic_name,
  icon_hint,
  visual_type, visual_object,
  option_a_scale, option_b_scale, option_c_scale
)
VALUES
(
  'BIG_SIZE_BALL_L1',1,'Big','tap',
  '⚽',NULL,NULL,
  'A','big',
  1,10,
  'CONCEPTS','Concepts',
  'BIG_SMALL','Big & Small',
  '⚽',
  'size','⚽',
  'big',NULL,NULL
),
(
  'SMALL_SIZE_BALL_L1',1,'Small','tap',
  '⚽',NULL,NULL,
  'A','small',
  1,20,
  'CONCEPTS','Concepts',
  'BIG_SMALL','Big & Small',
  '⚽',
  'size','⚽',
  'small',NULL,NULL
);

-- Level 2 = two-choice, obvious size difference.
INSERT OR IGNORE INTO education_little_questions
(
  skill_code, level, prompt_text, question_type,
  option_a, option_b, option_c,
  correct_option, accepted_words,
  active, sort_order,
  topic_code, topic_name,
  subtopic_code, subtopic_name,
  icon_hint,
  visual_type, visual_object,
  option_a_scale, option_b_scale, option_c_scale
)
VALUES
('BIG_SIZE_BALL_2A',2,'Big','tap','⚽','⚽',NULL,'B','big',1,10,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⚽','size','⚽','small','big',NULL),
('BIG_SIZE_BALL_2B',2,'Big','tap','⚽','⚽',NULL,'A','big',1,20,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⚽','size','⚽','big','small',NULL),
('SMALL_SIZE_BALL_2A',2,'Small','tap','⚽','⚽',NULL,'A','small',1,30,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⚽','size','⚽','small','big',NULL),
('SMALL_SIZE_BALL_2B',2,'Small','tap','⚽','⚽',NULL,'B','small',1,40,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⚽','size','⚽','big','small',NULL),

('BIG_SIZE_APPLE_2A',2,'Big','tap','🍎','🍎',NULL,'B','big',1,50,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍎','size','🍎','small','big',NULL),
('SMALL_SIZE_APPLE_2A',2,'Small','tap','🍎','🍎',NULL,'A','small',1,60,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍎','size','🍎','small','big',NULL),

('BIG_SIZE_STAR_2A',2,'Big','tap','⭐','⭐',NULL,'A','big',1,70,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⭐','size','⭐','big','small',NULL),
('SMALL_SIZE_STAR_2A',2,'Small','tap','⭐','⭐',NULL,'B','small',1,80,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⭐','size','⭐','big','small',NULL);

-- Level 3 = same concept, more objects / randomized side encoded as separate rows.
INSERT OR IGNORE INTO education_little_questions
(
  skill_code, level, prompt_text, question_type,
  option_a, option_b, option_c,
  correct_option, accepted_words,
  active, sort_order,
  topic_code, topic_name,
  subtopic_code, subtopic_name,
  icon_hint,
  visual_type, visual_object,
  option_a_scale, option_b_scale, option_c_scale
)
VALUES
('BIG_SIZE_CAR_3A',3,'Big','tap','🚗','🚗',NULL,'A','big',1,10,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🚗','size','🚗','big','small',NULL),
('BIG_SIZE_CAR_3B',3,'Big','tap','🚗','🚗',NULL,'B','big',1,20,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🚗','size','🚗','small','big',NULL),
('SMALL_SIZE_CAR_3A',3,'Small','tap','🚗','🚗',NULL,'A','small',1,30,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🚗','size','🚗','small','big',NULL),
('SMALL_SIZE_CAR_3B',3,'Small','tap','🚗','🚗',NULL,'B','small',1,40,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🚗','size','🚗','big','small',NULL),

('BIG_SIZE_CIRCLE_3A',3,'Big','tap','●','●',NULL,'B','big',1,50,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','●','size','●','small','big',NULL),
('SMALL_SIZE_CIRCLE_3A',3,'Small','tap','●','●',NULL,'A','small',1,60,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','●','size','●','small','big',NULL);

-- Level 4 = smaller contrast (medium vs big / small vs medium).
INSERT OR IGNORE INTO education_little_questions
(
  skill_code, level, prompt_text, question_type,
  option_a, option_b, option_c,
  correct_option, accepted_words,
  active, sort_order,
  topic_code, topic_name,
  subtopic_code, subtopic_name,
  icon_hint,
  visual_type, visual_object,
  option_a_scale, option_b_scale, option_c_scale
)
VALUES
('BIG_SIZE_BALL_4A',4,'Big','tap','⚽','⚽',NULL,'B','big',1,10,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⚽','size','⚽','medium','big',NULL),
('SMALL_SIZE_BALL_4A',4,'Small','tap','⚽','⚽',NULL,'A','small',1,20,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','⚽','size','⚽','small','medium',NULL),
('BIG_SIZE_APPLE_4A',4,'Big','tap','🍎','🍎',NULL,'A','big',1,30,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍎','size','🍎','big','medium',NULL),
('SMALL_SIZE_APPLE_4A',4,'Small','tap','🍎','🍎',NULL,'B','small',1,40,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍎','size','🍎','medium','small',NULL);
