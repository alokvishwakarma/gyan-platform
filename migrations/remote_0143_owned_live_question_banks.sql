-- 0143_owned_live_question_banks.sql
-- Original GYAN-owned question banks for class-linked Live Tests.
-- 30 JEE Straight Lines + 30 JEE Center of Mass + 25 NEET Center of Mass.
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_001',
'easy',
'slope through (2,3) and (6,11)?',
'1',
'2',
'3',
'4',
'B',
'Slope = (11-3)/(6-2)=2.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_002',
'easy',
'line slope 3 through (2,-1)?',
'y=3x-7',
'y=3x+5',
'3y=x-5',
'y=-3x+5',
'A',
'Using y+1=3(x-2) gives y=3x-7.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_003',
'easy',
'x-intercept of 2x+3y=12 when y=0?',
'2',
'4',
'6',
'12',
'C',
'Set y=0: 2x=12, so x=6.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_004',
'easy',
'y-intercept of 4x-2y=8?',
'-4',
'-2',
'2',
'4',
'A',
'Set x=0: -2y=8, so y=-4.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_005',
'easy',
'slope of 3x+2y-7=0?',
'3/2',
'-3/2',
'2/3',
'-2/3',
'B',
'Rewrite y=(-3/2)x+7/2.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_006',
'easy',
'parallel to 2x-5y+1=0 has slope?',
'-2/5',
'2/5',
'5/2',
'-5/2',
'B',
'y=(2/5)x+1/5.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_007',
'easy',
'perpendicular to slope 4 has slope?',
'4',
'-4',
'1/4',
'-1/4',
'D',
'Perpendicular slopes multiply to -1.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_008',
'easy',
'line through origin and (3,-6)?',
'y=2x',
'y=-2x',
'2y=x',
'y=-3x',
'B',
'Slope=-6/3=-2.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_009',
'easy',
'which point lies on x+2y=7?',
'(1,2)',
'(3,2)',
'(5,2)',
'(7,1)',
'B',
'3+2(2)=7.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_010',
'easy',
'distance of (3,4) from x-axis?',
'3',
'4',
'5',
'7',
'B',
'Distance from x-axis is |y|=4.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_011',
'easy',
'distance of (-5,2) from y-axis?',
'2',
'3',
'5',
'7',
'C',
'Distance from y-axis is |x|=5.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_012',
'easy',
'line x=4 is?',
'horizontal',
'vertical',
'slope 4',
'through origin',
'B',
'x=constant is vertical.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_013',
'easy',
'line y=-3 is?',
'vertical',
'horizontal',
'slope -3',
'through origin',
'B',
'y=constant is horizontal.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_014',
'medium',
'angle between lines with slopes 1 and -1?',
'30°',
'45°',
'60°',
'90°',
'D',
'Their slopes multiply to -1, so they are perpendicular.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_015',
'medium',
'line through (1,2) parallel to x+y=5?',
'x+y=3',
'x-y=-1',
'x+y=5',
'2x+y=4',
'A',
'Parallel form x+y=c; point gives c=3.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_016',
'medium',
'line through (2,1) perpendicular to x-2y=4?',
'2x+y=5',
'x-2y=0',
'x+2y=4',
'2x-y=3',
'A',
'Given slope=1/2; perpendicular slope=-2: y-1=-2(x-2), or 2x+y=5.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_017',
'medium',
'area of triangle formed by x+y=4 with coordinate axes?',
'4',
'6',
'8',
'16',
'C',
'Intercepts are 4 and 4; area=1/2·4·4=8.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_018',
'medium',
'equation with intercepts 3 and 6?',
'x/3+y/6=1',
'x/6+y/3=0',
'3x+6y=1',
'x+y=9',
'A',
'Intercept form is x/a+y/b=1.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_019',
'medium',
'distance from origin to 3x+4y-10=0?',
'1',
'2',
'5/2',
'10',
'B',
'Distance=10/sqrt(9+16)=2.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_020',
'medium',
'distance between parallel lines 3x+4y=5 and 3x+4y=15?',
'1',
'2',
'5',
'10',
'B',
'Distance=|15-5|/5=2.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_021',
'medium',
'point dividing (0,0),(6,9) internally in ratio 1:2?',
'(2,3)',
'(3,4.5)',
'(4,6)',
'(1,2)',
'A',
'Section formula gives (2,3).',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_022',
'medium',
'midpoint of intercepts of 2x+3y=6?',
'(1,1)',
'(3/2,1)',
'(3,2)',
'(1,3/2)',
'B',
'Intercepts (3,0),(0,2); midpoint=(3/2,1).',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_023',
'medium',
'family of lines through intersection of L1=0,L2=0 is?',
'L1+λL2=0',
'λL1=0',
'L1L2=0',
'L1-L2=1',
'A',
'The standard family is L1+λL2=0.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_024',
'easy',
'if ax+by+c=0 passes through origin, then?',
'a=0',
'b=0',
'c=0',
'a=b',
'C',
'Substitute (0,0): c=0.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_025',
'medium',
'line joining (a,0) and (0,b)?',
'ax+by=1',
'x/a+y/b=1',
'x/b+y/a=0',
'bx+ay=ab+1',
'B',
'This is the intercept form.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_026',
'medium',
'slope of line making 135° with +x-axis?',
'1',
'-1',
'√3',
'-√3',
'B',
'm=tan135°=-1.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_027',
'easy',
'if two nonvertical lines are parallel, their slopes are?',
'reciprocals',
'negative reciprocals',
'equal',
'zero',
'C',
'Parallel nonvertical lines have equal slopes.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_028',
'easy',
'line through (1,1) with slope undefined?',
'x=1',
'y=1',
'x+y=2',
'y=x',
'A',
'Undefined slope means vertical line x=1.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_029',
'medium',
'distance of (1,2) from x+y-1=0?',
'1/√2',
'√2',
'2',
'2√2',
'B',
'|1+2-1|/√2=√2.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_MATH_STRAIGHT_LINES_030',
'easy',
'reflection of (2,3) across x-axis?',
'(-2,3)',
'(2,-3)',
'(-2,-3)',
'(3,2)',
'B',
'Reflection across x-axis changes y sign.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND st.subtopic_code='STRAIGHT_LINES_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_001',
'easy',
'two masses 2 kg and 3 kg at x=0 and x=10 m. COM x?',
'4 m',
'5 m',
'6 m',
'8 m',
'C',
'x_cm=(2·0+3·10)/5=6 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_002',
'easy',
'equal masses at x=-4 m and x=6 m. COM x?',
'-1 m',
'1 m',
'2 m',
'5 m',
'B',
'For equal masses, COM is midpoint: 1 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_003',
'easy',
'1 kg at x=2 m and 4 kg at x=7 m. COM x?',
'5 m',
'6 m',
'6.5 m',
'7 m',
'B',
'x_cm=(2+28)/5=6 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_004',
'easy',
'COM of a uniform rod of length L lies at?',
'an end',
'L/4 from an end',
'L/2 from an end',
'depends on mass',
'C',
'Uniform rod COM is its geometric midpoint.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_005',
'easy',
'if all particles translate by vector a, COM translates by?',
'0',
'a',
'2a',
'a/2',
'B',
'COM shifts by the same translation vector.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_006',
'easy',
'net external force on system equals?',
'M a_cm',
'M v_cm',
'zero always',
'internal force sum',
'A',
'F_ext=M a_cm.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_007',
'medium',
'with zero net external force, COM velocity is?',
'always zero',
'constant',
'increasing',
'undefined',
'B',
'Zero external force implies constant total momentum and COM velocity.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_008',
'easy',
'two equal masses move with velocities +v and -v. COM velocity?',
'+v',
'-v',
'0',
'2v',
'C',
'Total momentum is zero, so V_cm=0.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_009',
'medium',
'2 kg moves 3 m/s right; 1 kg moves 6 m/s left. V_cm?',
'0',
'1 m/s right',
'3 m/s right',
'3 m/s left',
'A',
'Total momentum=6-6=0.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_010',
'medium',
'explosion of isolated body: motion of COM is governed by?',
'internal forces',
'external force',
'largest fragment',
'explosion energy',
'B',
'Internal forces cannot change total momentum; COM responds to external force.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_011',
'easy',
'COM of a uniform circular ring is at?',
'on circumference',
'center',
'half radius',
'depends on radius',
'B',
'By symmetry the COM is at the center.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_012',
'easy',
'COM of uniform disc is at?',
'center',
'rim',
'R/2 from center',
'R/3 from center',
'A',
'By symmetry it is at the center.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_013',
'medium',
'for masses m and 2m separated by 9 m, COM from m is?',
'3 m',
'4.5 m',
'6 m',
'9 m',
'C',
'x_cm=(2m·9)/(3m)=6 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_014',
'easy',
'COM lies closer to?',
'smaller mass',
'larger mass',
'always midpoint',
'origin',
'B',
'The weighted average lies closer to the larger mass.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_015',
'easy',
'if mass distribution is symmetric about a point, COM?',
'must be at that point',
'must be outside',
'is undefined',
'depends only on total mass',
'A',
'Symmetry places COM at the symmetry point.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_016',
'easy',
'system momentum P and total mass M give V_cm=?',
'PM',
'P/M',
'M/P',
'P²/M',
'B',
'P=M V_cm.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_017',
'easy',
'if external impulse J acts on system, change in total momentum?',
'J',
'J/M',
'MJ',
'0',
'A',
'Impulse equals change in total momentum.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_018',
'easy',
'two particles 1 kg at (0,0), 3 kg at (4,0). x_cm?',
'1',
'2',
'3',
'4',
'C',
'x_cm=(0+12)/4=3.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_019',
'medium',
'masses 1,1,2 kg at x=0,2,5. x_cm?',
'2',
'3',
'3.5',
'4',
'B',
'x_cm=(0+2+10)/4=3.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_020',
'easy',
'COM acceleration if F_ext=20 N and M=5 kg?',
'2 m/s²',
'4 m/s²',
'5 m/s²',
'100 m/s²',
'B',
'a_cm=F_ext/M=4 m/s².',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_021',
'medium',
'internal forces can change total momentum of an isolated system?',
'yes always',
'only if unequal',
'no',
'only during collision',
'C',
'Internal forces cancel in the total momentum balance.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_022',
'medium',
'person walks right inside stationary boat on still water; system COM horizontally?',
'moves right',
'moves left',
'remains fixed if no external horizontal force',
'accelerates upward',
'C',
'With negligible external horizontal force, horizontal COM remains fixed.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_023',
'medium',
'projectile explodes in flight neglecting air resistance. COM follows?',
'vertical line',
'original projectile trajectory',
'largest fragment',
'random path',
'B',
'Gravity is unchanged external force, so COM follows the original trajectory.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_024',
'medium',
'uniform semicircular wire COM lies?',
'at circle center',
'on symmetry axis',
'on arc endpoint',
'outside symmetry axis',
'B',
'Symmetry requires the COM to lie on the symmetry axis.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_025',
'medium',
'for continuous body, COM position uses?',
'∫r dm / M',
'∫r dt',
'M/∫r dm',
'∫F dm',
'A',
'Continuous mass distribution uses r_cm=(1/M)∫r dm.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_026',
'easy',
'if one particle is added far to the right, system COM generally shifts?',
'left',
'right',
'not at all',
'only vertically',
'B',
'The weighted average shifts toward the added mass.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_027',
'easy',
'COM of two masses is at midpoint only when?',
'masses are equal',
'speeds equal',
'momenta equal',
'both at rest',
'A',
'The midpoint is the weighted average only for equal masses.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_028',
'easy',
'if total mass doubles while same external force acts, a_cm becomes?',
'double',
'half',
'same',
'four times',
'B',
'a_cm=F_ext/M.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_029',
'easy',
'which forces determine acceleration of COM?',
'only internal',
'only resultant external',
'friction never',
'gravity never',
'B',
'The resultant external force determines COM acceleration.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_JEE_PHYSICS_CENTER_OF_MASS_030',
'easy',
'COM coordinates are weighted averages using weights?',
'speeds',
'accelerations',
'masses',
'forces',
'C',
'Each position is weighted by particle mass.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_001',
'easy',
'two masses 2 kg and 3 kg at x=0 and x=10 m. COM x?',
'4 m',
'5 m',
'6 m',
'8 m',
'C',
'x_cm=(2·0+3·10)/5=6 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_002',
'easy',
'equal masses at x=-4 m and x=6 m. COM x?',
'-1 m',
'1 m',
'2 m',
'5 m',
'B',
'For equal masses, COM is midpoint: 1 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_003',
'easy',
'1 kg at x=2 m and 4 kg at x=7 m. COM x?',
'5 m',
'6 m',
'6.5 m',
'7 m',
'B',
'x_cm=(2+28)/5=6 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_004',
'easy',
'COM of a uniform rod of length L lies at?',
'an end',
'L/4 from an end',
'L/2 from an end',
'depends on mass',
'C',
'Uniform rod COM is its geometric midpoint.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_005',
'easy',
'if all particles translate by vector a, COM translates by?',
'0',
'a',
'2a',
'a/2',
'B',
'COM shifts by the same translation vector.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_006',
'easy',
'net external force on system equals?',
'M a_cm',
'M v_cm',
'zero always',
'internal force sum',
'A',
'F_ext=M a_cm.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_007',
'medium',
'with zero net external force, COM velocity is?',
'always zero',
'constant',
'increasing',
'undefined',
'B',
'Zero external force implies constant total momentum and COM velocity.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_008',
'easy',
'two equal masses move with velocities +v and -v. COM velocity?',
'+v',
'-v',
'0',
'2v',
'C',
'Total momentum is zero, so V_cm=0.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_009',
'medium',
'2 kg moves 3 m/s right; 1 kg moves 6 m/s left. V_cm?',
'0',
'1 m/s right',
'3 m/s right',
'3 m/s left',
'A',
'Total momentum=6-6=0.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_010',
'medium',
'explosion of isolated body: motion of COM is governed by?',
'internal forces',
'external force',
'largest fragment',
'explosion energy',
'B',
'Internal forces cannot change total momentum; COM responds to external force.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_011',
'easy',
'COM of a uniform circular ring is at?',
'on circumference',
'center',
'half radius',
'depends on radius',
'B',
'By symmetry the COM is at the center.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_012',
'easy',
'COM of uniform disc is at?',
'center',
'rim',
'R/2 from center',
'R/3 from center',
'A',
'By symmetry it is at the center.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_013',
'medium',
'for masses m and 2m separated by 9 m, COM from m is?',
'3 m',
'4.5 m',
'6 m',
'9 m',
'C',
'x_cm=(2m·9)/(3m)=6 m.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_014',
'easy',
'COM lies closer to?',
'smaller mass',
'larger mass',
'always midpoint',
'origin',
'B',
'The weighted average lies closer to the larger mass.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_015',
'easy',
'if mass distribution is symmetric about a point, COM?',
'must be at that point',
'must be outside',
'is undefined',
'depends only on total mass',
'A',
'Symmetry places COM at the symmetry point.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_016',
'easy',
'system momentum P and total mass M give V_cm=?',
'PM',
'P/M',
'M/P',
'P²/M',
'B',
'P=M V_cm.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_017',
'easy',
'if external impulse J acts on system, change in total momentum?',
'J',
'J/M',
'MJ',
'0',
'A',
'Impulse equals change in total momentum.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_018',
'easy',
'two particles 1 kg at (0,0), 3 kg at (4,0). x_cm?',
'1',
'2',
'3',
'4',
'C',
'x_cm=(0+12)/4=3.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_019',
'medium',
'masses 1,1,2 kg at x=0,2,5. x_cm?',
'2',
'3',
'3.5',
'4',
'B',
'x_cm=(0+2+10)/4=3.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_020',
'easy',
'COM acceleration if F_ext=20 N and M=5 kg?',
'2 m/s²',
'4 m/s²',
'5 m/s²',
'100 m/s²',
'B',
'a_cm=F_ext/M=4 m/s².',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_021',
'medium',
'internal forces can change total momentum of an isolated system?',
'yes always',
'only if unequal',
'no',
'only during collision',
'C',
'Internal forces cancel in the total momentum balance.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_022',
'medium',
'person walks right inside stationary boat on still water; system COM horizontally?',
'moves right',
'moves left',
'remains fixed if no external horizontal force',
'accelerates upward',
'C',
'With negligible external horizontal force, horizontal COM remains fixed.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_023',
'medium',
'projectile explodes in flight neglecting air resistance. COM follows?',
'vertical line',
'original projectile trajectory',
'largest fragment',
'random path',
'B',
'Gravity is unchanged external force, so COM follows the original trajectory.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_024',
'medium',
'uniform semicircular wire COM lies?',
'at circle center',
'on symmetry axis',
'on arc endpoint',
'outside symmetry axis',
'B',
'Symmetry requires the COM to lie on the symmetry axis.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_NEET_PHYSICS_CENTER_OF_MASS_025',
'medium',
'for continuous body, COM position uses?',
'∫r dm / M',
'∫r dt',
'M/∫r dm',
'∫F dm',
'A',
'Continuous mass distribution uses r_cm=(1/M)∫r dm.',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND st.subtopic_code='CENTER_OF_MASS_CORE';


SELECT s.grade_code, s.subject_code, t.topic_code, COUNT(q.id) AS active_questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE q.active=1 AND (
 (s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STRAIGHT_LINES')
 OR (s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CENTER_OF_MASS')
 OR (s.grade_code='PROGRAM_NEET' AND s.subject_code='PHYSICS' AND t.topic_code='CENTER_OF_MASS')
)
GROUP BY s.grade_code,s.subject_code,t.topic_code
ORDER BY s.grade_code,s.subject_code;
