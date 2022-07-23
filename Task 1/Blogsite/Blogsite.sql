CREATE DATABASE Blog
USE Blog

CREATE TABLE Users 
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50),
	Surname NVARCHAR(50),
	Email NVARCHAR(100) UNIQUE NOT NULL CHECK(LEN(Email) >= 4)
)


CREATE TABLE Posts
(
	Id INT PRIMARY KEY IDENTITY,
	LikeCount INT,
	CreatedAt DATE,
	Title NVARCHAR(50),
	PostText NVARCHAR(500),
	UserId INT references Users(ID)
)

INSERT INTO Users
VALUES
('Ali', 'Mammadov', 'alim@gmail.com'),
('Orxan', 'Mammadov', 'orxanm@gmail.com'),
('Ramin', 'Safarli', 'ramins@gmail.com'),
('Seyfeddin', 'Nadjafli', 'seyfin@gmail.com'),
('Zaman', 'Safarov', 'zamans@gmail.com')

INSERT INTO Posts
VALUES
(250, GETDATE(), 'SQL intro', 'This text will talk about SQL SERVER generally...', 1),
(350, GETDATE(), 'SQL Commands', 'This text will talk about SQL Commands...', 2),
(400, GETDATE(), 'SQL Constraints', 'This article will cover the basics about SQL Constraints...', 3),
(450, GETDATE(), 'Normalizations', 'This post will talk about 3 types of normalization out of 6...', 4),
(500, GETDATE(), 'SQL Joins', 'There are several types of Joins in SQL, but we will touch main ones...', 5)

SELECT (u.Name + ' ' + u.Surname) as Username, p.Title as PostTitle, p.PostText as PostText, p.LikeCount as LikeCount FROM Users as u
INNER JOIN Posts as p
ON p.UserId = u.Id