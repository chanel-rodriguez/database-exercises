USE codeup_test_db;

DROP TABLE IF EXISTS albums;


CREATE TABLE albums(
id INT unsigned auto_increment,
artist VARCHAR(50) NOT NULL,
name VARCHAR (50) NOT NULL,
release_date INT(4) NOT NULL,
sales FLOAT unsigned NOT NULL,
genre VARCHAR(30) NOT NULL,
PRIMARY KEY (id)
);

DESCRIBE albums;

