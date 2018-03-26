
CREATE DATABASE adLister;

USE adLister;

CREATE TABLE users(
  ID INT UNSIGNED AUTO_INCREMENT,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);

SHOW tables;

CREATE TABLE ads(
  ID INT UNSIGNED AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL ,
  description TEXT,
  user_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (user_id) REFERENCES users(ID)
);

CREATE TABLE categories(
  ID INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE ad_categories(
  ad_id INT UNSIGNED NOT NULL,
  category_id INT UNSIGNED NOT NULL ,
  FOREIGN KEY (ad_id) REFERENCES ads(ID),
  FOREIGN KEY (category_id) REFERENCES categories(ID)
);

INSERT INTO users (email, password) VALUES
('johnny@gmail.com', 'mypassword'),
  ('something@aol.com','hispassword'),
  ('steven@codeup.com','someting');

INSERT INTO ads (title, description, user_id) VALUES
  ('Ford Mustang','Its in really good condition',1),
  ('Chevy Camaro', 'It is in terrible condition, do not buy it',2),
  ('Dodge Challenger','It is brand new, come get it',3),
  ('Toyota corolla','It will last forever',2);

INSERT INTO categories(name) VALUES
  ('New'),
  ('used'),
  ('japanese'),
  ('american'),
  ('cheap'),
  ('good first car');

INSERT INTO ad_categories (ad_id, category_id) VALUES
  (1,4),(1,2),(1,6),(2,4),(3,2),(3,1),(4,2),(4,5);



# QUERIES

# 1.)

select a.ID as AD_id,email
from ads as a
  JOIN users u
    ON a.user_id = u.ID
where a.ID =1;

# 2.)

SELECT ad_id,name as Category_name
from ad_categories as ac
JOIN categories c ON ac.category_id = c.ID
WHERE ac.ad_id = 1;

# 3.)

SELECT name,title, description,user_id
from categories c
  join ad_categories ac ON c.ID = ac.category_id
  join ads a ON ac.ad_id = a.ID
where c.ID =2 ;


# 4.)

SELECT u.ID,email,a.title, description
from users u
  JOIN ads a ON u.ID = a.user_id
where u.ID = 2;




SELECT * from users;
SELECT * from categories;
SELECT * from ads;
SELECT * from ad_categories;








## BONUS  ##############


CREATE DATABASE quiz;
USE quiz;

SHOW TABLES;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  is_Admin BOOLEAN NOT NULL ,
  PRIMARY KEY(id)
);
CREATE TABLE Quiz(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  created_by INT UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(created_by) REFERENCES users(id)
);
CREATE TABLE Questions(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  question TEXT,
  PRIMARY KEY(id)
);
CREATE TABLE Q_Q (
  quiz_id INT UNSIGNED NOT NULL,
  question_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(quiz_id) REFERENCES Quiz(id),
  FOREIGN KEY(question_id) REFERENCES Questions(id)
);

CREATE TABLE answers(
  id INT UNSIGNED AUTO_INCREMENT,
  question_id INT UNSIGNED NOT NULL ,
  description text NOT NULL ,
  answer VARCHAR(1) NOT NULL ,
  is_Correct BOOLEAN NOT NULL ,
  PRIMARY KEY (id),
  FOREIGN KEY (question_id) REFERENCES Questions(id)
);

CREATE TABLE Student_quiz(
  student_id INT UNSIGNED NOT NULL,
  quiz_id INT UNSIGNED NOT NULL,
  question_id INT UNSIGNED NOT NULL,
  student_answer VARCHAR(1) NOT NULL,
  FOREIGN KEY(student_id) REFERENCES users(id),
  FOREIGN KEY(quiz_id) REFERENCES Quiz(id),
  FOREIGN KEY(question_id) REFERENCES Questions(id)
);
INSERT INTO users (first_name, last_name,is_Admin) VALUES
  ('Albert', 'Einstein',TRUE ),
  ('Steve', 'jobs',TRUE ),
  ('Clark', 'kent', TRUE ),
  ('jimmy', 'neutron', FALSE ),
  ('johhny', 'bravo', FALSE ),
  ('scooby', 'doo', FALSE ),
  ('scrappy', 'doo', FALSE );
INSERT INTO quiz (name, created_by) VALUES
  ('Math Test', '1'),
  ('apple test',2),
  ('superhero test',3),
  ('programming test', 1);
INSERT INTO questions (question) VALUES
  ('What is 2 * 2?'),
  ('What is 1 + 5?'),
  ('How much is 4% of $100?');

INSERT INTO q_q (quiz_id, question_id) VALUES
  (1,1),(1,2),(1,3);

INSERT INTO answers (question_id, description, answer, is_Correct) VALUES
  (1,'4','a',TRUE ),(1,'22','b',FALSE ),(1,'6','c',FALSE ),(1,'0','d',FALSE ),
  (2,'4','a',FALSE ),(2,'6','b',TRUE ),(2,'15','c',FALSE ),(2,'3','d',FALSE ),
  (3,'$4.00','a',TRUE),(3,'$0.40','b',FALSE ),(3,'$40.00','c',FALSE ),(3,'$4','d',TRUE);


INSERT INTO student_quiz (student_id, quiz_id, question_id, student_answer) VALUES
  (1,1,1,'a'), (1,1,2,'c'), (1,1,3,'d');

SELECT * FROM users;

SELECT * FROM Student_quiz
WHERE quiz_id = 2;

select student_answer , first_name, last_name, quiz_id,a.question_id,question,description,answer,is_Correct, a.id
from users as u
  JOIN Student_quiz as sq on sq.student_id = u.id
  JOIN answers a ON sq.question_id = a.question_id
  join Questions q on a.question_id = q.id
where u.id = 1 and student_answer = answer;

select avg(is_Correct)*100
from users as u
  JOIN Student_quiz as sq on sq.student_id = u.id
  JOIN answers a ON sq.question_id = a.question_id
  join Questions q on a.question_id = q.id
where u.id = 1 and student_answer = answer;