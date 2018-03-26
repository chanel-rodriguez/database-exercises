create DATABASE budget_db;

USE budget_db;

CREATE TABLE users(
  id  INT UNSIGNED AUTO_INCREMENT,
  email VARCHAR(50) NOT NULL ,
  password VARCHAR(20) NOT NULL ,
  first_name VARCHAR(20) NOT NULL ,
  last_name VARCHAR(20) NOT NULL ,
  date_of_birth DATE NOT NULL,
  shares_with INT UNSIGNED,
  PRIMARY KEY (id)
);

CREATE TABLE categories(
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL ,
  amount DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE expenses (
  user_id int UNSIGNED NOT NULL ,
  category_id INT UNSIGNED NOT NULL ,
  amount DECIMAL(7,2) NOT NULL ,
  time_stamp DATE NOT NULL ,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE icons(
  id  INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL ,
  url VARCHAR(65) NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE financial_goals (
  id  INT UNSIGNED AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL ,
  name VARCHAR(50) NOT NULL ,
  amount DECIMAL(8,2) NOT NULL ,
  type VARCHAR(10) NOT NULL ,
  icon_id INT UNSIGNED NOT NULL ,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (icon_id) REFERENCES icons(id)
);
