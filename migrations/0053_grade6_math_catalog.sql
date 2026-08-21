-- 0053_grade6_math_catalog.sql
-- Grade 6 Mathematics catalog for both US and India.
-- Country-specific curriculum differences can be added later without changing schema.

INSERT OR IGNORE INTO education_subjects
(country_code, grade_code, subject_code, subject_name, enabled, sort_order)
VALUES
('US', 'GRADE_6', 'MATH', 'Mathematics', 1, 10),
('IN', 'GRADE_6', 'MATH', 'Mathematics', 1, 10);

-- Create the same topic catalog under both country Grade 6 Math subjects.
INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id, 'RATIOS', 'Ratios & Rates', 1, 10
FROM education_subjects
WHERE grade_code='GRADE_6' AND subject_code='MATH';

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id, 'NUMBER_SYSTEM', 'Number System', 1, 20
FROM education_subjects
WHERE grade_code='GRADE_6' AND subject_code='MATH';

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id, 'EXPRESSIONS', 'Expressions & Equations', 1, 30
FROM education_subjects
WHERE grade_code='GRADE_6' AND subject_code='MATH';

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id, 'GEOMETRY', 'Geometry', 1, 40
FROM education_subjects
WHERE grade_code='GRADE_6' AND subject_code='MATH';

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id, 'STATISTICS', 'Statistics & Data', 1, 50
FROM education_subjects
WHERE grade_code='GRADE_6' AND subject_code='MATH';

-- Ratios & Rates
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'RATIO_CONCEPTS', 'Understanding Ratios', 1, 10 FROM education_topics WHERE topic_code='RATIOS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'EQUIVALENT_RATIOS', 'Equivalent Ratios', 1, 20 FROM education_topics WHERE topic_code='RATIOS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'UNIT_RATES', 'Unit Rates', 1, 30 FROM education_topics WHERE topic_code='RATIOS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'RATIO_TABLES', 'Ratio Tables', 1, 40 FROM education_topics WHERE topic_code='RATIOS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'PERCENT', 'Percent', 1, 50 FROM education_topics WHERE topic_code='RATIOS';

-- Number System
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'FRACTIONS', 'Fractions', 1, 10 FROM education_topics WHERE topic_code='NUMBER_SYSTEM';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'DECIMALS', 'Decimals', 1, 20 FROM education_topics WHERE topic_code='NUMBER_SYSTEM';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'INTEGERS', 'Integers', 1, 30 FROM education_topics WHERE topic_code='NUMBER_SYSTEM';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'GCF_LCM', 'GCF & LCM', 1, 40 FROM education_topics WHERE topic_code='NUMBER_SYSTEM';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'COORDINATE_PLANE', 'Coordinate Plane', 1, 50 FROM education_topics WHERE topic_code='NUMBER_SYSTEM';

-- Expressions & Equations
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'EXPRESSIONS', 'Writing & Evaluating Expressions', 1, 10 FROM education_topics WHERE topic_code='EXPRESSIONS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'DISTRIBUTIVE', 'Distributive Property', 1, 20 FROM education_topics WHERE topic_code='EXPRESSIONS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'ONE_STEP_EQUATIONS', 'One-Step Equations', 1, 30 FROM education_topics WHERE topic_code='EXPRESSIONS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'INEQUALITIES', 'Inequalities', 1, 40 FROM education_topics WHERE topic_code='EXPRESSIONS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'DEPENDENT_VARIABLES', 'Dependent & Independent Variables', 1, 50 FROM education_topics WHERE topic_code='EXPRESSIONS';

-- Geometry
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'AREA_TRIANGLES', 'Area of Triangles', 1, 10 FROM education_topics WHERE topic_code='GEOMETRY';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'AREA_QUADRILATERALS', 'Area of Quadrilaterals', 1, 20 FROM education_topics WHERE topic_code='GEOMETRY';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'SURFACE_AREA', 'Surface Area', 1, 30 FROM education_topics WHERE topic_code='GEOMETRY';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'VOLUME', 'Volume', 1, 40 FROM education_topics WHERE topic_code='GEOMETRY';

-- Statistics & Data
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'MEAN', 'Mean', 1, 10 FROM education_topics WHERE topic_code='STATISTICS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'MEDIAN', 'Median', 1, 20 FROM education_topics WHERE topic_code='STATISTICS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'MODE', 'Mode', 1, 30 FROM education_topics WHERE topic_code='STATISTICS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'RANGE', 'Range', 1, 40 FROM education_topics WHERE topic_code='STATISTICS';
INSERT OR IGNORE INTO education_subtopics(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT id, 'DATA_DISPLAYS', 'Data Displays', 1, 50 FROM education_topics WHERE topic_code='STATISTICS';
