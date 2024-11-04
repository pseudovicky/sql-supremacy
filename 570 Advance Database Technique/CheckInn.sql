/* =============================================================================
=====================  DATABASE & SCHEMA CREATION QUERIES ======================
================================================================================*/

-- CREATES THE CheckInn DATABASE
CREATE DATABASE CheckInn;

-- USES DATABASE
USE CheckInn;

--CREATING HOTEL ATTRIBUTES TABLE
CREATE TABLE Hotel(
	HotelId INT NOT NULL PRIMARY KEY IDENTITY (100,1),
	Name VARCHAR (255) NOT NULL,
	Address VARCHAR (255) NOT NULL,
    City VARCHAR (255) NOT NULL,
    State VARCHAR (255) NOT NULL,
    Country VARCHAR (255) NOT NULL,
	PostalCode VARCHAR(20) NOT NULL,
	PhoneNo VARCHAR(15) NOT NULL,
	Email VARCHAR (255) NOT NULL,
	NoOfRooms INT 
);

-- FETCH ALL COLUMNS FROM Hotel TABLE
SELECT * FROM Hotel

--CREATING CUSTOMER ATTRIBUTES TABLE 
CREATE TABLE Customer(
	CustomerId INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	FirstName VARCHAR (225) NOT NULL,
	LastName VARCHAR (255),
	DateOfBirth DATE NOT NULL,
	PhoneNo VARCHAR(15) NOT NULL,
	Email VARCHAR (255) NOT NULL,
	Address VARCHAR (255) NOT NULL,
	City VARCHAR (255) NOT NULL,
    State VARCHAR (255) NOT NULL,
    Country VARCHAR (255) NOT NULL,
	PostalCode VARCHAR(20) NOT NULL
);
-- FETCH ALL COLUMNS FROM Customer TABLE
SELECT * FROM Customer

-- CREATING ROOM ATTRIBUTES TABLE
CREATE TABLE Room(
	RoomId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotel(HotelId),
	RoomNo INT NOT NULL,
	RoomType VARCHAR (255) NOT NULL,
	BedType VARCHAR (255) NOT NULL,
	PricePerNight INT NOT NULL,
    AvailabilityStatus VARCHAR(50) NOT NULL,
	CHECK (AvailabilityStatus IN ('Available', 'Occupied', 'Reserved', 'Maintenance', 'Out of Service'))
);
-- FETCH ALL COLUMNS FROM Room TABLE
SELECT * FROM Room

--CREATING RESERVATION ATTRIBUTES TABLE
CREATE TABLE Reservation ( 
	ReservationId INT NOT NULL PRIMARY KEY IDENTITY(1000,1),
	CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
	RoomId INT NOT NULL FOREIGN KEY REFERENCES Room(RoomId),
	HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotel(HotelId),
	CheckIn DATE NOT NULL,
	CheckOutDate DATE NOT NULL,
	NoOfPeople INT NOT NULL,
	TotalPrice DECIMAL(10,2),
	BookingDate DATE,
	ReservationStatus VARCHAR (50) NOT NULL,
    CHECK ( ReservationStatus IN ('Available', 'Occupied', 'Reserved', 'Maintenance', 'Out of Service'))
);
-- FETCH ALL COLUMNS FROM Reservation TABLE
SELECT * FROM Reservation

--CREATING PAYMENT ATTRIBUTES TABLE
CREATE TABLE Payment (
	PaymentId INT NOT NULL PRIMARY KEY IDENTITY(10000,1),
	PaymentDate DATE,
	ReservationId INT NOT NULL FOREIGN KEY REFERENCES Reservation(ReservationId),
	Amount DECIMAL(10,2) NOT NULL,
	PaymentStatus VARCHAR(50) NOT NULL,
	CHECK (PaymentStatus IN ('Pending', 'Completed', 'Failed', 'Refunded', 'Cancelled', 'Partially Refunded', 'Authorized', 'Declined')),
	PaymentMethod VARCHAR(50) NOT NULL,
    CHECK (PaymentMethod IN ('Credit Card', 'Debit Card', 'Cash', 'Bank Transfer', 'PayPal', 'Google Pay', 'Apple Pay', 'Amazon Pay', 'Cryptocurrency', 'Gift Card', 'Net Banking','Cheque'))
);
-- FETCH ALL COLUMNS FROM Payment TABLE
SELECT * FROM Payment

--CREATING FACILITY ATTRIBUTES TABLE
CREATE TABLE Facility (
	FacilityId INT NOT NULL PRIMARY KEY IDENTITY(10,1),
	HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotel(HotelId),
	FacilityName VARCHAR(255) NOT NULL,
	Description VARCHAR(500)
);
-- FETCH ALL COLUMNS FROM Facility TABLE
SELECT * FROM Facility

--CREATING SERVICE ATTRIBUTES TABLE
CREATE TABLE Service (
	ServiceId INT NOT NULL PRIMARY KEY IDENTITY(20,1),
	ServiceName VARCHAR(50),
	ServiceCost DECIMAL(10,2) NOT NULL,
	HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotel(HotelId)
);
-- FETCH ALL COLUMNS FROM Service TABLE
SELECT * FROM Service

--CREATING STAFF ATTRIBUTES TABLE
CREATE TABLE Staff (
    StaffId INT NOT NULL PRIMARY KEY IDENTITY(50,1),   
    HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotel(HotelId),
    FirstName VARCHAR(100) NOT NULL,         
    LastName VARCHAR(100) NOT NULL,             
    JobPosition VARCHAR(100) NOT NULL,         
    PhoneNo VARCHAR(15) NOT NULL,                 
    Email VARCHAR(255) NOT NULL,                 
    HireDate DATE NOT NULL,                      
    Salary DECIMAL(10, 2) NOT NULL
);
-- FETCH ALL COLUMNS FROM Staff TABLE
SELECT * FROM Staff

--CREATING REVIEW ATTRIBUTES TABLE
CREATE TABLE Review (
    ReviewId INT NOT NULL PRIMARY KEY IDENTITY(1,1),  
    CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
    HotelId INT NOT NULL FOREIGN KEY REFERENCES Hotel(HotelId),   
    Rating DECIMAL(3, 2) NOT NULL CHECK (Rating >= 0 AND Rating <= 5), 
    Remarks VARCHAR(500),          
    ReviewDate DATETIME NOT NULL DEFAULT GETDATE()
);
-- FETCH ALL COLUMNS FROM Review TABLE
SELECT * FROM Review

/* =============================================================================
==========================  VALUE INSERTION QUERIES ============================
================================================================================*/

-- =========== INSERTS DATA INTO HOTEL TABLE ===========
INSERT INTO Hotel (Name, Address, City, State, Country, PostalCode, PhoneNo, Email, NoOfRooms) VALUES 
('Hotel Azure', '123, Ocean Drive, Juhu, Mumbai', 'Mumbai', 'Maharashtra', 'India', '400049', '9876543210', 'hotelazure@gmail.com', 100),
('Royal Palace', '456, Kingsway, Connaught Place, New Delhi', 'New Delhi', 'Delhi', 'India', '110001', '9876543211', 'royalpalace@gmail.com', 200),
('Green Valley Resort', '789, Nature Lane, Munnar', 'Munnar', 'Kerala', 'India', '685612', '9876543212', 'greenvalley@gmail.com', 150),
('Beachside Inn', '321, Sunset Boulevard, Goa', 'Goa', 'Goa', 'India', '403507', '9876543213', 'beachsideinn@gmail.com', 75),
('Desert Camp', '654, Sand Dunes, Jaisalmer', 'Jaisalmer', 'Rajasthan', 'India', '345678', '9876543214', 'desertcamp@gmail.com', 50),
('Mountain Retreat', '987, Hilltop Road, Shimla', 'Shimla', 'Himachal Pradesh', 'India', '171001', '9876543215', 'mountainretreat@gmail.com', 100),
('City Center Hotel', '123, MG Road, Bengaluru', 'Bengaluru', 'Karnataka', 'India', '560001', '9876543216', 'citycenter@gmail.com', 120),
('Heritage Lodge', '456, Old Fort Road, Agra', 'Agra', 'Uttar Pradesh', 'India', '282001', '9876543217', 'heritagelodge@gmail.com', 60),
('Seaside Haven', '789, Ocean View, Chennai', 'Chennai', 'Tamil Nadu', 'India', '600001', '9876543218', 'seasidehaven@gmail.com', 80),
('Urban Suites', '321, Main Street, Hyderabad', 'Hyderabad', 'Telangana', 'India', '500001', '9876543219', 'urbansuites@gmail.com', 90),
('Royal Orchid', '654, Luxury Lane, Jaipur', 'Jaipur', 'Rajasthan', 'India', '302001', '9876543220', 'royalorchid@gmail.com', 110),
('Hilltop Resort', '987, Hill View Road, Darjeeling', 'Darjeeling', 'West Bengal', 'India', '734101', '9876543221', 'hilltopresort@gmail.com', 55),
('Palm Tree Resort', '321, Beach Road, Kovalam', 'Kovalam', 'Kerala', 'India', '695527', '9876543222', 'palmresort@gmail.com', 65),
('Cosy Cottage', '654, Hilltop Road, Ooty', 'Ooty', 'Tamil Nadu', 'India', '643001', '9876543223', 'cosycottage@gmail.com', 45),
('Luxury Inn', '987, Mall Road, Manali', 'Manali', 'Himachal Pradesh', 'India', '175131', '9876543224', 'luxuryinn@gmail.com', 70),
('Wilderness Resort', '123, Forest Lane, Corbett', 'Corbett', 'Uttarakhand', 'India', '244715', '9876543225', 'wilderness@gmail.com', 40),
('Cultural Hotel', '456, Heritage Street, Varanasi', 'Varanasi', 'Uttar Pradesh', 'India', '221001', '9876543226', 'culturalhotel@gmail.com', 95),
('Vibrant Inn', '789, Festival Road, Jaipur', 'Jaipur', 'Rajasthan', 'India', '302002', '9876543227', 'vibrantinn@gmail.com', 85),
('Grand Hotel', '321, Palace Road, Udaipur', 'Udaipur', 'Rajasthan', 'India', '313001', '9876543228', 'grandhotel@gmail.com', 110),
('Quiet Retreat', '654, Riverbank, Rishikesh', 'Rishikesh', 'Uttarakhand', 'India', '249137', '9876543229', 'quietretreat@gmail.com', 50),
('Sunset Resort', '987, Shoreline, Digha', 'Digha', 'West Bengal', 'India', '721428', '9876543230', 'sunsetresort@gmail.com', 60),
('Artisan Lodge', '123, Craft Street, Jodhpur', 'Jodhpur', 'Rajasthan', 'India', '342001', '9876543231', 'artisanlodge@gmail.com', 55),
('Tranquil Inn', '456, Peace Lane, Haridwar', 'Haridwar', 'Uttarakhand', 'India', '249401', '9876543232', 'tranquilinn@gmail.com', 75),
('Blooming Hotel', '789, Flower Street, Chandigarh', 'Chandigarh', 'Chandigarh', 'India', '160017', '9876543233', 'bloominghotel@gmail.com', 80),
('Heavenly Resort', '321, Paradise Lane, Kodaikanal', 'Kodaikanal', 'Tamil Nadu', 'India', '624101', '9876543234', 'heavenlyresort@gmail.com', 60),
('Pleasant Stay', '654, Cozy Lane, Agra', 'Agra', 'Uttar Pradesh', 'India', '282001', '9876543235', 'pleasantstay@gmail.com', 100),
('Oasis Inn', '987, Waterfall Road, Chikmagalur', 'Chikmagalur', 'Karnataka', 'India', '577101', '9876543236', 'oasisinn@gmail.com', 45),
('Jungle Retreat', '123, Wild Road, Kaziranga', 'Kaziranga', 'Assam', 'India', '784145', '9876543237', 'jungleretreat@gmail.com', 80),
('Serene Lodge', '456, Calm Street, Andaman', 'Andaman', 'Andaman and Nicobar Islands', 'India', '744101', '9876543238', 'serenelodge@gmail.com', 55),
('Vista Hotel', '789, Horizon Drive, Pune', 'Pune', 'Maharashtra', 'India', '411001', '9876543239', 'vistahotel@gmail.com', 70),
('Starlight Resort', '321, Star Road, Matheran', 'Matheran', 'Maharashtra', 'India', '410102', '9876543240', 'starlightresort@gmail.com', 60),
('Pine Valley Hotel', '654, Evergreen Lane, Nainital', 'Nainital', 'Uttarakhand', 'India', '263001', '9876543241', 'pinevalleyhotel@gmail.com', 65),
('The Grand Palace', '987, Royal Road, Hyderabad', 'Hyderabad', 'Telangana', 'India', '500001', '9876543242', 'thegrandpalace@gmail.com', 150),
('Dew Drops Hotel', '123, Misty Lane, Coorg', 'Coorg', 'Karnataka', 'India', '571201', '9876543243', 'dewdropshotel@gmail.com', 80),
('Fountain Resort', '456, Waterfall Road, Shillong', 'Shillong', 'Meghalaya', 'India', '793001', '9876543244', 'fountainresort@gmail.com', 50),
('Wildflower Inn', '789, Nature Trail, Kullu', 'Kullu', 'Himachal Pradesh', 'India', '175101', '9876543245', 'wildflowerinn@gmail.com', 90);

/* =========== INSERTS DATA INTO CUSTOMER TABLE =========== */
INSERT INTO Customer (FirstName, LastName, DateOfBirth, PhoneNo, Email, Address, City, State, Country, PostalCode) VALUES 
('Aarav', 'Singh', '1995-05-12', '9876543210', 'aaravsingh@gmail.com', '123, Maple Street', 'Patna', 'Bihar', 'India', '800001'),
('Vivaan', 'Sharma', '1988-07-25', '9876543211', 'vivansharma@gmail.com', '456, Oak Avenue', 'Mumbai', 'Maharashtra', 'India', '400002'),
('Aditya', 'Mehta', '1990-12-01', '9876543212', 'adityamehta@gmail.com', '789, Pine Road', 'Bengaluru', 'Karnataka', 'India', '560003'),
('Vihaan', 'Iyer', '1997-03-15', '9876543213', 'vihaaniyer@gmail.com', '321, Cedar Lane', 'Chennai', 'Tamil Nadu', 'India', '600004'),
('Arjun', 'Kumar', '1993-11-30', '9876543214', 'arjunkumar@gmail.com', '654, Elm Street', 'Hyderabad', 'Telangana', 'India', '500005'),
('Sai', 'Reddy', '1985-01-20', '9876543215', 'saireddy@gmail.com', '987, Willow Way', 'Ahmedabad', 'Gujarat', 'India', '380006'),
('Kabir', 'Patel', '1992-09-09', '9876543216', 'kabirpatel@gmail.com', '234, Bamboo Street', 'Pune', 'Maharashtra', 'India', '411007'),
('Dhruv', 'Verma', '1994-04-22', '9876543217', 'dhruvverma@gmail.com', '567, Palm Avenue', 'Jaipur', 'Rajasthan', 'India', '302008'),
('Reyansh', 'Chopra', '1996-10-11', '9876543218', 'reyanshchopra@gmail.com', '890, Mango Street', 'Lucknow', 'Uttar Pradesh', 'India', '226009'),
('Krishna', 'Joshi', '1989-08-05', '9876543219', 'krishnajoshi@gmail.com', '321, Lotus Lane', 'Varanasi', 'Uttar Pradesh', 'India', '221010'),
('Aarav', 'Gupta', '1991-02-14', '9876543220', 'aaravgupta@gmail.com', '654, Jasmine Road', 'Nashik', 'Maharashtra', 'India', '422011'),
('Lakshmi', 'Nair', '1993-12-31', '9876543221', 'lakshminair@gmail.com', '987, Orchid Street', 'Kochi', 'Kerala', 'India', '682012'),
('Maya', 'Srinivasan', '1998-06-24', '9876543222', 'mayasrinivasan@gmail.com', '123, Hibiscus Lane', 'Coimbatore', 'Tamil Nadu', 'India', '641013'),
('Riya', 'Bansal', '1990-05-05', '9876543223', 'riyabansal@gmail.com', '456, Clover Road', 'Indore', 'Madhya Pradesh', 'India', '452014'),
('Siddharth', 'Kumar', '1987-11-21', '9876543224', 'siddharthkumar@gmail.com', '789, Cherry Lane', 'Chandigarh', 'Chandigarh', 'India', '160015'),
('Tanishq', 'Verma', '1995-03-17', '9876543225', 'tanishqverma@gmail.com', '321, Lily Street', 'Gurgaon', 'Haryana', 'India', '122016'),
('Kaira', 'Pillai', '1994-09-14', '9876543226', 'kairapillai@gmail.com', '654, Tulip Avenue', 'Nagpur', 'Maharashtra', 'India', '440017'),
('Nia', 'Patel', '1999-04-09', '9876543227', 'niapatel@gmail.com', '987, Lotus Lane', 'Vadodara', 'Gujarat', 'India', '390018'),
('Rohan', 'Yadav', '1991-07-19', '9876543228', 'rohanyadav@gmail.com', '123, Aster Road', 'Bhopal', 'Madhya Pradesh', 'India', '462019'),
('Sanjana', 'Rao', '1988-02-02', '9876543229', 'sanjanarao@gmail.com', '456, Daffodil Lane', 'Surat', 'Gujarat', 'India', '395020'),
('Meera', 'Choudhary', '1996-10-25', '9876543230', 'meerachoudhary@gmail.com', '789, Orchid Street', 'Patna', 'Bihar', 'India', '800021'),
('Aanya', 'Malhotra', '1990-12-08', '9876543231', 'aanyamalhotra@gmail.com', '321, Azalea Road', 'Bhubaneswar', 'Odisha', 'India', '751022'),
('Tanvi', 'Jha', '1997-05-15', '9876543232', 'tanvijha@gmail.com', '654, Cedar Street', 'Agra', 'Uttar Pradesh', 'India', '282023'),
('Kanishk', 'Bhardwaj', '1994-08-14', '9876543233', 'kanishkbhardwaj@gmail.com', '987, Maple Avenue', 'Rajkot', 'Gujarat', 'India', '360024'),
('Rishabh', 'Kakkar', '1993-03-27', '9876543234', 'rishabhkakkar@gmail.com', '123, Jasmine Road', 'Navi Mumbai', 'Maharashtra', 'India', '400025'),
('Priya', 'Reddy', '1995-06-30', '9876543235', 'priyareddy@gmail.com', '456, Lotus Lane', 'Patiala', 'Punjab', 'India', '147026'),
('Anaya', 'Sood', '1991-11-15', '9876543236', 'anayapillai@gmail.com', '789, Hibiscus Lane', 'Tirupati', 'Andhra Pradesh', 'India', '517027'),
('Riya', 'Sethi', '1988-02-22', '9876543237', 'riyasethi@gmail.com', '321, Tulip Avenue', 'Raipur', 'Chhattisgarh', 'India', '492028'),
('Vansh', 'Chaturvedi', '1994-05-19', '9876543238', 'vanshchaturvedi@gmail.com', '654, Aster Street', 'Jammu', 'Jammu and Kashmir', 'India', '180029'),
('Shreya', 'Khan', '1992-10-04', '9876543239', 'shreyakhan@gmail.com', '987, Coral Road', 'Srinagar', 'Jammu and Kashmir', 'India', '190030'),
('Nishant', 'Puri', '1995-04-29', '9876543240', 'nishantpuri@gmail.com', '123, River Road', 'Kanpur', 'Uttar Pradesh', 'India', '208001'),
('Anika', 'Rao', '1990-08-22', '9876543241', 'anikarao@gmail.com', '456, Valley Lane', 'Thiruvananthapuram', 'Kerala', 'India', '695001'),
('Kabir', 'Singh', '1992-01-11', '9876543242', 'kabirsingh@gmail.com', '789, Mountain Road', 'Ludhiana', 'Punjab', 'India', '141001'),
('Simran', 'Chopra', '1989-09-17', '9876543243', 'simranchopra@gmail.com', '321, Green Street', 'Bhopal', 'Madhya Pradesh', 'India', '462001'),
('Ritika', 'Nair', '1993-06-30', '9876543244', 'ritikanair@gmail.com', '654, Sunshine Avenue', 'Mysuru', 'Karnataka', 'India', '570001');


/* =========== INSERTS DATA INTO Room TABLE =========== */
INSERT INTO Room (HotelId, RoomNo, RoomType, BedType, PricePerNight, AvailabilityStatus) VALUES 
(100, 101, 'Deluxe', 'King', 5000, 'Available'),
(100, 102, 'Standard', 'Queen', 3500, 'Occupied'),
(101, 201, 'Suite', 'King', 8000, 'Reserved'),
(101, 202, 'Deluxe', 'Twin', 5500, 'Available'),
(102, 301, 'Economy', 'Double', 3000, 'Out of Service'),
(102, 302, 'Standard', 'King', 4000, 'Maintenance'),
(103, 401, 'Luxury', 'King', 10000, 'Available'),
(103, 402, 'Standard', 'Queen', 4500, 'Occupied'),
(104, 501, 'Suite', 'Twin', 7500, 'Available'),
(104, 502, 'Deluxe', 'King', 6000, 'Reserved'),
(105, 601, 'Economy', 'Double', 2500, 'Available'),
(105, 602, 'Standard', 'Queen', 3800, 'Occupied'),
(106, 701, 'Luxury', 'King', 9000, 'Out of Service'),
(106, 702, 'Suite', 'King', 9500, 'Maintenance'),
(107, 801, 'Deluxe', 'Double', 4800, 'Available'),
(107, 802, 'Standard', 'Twin', 3200, 'Reserved'),
(108, 901, 'Economy', 'Queen', 2700, 'Available'),
(108, 902, 'Deluxe', 'King', 5200, 'Occupied'),
(109, 1001, 'Suite', 'Twin', 7200, 'Available'),
(109, 1002, 'Standard', 'Queen', 3900, 'Reserved'),
(110, 1101, 'Luxury', 'King', 8500, 'Occupied'),
(110, 1102, 'Standard', 'Double', 4000, 'Available'),
(111, 1201, 'Economy', 'Twin', 2500, 'Maintenance'),
(111, 1202, 'Deluxe', 'King', 5000, 'Out of Service'),
(112, 1301, 'Suite', 'Double', 9000, 'Available'),
(112, 1302, 'Standard', 'Queen', 3500, 'Occupied'),
(113, 1401, 'Deluxe', 'King', 6000, 'Available'),
(113, 1402, 'Standard', 'Twin', 4500, 'Reserved'),
(114, 1501, 'Economy', 'Double', 2800, 'Occupied'),
(114, 1502, 'Luxury', 'King', 8000, 'Available'),
(115, 1601, 'Suite', 'Twin', 7500, 'Maintenance'),
(115, 1602, 'Deluxe', 'Queen', 5800, 'Available'),
(116, 1701, 'Economy', 'Double', 3100, 'Out of Service'),
(116, 1702, 'Standard', 'King', 4700, 'Reserved'),
(117, 1801, 'Luxury', 'Queen', 8500, 'Occupied'),
(117, 1802, 'Suite', 'King', 9000, 'Available'),
(118, 1901, 'Standard', 'Double', 4000, 'Available'),
(118, 1902, 'Economy', 'Queen', 2700, 'Reserved'),
(119, 2001, 'Deluxe', 'Twin', 5000, 'Maintenance'),
(119, 2002, 'Standard', 'King', 4500, 'Out of Service'),
(120, 2101, 'Luxury', 'Queen', 9500, 'Occupied'),
(120, 2102, 'Suite', 'Double', 8800, 'Available'),
(121, 2201, 'Deluxe', 'King', 6000, 'Reserved'),
(121, 2202, 'Economy', 'Double', 2900, 'Occupied'),
(122, 2301, 'Standard', 'Twin', 3600, 'Available'),
(122, 2302, 'Luxury', 'Queen', 8000, 'Maintenance'),
(123, 2401, 'Suite', 'King', 9200, 'Out of Service'),
(123, 2402, 'Deluxe', 'Double', 5500, 'Available'),
(124, 2501, 'Economy', 'Queen', 2500, 'Occupied'),
(124, 2502, 'Standard', 'King', 4200, 'Reserved'),
(125, 2601, 'Luxury', 'Twin', 8700, 'Available'),
(125, 2602, 'Suite', 'Double', 9400, 'Maintenance'),
(126, 2701, 'Deluxe', 'King', 6100, 'Out of Service'),
(126, 2702, 'Standard', 'Queen', 4700, 'Occupied'),
(127, 2801, 'Economy', 'Double', 3000, 'Available'),
(127, 2802, 'Luxury', 'King', 9300, 'Reserved'),
(128, 2901, 'Suite', 'Twin', 7600, 'Occupied'),
(128, 2902, 'Deluxe', 'King', 6700, 'Available'),
(129, 3001, 'Standard', 'Queen', 4100, 'Maintenance'),
(129, 3002, 'Economy', 'Double', 3200, 'Out of Service'),
(130, 3101, 'Luxury', 'King', 10000, 'Available'),
(130, 3102, 'Suite', 'Twin', 8800, 'Reserved'),
(131, 3201, 'Deluxe', 'Queen', 6000, 'Occupied'),
(131, 3202, 'Standard', 'Double', 4500, 'Available'),
(132, 3301, 'Economy', 'Twin', 2800, 'Maintenance'),
(132, 3302, 'Luxury', 'King', 9000, 'Out of Service'),
(133, 3401, 'Suite', 'King', 7500, 'Available'),
(133, 3402, 'Deluxe', 'Queen', 5500, 'Occupied'),
(134, 3501, 'Standard', 'Double', 3800, 'Reserved'),
(134, 3502, 'Economy', 'Twin', 2700, 'Available'),
(135, 3601, 'Luxury', 'King', 9500, 'Out of Service'),
(135, 3602, 'Suite', 'Queen', 8000, 'Maintenance');

/* =========== INSERTS DATA INTO Reservation TABLE =========== */
INSERT INTO Reservation (CustomerId, RoomId, HotelId, CheckIn, CheckOutDate, NoOfPeople, TotalPrice, BookingDate, ReservationStatus) VALUES 
(1, 1, 100, '2024-10-01', '2024-10-05', 2, 20000.00, '2024-09-28', 'Reserved'),
(2, 2, 101, '2024-10-10', '2024-10-12', 1, 7000.00, '2024-10-05', 'Available'),
(3, 3, 102, '2024-10-20', '2024-10-23', 3, 15000.00, '2024-10-10', 'Reserved'),
(4, 4, 103, '2024-11-01', '2024-11-07', 2, 42000.00, '2024-10-18', 'Available'),
(5, 5, 104, '2024-10-05', '2024-10-08', 4, 18000.00, '2024-10-02', 'Reserved'),
(6, 6, 105, '2024-10-11', '2024-10-15', 2, 16000.00, '2024-10-01', 'Occupied'),
(7, 7, 106, '2024-10-20', '2024-10-22', 1, 8000.00, '2024-10-15', 'Available'),
(8, 8, 107, '2024-11-01', '2024-11-05', 3, 24000.00, '2024-10-18', 'Reserved'),
(9, 9, 108, '2024-10-22', '2024-10-25', 2, 15000.00, '2024-10-15', 'Reserved'),
(10, 10, 109, '2024-10-25', '2024-10-30', 4, 35000.00, '2024-10-10', 'Occupied'),
(11, 11, 110, '2024-11-05', '2024-11-08', 1, 9000.00, '2024-10-25', 'Available'),
(12, 12, 111, '2024-10-15', '2024-10-17', 2, 12000.00, '2024-10-12', 'Reserved'),
(13, 13, 112, '2024-10-20', '2024-10-23', 3, 16000.00, '2024-10-05', 'Available'),
(14, 14, 113, '2024-10-25', '2024-10-28', 2, 14000.00, '2024-10-20', 'Occupied'),
(15, 15, 114, '2024-11-02', '2024-11-04', 1, 7000.00, '2024-10-22', 'Reserved'),
(16, 16, 115, '2024-10-29', '2024-11-03', 4, 34000.00, '2024-10-19', 'Available'),
(17, 17, 116, '2024-10-08', '2024-10-12', 2, 18000.00, '2024-10-01', 'Occupied'),
(18, 18, 117, '2024-10-15', '2024-10-18', 2, 12000.00, '2024-10-05', 'Reserved'),
(19, 19, 118, '2024-11-10', '2024-11-12', 3, 17000.00, '2024-10-30', 'Available'),
(20, 20, 119, '2024-10-22', '2024-10-26', 4, 25000.00, '2024-10-14', 'Occupied'),
(21, 21, 120, '2024-10-30', '2024-11-02', 2, 16000.00, '2024-10-20', 'Available'),
(22, 22, 121, '2024-10-27', '2024-10-30', 3, 18000.00, '2024-10-15', 'Reserved'),
(23, 23, 122, '2024-10-10', '2024-10-12', 2, 9000.00, '2024-10-07', 'Occupied'),
(24, 24, 123, '2024-11-05', '2024-11-08', 1, 12000.00, '2024-10-25', 'Available'),
(25, 25, 124, '2024-11-01', '2024-11-04', 3, 16000.00, '2024-10-20', 'Reserved'),
(26, 26, 125, '2024-10-20', '2024-10-22', 2, 8000.00, '2024-10-10', 'Occupied'),
(27, 27, 126, '2024-10-18', '2024-10-21', 4, 28000.00, '2024-10-05', 'Available'),
(28, 28, 127, '2024-10-25', '2024-10-28', 2, 14000.00, '2024-10-18', 'Reserved'),
(29, 29, 128, '2024-10-05', '2024-10-07', 3, 12000.00, '2024-09-30', 'Occupied'),
(30, 30, 129, '2024-11-10', '2024-11-12', 2, 8000.00, '2024-10-30', 'Available'),
(31, 31, 130, '2024-10-15', '2024-10-19', 1, 14000.00, '2024-10-05', 'Reserved'),
(32, 32, 131, '2024-10-28', '2024-11-01', 4, 25000.00, '2024-10-20', 'Available'),
(33, 33, 132, '2024-11-04', '2024-11-06', 2, 10000.00, '2024-10-24', 'Occupied'),
(34, 34, 133, '2024-10-01', '2024-10-03', 3, 6000.00, '2024-09-25', 'Reserved'),
(35, 35, 134, '2024-10-20', '2024-10-23', 2, 16000.00, '2024-10-15', 'Available');

/* =========== INSERTS DATA INTO Payment TABLE =========== */
INSERT INTO Payment (PaymentDate, ReservationId, Amount, PaymentStatus, PaymentMethod) VALUES
('2024-09-28', 1000, 20000.00, 'Completed', 'Credit Card'),
('2024-10-05', 1001, 7000.00, 'Completed', 'Debit Card'),
('2024-10-10', 1002, 15000.00, 'Completed', 'Google Pay'),
('2024-10-18', 1003, 42000.00, 'Completed', 'Net Banking'),
('2024-10-02', 1004, 18000.00, 'Completed', 'PayPal'),
('2024-10-01', 1005, 16000.00, 'Completed', 'Cash'),
('2024-10-15', 1006, 8000.00, 'Pending', 'Debit Card'),
('2024-10-18', 1007, 24000.00, 'Refunded', 'Bank Transfer'),
('2024-10-15', 1008, 15000.00, 'Completed', 'Google Pay'),
('2024-10-10', 1009, 35000.00, 'Cancelled', 'Credit Card'),
('2024-10-25', 1010, 9000.00, 'Completed', 'Cash'),
('2024-10-12', 1011, 12000.00, 'Failed', 'Net Banking'),
('2024-10-05', 1012, 16000.00, 'Completed', 'Debit Card'),
('2024-10-20', 1013, 14000.00, 'Completed', 'Gift Card'),
('2024-10-22', 1014, 7000.00, 'Completed', 'Amazon Pay'),
('2024-10-19', 1015, 34000.00, 'Completed', 'Credit Card'),
('2024-10-01', 1016, 18000.00, 'Authorized', 'Google Pay'),
('2024-10-05', 1017, 12000.00, 'Completed', 'Cash'),
('2024-10-30', 1018, 17000.00, 'Cancelled', 'Net Banking'),
('2024-10-14', 1019, 25000.00, 'Completed', 'Debit Card'),
('2024-10-20', 1020, 16000.00, 'Partially Refunded', 'Credit Card'),
('2024-10-15', 1021, 18000.00, 'Completed', 'PayPal'),
('2024-10-07', 1022, 9000.00, 'Declined', 'Google Pay'),
('2024-10-25', 1023, 12000.00, 'Completed', 'Bank Transfer'),
('2024-10-20', 1024, 16000.00, 'Completed', 'Cash'),
('2024-10-10', 1025, 8000.00, 'Refunded', 'Gift Card'),
('2024-10-05', 1026, 28000.00, 'Completed', 'Amazon Pay'),
('2024-10-18', 1027, 14000.00, 'Pending', 'Credit Card'),
('2024-09-30', 1028, 12000.00, 'Completed', 'Cheque'),
('2024-10-30', 1029, 8000.00, 'Completed', 'Google Pay'),
('2024-10-05', 1030, 14000.00, 'Authorized', 'Net Banking'),
('2024-10-20', 1031, 25000.00, 'Completed', 'Apple Pay'),
('2024-10-24', 1032, 10000.00, 'Completed', 'Cryptocurrency'),
('2024-09-25', 1033, 6000.00, 'Completed', 'Debit Card'),
('2024-10-15', 1034, 16000.00, 'Completed', 'Google Pay');

/* =========== INSERTS DATA INTO Facility TABLE =========== */
INSERT INTO Facility (HotelId, FacilityName, Description) VALUES
(100, 'Swimming Pool', 'An outdoor pool with temperature control and lifeguard service available.'),
(101, 'Gym', 'Fully equipped gym with personal trainers available from 6 AM to 10 PM.'),
(102, 'Spa', 'A luxury spa offering ayurvedic treatments and massages.'),
(103, 'Restaurant', 'Multi-cuisine restaurant serving Indian, Continental, and Chinese food.'),
(104, 'Conference Hall', 'Spacious hall with a seating capacity of 300 people and modern AV equipment.'),
(105, 'Parking', 'Secure parking facility with 24x7 CCTV surveillance.'),
(106, 'Free Wi-Fi', 'High-speed internet available throughout the hotel premises.'),
(107, 'Bar', 'In-house bar offering a wide variety of wines, cocktails, and spirits.'),
(108, 'Laundry Service', 'Same-day laundry and dry cleaning service available.'),
(109, 'Airport Shuttle', 'Complimentary airport pick-up and drop-off services.'),
(110, 'Kids Play Area', 'Dedicated play zone for children with toys and games.'),
(111, 'Business Center', 'Workstations with computers, printers, and high-speed internet.'),
(112, 'Banquet Hall', 'Ideal for weddings and large events with catering options.'),
(113, 'Rooftop Lounge', 'Open-air lounge offering panoramic views of the city.'),
(114, 'Yoga Center', 'Morning and evening yoga sessions conducted by professionals.'),
(115, 'Pet-Friendly Facility', 'Pets allowed with special arrangements on request.'),
(116, 'Library', 'A quiet space with a collection of books across genres.'),
(117, 'Medical Assistance', 'On-call doctor available 24x7 for emergencies.'),
(118, 'Game Room', 'Indoor games like pool, table tennis, and board games.'),
(119, 'Valet Parking', 'Valet service available for hassle-free parking.'),
(120, 'Salon', 'Haircuts, grooming, and beauty services available.'),
(121, 'Bicycle Rental', 'Bicycles available for rent to explore the city.'),
(122, 'Cinema Room', 'Private screening room with a selection of movies.'),
(123, 'Garden', 'Lush green garden area ideal for morning walks.'),
(124, 'Fireplace Lounge', 'Cozy lounge with a fireplace for the winter season.'),
(125, '24-Hour Room Service', 'Round-the-clock room service with a full menu.'),
(126, 'Jacuzzi', 'Private Jacuzzi facility available on request.'),
(127, 'Mini Golf Course', 'A small golf course for guests to enjoy.'),
(128, 'ATM', 'In-house ATM for easy cash withdrawals.'),
(129, 'Courier Service', 'Parcel and courier service available at the reception.'),
(130, 'Tours & Travel Desk', 'Assistance with travel bookings and city tours.'),
(131, 'Event Management', 'Professional event planning and management service.'),
(132, 'Car Rental', 'Luxury cars available for rental with or without driver.'),
(133, 'Electric Vehicle Charging Station', 'EV charging points available in the parking area.'),
(134, 'Security Service', '24x7 security personnel and CCTV surveillance.'),
(135, 'Helipad', 'Helipad available for VIP guests and emergency situations.');

/* =========== INSERTS DATA INTO Service TABLE =========== */
INSERT INTO Service (ServiceName, ServiceCost, HotelId) VALUES
('Room Cleaning', 500.00, 100),
('Laundry', 300.00, 101),
('In-Room Dining', 800.00, 102),
('Spa Treatment', 2500.00, 103),
('Airport Pickup', 1500.00, 104),
('Valet Parking', 700.00, 105),
('Gym Access', 200.00, 106),
('Massage Therapy', 3000.00, 107),
('Tour Guide', 5000.00, 108),
('Daily Newspaper', 50.00, 109),
('Car Rental', 6000.00, 110),
('Mini Bar Refill', 1200.00, 111),
('Wi-Fi Upgrade', 300.00, 112),
('Baby Sitting', 2000.00, 113),
('Event Catering', 8000.00, 114),
('Courier Service', 250.00, 115),
('Pet Sitting', 1500.00, 116),
('Yoga Classes', 500.00, 117),
('Doctor on Call', 1000.00, 118),
('Haircut', 1200.00, 119),
('Breakfast Buffet', 900.00, 120),
('Electric Car Rental', 7500.00, 121),
('Business Center Use', 1000.00, 122),
('Bicycle Rental', 300.00, 123),
('Private Movie Screening', 2000.00, 124),
('Wine Tasting', 5000.00, 125),
('Fireplace Lounge Access', 1500.00, 126),
('Golf Course Use', 3500.00, 127),
('ATM Service Fee', 100.00, 128),
('Luxury Car Rental', 9000.00, 129),
('Conference Hall Setup', 12000.00, 130),
('Helicopter Ride', 25000.00, 131),
('Laundry Express', 600.00, 132),
('Game Room Access', 400.00, 133),
('Electric Vehicle Charging', 200.00, 134),
('Banquet Hall Use', 15000.00, 135);

/* =========== INSERTS DATA INTO Staff TABLE =========== */
INSERT INTO Staff (HotelId, FirstName, LastName, JobPosition, PhoneNo, Email, HireDate, Salary) VALUES
(100, 'Rajesh', 'Sharma', 'General Manager', '9876543210', 'rajesh.sharma@gmail.com', '2019-01-10', 80000.00),
(101, 'Priya', 'Verma', 'Receptionist', '9867554321', 'priya.verma@gmail.com', '2021-03-15', 25000.00),
(102, 'Amit', 'Singh', 'Housekeeping Manager', '9876541234', 'amit.singh@gmail.com', '2018-07-22', 40000.00),
(103, 'Suman', 'Kumar', 'Chef', '9876545678', 'suman.kumar@gmail.com', '2020-08-05', 60000.00),
(104, 'Rohit', 'Jain', 'Bellboy', '9845123456', 'rohit.jain@gmail.com', '2022-05-14', 18000.00),
(105, 'Neha', 'Tiwari', 'HR Manager', '9856231470', 'neha.tiwari@gmail.com', '2019-12-10', 50000.00),
(106, 'Vikash', 'Mishra', 'Security Officer', '9845043210', 'vikash.mishra@gmail.com', '2021-04-25', 30000.00),
(107, 'Sneha', 'Pandey', 'Spa Therapist', '9876589432', 'sneha.pandey@gmail.com', '2020-11-19', 35000.00),
(108, 'Arjun', 'Rao', 'Valet', '9876123456', 'arjun.rao@gmail.com', '2023-02-01', 15000.00),
(109, 'Kavita', 'Yadav', 'Event Planner', '9867345120', 'kavita.yadav@gmail.com', '2022-01-20', 55000.00),
(110, 'Ramesh', 'Patil', 'Electrician', '9876054321', 'ramesh.patil@gmail.com', '2017-06-10', 25000.00),
(111, 'Sunil', 'Mehta', 'Bar Manager', '9845120987', 'sunil.mehta@gmail.com', '2020-09-15', 45000.00),
(112, 'Ankita', 'Joshi', 'Yoga Instructor', '9845723110', 'ankita.joshi@gmail.com', '2021-07-18', 30000.00),
(113, 'Vijay', 'Rana', 'Tour Guide', '9876765432', 'vijay.rana@gmail.com', '2018-03-23', 28000.00),
(114, 'Deepak', 'Kashyap', 'IT Technician', '9856012345', 'deepak.kashyap@gmail.com', '2022-08-12', 35000.00),
(115, 'Meera', 'Desai', 'Marketing Manager', '9845123409', 'meera.desai@gmail.com', '2019-10-21', 65000.00),
(116, 'Harish', 'Saxena', 'Accountant', '9876145678', 'harish.saxena@gmail.com', '2020-01-05', 40000.00),
(117, 'Pooja', 'Kapoor', 'Laundry Supervisor', '9867321098', 'pooja.kapoor@gmail.com', '2018-04-18', 22000.00),
(118, 'Ajay', 'Thakur', 'Concierge', '9876128907', 'ajay.thakur@gmail.com', '2023-06-01', 26000.00),
(119, 'Divya', 'Malhotra', 'Room Service Attendant', '9867543021', 'divya.malhotra@gmail.com', '2021-09-12', 20000.00),
(120, 'Karan', 'Chopra', 'Fitness Trainer', '9845312768', 'karan.chopra@gmail.com', '2020-12-17', 32000.00),
(121, 'Siddharth', 'Bansal', 'Waiter', '9876056789', 'siddharth.bansal@gmail.com', '2017-02-10', 18000.00),
(122, 'Ritika', 'Agrawal', 'Assistant Chef', '9845012345', 'ritika.agrawal@gmail.com', '2022-10-23', 28000.00),
(123, 'Naveen', 'Kaur', 'Lifeguard', '9856743210', 'naveen.kaur@gmail.com', '2021-05-01', 22000.00),
(124, 'Farhan', 'Ali', 'Inventory Manager', '9876987654', 'farhan.ali@gmail.com', '2019-08-09', 42000.00),
(125, 'Anita', 'Patel', 'Banquet Coordinator', '9867212345', 'anita.patel@gmail.com', '2023-03-05', 50000.00),
(126, 'Gaurav', 'Verma', 'IT Manager', '9845109876', 'gaurav.verma@gmail.com', '2020-06-30', 60000.00),
(127, 'Mahesh', 'Kulkarni', 'Chef', '9856123456', 'mahesh.kulkarni@gmail.com', '2018-02-14', 55000.00),
(128, 'Bhavna', 'Shah', 'Housekeeper', '9845321768', 'bhavna.shah@gmail.com', '2021-08-11', 22000.00),
(129, 'Tarun', 'Sen', 'Barista', '9867543219', 'tarun.sen@gmail.com', '2022-11-25', 18000.00),
(130, 'Alok', 'Gupta', 'Maintenance Engineer', '9845098765', 'alok.gupta@gmail.com', '2017-12-03', 38000.00),
(131, 'Geeta', 'Bhatt', 'Receptionist', '9856712345', 'geeta.bhatt@gmail.com', '2019-07-22', 24000.00),
(132, 'Rahul', 'Shukla', 'Accountant', '9876124789', 'rahul.shukla@gmail.com', '2020-11-30', 38000.00),
(133, 'Shivani', 'Reddy', 'Spa Manager', '9845012567', 'shivani.reddy@gmail.com', '2021-02-15', 45000.00),
(134, 'Yash', 'Kapoor', 'Event Coordinator', '9856312456', 'yash.kapoor@gmail.com', '2022-04-10', 50000.00),
(135, 'Monika', 'Singh', 'Laundry Staff', '9876098761', 'monika.singh@gmail.com', '2023-01-27', 20000.00);


/* =========== INSERTS DATA INTO Review TABLE =========== */
INSERT INTO Review (CustomerId, HotelId, Rating, Remarks, ReviewDate) VALUES  
(1, 100, 4.50, 'Excellent service and clean rooms.', '2024-01-15 12:30:00'),  
(2, 101, 3.75, 'Good stay, but the food could have been better.', '2024-02-12 09:45:00'),  
(3, 102, 4.00, 'Nice location and friendly staff.', '2024-03-22 14:20:00'),  
(4, 103, 2.50, 'Rooms need renovation. Not worth the price.', '2024-04-05 17:50:00'),  
(5, 104, 5.00, 'Amazing experience! Will visit again.', '2024-05-18 10:15:00'),  
(6, 105, 3.25, 'Decent stay but had some issues with AC.', '2024-06-21 11:40:00'),  
(7, 106, 4.75, 'Fantastic hospitality and delicious food.', '2024-07-08 19:00:00'),  
(8, 107, 2.00, 'Staff was unresponsive, and room was dirty.', '2024-08-10 08:30:00'),  
(9, 108, 4.20, 'Comfortable stay with good amenities.', '2024-09-14 16:45:00'),  
(10, 109, 3.80, 'Satisfactory experience overall.', '2024-10-01 13:10:00'),  
(11, 110, 5.00, 'Perfect stay! Everything was top-notch.', '2024-10-12 15:00:00'),  
(12, 111, 3.00, 'Average experience. Could improve.', '2024-04-15 10:20:00'),  
(13, 112, 4.00, 'Clean rooms and courteous staff.', '2024-05-22 11:35:00'),  
(14, 113, 4.50, 'Loved the ambience and food quality.', '2024-06-03 14:45:00'),  
(15, 114, 3.50, 'Good hotel but the check-in process was slow.', '2024-07-14 09:00:00'),  
(16, 115, 4.80, 'Exceptional service! Highly recommended.', '2024-08-18 18:30:00'),  
(17, 116, 2.75, 'Some maintenance issues in the room.', '2024-09-05 12:10:00'),  
(18, 117, 4.90, 'Luxurious stay with great facilities.', '2024-10-07 20:45:00'),  
(19, 118, 3.10, 'Decent stay, but the food was overpriced.', '2024-01-22 15:15:00'),  
(20, 119, 4.60, 'Pleasant stay and friendly staff.', '2024-02-19 11:25:00'),  
(21, 120, 2.25, 'Poor cleanliness and service.', '2024-03-11 09:45:00'),  
(22, 121, 4.30, 'Comfortable stay with great food.', '2024-04-27 19:00:00'),  
(23, 122, 3.40, 'Good hotel but noisy surroundings.', '2024-05-19 08:30:00'),  
(24, 123, 4.85, 'Amazing experience! Will recommend.', '2024-06-13 16:30:00'),  
(25, 124, 3.60, 'Good facilities but service needs improvement.', '2024-07-25 14:50:00'),  
(26, 125, 2.80, 'Rooms were too small for the price.', '2024-08-03 12:40:00'),  
(27, 126, 4.00, 'Nice stay overall.', '2024-09-10 10:15:00'),  
(28, 127, 4.95, 'Best experience ever!', '2024-10-09 15:30:00'),  
(29, 128, 3.70, 'Decent hotel but parking was an issue.', '2024-01-30 13:25:00'),  
(30, 129, 4.10, 'Good rooms and friendly reception.', '2024-02-15 10:50:00'),  
(31, 130, 2.00, 'Bad experience. Not recommended.', '2024-03-29 19:20:00'),  
(32, 131, 4.40, 'Lovely ambiance and nice staff.', '2024-04-17 09:30:00'),  
(33, 132, 3.90, 'Good value for money.', '2024-05-23 12:35:00'),  
(34, 133, 4.20, 'Nice place to stay with family.', '2024-06-27 18:10:00'),  
(35, 134, 3.55, 'Average service but decent rooms.', '2024-07-12 20:15:00');

select * from Customer;
select * from Hotel;
select * from Room;
select * from Payment;
select * from Reservation;
select * from Review;
select * from Service;
select * from Staff;
select * from Payment;

USE CheckInn;
USE master;

-- 1. Write the SQL Query for displaying for each room type, list the total number of bookings and the average revenue per booking

SELECT Room.RoomType, COUNT(Reservation.ReservationId) AS total_bookings, AVG(Payment.Amount) AS average_revenue_per_booking
FROM Room 
JOIN Reservation ON Room.RoomId = Reservation.RoomId
JOIN Payment ON Reservation.ReservationId = Payment.ReservationId
GROUP BY Room.RoomType;

-- 2. Write the Sql query to Find the city ans states of the branches of the hotels, the first and last names of the customers 
-- who have stayed in each hotel branch and has reserved a particular room in which the month of Booking and Checking are same

SELECT h.City, h.State, c.FirstName, c.LastName, re.ReservationId, MONTH(re.BookingDate) AS BookingMonth, MONTH(re.CheckIn) AS CheckInMonth
FROM Hotel h JOIN Reservation re ON h.HotelId = re.HotelId
JOIN Customer c ON re.CustomerId = c.CustomerId
WHERE MONTH(re.BookingDate) = MONTH(re.CheckIn);

-- 3. Write sql query to Retrieve the list of guests who have never booked and reserved  a room and made payment below a specific rate
-- (say Rs 1000)

SELECT c.CustomerId,c.FirstName,c.LastName,c.PhoneNo,c.Email
FROM Customer c LEFT JOIN Reservation re ON c.CustomerId = re.CustomerId
LEFT JOIN Payment p ON re.ReservationId = p.ReservationId
WHERE re.ReservationId IS NULL -- Ensures the customer has never booked or reserved a room 
OR (p.Amount < 1000 AND re.ReservationId IS NOT NULL); -- Checks for payments below Rs 800 if a reservation exists



-- 4. Write sql query to Display the most common room type booked by guests from each country and their ratings 

SELECT 
    c.Country,
    r.RoomType,
    COUNT(re.ReservationId) AS total_bookings,
    AVG(rv.Rating) AS average_rating
FROM 
    Customer c
JOIN 
    Reservation re ON c.CustomerId = re.CustomerId
JOIN 
    Room r ON re.RoomId = r.RoomId
LEFT JOIN 
    Review rv ON re.CustomerId = rv.CustomerId AND re.HotelId = rv.HotelId
GROUP BY 
    c.Country, r.RoomType
HAVING 
    COUNT(re.ReservationId) = (
        SELECT MAX(total_bookings)
        FROM (
            SELECT 
                COUNT(sub_re.ReservationId) AS total_bookings
            FROM 
                Customer sub_c
            JOIN 
                Reservation sub_re ON sub_c.CustomerId = sub_re.CustomerId
            JOIN 
                Room sub_r ON sub_re.RoomId = sub_r.RoomId
            WHERE 
                sub_c.Country = c.Country
            GROUP BY 
                sub_r.RoomType
        ) AS sub_query
    )
ORDER BY 
    c.Country, total_bookings DESC;


-- 5. Write the Sql query to display the most common room type booked by guests along with their names
-- and the maximum no of rooms booked for a particular room typefrom each country

SELECT 
    c.Country,
    c.FirstName,
    c.LastName,
    r.RoomType,
    COUNT(re.ReservationId) AS total_bookings
FROM 
    Customer c
JOIN 
    Reservation re ON c.CustomerId = re.CustomerId
JOIN 
    Room r ON re.RoomId = r.RoomId
GROUP BY 
    c.Country, c.FirstName, c.LastName, r.RoomType
HAVING 
    COUNT(re.ReservationId) = (
        SELECT MAX(room_booking_count)
        FROM (
            SELECT 
                sub_c.Country,
                sub_r.RoomType,
                COUNT(sub_re.ReservationId) AS room_booking_count
            FROM 
                Customer sub_c
            JOIN 
                Reservation sub_re ON sub_c.CustomerId = sub_re.CustomerId
            JOIN 
                Room sub_r ON sub_re.RoomId = sub_r.RoomId
            GROUP BY 
                sub_c.Country, sub_r.RoomType
        ) AS sub_query
        WHERE sub_query.Country = c.Country
    )
ORDER BY 
    c.Country, total_bookings DESC;



-- 6. Write the Sql query to Find each hotel branch's least popular room type based on the total number of bookings and display the amount paid 
-- by each customer according to room type for each hotel
WITH RoomBookings AS (
    SELECT h.HotelId, h.Name AS HotelName, r.RoomType, COUNT(re.ReservationId) AS total_bookings, SUM(p.Amount) AS total_paid
    FROM  Hotel h JOIN  Room r ON h.HotelId = r.HotelId
    LEFT JOIN Reservation re ON r.RoomId = re.RoomId
    LEFT JOIN Payment p ON re.ReservationId = p.ReservationId
    GROUP BY h.HotelId, h.Name, r.RoomType
),
LeastPopularRoomTypes AS (
    SELECT HotelId, MIN(total_bookings) AS least_bookings
    FROM RoomBookings GROUP BY HotelId
)
SELECT  rb.HotelName, rb.RoomType, rb.total_bookings, rb.total_paid
FROM RoomBookings rb
JOIN LeastPopularRoomTypes lpr ON rb.HotelId = lpr.HotelId AND rb.total_bookings = lpr.least_bookings
ORDER BY rb.HotelName, rb.RoomType;



-- 10. Write the Sql query to List each guests total spend across all hotel branches booked and reserved and the type of rooms theyve stayed 
-- in and the total payment for each room in each hotel reserved and booked

SELECT c.CustomerId,c.FirstName,c.LastName, h.Name AS HotelName, r.RoomType, SUM(p.Amount) AS TotalPayment, COUNT(re.ReservationId) AS TotalBookings
FROM Customer c JOIN Reservation re ON c.CustomerId = re.CustomerId
JOIN Room r ON re.RoomId = r.RoomId
JOIN Hotel h ON r.HotelId = h.HotelId
JOIN Payment p ON re.ReservationId = p.ReservationId
GROUP BY c.CustomerId, c.FirstName, c.LastName, h.Name, r.RoomType
ORDER BY c.CustomerId, h.Name;


-- 11. write a query to find, for each month, list the branch with the highest total revenue, showing the no of custoers per hotel reserved and booked with showing 
-- only months where revenue is less than 50,00

WITH MonthlyRevenue AS (
    SELECT h.HotelId,h.Name AS HotelName, MONTH(re.CheckIn) AS BookingMonth, YEAR(re.CheckIn) AS BookingYear,SUM(p.Amount) AS TotalRevenue, COUNT(DISTINCT re.CustomerId) AS TotalCustomers
    FROM Hotel h
    JOIN Room r ON h.HotelId = r.HotelId
    JOIN Reservation re ON r.RoomId = re.RoomId
    JOIN Payment p ON re.ReservationId = p.ReservationId
    GROUP BY h.HotelId, h.Name, MONTH(re.CheckIn), YEAR(re.CheckIn)
),
RankedRevenue AS (
    SELECT BookingMonth,BookingYear,HotelName,TotalRevenue,TotalCustomers,RANK() OVER (PARTITION BY BookingYear, BookingMonth ORDER BY TotalRevenue DESC) AS RevenueRank
    FROM MonthlyRevenue
)
SELECT BookingMonth,BookingYear,HotelName,TotalRevenue,TotalCustomers
FROM RankedRevenue
WHERE RevenueRank = 1 AND TotalRevenue < 50000
ORDER BY BookingYear, BookingMonth;


 -- 12. write a query to find the guests who have booked the most popular room type of each hotel in the hotel system and the rating of the hotel 
 -- according to the most popular room type of each hotel 

WITH PopularRoomType AS (
    SELECT h.HotelId,h.Name AS HotelName,r.RoomType,COUNT(re.ReservationId) AS TotalBookings,RANK() OVER (PARTITION BY h.HotelId ORDER BY COUNT(re.ReservationId) DESC) AS RoomRank
    FROM Hotel h JOIN Room r ON h.HotelId = r.HotelId
    JOIN Reservation re ON r.RoomId = re.RoomId
    GROUP BY h.HotelId, h.Name, r.RoomType
),
GuestsWithPopularRoom AS (
    SELECT c.CustomerId, c.FirstName,c.LastName,h.HotelId,h.Name AS HotelName,r.RoomType,r.PricePerNight, hr.Rating
    FROM PopularRoomType prt
    JOIN Room r ON prt.HotelId = r.HotelId AND prt.RoomType = r.RoomType
    JOIN Reservation re ON r.RoomId = re.RoomId
    JOIN Customer c ON re.CustomerId = c.CustomerId
    JOIN Hotel h ON prt.HotelId = h.HotelId
    JOIN Review hr ON h.HotelId = hr.HotelId AND r.RoomType = hr.RoomType
    WHERE prt.RoomRank = 1
)
SELECT g.CustomerId,g.FirstName,g.LastName,g.HotelName,g.RoomType,g.PricePerNight,AVG(g.Rating) AS AverageRating
FROM GuestsWithPopularRoom g
GROUP BY g.CustomerId, g.FirstName, g.LastName, g.HotelName, g.RoomType, g.PricePerNight
ORDER BY g.HotelName, g.RoomType;



-- 15. Write a SQL query to find the no of customers , their names and average price paid by each customer according to each room type in each hotel branch
-- and the total payment made by the customer after booking and reserving a particular room on the date of CheckIn and CheckOut who stayed in each hotel branch. 
-- Also list out the Facilities provided by each hotel and the name of the staff  and count the no of staffs for each hotel and according to the facilties provided 
-- by each hotel branch , display the reviews of each hotel along with the maximum average rating of a particular hotel branch according to its room and Facilities

WITH CustomerPayments AS (
    SELECT c.CustomerId,c.FirstName,c.LastName,h.HotelId,h.Name AS HotelName,r.RoomType,AVG(p.Amount) AS AveragePricePaid,SUM(p.Amount) AS TotalPayment,COUNT(DISTINCT re.ReservationId) AS TotalBookings
    FROM Customer c
    JOIN Reservation re ON c.CustomerId = re.CustomerId
    JOIN Room r ON re.RoomId = r.RoomId
    JOIN Hotel h ON r.HotelId = h.HotelId
    JOIN Payment p ON re.ReservationId = p.ReservationId
    GROUP BY c.CustomerId, c.FirstName, c.LastName, h.HotelId, h.Name, r.RoomType
),
HotelFacilities AS (
    SELECT h.HotelId,h.Name AS HotelName,f.FacilityName,COUNT(s.StaffId) AS StaffCount
    FROM Hotel h LEFT JOIN Facility f ON h.HotelId = f.HotelId
    LEFT JOIN Staff s ON h.HotelId = s.HotelId GROUP BY h.HotelId, h.Name, f.FacilityName
),
HotelReviews AS (
    SELECT h.HotelId,AVG(r.Rating) AS AverageRating,COUNT(r.ReviewId) AS ReviewCount
    FROM Hotel h
    LEFT JOIN Review r ON h.HotelId = r.HotelId GROUP BY h.HotelId
)

SELECT cp.CustomerId,cp.FirstName,cp.LastName,cp.HotelName,cp.RoomType,cp.AveragePricePaid,cp.TotalPayment,hf.FacilityName,hf.StaffCount,hr.AverageRating,hr.ReviewCount
FROM CustomerPayments cp
JOIN HotelFacilities hf ON cp.HotelId = hf.HotelId
JOIN HotelReviews hr ON cp.HotelId = hr.HotelId
ORDER BY cp.HotelName, cp.CustomerId;

