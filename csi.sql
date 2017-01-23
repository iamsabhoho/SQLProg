DROP SCHEMA IF EXISTS CSI;
CREATE SCHEMA CSI;
USE CSI;

CREATE TABLE lab (
  lab_id   SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  lab_name VARCHAR(45)       NOT NULL,
  lab_desc TEXT              NOT NULL,
  PRIMARY KEY (lab_id),
  KEY idx_actor_last_name (lab_name)
);


CREATE TABLE employees (
  emp_id    SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  emp_name  VARCHAR(45)       NOT NULL,
  email     VARCHAR(100)      NOT NULL,
  phone_num INTEGER           NOT NULL,
  title     VARCHAR(45)       NOT NULL,
  salary    INTEGER           NOT NULL,
  lab_id    SMALLINT          NOT NULL,
  PRIMARY KEY (emp_id)
);


CREATE TABLE customers (
  cus_id   SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  cus_name VARCHAR(25)       NOT NULL,

  PRIMARY KEY (cus_id)
);

CREATE TABLE orders (
  order_id   SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  cus_id     SMALLINT          NOT NULL,
  order_date DATE              NOT NULL,
  order_desc TEXT              NOT NULL,
  PRIMARY KEY (order_id)
);

CREATE TABLE robots (
  robot_id   SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  job_desc   TEXT              NOT NULL,
  start_date DATE              NOT NULL,
  lab_id     SMALLINT          NOT NULL,

  PRIMARY KEY (robot_id)
);

CREATE TABLE works (
  lab_id SMALLINT UNSIGNED NOT NULL,
  emp_id SMALLINT UNSIGNED NOT NULL,

  PRIMARY KEY (lab_id, emp_id)
);

CREATE TABLE own (
  lab_id   SMALLINT UNSIGNED NOT NULL,
  robot_id SMALLINT UNSIGNED NOT NULL,

  PRIMARY KEY (lab_id, robot_id)
);

CREATE TABLE ordered (
  cus_id   SMALLINT UNSIGNED NOT NULL,
  order_id SMALLINT UNSIGNED NOT NULL

    PRIMARY KEY (cus_id, order_id)
);

SET AUTOCOMMIT = 0;
INSERT INTO works VALUES
  (40, 50),
  (41, 51),
  (47, 52),
  (42, 53),
  (43, 54),
  (46, 55),
  (44, 56),
  (43, 57),
  (44, 58),
  (45, 59);
COMMIT;

SET AUTOCOMMIT = 0;
INSERT INTO own VALUES
  (41, 71),
  (47, 72),
  (46, 73),
  (47, 74),
  (43, 75);
COMMIT;

SET AUTOCOMMIT = 0;
INSERT INTO ordered VALUES
  (34, 900),
  (35, 901),
  (32, 902),
  (39, 903),
  (31, 904),
  (33, 905),
  (34, 906),
  (32, 907),
  (38, 908),
  (30, 909),
  (37, 910),
  (31, 911),
  (36, 912),
  (36, 913),
  (39, 914),
  (35, 915),
  (34, 916),
  (37, 917),
  (33, 918),
  (30, 919);
COMMIT;

#data
SET AUTOCOMMIT = 0;
INSERT INTO lab VALUES (41, 'Police', 'Getting suspects back to the department'),
  (42, 'Chemistry', 'Exam and analyze chemical evidence collected from the crime scene'),
  (43, 'Biology', 'Exam and analyze biological evidence'),
  (44, 'Physics', 'Exam and analyze physical evidence'),
  (45, 'Gun Fire', 'Exam and analyze bullets and guns'),
  (46, 'Medical Exam', 'Perform autopsy on bodies and analyze them'),
  (47, 'Computer', 'Exam and analyze digital or any computer related evidence'),
  (40, 'CSI', 'In charge of all the other labs on their cases');
COMMIT;

SET AUTOCOMMIT = 0;
INSERT INTO employees VALUES
  (50, 'Sabrina Ho', 'sabrinaho@csi.org', 0919421107, 'CEO', 9999999, 40),
  (51, 'Donald Flack', 'donaldflack@csi.org', 0987103520, 'Detective', 123456, 41),
  (52, 'Danny Messer', 'dannymesser@csi.org', 0919083072, 'ComputerProgrammer', 732599, 47),
  (53, 'Greg Sanders', 'gregsanders@csi.org', 0919538871, 'Chemist', 452367, 42),
  (54, 'Nick Stokes', 'nickstokes@csi.org', 0988889100, 'Biologist', 452367, 43),
  (55, 'Sheldon Hawkes', 'sheldonhawkes@csi.org', 0934015723, 'Doctor', 790456, 46),
  (56, 'Sara Sidle', 'sarasidle@csi.org', 0915672305, 'Physician', 552338, 44),
  (57, 'Catherine Willows', 'catherinewillows@csi.org', 0972990239, 'BioHead', 769012, 43),
  (58, 'Horatio Caine', 'horatiocaine@csi.org', 0955099135, 'PhysicHead', 778901, 44),
  (59, 'Calleigh Duquesne', 'calleighduquesne@csi.org', 0988669722, 'GunFireHead', 789012, 45);
COMMIT;

SET AUTOCOMMIT = 0;
INSERT INTO customers VALUES
  (30, 'Dominic Toretto'),
  (31, 'Letty'),
  (32, 'Roman Pearce'),
  (33, 'Tej'),
  (34, 'Brian OConner'),
  (35, 'Elena Neves'),
  (36, 'Luke Hobbs'),
  (37, 'Mia Toretto'),
  (38, 'Gisele Yashar'),
  (39, 'Han');
COMMIT;

SET AUTOCOMMIT = 0;
INSERT INTO orders VALUES
  (900, 34, '2015-10-26', 'Miniature Killer'),
  (901, 35, '2015-05-23', 'Killer always leave message to victims relating to 333'),
  (902, 32, '2015-01-17', 'Related to a gangster called Zata'),
  (903, 39, '2016-12-15', 'A wedding and a funeral'),
  (904, 31, '2016-08-09', 'Taxi Driver kill random customers'),
  (905, 33, '2014-05-02', 'A killer looking for someone named Mac Taylor'),
  (906, 34, '2016-04-18', 'Woman who introduced men to other girls got killed'),
  (907, 32, '2015-09-27', 'A man died in the space and his body got threw out of a helicopter'),
  (908, 38, '2014-11-05', 'A doctor stole human organ a sold them to the black market, and always
  leave a special signature before dumbing bodies'),
  (909, 30, '2016-02-28', 'A bunch of local college students beat up random tourist'),

  (910, 37, '2014-07-07', 'Six girls were murdered in their own apartment by one of their boyfriend'),
  (911, 31, '2015-10-09',
   'A body was found without any blood left and there was two holes on his neck. The killer thinks he is a vampire.'),
  (912, 36, '2015-11-23',
   'A girl from one of the pimp escaped from him because she thinks it is a wrong idea to work as a prostitute and the other girl killed her'),
  (913, 36, '2014-03-21',
   'A girl was found alive but her throat was being cut. Later on, the CSI found out it was her dad who did this to the girl.'),
  (914, 39, '2014-04-20', 'One of the CSI was to process the crime scene, but when he arrived, he became the hostage.'),
  (915, 35, '2016-12-15',
   'Pieces of a girl was found in different places in the city. She was cut out when she was alive'),
  (916, 34, '2016-09-19', 'A dead body was found in the CSI department, but she is not part of the lab.'),
  (917, 37, '2016-06-24',
   'A 10 years old kid pulled trigger and killed the taxman because he took everything away from his family '),
  (918, 33, '2015-05-10', 'A group of criminals killed people from Les Vegas to Miami, and to New York'),
  (919, 30, '2016-01-02', 'Criminal who kidnapped one of the CSI and wanted her to cover up a murder');
COMMIT;

SET AUTOCOMMIT = 0;
INSERT INTO robots VALUES (71, 'Collect and process all the fingerprints in the crime scene', '2015-11-15', 41),
  (72, 'Construct 360 visualize image by using different photos of angel of a place', '2015-11-15', 47),
  (73, 'Construct a 3D autopsy', '2015-11-15', 46),
  (74, 'God eyes: locating the exact location of the criminals', '2015-11-15', 47),
  (75, 'It is a room of samples that can be used to compare evidence and samples to identify the unknown substance',
   '2015-11-15', 43);
COMMIT;

#simple Queries
#1
SELECT *
FROM employees
WHERE emp_name = 'Danny Messer';
SELECT *
FROM employees;

#2
SELECT emp_name
FROM employees
WHERE phone_num LIKE '%8888%';
SELECT
  emp_name,
  phone_num
FROM employees;

#3
SELECT order_id
FROM orders
WHERE order_desc LIKE '%throat%cut%';
SELECT *
FROM orders;

#4
SELECT robot_id
FROM robots
WHERE job_desc LIKE '%3D%autopsy%';
SELECT *
FROM robots;

#5
SELECT cus_name
FROM customers
WHERE cus_name LIKE '%Toretto%';
SELECT *
FROM customers;

#complex Queries
#1
SELECT
  cus_name,
  order_id
FROM orders
  INNER JOIN customers USING (cus_id)
WHERE cus_id = 33;
SELECT
  cus_name,
  order_id
FROM orders
  INNER JOIN customers USING (cus_id);

#2
(SELECT
   emp_name,
   salary
 FROM employees
 GROUP BY emp_id
 ORDER BY salary DESC
 LIMIT 3)
UNION
(SELECT
   emp_name,
   salary
 FROM employees
 GROUP BY emp_id
 ORDER BY salary
 LIMIT 3);

SELECT
  emp_name,
  salary
FROM employees
ORDER BY salary DESC;

#3
SELECT
  count(*),
  order_date
FROM orders
GROUP BY order_date DESC
LIMIT 1;
SELECT
  count(*),
  order_date
FROM orders
GROUP BY order_date;

#4
SELECT
  order_id,
  cus_name,
  order_date
FROM orders
  INNER JOIN customers USING (cus_id)
GROUP BY order_date
LIMIT 1;
SELECT
  order_id,
  cus_name,
  order_date
FROM orders
  INNER JOIN customers USING (cus_id);

#5
SELECT
  robot_id,
  emp_name
FROM robots
  INNER JOIN lab USING (lab_id)
  INNER JOIN employees USING (lab_id)
WHERE job_desc LIKE '%fingerprints%';
SELECT
  robot_id,
  emp_name
FROM robots
  INNER JOIN lab USING (lab_id)
  INNER JOIN employees USING (lab_id);