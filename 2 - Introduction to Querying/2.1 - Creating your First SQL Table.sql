CREATE database mytestdb
GO

USE mytestdb

CREATE TABLE mytesttable
(
rollno INT,
firstname varchar(50),
lastname varchar (50)
)

USE mytestdb
SELECT rollno, firstname, lastname FROM mytesttable

USE mytestdb
INSERT INTO mytesttable(rollno, firstname, lastname)
VALUES (1, 'Chris', 'Webb')