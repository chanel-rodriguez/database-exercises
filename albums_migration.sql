USE codeup_test_db;

DROP TABLE IF EXISTS albums;


CREATE TABLE albums(
id INT unsigned auto_increment,
artist VARCHAR(70) NOT NULL,
name VARCHAR (70) NOT NULL,
release_date INT(4) NOT NULL,
sales FLOAT unsigned NOT NULL,
genre VARCHAR(60) NOT NULL,
PRIMARY KEY (id)
);

DESCRIBE albums;

DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts(
id INT unsigned auto_increment,
name VARCHAR(50) NOT NULL,
number VARCHAR (12) NOT NULL,
email VARCHAR(50) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO contacts (name,number,email) VALUES ('Chanel Rodriguez', '4802252640', '13car92@gmail.com');

SELECT * from contacts;

