------------------------------------
-------START QUERIES FROM 4.2-------
------------------------------------


-----------------------------------------------------------
-----------------------------------------------------------
--JOINS
-----------------------------------------------------------
-----------------------------------------------------------

USE AdventureWorks2017

CREATE TABLE MyEmployee (EmployeeID INT, FirstName VARCHAR(20), LastName VARCHAR(20))

INSERT INTO MyEmployee VALUES (1, 'Michael', 'Scott')
INSERT INTO MyEmployee VALUES (2, 'Pam', 'Beesly')
INSERT INTO MyEmployee VALUES (3, 'Dwight', 'Schrute')

SELECT * FROM MyEmployee


CREATE TABLE MySalary (EmployeeID INT, Salary FLOAT)

INSERT INTO MySalary VALUES (1, 10000)
INSERT INTO MySalary VALUES (2, 8000)
INSERT INTO MySalary VALUES (3, 6000)

SELECT * FROM MyEmployee
SELECT * FROM MySalary

SELECT A.FirstName, A.LastName, B.Salary
FROM MyEmployee A INNER JOIN MySalary B ON A.EmployeeID = B.EmployeeID

-- LEFT OUTER JOIN
CREATE TABLE MyPhone (EmployeeID INT, PhoneNumber INT)

INSERT INTO MyPhone VALUES (1, 02071231234)
INSERT INTO MyPhone VALUES (2, 01151234123)

SELECT * FROM MyEmployee
SELECT * FROM MyPhone

SELECT * FROM MyEmployee A LEFT JOIN MyPhone B
ON A.EmployeeID = B.EmployeeID


--RIGHT OUTER JOIN
CREATE TABLE MyParking (EmployeeID INT, ParkingSpot VARCHAR(20))

INSERT INTO MyParking VALUES (1,'A1')
INSERT INTO MyParking VALUES (2,'A2')

SELECT * FROM MyParking
SELECT * FROM MyEmployee

SELECT A.ParkingSpot, B.FirstName, B.LastName FROM MyParking A RIGHT JOIN MyEmployee B
ON A.EmployeeID = B. EmployeeID


--FULL OUTER JOIN
CREATE TABLE MyCustomer (CustomerID INT, CustomerName VARCHAR(20))

--EMPTY THE TABLE USING TRUNCATE
TRUNCATE TABLE MyCustomer

INSERT INTO MyCustomer VALUES (1, 'Chris') 
INSERT INTO MyCustomer VALUES (3, 'Dean')

CREATE TABLE MyOrder (OrderNo INT, OrderName VARCHAR(20), CustomerID VARCHAR(20))

INSERT INTO MyOrder VALUES (1, 'Some Order 1', 1)
INSERT INTO MyOrder VALUES (2, 'Some Order 2', 2)
INSERT INTO MyOrder VALUES (3, 'Some Order 3', 7)
INSERT INTO MyOrder VALUES (3, 'Some Order 3', 8)

SELECT * FROM MyCustomer
SELECT * FROM MyOrder

SELECT A.CustomerID, A.CustomerName, B.OrderNo, B.OrderName
FROM MyCustomer A FULL OUTER JOIN MyOrder B
ON A.CustomerID = B.CustomerID


--CROSS JOIN
SELECT * FROM MyCustomer
SELECT * FROM MySalary

SELECT * FROM MyCustomer CROSS JOIN MySalary
SELECT * FROM MyCustomer, MySalary

------------------------------------
--------END QUERIES FROM 4.2--------
------------------------------------

--CURRENT DATE
SELECT GETDATE()

--2 DAYS AGO
SELECT GETDATE() - 2

--DATEPART
SELECT DATEPART(yyyy, GETDATE()) AS YearNumber

SELECT DATEPART(mm, GETDATE()) AS MonthNumber

SELECT DATEPART(dd, GETDATE()) AS DayNumber

--DATEADD

SELECT DATEADD(day, 4, GETDATE())
SELECT DATEADD(day, 4, '2018-4-17')

SELECT DATEADD(month, 3, GETDATE())
SELECT DATEADD(year, 7, GETDATE())

--CALCULATE NO OF DATES BETWEEN 2 DATES
SELECT TOP 10 * FROM [Production].[WorkOrder]

SELECT WorkOrderID, ProductId, StartDate, EndDate, DATEDIFF(day, StartDate, EndDate)
FROM [Production].[WorkOrder]

--CALCULATE START OF THE MONTH
SELECT DATEADD(day, -(DATEPART(day, GETDATE() - 1)), GETDATE())