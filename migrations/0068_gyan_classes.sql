CREATE TABLE IF NOT EXISTS class_teachers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  display_name TEXT NOT NULL,
  education TEXT NOT NULL DEFAULT '',
  experience TEXT NOT NULL DEFAULT '',
  level TEXT NOT NULL CHECK (level IN ('BRONZE','SILVER','GOLD')),
  active INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS class_offerings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category TEXT NOT NULL CHECK (category IN ('IIT-JEE','NEET')),
  subject TEXT NOT NULL,
  topic TEXT NOT NULL,
  teacher_id INTEGER NOT NULL,
  class_type TEXT NOT NULL CHECK (class_type IN ('DEMO','ACTUAL')),
  weekday INTEGER NOT NULL CHECK (weekday BETWEEN 1 AND 7),
  start_ist TEXT NOT NULL,
  duration_minutes INTEGER NOT NULL CHECK (duration_minutes IN (30,60)),
  program_start_date TEXT NOT NULL,
  program_end_date TEXT NOT NULL,
  active INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (teacher_id) REFERENCES class_teachers(id)
);

CREATE TABLE IF NOT EXISTS class_registrations (
  id TEXT PRIMARY KEY,
  offering_id INTEGER NOT NULL,
  occurrence_date TEXT NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'REGISTERED',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (offering_id) REFERENCES class_offerings(id)
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_class_registration_unique
ON class_registrations(offering_id, occurrence_date, lower(email));

INSERT INTO class_teachers(display_name,education,experience,level)
SELECT 'Dr. A. Sharma','M.Sc. Physics · IIT background','10+ years competitive-exam Physics','GOLD'
WHERE NOT EXISTS (SELECT 1 FROM class_teachers WHERE display_name='Dr. A. Sharma');

INSERT INTO class_teachers(display_name,education,experience,level)
SELECT 'Priya Mehta','M.Sc. Chemistry','7+ years teaching Chemistry','SILVER'
WHERE NOT EXISTS (SELECT 1 FROM class_teachers WHERE display_name='Priya Mehta');

INSERT INTO class_teachers(display_name,education,experience,level)
SELECT 'Rahul Verma','M.Sc. Mathematics','8+ years teaching JEE Mathematics','GOLD'
WHERE NOT EXISTS (SELECT 1 FROM class_teachers WHERE display_name='Rahul Verma');

INSERT INTO class_offerings(category,subject,topic,teacher_id,class_type,weekday,start_ist,duration_minutes,program_start_date,program_end_date)
SELECT 'IIT-JEE','Physics','Electrostatics',id,'ACTUAL',1,'20:30',60,'2026-09-01','2026-10-31'
FROM class_teachers WHERE display_name='Dr. A. Sharma'
AND NOT EXISTS (SELECT 1 FROM class_offerings WHERE category='IIT-JEE' AND subject='Physics' AND topic='Electrostatics');

INSERT INTO class_offerings(category,subject,topic,teacher_id,class_type,weekday,start_ist,duration_minutes,program_start_date,program_end_date)
SELECT 'IIT-JEE','Chemistry','Chemical Bonding',id,'ACTUAL',2,'21:30',30,'2026-09-01','2026-10-31'
FROM class_teachers WHERE display_name='Priya Mehta'
AND NOT EXISTS (SELECT 1 FROM class_offerings WHERE category='IIT-JEE' AND subject='Chemistry' AND topic='Chemical Bonding');

INSERT INTO class_offerings(category,subject,topic,teacher_id,class_type,weekday,start_ist,duration_minutes,program_start_date,program_end_date)
SELECT 'IIT-JEE','Mathematics','Functions & Graphs',id,'DEMO',3,'20:30',30,'2026-09-01','2026-10-31'
FROM class_teachers WHERE display_name='Rahul Verma'
AND NOT EXISTS (SELECT 1 FROM class_offerings WHERE category='IIT-JEE' AND subject='Mathematics' AND topic='Functions & Graphs');

INSERT INTO class_offerings(category,subject,topic,teacher_id,class_type,weekday,start_ist,duration_minutes,program_start_date,program_end_date)
SELECT 'NEET','Physics','Units, Dimensions & Vectors',id,'DEMO',1,'21:30',30,'2026-09-01','2026-10-31'
FROM class_teachers WHERE display_name='Dr. A. Sharma'
AND NOT EXISTS (SELECT 1 FROM class_offerings WHERE category='NEET' AND subject='Physics' AND topic='Units, Dimensions & Vectors');

INSERT INTO class_offerings(category,subject,topic,teacher_id,class_type,weekday,start_ist,duration_minutes,program_start_date,program_end_date)
SELECT 'NEET','Chemistry','Atomic Structure',id,'ACTUAL',4,'20:30',60,'2026-09-01','2026-10-31'
FROM class_teachers WHERE display_name='Priya Mehta'
AND NOT EXISTS (SELECT 1 FROM class_offerings WHERE category='NEET' AND subject='Chemistry' AND topic='Atomic Structure');
