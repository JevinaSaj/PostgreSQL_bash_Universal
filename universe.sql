+--------+----------------------+----------+--------------+
(9 rows)

universe=> ALTER TABLE hello ADD COLUMN hello_id INT;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN number3 INT;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN number4 INT;
ALTER TABLE
universe=> INSERT INTO hello(hello_id, number3, number4) VALUES(1,26,27), (2,28,29), (3,30,31);
INSERT 0 3
universe=> SELECT * FROM galaxy;
+-----------+------+---------+---------+
| galaxy_id | name | number1 | number2 |
+-----------+------+---------+---------+
|         1 | a    |      11 |      12 |
|         2 | b    |      13 |      14 |
|         3 | c    |      15 |      16 |
+-----------+------+---------+---------+
(3 rows)

universe=> INSERT INTO galaxy(galaxy_id,name,number1,number2) VALUES(4,'d',17,18), (5,'e',19,20), (6,'f',21,22);
INSERT 0 3
universe=> INSERT INTO star(star_id, name, numeric, galaxy_id) VALUES(4,'y',15.9,4), (5,'t',16.5,5), (6,'fo',13.5,6);
INSERT 0 3
universe=> ALTER TABLE hello ADD COLUMN name VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE hello ADD PRIMARY KEY(hello_id);
ALTER TABLE
universe=> SELECT * FROM planet;
+-----------+------+------+---------+
| planet_id | name | text | star_id |
+-----------+------+------+---------+
|         1 | g    | 20.5 |       1 |
|         2 | h    | 21.5 |       2 |
|         3 | i    | 22.5 |       3 |
+-----------+------+------+---------+
(3 rows)

universe=> INSERT INTO planet(planet_id, name, text, star_id) VALUES(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6), (4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),;
ERROR:  syntax error at or near ";"
LINE 1: ...,72.5,6),(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),;
                                                                      ^
universe=> INSERT INTO planet(planet_id, name, text, star_id) VALUES(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6), (4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6);
ERROR:  duplicate key value violates unique constraint "planet_pkey"
DETAIL:  Key (planet_id)=(4) already exists.
universe=> INSERT INTO planet(planet_id, name, text, star_id) VALUES(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6), (7,'go',20.7,4), (8,'ho',51.5,5),
 (9,'io',72.5,6),(10,'go',20.7,4), (11,'ho',51.5,5), (12,'io',72.5,6);
INSERT 0 9
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(1,'j','TRUE',1), (2,'k','FALSE',2), (3,'l','TRUE',3);
ERROR:  duplicate key value violates unique constraint "moon_pkey"
DETAIL:  Key (moon_id)=(1) already exists.
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(4,'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3)(7,'j','TRUE',1), (8,'k','FALS
E',12), (9,'l','TRUE',4), (10,'j','TRUE',5), (11,'k','FALSE',6), (12,'l','TRUE',7), (13,'j','TRUE',8), (14,'k','FALSE',9), (15,'l','TRUE',10), (16,'j','
TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3)(19,'j','TRUE',1), (20,'k','FALSE',2);
ERROR:  syntax error at or near "("
LINE 1: ...'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3)(7,'j','TR...
                                                             ^
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(4,'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3), (7,'j','TRUE',1), (8,'k','FA
LSE',12), (9,'l','TRUE',4), (10,'j','TRUE',5), (11,'k','FALSE',6), (12,'l','TRUE',7), (13,'j','TRUE',8), (14,'k','FALSE',9), (15,'l','TRUE',10), (16,'j'
,'TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3)(19,'j','TRUE',1), (20,'k','FALSE',2);
ERROR:  syntax error at or near "("
LINE 1: ...,'TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3)(19,'j','T...
                                                             ^
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(4,'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3), (7,'j','TRUE',1), (8,'k','FALSE',12), (9,'l','TRUE',4), (10,'j','TRUE',5), (11,'k','FALSE',6), (12,'l','TRUE',7), (13,'j','TRUE',8), (14,'k','FALSE',9), (15,'l','TRUE',10), (16,'j','TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3), (19,'j','TRUE',1), (20,'k','FALSE',2);
INSERT 0 17
universe=> ALTER TABLE galaxy ADD COLUMN number7 INT NOT NULL UNIQUE;
ERROR:  column "number7" contains null values
universe=> ALTER TABLE galaxy ADD COLUMN number11 INT NOT NULL UNIQUE;
ERROR:  column "number11" contains null values
universe=> ALTER TABLE galaxy ADD COLUMN num1 INT NOT NULL UNIQUE;
ERROR:  column "num1" contains null values
universe=> ALTER TABLE galaxy ADD COLUMN num1 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN num2 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN num3 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN num4 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN num5 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN num6 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN num7 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN num8 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN num9 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN num10 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> SELECT * FROM planet;
+-----------+------+------+---------+------+------+
| planet_id | name | text | star_id | num5 | num6 |
+-----------+------+------+---------+------+------+
|         1 | g    | 20.5 |       1 |    1 |    1 |
|         2 | h    | 21.5 |       2 |    2 |    2 |
|         3 | i    | 22.5 |       3 |    3 |    3 |
|         4 | go   | 20.7 |       4 |    4 |    4 |
|         5 | ho   | 51.5 |       5 |    5 |    5 |
|         6 | io   | 72.5 |       6 |    6 |    6 |
|         7 | go   | 20.7 |       4 |    7 |    7 |
|         8 | ho   | 51.5 |       5 |    8 |    8 |
|         9 | io   | 72.5 |       6 |    9 |    9 |
|        10 | go   | 20.7 |       4 |   10 |   10 |
|        11 | ho   | 51.5 |       5 |   11 |   11 |
|        12 | io   | 72.5 |       6 |   12 |   12 |
+-----------+------+------+---------+------+------+
(12 rows)

universe=> +--------+----------------------+----------+--------------+
(9 rows)

universe=> ALTER TABLE hello ADD COLUMN hello_id INT;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN number3 INT;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN number4 INT;
ALTER TABLE
universe=> INSERT INTO hello(hello_id, number3, number4) VALUES(1,26,27), (2,28,29), (3,30,31);
INSERT 0 3
universe=> SELECT * FROM galaxy;
+-----------+------+---------+---------+
| galaxy_id | name | number1 | number2 |
+-----------+------+---------+---------+
|         1 | a    |      11 |      12 |
|         2 | b    |      13 |      14 |
|         3 | c    |      15 |      16 |
+-----------+------+---------+---------+
(3 rows)

universe=> INSERT INTO galaxy(galaxy_id,name,number1,number2) VALUES(4,'d',17,18), (5,'e',19,20), (6,'f',21,22);
INSERT 0 3
universe=> INSERT INTO star(star_id, name, numeric, galaxy_id) VALUES(4,'y',15.9,4), (5,'t',16.5,5), (6,'fo',13.5,6);
INSERT 0 3
universe=> ALTER TABLE hello ADD COLUMN name VARCHAR(30);
ALTER TABLE
universe=> ALTER TABLE hello ADD PRIMARY KEY(hello_id);
ALTER TABLE
universe=> SELECT * FROM planet;
+-----------+------+------+---------+
| planet_id | name | text | star_id |
+-----------+------+------+---------+
|         1 | g    | 20.5 |       1 |
|         2 | h    | 21.5 |       2 |
|         3 | i    | 22.5 |       3 |
+-----------+------+------+---------+
(3 rows)

universe=> INSERT INTO planet(planet_id, name, text, star_id) VALUES(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6), (4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),;
ERROR:  syntax error at or near ";"
LINE 1: ...,72.5,6),(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),;
                                                                      ^
universe=> INSERT INTO planet(planet_id, name, text, star_id) VALUES(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6), (4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6),(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6);
ERROR:  duplicate key value violates unique constraint "planet_pkey"
DETAIL:  Key (planet_id)=(4) already exists.
universe=> INSERT INTO planet(planet_id, name, text, star_id) VALUES(4,'go',20.7,4), (5,'ho',51.5,5), (6,'io',72.5,6), (7,'go',20.7,4), (8,'ho',51.5,5),
 (9,'io',72.5,6),(10,'go',20.7,4), (11,'ho',51.5,5), (12,'io',72.5,6);
INSERT 0 9
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(1,'j','TRUE',1), (2,'k','FALSE',2), (3,'l','TRUE',3);
ERROR:  duplicate key value violates unique constraint "moon_pkey"
DETAIL:  Key (moon_id)=(1) already exists.
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(4,'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3)(7,'j','TRUE',1), (8,'k','FALS
E',12), (9,'l','TRUE',4), (10,'j','TRUE',5), (11,'k','FALSE',6), (12,'l','TRUE',7), (13,'j','TRUE',8), (14,'k','FALSE',9), (15,'l','TRUE',10), (16,'j','
TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3)(19,'j','TRUE',1), (20,'k','FALSE',2);
ERROR:  syntax error at or near "("
LINE 1: ...'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3)(7,'j','TR...
                                                             ^
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(4,'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3), (7,'j','TRUE',1), (8,'k','FA
LSE',12), (9,'l','TRUE',4), (10,'j','TRUE',5), (11,'k','FALSE',6), (12,'l','TRUE',7), (13,'j','TRUE',8), (14,'k','FALSE',9), (15,'l','TRUE',10), (16,'j'
,'TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3)(19,'j','TRUE',1), (20,'k','FALSE',2);
ERROR:  syntax error at or near "("
LINE 1: ...,'TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3)(19,'j','T...
                                                             ^
universe=> INSERT INTO moon(moon_id, name, boolean, planet_id) VALUES(4,'j','TRUE',1), (5,'k','FALSE',2), (6,'l','TRUE',3), (7,'j','TRUE',1), (8,'k','FALSE',12), (9,'l','TRUE',4), (10,'j','TRUE',5), (11,'k','FALSE',6), (12,'l','TRUE',7), (13,'j','TRUE',8), (14,'k','FALSE',9), (15,'l','TRUE',10), (16,'j','TRUE',11), (17,'k','FALSE',2), (18,'l','TRUE',3), (19,'j','TRUE',1), (20,'k','FALSE',2);
INSERT 0 17
universe=> ALTER TABLE galaxy ADD COLUMN number7 INT NOT NULL UNIQUE;
ERROR:  column "number7" contains null values
universe=> ALTER TABLE galaxy ADD COLUMN number11 INT NOT NULL UNIQUE;
ERROR:  column "number11" contains null values
universe=> ALTER TABLE galaxy ADD COLUMN num1 INT NOT NULL UNIQUE;
ERROR:  column "num1" contains null values
universe=> ALTER TABLE galaxy ADD COLUMN num1 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN num2 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN num3 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN num4 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN num5 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN num6 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN num7 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN num8 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN num9 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> ALTER TABLE hello ADD COLUMN num10 SERIAL NOT NULL UNIQUE;
ALTER TABLE
universe=> SELECT * FROM planet;
+-----------+------+------+---------+------+------+
| planet_id | name | text | star_id | num5 | num6 |
+-----------+------+------+---------+------+------+
|         1 | g    | 20.5 |       1 |    1 |    1 |
|         2 | h    | 21.5 |       2 |    2 |    2 |
|         3 | i    | 22.5 |       3 |    3 |    3 |
|         4 | go   | 20.7 |       4 |    4 |    4 |
|         5 | ho   | 51.5 |       5 |    5 |    5 |
|         6 | io   | 72.5 |       6 |    6 |    6 |
|         7 | go   | 20.7 |       4 |    7 |    7 |
|         8 | ho   | 51.5 |       5 |    8 |    8 |
|         9 | io   | 72.5 |       6 |    9 |    9 |
|        10 | go   | 20.7 |       4 |   10 |   10 |
|        11 | ho   | 51.5 |       5 |   11 |   11 |
|        12 | io   | 72.5 |       6 |   12 |   12 |
+-----------+------+------+---------+------+------+
(12 rows)
