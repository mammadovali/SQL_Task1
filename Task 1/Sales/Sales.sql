CREATE DATABASE Marketing
USE Marketing

CREATE TABLE Positions
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(200)
)

CREATE TABLE Workers
(
	Id INT PRIMARY KEY IDENTITY,
	NameSurnameFatherName NVARCHAR(150),
	PositionId INT references Positions(Id),
	Salary INT
)

ALTER TABLE Workers
ADD BranchID INT references Branches(Id)

CREATE TABLE Branches
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100)
)

CREATE TABLE Products
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100),
	PurchasePrice INT,
	SalePrice INT
)

CREATE TABLE Sales
(
	Id INT PRIMARY KEY IDENTITY,
	ProductId INT references Products(Id),
	WorkerId INT references Workers(Id),
	BranchId INT references Branches(Id),
	SaleDate Date DEFAULT GETDATE()
)

INSERT INTO Positions
VALUES
('Satici'), ('Kassir')

INSERT INTO Workers
VALUES
('Ravil Mehrabov Ramil oğlu', 1, 500),
('Murad Əlizadə Həsən oğlu', 2, 600),
('Cəlal Fətullayev Qulu oğlu', 1, 300),
('Fuad Əsgərov Hikmət oğlu', 2, 400)

INSERT INTO Branches
VALUES
('Bakıxanov'), ('Koroğlu')

INSERT INTO Products
VALUES
('Kərə yağı', 14, 19), ('Dirol Nanə', 1, 2), ('Kolbasa', 5.50, 8.70), ('Sobranie Caster', 3.20, 4.80)

INSERT INTO Sales
VALUES
(1, 1, 1, GETDATE()), (2, 2, 1, GETDATE()), (3, 3, 2, GETDATE()), (4, 4, 2, GETDATE())


SELECT w.NameSurnameFatherName as Fullname, Positions.Name as Vəzifə, p.Name as Product, b.Name as Filial, p.PurchasePrice as 'Alış qiyməti',
p.SalePrice as 'Satış qiyməti' FROM Sales as s
INNER JOIN Workers as w
ON w.Id = s.ProductId
INNER JOIN Branches as b
ON b.Id = s.BranchId
INNER JOIN Products as p
ON p.Id = s.ProductId
INNER JOIN Positions
ON Positions.Id = w.PositionId