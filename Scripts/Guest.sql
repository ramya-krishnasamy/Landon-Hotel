USE LandonHotel

CREATE TABLE Guest(
	GuestID int IDENTITY(1000,1) NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Address nvarchar(50) NULL,
	City nvarchar(50) NULL,
	State nvarchar(20) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(25) NULL,
	TimeStamp datetime2(7) DEFAULT CURRENT_TIMESTAMP );

	INSERT INTO Guest(FirstName, LastName, Address, City, State, PostalCode, Country,TimeStamp)
	VALUES
	    ('Kathe','Reid', '8 Maple Park','Redding', 'California', '96003', 'United States',CURRENT_TIMESTAMP),
	   ('Eric', 'Bryant', NULL, NULL, NULL, NULL, NULL, NULL),
		('Kimberly','Freeman','37717 Rutledge Park','Lansing','MI','48823','United States', NULL),
		('Linda', 'Moreno', '3593 Atwood Circle', 'Albany', 'NY', '12203', 'United States', NULL),
		('Michelle', 'Nguyen', '7396 Canary Center', 'Santa Barbara', 'CA', '93108', 'United States', NULL),
		('Frances', 'Sanders','98830 Schlimgen Park', 'Eugene', 'OR', '97401', 'United States', NULL),
		('Earnest', 'Hamilton', '123 Main St', 'Seattle', 'Washington','98101', 'United States', NULL),
		('Roy', 'Tucker', NULL, NULL, NULL, NULL, 'United States',NULL),
		('Emily','Hayes','9 South Crossing','Cleveland','OH','44101','United States',CURRENT_TIMESTAMP),
		('Dennis','Bishop','33 Victoria Circle','El Paso','TX','79821','United States',CURRENT_TIMESTAMP),
		('Frank','Rogers','9 Tomscot Place','Dallas','TX','75001','United States',CURRENT_TIMESTAMP),
		('Dorothy','Tucker','7715 Havey Center','Los Angeles','CA','90001','United States',CURRENT_TIMESTAMP),
		('Steven','Jenkins','772 Eagle Crest Court','Seattle','WA','98101','United States',CURRENT_TIMESTAMP);

SELECT * FROM Guest;

--DELETE TABLE AND RECORDS
TRUNCATE TABLE Guest;
DROP TABLE IF EXISTS  Guest;


---Creating Indexes-----
CREATE NONCLUSTERED INDEX IX_Guest_LastName ON Guest (LastName ASC);

--Aggregate Functions
SELECT UPPER (FirstName),LOWER (LastName) FROM Guest;
SELECT LEFT ( FirstName,2), LEFT (LastName,3) FROM Guest;

SELECT TOP(3) GuestID, FirstName+ ' ' + LastName AS FullName, Address+City AS CommunicateAddress FROM Guest;

SELECT * FROM Guest WHERE State = 'NY' OR State='CA' ORDER BY FirstName;
DELETE FROM Guest WHERE GuestID = 1000;


SELECT GuestID, FirstName, LastName, State
FROM dbo.Guest WHERE State = 'CA' ORDER BY FirstName DESC, LastName DESC


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


SELECT * FROM Guest;
SELECT TOP(3) GuestID, FirstName+ ' ' + LastName AS FullName, dbo.CommunicateAddress(Address,City) AS FullAddress FROM Guest;

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

SELECT * FROM Guest;
SELECT TOP(3) GuestID, dbo.FullName(FirstName, LastName) AS FullName , dbo.CommunicateAddress(Address,City) AS FullAddress FROM Guest;



