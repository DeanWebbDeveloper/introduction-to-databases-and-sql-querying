------------------------------------
-------START QUERIES FROM 3.1-------
------------------------------------

USE [AdventureWorks2017]

--
SELECT * FROM [HumanResources].[Department]

--SHOW ME ALL THE DEPARTMENT NAMES
SELECT Name FROM [HumanResources].[Department]

--SHOW ME ALL THE GROUPS
SELECT GroupName FROM [HumanResources].[Department]

--SHOW ME ALL THE DISTINCT GROUPNAMES
SELECT DISTINCT GroupName FROM  [HumanResources].[Department]

--SHOW ME ALL THE DEPARTMENTS NAMES WHO ARE A PART OF MANUFACTURING
SELECT Name FROM [HumanResources].[Department]
WHERE [GroupName] LIKE 'Manufacturing'


--GIVE ME ALL THE EMPLOYEES FROM THE EMPLOYEE TABLE
SELECT * FROM [HumanResources].[Employee]

--GIVE ME A LIST OF ALL EMPLOYEES WHO HAVE AN ORGLEVEL = 2
SELECT * FROM [HumanResources].[Employee]
WHERE [OrganizationLevel] = 2

--GIVE ME A LIST OF ALL EMPLOYEES WHO HAVE AN ORGLEVEL = 2 OR 3
SELECT * FROM [HumanResources].[Employee]
WHERE [OrganizationLevel] IN (2,3)

--GIVE ME A LIST OF EMPLOYEES WHO HAVE A TITLE AS FACILITIES MANAGER

SELECT * FROM  [HumanResources].[Employee]
WHERE [JobTitle] LIKE 'Facilities Manager'


--GIVE ME ALL THE EMPLOYEES WHO HAVE THE WORD CONTROL IN THEIR TITLE (WILDCARDS)
SELECT * FROM [HumanResources].[Employee]
WHERE [JobTitle] LIKE '%Control%'


--GIVE ME ALL THE EMPLOYEES WHO WERE BORN AFTER JAN 1, 1980
SELECT * FROM [HumanResources].[Employee]
WHERE [BirthDate] > '1/1/1980'

--GIVE ME ALL THE EMPLOYEES WHO WERE BORN BETWEEN JAN 1, 1970 & JAN 1, 1980
SELECT * FROM [HumanResources].[Employee]
WHERE [BirthDate] > '1/1/1970' AND [BirthDate] < '1/1/1980'

SELECT * FROM [HumanResources].[Employee]
WHERE [BirthDate] BETWEEN '1/1/1970' AND '1/1/1980'

------------------------------------
--------END QUERIES FROM 3.1--------
------------------------------------

USE [AdventureWorks2017]

--CALCULATED COLUMNS
SELECT Name, ListPrice FROM [Production].[Product]

SELECT Name, ListPrice, ListPrice + 10 As AdjustedListPrice FROM [Production].[Product]

--INTO

SELECT Name, ListPrice, ListPrice + 10 As AdjustedListPrice INTO [Production].[Product_2] FROM [Production].[Product]

--TABLE PRODUCT_2 HAS BEEN MADE
SELECT * FROM [Production].[Product_2]

SELECT Name, ListPrice, ListPrice + 10 As AdjustedListPrice INTO #tempTable FROM [Production].[Product]

--A TEMPORARY TABLE IS MADE BY PUTTING A # BEFORE, SO WILL DISAPPEAR WHEN ENDED SESSION
SELECT * FROM #tempTable

--DELETE DATA FROM A TABLE
DELETE FROM [Production].[Product_2]
WHERE Name LIKE 'Bearing Ball'

SELECT * FROM [Production].[Product_2]

--UPDATE

UPDATE [Production].[Product_2]
SET Name = 'BladeNew'
WHERE Name LIKE 'Blade'

SELECT * FROM [Production].[Product_2]