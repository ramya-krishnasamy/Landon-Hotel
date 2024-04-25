CREATE TABLE Rooms(

RoomID int IDENTITY(1,1) NOT NULL,
RoomNumber char(3) NOT NULL,
BedType nvarchar(15) NOT NULL,
Rate smallmoney NOT NULL

);


INSERT INTO Rooms (RoomNumber,BedType,Rate)
     VALUES ('101','King',110),
	 ('102','Queen',100),
	 ('103','Two Doubles',90),
	 ('201','King',120),
	 ('202','King',120),
	 ('203','Two Doubles',90)
;

SELECT RoomNumber, BedType FROM Rooms;

SELECT * FROM Rooms;
SELECT TOP(3) * FROM Rooms;

SELECT * FROM Rooms WHERE Rate <= 120 AND BedType = 'King';

SELECT * FROM Guests;

SELECT * FROM Guests WHERE State = 'NY' OR State='CA' ORDER BY FirstName;

SELECT * FROM RoomReservations;

SELECT * FROM Guests;

DELETE FROM Guests WHERE GuestID = 1000;

DELETE FROM RoomReservations WHERE GuestID = 1000;

INSERT INTO RoomReservations (CheckInDate,CheckOutDate,RoomNumber,GuestID)
VALUES ('2023-05-21','2023-05-22','201',1000);


SELECT * FROM RoomReservations;

UPDATE RoomReservations 
SET    CheckInDate = '2023-05-22',CheckOutDate = '2023-05-25'
WHERE  GuestID = 1001;


SELECT * FROM Guests;
SELECT * FROM RoomReservations;
SELECT * FROM Rooms;


SELECT Guests.GuestID,Guests.FirstName,Guests.LastName,
       RoomReservations.CheckInDate, RoomReservations.CheckOutDate, RoomReservations.RoomNumber,
	   Rooms.BedType,Rooms.Rate
FROM Guests RIGHT JOIN RoomReservations ON Guests.GuestID = RoomReservations.GuestID
RIGHT JOIN Rooms ON RoomReservations.RoomNumber =Rooms.RoomNumber ; --INNER JOIN, LEFT JOIN

/*
FROM Guests RIGHT JOIN RoomReservations ON Guests.GuestID = RoomReservations.GuestID
RIGHT JOIN Rooms ON RoomReservations.RoomNumber =Rooms.RoomNumber ; --ORDER BY Guests.FirstName DESC;
*/


-- Delete Table and Records

TRUNCATE TABLE Rooms;
SELECT * FROM Rooms;

--DROP TABLE Rooms;

DROP TABLE IF EXISTS  Rooms;

SELECT * FROM ReservationDetails;

---Creating Indexes-----
CREATE NONCLUSTERED INDEX IX_Guests_LastName ON Guests (LastName ASC);

--Aggregate Functions
SELECT UPPER (FirstName),LOWER (LastName) FROM Guests;
SELECT LEFT ( FirstName,2), LEFT (LastName,3) FROM Guests;

SELECT * FROM Guests;
SELECT TOP(3) GuestID, FirstName+ ' ' + LastName AS FullName, Address+City AS CommunicateAddress FROM Guests;

GO
CREATE FUNCTION dbo.CommunicateAddress(@address nvarchar(50), @city nvarchar(50))
RETURNS nvarchar(100)
AS
BEGIN
     DECLARE @CommunicateAddress nvarchar(100);
	 SET @CommunicateAddress = (@address + ' '+ @city);
	 RETURN @CommunicateAddress
END;
GO


SELECT * FROM Guests;
SELECT TOP(3) GuestID, FirstName+ ' ' + LastName AS FullName, dbo.CommunicateAddress(Address,City) AS FullAddress FROM Guests;

GO
CREATE FUNCTION dbo.FullName (@FirstName nvarchar(50), @LastName nvarchar(50))
RETURNS nvarchar(100)
AS
BEGIN
     DECLARE @FullName nvarchar(100);
	 SET @FullName = (@FirstName  + @LastName );
	 RETURN @FullName
END;
GO

SELECT * FROM Guests;
SELECT TOP(3) GuestID, dbo.FullName(FirstName, LastName) AS FullName , dbo.CommunicateAddress(Address,City) AS FullAddress FROM Guests;
