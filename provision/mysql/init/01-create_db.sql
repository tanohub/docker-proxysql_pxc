-- proxysql monitoring user
CREATE USER 'proxysql-monitor'@'%' IDENTIFIED BY 'Password123';
GRANT USAGE ON *.* TO 'proxysql-monitor'@'%';

-- create database and application user
CREATE DATABASE IF NOT EXISTS `DB01`;
CREATE USER 'db01user01'@'%' IDENTIFIED BY 'Password123';
GRANT ALL PRIVILEGES ON DB01.* TO 'db01user01'@'%';

-- insert some data on DB01.movies
use DB01;
CREATE TABLE movies(
	title VARCHAR(50) NOT NULL,
	genre VARCHAR(30) NOT NULL,
	director VARCHAR(60) NOT NULL,
	release_year INT NOT NULL,
PRIMARY KEY(title));

INSERT INTO movies VALUE ("Joker", "psychological thriller", "Todd Phillips", 2019);
INSERT INTO movies VALUE ("Alien", "Sci Fi", "Ridley Scott", 1979);
INSERT INTO movies VALUE ("Tremors", "Epic", "Ron Underwood", 1990);
