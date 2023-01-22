# create databases
CREATE DATABASE IF NOT EXISTS `DB01`;

# create DB01 user and grant rights
CREATE USER 'db01user01'@'%' IDENTIFIED BY 'Password123';
CREATE USER 'db01user02'@'%' IDENTIFIED BY 'Password123';
GRANT ALL PRIVILEGES ON DB01.* TO 'db01user02'@'%';
GRANT SELECT ON DB01.* TO 'db01user02'@'%';

use DB01;
CREATE TABLE movies(
	title VARCHAR(50) NOT NULL,
	genre VARCHAR(30) NOT NULL,
	director VARCHAR(60) NOT NULL,
	release_year INT NOT NULL,
PRIMARY KEY(title));

INSERT INTO movies VALUE ("Joker", "psychological thriller", "Todd Phillips", 2019);
INSERT INTO movies VALUE ("Alien", "Sci Fi", "Dumbo", 1978);
