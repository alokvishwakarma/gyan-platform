-- 0107_gre_2026_catalog.sql
-- GYAN GRE General Test catalog aligned to the current ETS structure.
-- Safe to rerun.

UPDATE education_programs
SET enabled=1, program_name='GRE'
WHERE program_code='GRE' AND country_code IN ('US','IN');

UPDATE education_program_catalog
SET canonical_name='GRE', grade_code='PROGRAM_GRE', experience_type='CBT',
    enabled=1, show_questions=1, show_mock_tests=1, show_reports=1,
    duration_minutes=118, question_count=54, updated_at=CURRENT_TIMESTAMP
WHERE program_code='GRE';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'US','PROGRAM_GRE','VERBAL','GRE Verbal Reasoning',1,10
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL'
);
UPDATE education_subjects SET subject_name='GRE Verbal Reasoning',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'US','PROGRAM_GRE','QUANT','GRE Quantitative Reasoning',1,20
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT'
);
UPDATE education_subjects SET subject_name='GRE Quantitative Reasoning',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'US','PROGRAM_GRE','WRITING','GRE Analytical Writing',1,30
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='WRITING'
);
UPDATE education_subjects SET subject_name='GRE Analytical Writing',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='WRITING';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'IN','PROGRAM_GRE','VERBAL','GRE Verbal Reasoning',1,10
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL'
);
UPDATE education_subjects SET subject_name='GRE Verbal Reasoning',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'IN','PROGRAM_GRE','QUANT','GRE Quantitative Reasoning',1,20
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT'
);
UPDATE education_subjects SET subject_name='GRE Quantitative Reasoning',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT';

INSERT INTO education_subjects
(country_code,grade_code,subject_code,subject_name,enabled,sort_order)
SELECT 'IN','PROGRAM_GRE','WRITING','GRE Analytical Writing',1,30
WHERE NOT EXISTS (
  SELECT 1 FROM education_subjects
  WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='WRITING'
);
UPDATE education_subjects SET subject_name='GRE Analytical Writing',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='WRITING';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'READING_COMPREHENSION','Reading Comprehension',1,10
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='READING_COMPREHENSION');
UPDATE education_topics SET topic_name='Reading Comprehension',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL' LIMIT 1
) AND topic_code='READING_COMPREHENSION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'MAIN_IDEA','Main Idea & Primary Purpose',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='MAIN_IDEA');
UPDATE education_subtopics SET subtopic_name='Main Idea & Primary Purpose',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='MAIN_IDEA';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DETAIL_EVIDENCE','Details & Textual Evidence',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DETAIL_EVIDENCE');
UPDATE education_subtopics SET subtopic_name='Details & Textual Evidence',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='DETAIL_EVIDENCE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'INFERENCE','Inference',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='INFERENCE');
UPDATE education_subtopics SET subtopic_name='Inference',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='INFERENCE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'AUTHOR_PERSPECTIVE','Author Perspective & Tone',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='AUTHOR_PERSPECTIVE');
UPDATE education_subtopics SET subtopic_name='Author Perspective & Tone',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='AUTHOR_PERSPECTIVE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'STRUCTURE_FUNCTION','Structure & Function',50,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='STRUCTURE_FUNCTION');
UPDATE education_subtopics SET subtopic_name='Structure & Function',enabled=1,sort_order=50,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='STRUCTURE_FUNCTION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'ARGUMENT_EVALUATION','Argument Evaluation',60,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='ARGUMENT_EVALUATION');
UPDATE education_subtopics SET subtopic_name='Argument Evaluation',enabled=1,sort_order=60,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='ARGUMENT_EVALUATION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'TEXT_COMPLETION','Text Completion',1,20
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='TEXT_COMPLETION');
UPDATE education_topics SET topic_name='Text Completion',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL' LIMIT 1
) AND topic_code='TEXT_COMPLETION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'SINGLE_BLANK','Single-Blank Text Completion',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='SINGLE_BLANK');
UPDATE education_subtopics SET subtopic_name='Single-Blank Text Completion',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION' LIMIT 1
) AND subtopic_code='SINGLE_BLANK';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DOUBLE_BLANK','Double-Blank Text Completion',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DOUBLE_BLANK');
UPDATE education_subtopics SET subtopic_name='Double-Blank Text Completion',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION' LIMIT 1
) AND subtopic_code='DOUBLE_BLANK';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'TRIPLE_BLANK','Triple-Blank Text Completion',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='TRIPLE_BLANK');
UPDATE education_subtopics SET subtopic_name='Triple-Blank Text Completion',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION' LIMIT 1
) AND subtopic_code='TRIPLE_BLANK';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'SENTENCE_EQUIVALENCE','Sentence Equivalence',1,30
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='SENTENCE_EQUIVALENCE');
UPDATE education_topics SET topic_name='Sentence Equivalence',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL' LIMIT 1
) AND topic_code='SENTENCE_EQUIVALENCE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'CONTEXT_MEANING','Meaning in Context',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='CONTEXT_MEANING');
UPDATE education_subtopics SET subtopic_name='Meaning in Context',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE' LIMIT 1
) AND subtopic_code='CONTEXT_MEANING';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EQUIVALENT_PAIR','Equivalent Answer Pair',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EQUIVALENT_PAIR');
UPDATE education_subtopics SET subtopic_name='Equivalent Answer Pair',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE' LIMIT 1
) AND subtopic_code='EQUIVALENT_PAIR';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ARITHMETIC','Arithmetic',1,10
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='ARITHMETIC');
UPDATE education_topics SET topic_name='Arithmetic',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='ARITHMETIC';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'INTEGERS_FACTORS','Integers, Factors & Multiples',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='INTEGERS_FACTORS');
UPDATE education_subtopics SET subtopic_name='Integers, Factors & Multiples',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='INTEGERS_FACTORS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'FRACTIONS_RATIOS_PERCENT','Fractions, Ratios & Percent',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='FRACTIONS_RATIOS_PERCENT');
UPDATE education_subtopics SET subtopic_name='Fractions, Ratios & Percent',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EXPONENTS_ROOTS','Exponents & Roots',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EXPONENTS_ROOTS');
UPDATE education_subtopics SET subtopic_name='Exponents & Roots',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='EXPONENTS_ROOTS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'RATES_WORK','Rates, Work & Applied Arithmetic',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='RATES_WORK');
UPDATE education_subtopics SET subtopic_name='Rates, Work & Applied Arithmetic',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='RATES_WORK';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ALGEBRA','Algebra',1,20
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='ALGEBRA');
UPDATE education_topics SET topic_name='Algebra',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='ALGEBRA';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EXPRESSIONS_EQUATIONS','Expressions & Equations',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EXPRESSIONS_EQUATIONS');
UPDATE education_subtopics SET subtopic_name='Expressions & Equations',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'INEQUALITIES','Inequalities',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='INEQUALITIES');
UPDATE education_subtopics SET subtopic_name='Inequalities',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='INEQUALITIES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'FUNCTIONS_SEQUENCES','Functions & Sequences',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='FUNCTIONS_SEQUENCES');
UPDATE education_subtopics SET subtopic_name='Functions & Sequences',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='FUNCTIONS_SEQUENCES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'COORDINATE_GEOMETRY','Coordinate Geometry',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='COORDINATE_GEOMETRY');
UPDATE education_subtopics SET subtopic_name='Coordinate Geometry',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='COORDINATE_GEOMETRY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'GEOMETRY','Geometry',1,30
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='GEOMETRY');
UPDATE education_topics SET topic_name='Geometry',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='GEOMETRY';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'LINES_ANGLES_TRIANGLES','Lines, Angles & Triangles',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='LINES_ANGLES_TRIANGLES');
UPDATE education_subtopics SET subtopic_name='Lines, Angles & Triangles',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'POLYGONS','Quadrilaterals & Polygons',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='POLYGONS');
UPDATE education_subtopics SET subtopic_name='Quadrilaterals & Polygons',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='POLYGONS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'CIRCLES','Circles',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='CIRCLES');
UPDATE education_subtopics SET subtopic_name='Circles',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='CIRCLES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'THREE_DIMENSIONAL','Three-Dimensional Geometry',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='THREE_DIMENSIONAL');
UPDATE education_subtopics SET subtopic_name='Three-Dimensional Geometry',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='THREE_DIMENSIONAL';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'DATA_ANALYSIS','Data Analysis',1,40
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='DATA_ANALYSIS');
UPDATE education_topics SET topic_name='Data Analysis',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='DATA_ANALYSIS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DESCRIPTIVE_STATISTICS','Descriptive Statistics',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DESCRIPTIVE_STATISTICS');
UPDATE education_subtopics SET subtopic_name='Descriptive Statistics',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'PROBABILITY','Probability',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='PROBABILITY');
UPDATE education_subtopics SET subtopic_name='Probability',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='PROBABILITY';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'COUNTING','Counting Methods',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='COUNTING');
UPDATE education_subtopics SET subtopic_name='Counting Methods',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='COUNTING';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DATA_INTERPRETATION','Tables, Graphs & Data Interpretation',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DATA_INTERPRETATION');
UPDATE education_subtopics SET subtopic_name='Tables, Graphs & Data Interpretation',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='DATA_INTERPRETATION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ANALYZE_ISSUE','Analyze an Issue',1,10
FROM education_subjects s
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='ANALYZE_ISSUE');
UPDATE education_topics SET topic_name='Analyze an Issue',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='US' AND grade_code='PROGRAM_GRE' AND subject_code='WRITING' LIMIT 1
) AND topic_code='ANALYZE_ISSUE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'POSITION_REASONING','Position & Reasoning',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='POSITION_REASONING');
UPDATE education_subtopics SET subtopic_name='Position & Reasoning',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='POSITION_REASONING';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EVIDENCE_EXAMPLES','Evidence & Examples',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EVIDENCE_EXAMPLES');
UPDATE education_subtopics SET subtopic_name='Evidence & Examples',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='EVIDENCE_EXAMPLES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'ORGANIZATION','Organization & Coherence',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='ORGANIZATION');
UPDATE education_subtopics SET subtopic_name='Organization & Coherence',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='ORGANIZATION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'LANGUAGE_CLARITY','Language & Clarity',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='LANGUAGE_CLARITY');
UPDATE education_subtopics SET subtopic_name='Language & Clarity',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='LANGUAGE_CLARITY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'READING_COMPREHENSION','Reading Comprehension',1,10
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='READING_COMPREHENSION');
UPDATE education_topics SET topic_name='Reading Comprehension',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL' LIMIT 1
) AND topic_code='READING_COMPREHENSION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'MAIN_IDEA','Main Idea & Primary Purpose',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='MAIN_IDEA');
UPDATE education_subtopics SET subtopic_name='Main Idea & Primary Purpose',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='MAIN_IDEA';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DETAIL_EVIDENCE','Details & Textual Evidence',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DETAIL_EVIDENCE');
UPDATE education_subtopics SET subtopic_name='Details & Textual Evidence',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='DETAIL_EVIDENCE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'INFERENCE','Inference',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='INFERENCE');
UPDATE education_subtopics SET subtopic_name='Inference',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='INFERENCE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'AUTHOR_PERSPECTIVE','Author Perspective & Tone',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='AUTHOR_PERSPECTIVE');
UPDATE education_subtopics SET subtopic_name='Author Perspective & Tone',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='AUTHOR_PERSPECTIVE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'STRUCTURE_FUNCTION','Structure & Function',50,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='STRUCTURE_FUNCTION');
UPDATE education_subtopics SET subtopic_name='Structure & Function',enabled=1,sort_order=50,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='STRUCTURE_FUNCTION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'ARGUMENT_EVALUATION','Argument Evaluation',60,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='ARGUMENT_EVALUATION');
UPDATE education_subtopics SET subtopic_name='Argument Evaluation',enabled=1,sort_order=60,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='READING_COMPREHENSION' LIMIT 1
) AND subtopic_code='ARGUMENT_EVALUATION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'TEXT_COMPLETION','Text Completion',1,20
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='TEXT_COMPLETION');
UPDATE education_topics SET topic_name='Text Completion',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL' LIMIT 1
) AND topic_code='TEXT_COMPLETION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'SINGLE_BLANK','Single-Blank Text Completion',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='SINGLE_BLANK');
UPDATE education_subtopics SET subtopic_name='Single-Blank Text Completion',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION' LIMIT 1
) AND subtopic_code='SINGLE_BLANK';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DOUBLE_BLANK','Double-Blank Text Completion',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DOUBLE_BLANK');
UPDATE education_subtopics SET subtopic_name='Double-Blank Text Completion',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION' LIMIT 1
) AND subtopic_code='DOUBLE_BLANK';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'TRIPLE_BLANK','Triple-Blank Text Completion',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='TRIPLE_BLANK');
UPDATE education_subtopics SET subtopic_name='Triple-Blank Text Completion',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='TEXT_COMPLETION' LIMIT 1
) AND subtopic_code='TRIPLE_BLANK';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'SENTENCE_EQUIVALENCE','Sentence Equivalence',1,30
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='SENTENCE_EQUIVALENCE');
UPDATE education_topics SET topic_name='Sentence Equivalence',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='VERBAL' LIMIT 1
) AND topic_code='SENTENCE_EQUIVALENCE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'CONTEXT_MEANING','Meaning in Context',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='CONTEXT_MEANING');
UPDATE education_subtopics SET subtopic_name='Meaning in Context',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE' LIMIT 1
) AND subtopic_code='CONTEXT_MEANING';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EQUIVALENT_PAIR','Equivalent Answer Pair',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EQUIVALENT_PAIR');
UPDATE education_subtopics SET subtopic_name='Equivalent Answer Pair',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='VERBAL' AND t.topic_code='SENTENCE_EQUIVALENCE' LIMIT 1
) AND subtopic_code='EQUIVALENT_PAIR';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ARITHMETIC','Arithmetic',1,10
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='ARITHMETIC');
UPDATE education_topics SET topic_name='Arithmetic',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='ARITHMETIC';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'INTEGERS_FACTORS','Integers, Factors & Multiples',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='INTEGERS_FACTORS');
UPDATE education_subtopics SET subtopic_name='Integers, Factors & Multiples',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='INTEGERS_FACTORS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'FRACTIONS_RATIOS_PERCENT','Fractions, Ratios & Percent',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='FRACTIONS_RATIOS_PERCENT');
UPDATE education_subtopics SET subtopic_name='Fractions, Ratios & Percent',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='FRACTIONS_RATIOS_PERCENT';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EXPONENTS_ROOTS','Exponents & Roots',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EXPONENTS_ROOTS');
UPDATE education_subtopics SET subtopic_name='Exponents & Roots',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='EXPONENTS_ROOTS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'RATES_WORK','Rates, Work & Applied Arithmetic',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='RATES_WORK');
UPDATE education_subtopics SET subtopic_name='Rates, Work & Applied Arithmetic',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ARITHMETIC' LIMIT 1
) AND subtopic_code='RATES_WORK';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ALGEBRA','Algebra',1,20
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='ALGEBRA');
UPDATE education_topics SET topic_name='Algebra',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='ALGEBRA';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EXPRESSIONS_EQUATIONS','Expressions & Equations',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EXPRESSIONS_EQUATIONS');
UPDATE education_subtopics SET subtopic_name='Expressions & Equations',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='EXPRESSIONS_EQUATIONS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'INEQUALITIES','Inequalities',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='INEQUALITIES');
UPDATE education_subtopics SET subtopic_name='Inequalities',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='INEQUALITIES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'FUNCTIONS_SEQUENCES','Functions & Sequences',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='FUNCTIONS_SEQUENCES');
UPDATE education_subtopics SET subtopic_name='Functions & Sequences',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='FUNCTIONS_SEQUENCES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'COORDINATE_GEOMETRY','Coordinate Geometry',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='COORDINATE_GEOMETRY');
UPDATE education_subtopics SET subtopic_name='Coordinate Geometry',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='ALGEBRA' LIMIT 1
) AND subtopic_code='COORDINATE_GEOMETRY';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'GEOMETRY','Geometry',1,30
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='GEOMETRY');
UPDATE education_topics SET topic_name='Geometry',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='GEOMETRY';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'LINES_ANGLES_TRIANGLES','Lines, Angles & Triangles',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='LINES_ANGLES_TRIANGLES');
UPDATE education_subtopics SET subtopic_name='Lines, Angles & Triangles',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='LINES_ANGLES_TRIANGLES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'POLYGONS','Quadrilaterals & Polygons',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='POLYGONS');
UPDATE education_subtopics SET subtopic_name='Quadrilaterals & Polygons',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='POLYGONS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'CIRCLES','Circles',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='CIRCLES');
UPDATE education_subtopics SET subtopic_name='Circles',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='CIRCLES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'THREE_DIMENSIONAL','Three-Dimensional Geometry',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='THREE_DIMENSIONAL');
UPDATE education_subtopics SET subtopic_name='Three-Dimensional Geometry',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='GEOMETRY' LIMIT 1
) AND subtopic_code='THREE_DIMENSIONAL';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'DATA_ANALYSIS','Data Analysis',1,40
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='DATA_ANALYSIS');
UPDATE education_topics SET topic_name='Data Analysis',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='QUANT' LIMIT 1
) AND topic_code='DATA_ANALYSIS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DESCRIPTIVE_STATISTICS','Descriptive Statistics',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DESCRIPTIVE_STATISTICS');
UPDATE education_subtopics SET subtopic_name='Descriptive Statistics',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='DESCRIPTIVE_STATISTICS';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'PROBABILITY','Probability',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='PROBABILITY');
UPDATE education_subtopics SET subtopic_name='Probability',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='PROBABILITY';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'COUNTING','Counting Methods',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='COUNTING');
UPDATE education_subtopics SET subtopic_name='Counting Methods',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='COUNTING';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'DATA_INTERPRETATION','Tables, Graphs & Data Interpretation',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='DATA_INTERPRETATION');
UPDATE education_subtopics SET subtopic_name='Tables, Graphs & Data Interpretation',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='QUANT' AND t.topic_code='DATA_ANALYSIS' LIMIT 1
) AND subtopic_code='DATA_INTERPRETATION';

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT s.id,'ANALYZE_ISSUE','Analyze an Issue',1,10
FROM education_subjects s
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING'
  AND NOT EXISTS (SELECT 1 FROM education_topics t WHERE t.subject_id=s.id AND t.topic_code='ANALYZE_ISSUE');
UPDATE education_topics SET topic_name='Analyze an Issue',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE subject_id=(
  SELECT id FROM education_subjects WHERE country_code='IN' AND grade_code='PROGRAM_GRE' AND subject_code='WRITING' LIMIT 1
) AND topic_code='ANALYZE_ISSUE';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'POSITION_REASONING','Position & Reasoning',10,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='POSITION_REASONING');
UPDATE education_subtopics SET subtopic_name='Position & Reasoning',enabled=1,sort_order=10,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='POSITION_REASONING';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'EVIDENCE_EXAMPLES','Evidence & Examples',20,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='EVIDENCE_EXAMPLES');
UPDATE education_subtopics SET subtopic_name='Evidence & Examples',enabled=1,sort_order=20,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='EVIDENCE_EXAMPLES';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'ORGANIZATION','Organization & Coherence',30,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='ORGANIZATION');
UPDATE education_subtopics SET subtopic_name='Organization & Coherence',enabled=1,sort_order=30,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='ORGANIZATION';

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,sort_order,enabled)
SELECT t.id,'LANGUAGE_CLARITY','Language & Clarity',40,1
FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE'
  AND NOT EXISTS (SELECT 1 FROM education_subtopics st WHERE st.topic_id=t.id AND st.subtopic_code='LANGUAGE_CLARITY');
UPDATE education_subtopics SET subtopic_name='Language & Clarity',enabled=1,sort_order=40,updated_at=CURRENT_TIMESTAMP
WHERE topic_id=(
  SELECT t.id FROM education_topics t JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='IN' AND s.grade_code='PROGRAM_GRE' AND s.subject_code='WRITING' AND t.topic_code='ANALYZE_ISSUE' LIMIT 1
) AND subtopic_code='LANGUAGE_CLARITY';

SELECT s.country_code,s.subject_code,
       COUNT(DISTINCT t.id) AS topics,
       COUNT(DISTINCT st.id) AS skills
FROM education_subjects s
LEFT JOIN education_topics t ON t.subject_id=s.id AND t.enabled=1
LEFT JOIN education_subtopics st ON st.topic_id=t.id AND st.enabled=1
WHERE s.grade_code='PROGRAM_GRE' AND s.country_code IN ('US','IN')
GROUP BY s.country_code,s.subject_code
ORDER BY s.country_code,s.sort_order;
