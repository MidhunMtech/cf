CREATE DATABASE IF NOT EXISTS cfTask;
USE cfTask;
CREATE TABLE IF NOT EXISTS person (
	firstname VARCHAR(50),
    lastname VARCHAR(50)
    );
    
INSERT INTO 
	person (firstname, lastname)
VALUES 
	("Midhun", "M"),
    ("Ajay", "Francis"),
    ("Prajwal", "VK"),
    ("Suby", "Baby"),
    ("Anju", "Varghese"),
    ("Deepak", "Jose"),
    ("Vishnu", "Jayakumar"),
    ("Sonu", "Raj"),
    ("Maneesh", "S"),
    ("Eldho", "KV");
    
SELECT *
FROM person;

CREATE table imgDetails (
	ID int PRIMARY KEY auto_increment,
    ImgName varchar(50),
    ImgDesc varchar(50),
    ImgPath varchar(50)
);

SELECT * FROM imgDetails;

TRUNCATE TABLE imgDetails;

CREATE TABLE positions(
	ID int PRIMARY KEY auto_increment,
    positions VARCHAR(50)
);

INSERT INTO positions (positions)
VALUES 
	("Interface Designer"),
	("Software Engineer"),
    ("System Admininstrator"),
    ("Manager");
    
SELECT * FROM positions;

CREATE TABLE task23 (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	positions INT,
    relocate VARCHAR(5),
    datepick DATE,
    portfolio VARCHAR(50),
    resumePath  VARCHAR(50),
    dollars VARCHAR(50),
    cents VARCHAR(50),
    fname VARCHAR(50),
    lname VARCHAR(50),
    emailId VARCHAR(50),
    phone VARCHAR(50)
);
    
ALTER TABLE 
	task23
ADD CONSTRAINT 
	fk_positions
FOREIGN KEY 
	(positions) 
REFERENCES 
	positions(ID);

SELECT * FROM task23;

CREATE TABLE task24 (
	firstName VARCHAR(50),
    email VARCHAR(50)
);

SELECT * FROM task24;
TRUNCATE TABLE task24;

CREATE TABLE task25_tag (
	words VARCHAR(50) UNIQUE
);

SELECT * FROM task25_tag;
TRUNCATE TABLE task25_tag;

ALTER TABLE task25_tag DROP INDEX words;

ALTER TABLE task25_tag
ADD CONSTRAINT unique_words UNIQUE (words);

CREATE TABLE task25_task2 (
	words VARCHAR(50)
);
SELECT * FROM task25_task2;
TRUNCATE TABLE task25_task2;


-- task28
CREATE TABLE user (
	userId INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(50) NOT NULL,
    pwd VARCHAR(50) NOT NULL,
    `role` VARCHAR(20) NOT NULL
);

INSERT INTO user 
	(userName, pwd, role)
VALUES 
	("admin123", "password", "admin"),
    ("editor123", "password", "editor") ;

CREATE TABLE `page` (
	pageId INT AUTO_INCREMENT PRIMARY KEY,
    pageName VARCHAR(50) NOT NULL,
    pageDesc TEXT NOT NULL
);
INSERT INTO page 
	(pageName, pageDesc)
VALUES 
	("page1", "password");
    
    
SELECT * FROM user;
SELECT * FROM page;

CREATE TABLE task26 (
	words VARCHAR(50)
);
TRUNCATE TABLE task26;

