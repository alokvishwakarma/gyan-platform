-- GENERATED ORIGINAL PRACTICE BANK
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_subjects
(country_code, grade_code, subject_code, subject_name, enabled, sort_order)
VALUES ('US','PROGRAM_SAT','RW','SAT Reading & Writing',1,10);

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id,'RW','Reading & Writing',1,10
FROM education_subjects
WHERE country_code='US' AND grade_code='PROGRAM_SAT' AND subject_code='RW';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'GRAMMAR','Grammar',1,10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='RW'
  AND t.topic_code='RW';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'TRANSITIONS','Transitions',1,20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='RW'
  AND t.topic_code='RW';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'RHETORIC','Rhetorical Reasoning',1,30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='RW'
  AND t.topic_code='RW';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'VOCAB','Words in Context',1,40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='RW'
  AND t.topic_code='RW';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0001',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0002',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0003',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0004',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0005',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0006',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0007',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0008',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0009',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0010',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0011',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0012',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0013',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0014',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0015',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0016',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0017',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0018',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0019',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0020',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0021',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0022',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0023',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0024',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0025',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0026',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0027',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0028',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0029',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0030',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0031',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0032',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0033',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0034',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0035',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0036',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0037',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0038',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0039',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0040',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0041',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0042',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0043',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0044',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0045',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0046',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0047',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0048',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0049',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0050',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0051',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0052',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0053',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0054',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0055',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0056',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0057',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0058',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0059',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0060',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0061',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0062',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0063',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0064',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0065',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0066',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0067',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0068',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0069',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0070',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0071',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0072',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0073',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0074',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0075',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0076',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0077',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0078',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0079',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0080',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0081',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0082',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0083',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0084',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0085',
'easy',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0086',
'easy',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0087',
'easy',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0088',
'easy',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0089',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0090',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0091',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0092',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0093',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0094',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0095',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0096',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0097',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0098',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0099',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0100',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0101',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0102',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0103',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0104',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0105',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0106',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0107',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0108',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0109',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0110',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0111',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0112',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0113',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0114',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0115',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0116',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0117',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0118',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0119',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0120',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0121',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0122',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0123',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0124',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0125',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0126',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0127',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0128',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0129',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0130',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0131',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0132',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0133',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0134',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0135',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0136',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0137',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0138',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0139',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0140',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0141',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0142',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0143',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0144',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0145',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0146',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0147',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0148',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0149',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0150',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0151',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0152',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0153',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0154',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0155',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0156',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0157',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0158',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0159',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0160',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0161',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0162',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0163',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0164',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0165',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0166',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0167',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0168',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0169',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0170',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0171',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0172',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0173',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0174',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0175',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0176',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0177',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0178',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0179',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0180',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0181',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0182',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0183',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0184',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0185',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0186',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0187',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0188',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0189',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0190',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0191',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0192',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0193',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0194',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0195',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0196',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0197',
'medium',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0198',
'medium',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0199',
'medium',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0200',
'medium',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0201',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0202',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0203',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0204',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0205',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0206',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0207',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0208',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0209',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0210',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0211',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0212',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0213',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0214',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0215',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0216',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0217',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0218',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0219',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0220',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0221',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0222',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0223',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0224',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0225',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0226',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0227',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0228',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0229',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0230',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0231',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0232',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0233',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0234',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0235',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0236',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0237',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0238',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0239',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0240',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0241',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0242',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0243',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0244',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0245',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0246',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0247',
'challenge',
'The results of the experiment ___ consistent.',
'was',
'be',
'are',
'is',
'C',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0248',
'challenge',
'Each of the books ___ a different perspective.',
'have offered',
'offers',
'offer',
'offering',
'B',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0249',
'challenge',
'The committee, along with its advisers, ___ meeting today.',
'is',
'are',
'were',
'be',
'A',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_GRAMMAR_0250',
'challenge',
'Neither the coach nor the players ___ ready.',
'is',
'was',
'be',
'are',
'D',
'Choose the verb that agrees with the grammatical subject.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='GRAMMAR';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0001',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0002',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0003',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0004',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0005',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0006',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0007',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0008',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0009',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0010',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0011',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0012',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0013',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0014',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0015',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0016',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0017',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0018',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0019',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0020',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0021',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0022',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0023',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0024',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0025',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0026',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0027',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0028',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0029',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0030',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0031',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0032',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0033',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0034',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0035',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0036',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0037',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0038',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0039',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0040',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0041',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0042',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0043',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0044',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0045',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0046',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0047',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0048',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0049',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0050',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0051',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0052',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0053',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0054',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0055',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0056',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0057',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0058',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0059',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0060',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0061',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0062',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0063',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0064',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0065',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0066',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0067',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0068',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0069',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0070',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0071',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0072',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0073',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0074',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0075',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0076',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0077',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0078',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0079',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0080',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0081',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0082',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0083',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0084',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0085',
'easy',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0086',
'easy',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0087',
'easy',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0088',
'easy',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0089',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0090',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0091',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0092',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0093',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0094',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0095',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0096',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0097',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0098',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0099',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0100',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0101',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0102',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0103',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0104',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0105',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0106',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0107',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0108',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0109',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0110',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0111',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0112',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0113',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0114',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0115',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0116',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0117',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0118',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0119',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0120',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0121',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0122',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0123',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0124',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0125',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0126',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0127',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0128',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0129',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0130',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0131',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0132',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0133',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0134',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0135',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0136',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0137',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0138',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0139',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0140',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0141',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0142',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0143',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0144',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0145',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0146',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0147',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0148',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0149',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0150',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0151',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0152',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0153',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0154',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0155',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0156',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0157',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0158',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0159',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0160',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0161',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0162',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0163',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0164',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0165',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0166',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0167',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0168',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0169',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0170',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0171',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0172',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0173',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0174',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0175',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0176',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0177',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0178',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0179',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0180',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0181',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0182',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0183',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0184',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0185',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0186',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0187',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0188',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0189',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0190',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0191',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0192',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0193',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0194',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0195',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0196',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0197',
'medium',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0198',
'medium',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0199',
'medium',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0200',
'medium',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0201',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0202',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0203',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0204',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0205',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0206',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0207',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0208',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0209',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0210',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0211',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0212',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0213',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0214',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0215',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0216',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0217',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0218',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0219',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0220',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0221',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0222',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0223',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0224',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0225',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0226',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0227',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0228',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0229',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0230',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0231',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0232',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0233',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0234',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0235',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0236',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0237',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0238',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0239',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0240',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0241',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0242',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0243',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0244',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0245',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0246',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0247',
'challenge',
'The city expanded bus service. ___, ridership increased.',
'For example',
'Meanwhile',
'As a result',
'In contrast',
'C',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0248',
'challenge',
'Some insects are active by day. ___, many moths are active at night.',
'Similarly',
'By contrast',
'Therefore',
'For example',
'B',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0249',
'challenge',
'The first trial failed. ___, the team revised the design.',
'Therefore',
'For example',
'Meanwhile',
'Similarly',
'A',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_TRANSITIONS_0250',
'challenge',
'The methods use different materials. ___, both reduce waste.',
'Therefore',
'For instance',
'Likewise',
'However',
'D',
'Choose the transition matching the logical relationship.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='TRANSITIONS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0001',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0002',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0003',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0004',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0005',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0006',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0007',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0008',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0009',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0010',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0011',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0012',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0013',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0014',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0015',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0016',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0017',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0018',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0019',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0020',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0021',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0022',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0023',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0024',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0025',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0026',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0027',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0028',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0029',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0030',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0031',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0032',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0033',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0034',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0035',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0036',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0037',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0038',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0039',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0040',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0041',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0042',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0043',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0044',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0045',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0046',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0047',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0048',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0049',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0050',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0051',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0052',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0053',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0054',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0055',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0056',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0057',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0058',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0059',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0060',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0061',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0062',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0063',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0064',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0065',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0066',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0067',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0068',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0069',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0070',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0071',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0072',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0073',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0074',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0075',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0076',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0077',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0078',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0079',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0080',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0081',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0082',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0083',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0084',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0085',
'easy',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0086',
'easy',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0087',
'easy',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0088',
'easy',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0089',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0090',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0091',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0092',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0093',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0094',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0095',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0096',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0097',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0098',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0099',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0100',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0101',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0102',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0103',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0104',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0105',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0106',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0107',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0108',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0109',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0110',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0111',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0112',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0113',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0114',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0115',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0116',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0117',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0118',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0119',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0120',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0121',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0122',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0123',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0124',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0125',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0126',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0127',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0128',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0129',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0130',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0131',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0132',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0133',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0134',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0135',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0136',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0137',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0138',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0139',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0140',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0141',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0142',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0143',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0144',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0145',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0146',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0147',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0148',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0149',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0150',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0151',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0152',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0153',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0154',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0155',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0156',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0157',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0158',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0159',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0160',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0161',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0162',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0163',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0164',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0165',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0166',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0167',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0168',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0169',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0170',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0171',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0172',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0173',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0174',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0175',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0176',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0177',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0178',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0179',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0180',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0181',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0182',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0183',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0184',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0185',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0186',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0187',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0188',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0189',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0190',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0191',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0192',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0193',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0194',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0195',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0196',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0197',
'medium',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0198',
'medium',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0199',
'medium',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0200',
'medium',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0201',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0202',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0203',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0204',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0205',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0206',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0207',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0208',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0209',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0210',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0211',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0212',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0213',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0214',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0215',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0216',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0217',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0218',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0219',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0220',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0221',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0222',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0223',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0224',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0225',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0226',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0227',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0228',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0229',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0230',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0231',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0232',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0233',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0234',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0235',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0236',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0237',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0238',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0239',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0240',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0241',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0242',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0243',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0244',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0245',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0246',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0247',
'challenge',
'The puppy was ____ to see its owner.',
'sleepy',
'angry',
'excited',
'bored',
'C',
'''excited'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0248',
'challenge',
'A scientist repeats an experiment to make results more ____.',
'brief',
'reliable',
'random',
'hidden',
'B',
'''reliable'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0249',
'challenge',
'The desert was so ____ that travelers carried extra water.',
'dry',
'crowded',
'noisy',
'soft',
'A',
'''dry'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_RHETORIC_0250',
'challenge',
'Mina checked her work carefully because she wanted to be ____.',
'careless',
'late',
'silent',
'accurate',
'D',
'''accurate'' best completes the sentence.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='RHETORIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0001',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0002',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0003',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0004',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0005',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0006',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0007',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0008',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0009',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0010',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0011',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0012',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0013',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0014',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0015',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0016',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0017',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0018',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0019',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0020',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0021',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0022',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0023',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0024',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0025',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0026',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0027',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0028',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0029',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0030',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0031',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0032',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0033',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0034',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0035',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0036',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0037',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0038',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0039',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0040',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0041',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0042',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0043',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0044',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0045',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0046',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0047',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0048',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0049',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0050',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0051',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0052',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0053',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0054',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0055',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0056',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0057',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0058',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0059',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0060',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0061',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0062',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0063',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0064',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0065',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0066',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0067',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0068',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0069',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0070',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0071',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0072',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0073',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0074',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0075',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0076',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0077',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0078',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0079',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0080',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0081',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0082',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0083',
'easy',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0084',
'easy',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0085',
'easy',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0086',
'easy',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0087',
'easy',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0088',
'easy',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0089',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0090',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0091',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0092',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0093',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0094',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0095',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0096',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0097',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0098',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0099',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0100',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0101',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0102',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0103',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0104',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0105',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0106',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0107',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0108',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0109',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0110',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0111',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0112',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0113',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0114',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0115',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0116',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0117',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0118',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0119',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0120',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0121',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0122',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0123',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0124',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0125',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0126',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0127',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0128',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0129',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0130',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0131',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0132',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0133',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0134',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0135',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0136',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0137',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0138',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0139',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0140',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0141',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0142',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0143',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0144',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0145',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0146',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0147',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0148',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0149',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0150',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0151',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0152',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0153',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0154',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0155',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0156',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0157',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0158',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0159',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0160',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0161',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0162',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0163',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0164',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0165',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0166',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0167',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0168',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0169',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0170',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0171',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0172',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0173',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0174',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0175',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0176',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0177',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0178',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0179',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0180',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0181',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0182',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0183',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0184',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0185',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0186',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0187',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0188',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0189',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0190',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0191',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0192',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0193',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0194',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0195',
'medium',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0196',
'medium',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0197',
'medium',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0198',
'medium',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0199',
'medium',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0200',
'medium',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0201',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0202',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0203',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0204',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0205',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0206',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0207',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0208',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0209',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0210',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0211',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0212',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0213',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0214',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0215',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0216',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0217',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0218',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0219',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0220',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0221',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0222',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0223',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0224',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0225',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0226',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0227',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0228',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0229',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0230',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0231',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0232',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0233',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0234',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0235',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0236',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0237',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0238',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0239',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'shrink',
'abundant',
'forbid',
'modern',
'C',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0240',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'abundant',
'defeat',
'modern',
'shrink',
'B',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0241',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'modern',
'shrink',
'abundant',
'sturdy',
'A',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0242',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'modern',
'abundant',
'sturdy',
'shrink',
'D',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0243',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'shrink',
'sturdy',
'abundant',
'modern',
'C',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0244',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'abundant',
'sturdy',
'modern',
'shrink',
'B',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0245',
'challenge',
'Which word is most nearly the opposite of ''permit''?',
'forbid',
'modern',
'shrink',
'abundant',
'A',
'''forbid'' is opposite in meaning to ''permit''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0246',
'challenge',
'Which word is most nearly the opposite of ''victory''?',
'modern',
'shrink',
'abundant',
'defeat',
'D',
'''defeat'' is opposite in meaning to ''victory''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0247',
'challenge',
'Which word is most nearly the opposite of ''ancient''?',
'abundant',
'sturdy',
'modern',
'shrink',
'C',
'''modern'' is opposite in meaning to ''ancient''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0248',
'challenge',
'Which word is most nearly the opposite of ''expand''?',
'sturdy',
'shrink',
'modern',
'abundant',
'B',
'''shrink'' is opposite in meaning to ''expand''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0249',
'challenge',
'Which word is most nearly the opposite of ''scarce''?',
'abundant',
'modern',
'shrink',
'sturdy',
'A',
'''abundant'' is opposite in meaning to ''scarce''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_RW_VOCAB_0250',
'challenge',
'Which word is most nearly the opposite of ''fragile''?',
'modern',
'shrink',
'abundant',
'sturdy',
'D',
'''sturdy'' is opposite in meaning to ''fragile''.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='RW'
  AND st.subtopic_code='VOCAB';

