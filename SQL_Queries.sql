--Create Database
CREATE DATABASE ecommerce_db;

--Use Database
USE ecommerce_db;

--Create Customers Table
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

--Create Orders Table
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATE
);

--Show Tables
SHOW TABLES;

--Insert Customer Records
INSERT INTO Customers VALUES
(1,'Arun Kumar','Chennai'),
(2,'Priya Sharma','Bangalore'),
(3,'Rahul Verma','Hyderabad'),
(4,'Sneha Reddy','Mumbai'),
(5,'Karthik S','Coimbatore');

--Insert Order Records
INSERT INTO Orders VALUES
(101,1,'Laptop','Electronics',1,55000,'2025-01-10'),
(102,2,'Smartphone','Electronics',2,25000,'2025-01-12'),
(103,3,'Headphones','Electronics',3,2000,'2025-01-15'),
(104,1,'T-Shirt','Fashion',4,500,'2025-01-18'),
(105,4,'Jeans','Fashion',2,1200,'2025-01-20'),
(106,5,'Shoes','Fashion',1,2500,'2025-01-22'),
(107,2,'Book','Books',5,300,'2025-01-25'),
(108,3,'Notebook','Stationery',10,50,'2025-01-27'),
(109,4,'Pen','Stationery',20,20,'2025-01-28'),
(110,5,'Tablet','Electronics',1,18000,'2025-01-30');

--Display Orders Data
SELECT * FROM Orders;

--WHERE Clause
SELECT *
FROM Orders
WHERE Category='Electronics';

--ORDER BY Clause
SELECT *
FROM Orders
ORDER BY Price DESC;

--GROUP BY Clause
SELECT Category,
SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY Category;

--INNER JOIN
SELECT
o.OrderID,
c.CustomerName,
o.ProductName
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID=c.CustomerID;

--LEFT JOIN
SELECT
o.OrderID,
c.CustomerName
FROM Orders o
LEFT JOIN Customers c
ON o.CustomerID=c.CustomerID;

--RIGHT JOIN
SELECT
o.OrderID,
c.CustomerName
FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID=c.CustomerID;

--Subquery
SELECT CustomerID,
SUM(Quantity*Price) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(Quantity*Price) >
(
    SELECT AVG(TotalAmount)
    FROM
    (
        SELECT SUM(Quantity*Price) AS TotalAmount
        FROM Orders
        GROUP BY CustomerID
    ) AvgTable
);

--SUM Function
SELECT SUM(Quantity*Price) AS TotalRevenue
FROM Orders;

--AVG Function
SELECT AVG(Quantity*Price) AS AverageOrderValue
FROM Orders;

--Create View
CREATE VIEW Sales_Summary AS
SELECT
Category,
SUM(Quantity*Price) AS Revenue
FROM Orders
GROUP BY Category;

--View Output
SELECT * FROM Sales_Summary;

--Create Index
CREATE INDEX idx_customer
ON Orders(CustomerID);

--Verify Index
SHOW INDEX FROM Orders;