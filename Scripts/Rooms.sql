CREATE TABLE Rooms (
	RoomID int IDENTITY(1, 1) NOT NULL,
	RoomNumber char(3) NOT NULL,
	BedType varchar(15) NOT NULL, 
	Rate smallmoney NOT NULL
);

INSERT INTO Rooms (RoomNumber,BedType,Rate)
     VALUES ('101','King',110),
	 ('102','Queen',100),
	 ('103','Two Doubles',90),
	 ('201','King',120),
	 ('202','King',120),
	 ('203','Two Doubles',90);


SELECT RoomNumber, BedType FROM Rooms;

SELECT RoomID, RoomNumber, BedType, Rate FROM dbo.Rooms;

SELECT * FROM Rooms;
SELECT TOP(3) * FROM Rooms;

SELECT * FROM Rooms WHERE Rate <= 120 AND BedType = 'King';


-- Delete Table and Records
TRUNCATE TABLE Rooms;
SELECT * FROM Rooms;


--DROP TABLE Rooms;
DROP TABLE IF EXISTS  Rooms;