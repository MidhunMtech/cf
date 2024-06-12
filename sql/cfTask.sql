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
