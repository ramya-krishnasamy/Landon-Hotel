USE LandonHotel
GO


CREATE TABLE RoomReservations(
ReservationID int IDENTITY (1,1) NOT NULL,
CheckInDate Date NOT NULL,
CheckOutDate Date NOT NULL,
RoomNumber char(3) NOT NULL,
GuestID int NOT NULL                  -- CONSTRAINT FK_GuestID_ FOREIGN KEY(GuestID) REFERENCES Guest(GuestID)
);

--Insert values---
INSERT INTO RoomReservations (CheckInDate,CheckOutDate,RoomNumber,GuestID)
VALUES ('2023-05-21','2023-05-22','201',1000),
       ('2023-05-15','2023-05-16','301',1003);

SELECT * FROM RoomReservations;

---
UPDATE RoomReservations 
SET    CheckInDate = '2023-05-23',CheckOutDate = '2023-05-24'
WHERE  GuestID = 1003;

SELECT * FROM RoomReservations;
DELETE FROM RoomReservations WHERE GuestID = 1000;

TRUNCATE TABLE RoomReservations;
DROP TABLE IF EXISTS RoomReservations;

SELECT * FROM ReservationDetails;

