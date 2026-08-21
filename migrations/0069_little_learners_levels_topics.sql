-- 0069_little_learners_levels_topics.sql
PRAGMA foreign_keys = ON;

ALTER TABLE education_little_questions ADD COLUMN topic_code TEXT;
ALTER TABLE education_little_questions ADD COLUMN topic_name TEXT;
ALTER TABLE education_little_questions ADD COLUMN subtopic_code TEXT;
ALTER TABLE education_little_questions ADD COLUMN subtopic_name TEXT;
ALTER TABLE education_little_questions ADD COLUMN icon_hint TEXT;

CREATE INDEX IF NOT EXISTS idx_little_questions_topic
ON education_little_questions(topic_code,subtopic_code,level,active);

UPDATE education_little_questions SET topic_code='COLORS',topic_name='Colors',subtopic_code='BASIC_COLORS',subtopic_name='Basic Colors' WHERE skill_code LIKE 'COLOR_%';
UPDATE education_little_questions SET topic_code='CONCEPTS',topic_name='Concepts',subtopic_code='BIG_SMALL',subtopic_name='Big & Small' WHERE skill_code IN ('BIG','SMALL');
UPDATE education_little_questions SET topic_code='NUMBERS',topic_name='Numbers',subtopic_code='COUNT_1_5',subtopic_name='Numbers 1-5' WHERE skill_code LIKE 'NUMBER_%';
UPDATE education_little_questions SET topic_code='FUNCTIONAL',topic_name='Functional Words',subtopic_code='NEEDS_ACTIONS',subtopic_name='Needs & Actions' WHERE skill_code IN ('HELP','OUT','WATER','STOP','GO');
UPDATE education_little_questions SET topic_code='SPEECH',topic_name='Speech Practice',subtopic_code='EXPRESSIVE',subtopic_name='Expressive Practice' WHERE skill_code LIKE 'SAY_%';

INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_BALL',1,'Ball','tap','⚽',NULL,NULL,'A','ball',100,'WORDS','Words','NOUNS','Nouns','⚽');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_CAR',1,'Car','tap','🚗',NULL,NULL,'A','car',100,'WORDS','Words','NOUNS','Nouns','🚗');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_BUS',1,'Bus','tap','🚌',NULL,NULL,'A','bus',100,'WORDS','Words','NOUNS','Nouns','🚌');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_APPLE',1,'Apple','tap','🍎',NULL,NULL,'A','apple',100,'WORDS','Words','NOUNS','Nouns','🍎');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_BANANA',1,'Banana','tap','🍌',NULL,NULL,'A','banana',100,'WORDS','Words','NOUNS','Nouns','🍌');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_BOOK',1,'Book','tap','📘',NULL,NULL,'A','book',100,'WORDS','Words','NOUNS','Nouns','📘');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_SHOE',1,'Shoe','tap','👟',NULL,NULL,'A','shoe',100,'WORDS','Words','NOUNS','Nouns','👟');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_WATER',1,'Water','tap','💧',NULL,NULL,'A','water',100,'WORDS','Words','NOUNS','Nouns','💧');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('VERB_GO',1,'Go','tap','▶️',NULL,NULL,'A','go',100,'ACTIONS','Actions','BASIC_ACTIONS','Basic Actions','▶️');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('VERB_STOP',1,'Stop','tap','🛑',NULL,NULL,'A','stop',100,'ACTIONS','Actions','BASIC_ACTIONS','Basic Actions','🛑');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('VERB_COME',1,'Come','tap','👋',NULL,NULL,'A','come',100,'ACTIONS','Actions','BASIC_ACTIONS','Basic Actions','👋');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('VERB_PUSH',1,'Push','tap','👉📦',NULL,NULL,'A','push|pushing',100,'ACTIONS','Actions','MOVEMENT','Movement','👉📦');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('VERB_SPIN',1,'Spin','tap','🌀',NULL,NULL,'A','spin|spinning',100,'ACTIONS','Actions','MOVEMENT','Movement','🌀');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('ABSTRACT_HELP',1,'Help','tap','🆘',NULL,NULL,'A','help',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','🆘');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('ABSTRACT_MORE',1,'More','tap','➕',NULL,NULL,'A','more',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','➕');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('FEELING_HAPPY',1,'Happy','tap','😊',NULL,NULL,'A','happy',100,'CONCEPTS','Concepts','FEELINGS','Feelings','😊');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('BIG_ELEPHANT',2,'Big','tap','🐘','🐭',NULL,'A','big',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🐘');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SMALL_MOUSE',2,'Small','tap','🐘','🐭',NULL,'B','small',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🐭');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('BIG_FRUIT',2,'Big','tap','🍉','🍒',NULL,'A','big',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍉');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SMALL_FRUIT',2,'Small','tap','🍉','🍒',NULL,'B','small',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍒');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('BIG_VEHICLE',2,'Big','tap','🚌','🚗',NULL,'A','big',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🚌');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SMALL_VEHICLE',2,'Small','tap','🚌','🚗',NULL,'B','small',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🚗');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SAME_1',2,'Same','tap','🍎 🍎','🍎 🍌',NULL,'A','same',100,'CONCEPTS','Concepts','SAME_DIFFERENT','Same & Different','🟰');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('DIFFERENT_1',2,'Different','tap','⚽ ⚽','⚽ 🚗',NULL,'B','different',100,'CONCEPTS','Concepts','SAME_DIFFERENT','Same & Different','↔️');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('ABSTRACT_HELP_2',2,'Help','tap','🆘','💧',NULL,'A','help',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','🆘');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('ABSTRACT_MORE_2',2,'More','tap','🍪🍪🍪','🍪',NULL,'A','more',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','➕');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('HAPPY_2',2,'Happy','tap','😊','😢',NULL,'A','happy',100,'CONCEPTS','Concepts','FEELINGS','Feelings','😊');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_BALL_2',2,'Ball','tap','⚽','🍎',NULL,'A','ball',100,'WORDS','Words','NOUNS','Nouns','⚽');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_CAR_2',2,'Car','tap','🚗','📘',NULL,'A','car',100,'WORDS','Words','NOUNS','Nouns','🚗');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_BUS_2',2,'Bus','tap','🍌','🚌',NULL,'B','bus',100,'WORDS','Words','NOUNS','Nouns','🚌');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_APPLE_2',2,'Apple','tap','🍎','👟',NULL,'A','apple',100,'WORDS','Words','NOUNS','Nouns','🍎');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_BOOK_2',2,'Book','tap','📘','⚽',NULL,'A','book',100,'WORDS','Words','NOUNS','Nouns','📘');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('NOUN_WATER_2',2,'Water','tap','💧','🚗',NULL,'A','water',100,'WORDS','Words','NOUNS','Nouns','💧');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('GO_2',2,'Go','tap','▶️','🛑',NULL,'A','go',100,'ACTIONS','Actions','BASIC_ACTIONS','Basic Actions','▶️');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('STOP_2',2,'Stop','tap','▶️','🛑',NULL,'B','stop',100,'ACTIONS','Actions','BASIC_ACTIONS','Basic Actions','🛑');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('COME_2',2,'Come','tap','👋','🚪',NULL,'A','come',100,'ACTIONS','Actions','BASIC_ACTIONS','Basic Actions','👋');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('PUSH_2',2,'Push','tap','👉📦','🌀',NULL,'A','push|pushing',100,'ACTIONS','Actions','MOVEMENT','Movement','👉');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SPIN_2',2,'Spin','tap','👉📦','🌀',NULL,'B','spin|spinning',100,'ACTIONS','Actions','MOVEMENT','Movement','🌀');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('BIG_3',3,'Big','tap','🍒','🫐','🍉','C','big',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍉');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SMALL_3',3,'Small','tap','🍉','🍒','🍍','B','small',100,'CONCEPTS','Concepts','BIG_SMALL','Big & Small','🍒');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('BALL_3',3,'Ball','tap','🍎','⚽','🚗','B','ball',100,'WORDS','Words','NOUNS','Nouns','⚽');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('CAR_3',3,'Car','tap','📘','🍌','🚗','C','car',100,'WORDS','Words','NOUNS','Nouns','🚗');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('GO_3',3,'Go','tap','🛑','💧','▶️','C','go',100,'ACTIONS','Actions','BASIC_ACTIONS','Basic Actions','▶️');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('PUSH_3',3,'Push','tap','🌀','👉📦','👋','B','push|pushing',100,'ACTIONS','Actions','MOVEMENT','Movement','👉');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SPIN_3',3,'Spin','tap','👉📦','👋','🌀','C','spin|spinning',100,'ACTIONS','Actions','MOVEMENT','Movement','🌀');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('HELP_3',3,'Help','tap','💧','🆘','🚪','B','help',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','🆘');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('MORE_3',3,'More','tap','🍪','🍪🍪🍪','🛑','B','more',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','➕');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('HAPPY_3',3,'Happy','tap','😢','😠','😊','C','happy',100,'CONCEPTS','Concepts','FEELINGS','Feelings','😊');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SAME_3',3,'Same','tap','🚗 🚌','🍌 🍎','⚽ ⚽','C','same',100,'CONCEPTS','Concepts','SAME_DIFFERENT','Same & Different','🟰');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('DIFF_3',3,'Different','tap','🍎 🍎','🚌 🚌','🍎 🍌','C','different',100,'CONCEPTS','Concepts','SAME_DIFFERENT','Same & Different','↔️');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('IN_4',4,'In','tap','📦⚽','⚽⬆️📦','⚽⬇️📦','A','in',100,'CONCEPTS','Concepts','LOCATION','In, On & Under','📦');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('ON_4',4,'On','tap','📦⚽','⚽⬆️📦','⚽⬇️📦','B','on',100,'CONCEPTS','Concepts','LOCATION','In, On & Under','⬆️');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('UNDER_4',4,'Under','tap','📦⚽','⚽⬆️📦','⚽⬇️📦','C','under',100,'CONCEPTS','Concepts','LOCATION','In, On & Under','⬇️');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('FIRST_4',4,'First','tap','1️⃣','2️⃣','3️⃣','A','first',100,'CONCEPTS','Concepts','SEQUENCE','First & Then','1️⃣');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('HAPPY_4',4,'Happy','tap','🙂','😢','😠','A','happy',100,'CONCEPTS','Concepts','FEELINGS','Feelings','🙂');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('PUSH_5',5,'Pushing','tap','🧒👉📦','🧒🌀','🧒🛑','A','push|pushing',100,'ACTIONS','Actions','MOVEMENT','Movement','👉');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('SPIN_5',5,'Spinning','tap','🧒🛑','🧒🌀','🧒👉📦','B','spin|spinning',100,'ACTIONS','Actions','MOVEMENT','Movement','🌀');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('HAPPY_5',5,'Happy','tap','👦😊','👦😢','👦😴','A','happy',100,'CONCEPTS','Concepts','FEELINGS','Feelings','😊');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('MORE_5',5,'More','tap','🍪','🍪🍪🍪','🚪','B','more',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','➕');
INSERT OR IGNORE INTO education_little_questions
(skill_code,level,prompt_text,question_type,option_a,option_b,option_c,correct_option,accepted_words,sort_order,topic_code,topic_name,subtopic_code,subtopic_name,icon_hint)
VALUES ('HELP_5',5,'Help','tap','🧒🆘','🧒▶️','🧒😴','A','help',100,'CONCEPTS','Concepts','FUNCTIONAL','Help & More','🆘');
