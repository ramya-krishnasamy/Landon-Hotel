SELECT * FROM Guest;
SELECT * FROM Rooms;
SELECT * FROM RoomReservations;


--INNER JOIN--
SELECT Guest.GuestID,Guest.FirstName,Guest.LastName,
       RoomReservations.CheckInDate, RoomReservations.CheckOutDate, RoomReservations.RoomNumber,
	   Rooms.BedType,Rooms.Rate --FROM Guest,RoomReservations,Rooms;
FROM   Guest INNER JOIN RoomReservations ON Guest.GuestID = RoomReservations.GuestID
       INNER JOIN Rooms ON RoomReservations.RoomNumber =Rooms.RoomNumber ;


--LEFT JOIN--
SELECT Guest.GuestID,Guest.FirstName,Guest.LastName,
       RoomReservations.CheckInDate, RoomReservations.CheckOutDate, RoomReservations.RoomNumber,
	   Rooms.BedType,Rooms.Rate
FROM   Guest LEFT JOIN RoomReservations ON Guest.GuestID = RoomReservations.GuestID
       LEFT JOIN Rooms ON RoomReservations.RoomNumber =Rooms.RoomNumber ; 


--RIGHT JOIN--
SELECT Guest.GuestID,Guest.FirstName,Guest.LastName,
       RoomReservations.CheckInDate, RoomReservations.CheckOutDate, RoomReservations.RoomNumber,
	   Rooms.BedType,Rooms.Rate
FROM Guest RIGHT JOIN RoomReservations ON Guest.GuestID = RoomReservations.GuestID
RIGHT JOIN Rooms ON RoomReservations.RoomNumber =Rooms.RoomNumber ORDER BY Guest.FirstName DESC;


--Create Table Employee--
CREATE TABLE EMPLOYEE(
EmployeeId int NOT NULL,
EmployeeName nvarchar(50) NOT NULL);

SELECT * FROM EMPLOYEE;

INSERT INTO  EMPLOYEE(EmployeeId,EmployeeName) VALUES (11,'John');


--SCHEMAS
CREATE SCHEMA HumanResources

ALTER SCHEMA HumanResources TRANSFER dbo.EMPLOYEE

--GRANT INSERT ON SCHEMA :: Humanresources TO Marcus;

--Data Masking
SELECT * FROM HumanResources.Employees;
ALTER TABLE HumanResources.Employees
ALTER COLUMN Email ADD MASKED WITH (FUNCTION = 'email()');

--DMV
SELECT * FROM sys.dm_db_file_space_usage;

SELECT * FROM sys.dm_exec_connections;

SELECT DB_NAME (database_id) AS DatabaseName, OBJECT_NAME (object_id) AS ObjectName,
* FROM sys.dm_db_index_usage_stats;