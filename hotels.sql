--Before exercises

DROP SCHEMA IF EXISTS hotels CASCADE;
CREATE SCHEMA hotels;
SET SCHEMA 'hotels';


CREATE TABLE Hotel (
  hotelNo SERIAL PRIMARY KEY,
  hotelName VARCHAR(40) NOT NULL,
  city VARCHAR(40) NOT NULL
  );

CREATE TABLE Room (
  roomNo INT NOT NULL CHECK(roomNo >= 0),
  hotelNo INT NOT NULL,
  type VARCHAR(10) NOT NULL CHECK(type IN ('Family', 'Single', 'Double', 'Suite')),
  price FLOAT NOT NULL CHECK(price > 0),
  PRIMARY KEY (roomNo, hotelNo),
  FOREIGN KEY(hotelNo) REFERENCES Hotel(hotelNo) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED
  );

CREATE TABLE Guest (
  guestNo SERIAL PRIMARY KEY,
  guestName VARCHAR(60) NOT NULL,
  guestAddress VARCHAR(60) NOT NULL
  );

CREATE TABLE Booking (
  hotelNo INT,
  guestNo INT,
  dateFrom DATE,
  dateTo DATE,
  roomNo INT NOT NULL,
  PRIMARY KEY(hotelNo, guestNo, dateFrom),
  FOREIGN KEY(hotelNo, roomNo) REFERENCES Room(hotelNo, roomNo) ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY(guestNo) REFERENCES Guest(guestNo) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED
  );

INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES
  (1, 'Donald Duck', 'Webfoot Walk 1313'),
  (2, 'Homer Simpson', '742 Evergreen Terrace'),
  (3, 'Paris Hilton', '1234 Sunset Boulevard, Los Angeles, CA 90028'),
  (4, 'Donald Trump', '1600 Pennsylvania Avenue, Washington DC');

INSERT INTO Hotel (hotelName, city) VALUES
  ('Grosvenor Hotel', 'London'),
  ('Hilton', 'Paris'),
  ('Ritz', 'London'),
  ('Hilton', 'London');

INSERT INTO Room (roomNo, hotelNo, type, price) VALUES
  (101, 1, 'Single', 23.75),
  (102, 1, 'Single', 23.75),
  (103, 1, 'Double', 32.95),
  (601, 1, 'Family', 42.75),
  (602, 1, 'Suite', 123.75),
  (603, 1, 'Suite', 213.95),
  (101, 2, 'Single', 223.75),
  (102, 2, 'Double', 323.75),
  (103, 2, 'Family', 513.95),
  (601, 2, 'Suite', 523.75),
  (602, 2, 'Suite', 723.75),
  (603, 2, 'Suite', 1313.95),
  (601, 3, 'Suite', 1523.75),
  (602, 3, 'Suite', 1723.75),
  (603, 3, 'Suite', 2313.95);

  INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES
  (1, 1, '2014-04-13', '2014-04-15', 101),
  (1, 1, '2014-07-13', '2014-07-20', 102),
  (1, 2, '2014-03-16', '2014-03-20', 103),
  (2, 3, '2014-04-01', '2014-07-31', 603),
  (3, 4, '2014-01-01', '2014-06-01', 603);

INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo)
VALUES (1, 1, '2016-04-13', NULL, 101);

-- Exercise 1: Create a trigger that makes sure that all hotel names are always in upper case.


-- Before
SELECT Hotel.hotelName from hotel;

UPDATE Hotel SET hotelname = hotelname;
-- After
SELECT * FROM Hotel;


-- Exercise 2: Create a trigger that raises an exception if an UPDATE of the Room table changes the hotelNo of the room.
-- (Hint: RAISE EXCEPTION 'This is an exception')


-- Test
UPDATE Room SET hotelno = 1
	WHERE roomno = 601 AND hotelno = 3;
SELECT * FROM Room; -- check if 601 is 3 or 1, should be 3 still


-- Exercise 3: The hotels change the type and pricing of the rooms often.
-- They would like to have versioning information in the table.

-- a) Add a version column to the Room table. Set all versions to 1.
ALTER TABLE Room
ADD COLUMN version INT DEFAULT 1;

-- b) Add a trigger to update the version number every time the table changes.


-- Test 1: Make sure version is 1
SELECT * FROM hotels.room;

-- Test 2: Run the following update
UPDATE hotels.room
SET price = 44.00
WHERE roomno = 101 AND hotelno = 1;

-- Test 3: What version is it?
SELECT * FROM hotels.room
WHERE roomno = 101 AND hotelno = 1;


-- Exercise 4: The Guest table has a foreign key to the Booking table with referential action ON DELETE CASCADE.
-- It does not specify what happens if the guest id is updated.
-- Make a trigger that updates all guest ids in the booking table if a guest gets a new id.

-- Test
UPDATE Guest SET guestno = 1234 WHERE guestname = 'Donald Duck';
SELECT * FROM Guest; -- Confirm Donald Duck is 1234
SELECT * FROM Booking; -- Confirm guestno also updated in Booking

-- Exercise 5: Create a trigger for the following situations:
-- a) The price of all double rooms must be greater than 100 USD. (i.e. raise an exception if not)


-- Test: The following should not be allowed
INSERT INTO Room VALUES (105, 1, 'Double', 23.75);

-- b) The price of double rooms must be greater than the price of the highest single room.


-- Test: First find the max price of single, then insert double room priced less. Should not be allowed
SELECT MAX(price) FROM Room WHERE type = 'Single';
INSERT INTO hotels.room VALUES (106, 1, 'Double', 200);
SELECT * FROM hotels.room WHERE roomno = 106;

SELECT *
FROM Booking
JOIN Guest
ON Guest.guestNo=Booking.guestNo
WHERE guestName='Homer Simpson'