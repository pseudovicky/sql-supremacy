create database customerDB;
use customerDB;
-- the table should include these 
CREATE TABLE CustomerTable (
   CustomerID int unique primary key,
   LastName varchar(255) not null,
   FirstName varchar(255)not null,
   Email varchar(255) unique not null,
   PhoneNumber varchar(20) check (PhoneNumber REGEXP '^[0-9]{10,15}$')
);
-- Then insert records for three customer into this table.
insert into CustomerTable (CustomerID, LastName, FirstName, Email, PhoneNumber )
values 
(123,'Kumar','Vicky','sudovicky@gmail.com','2340973343'),
(124,'Mehta','Rohan','rohan@gmail.com','2345676543'),
(125,'john','wick','john@gmail.com','3456784345');

select  * from CustomerTable;
-- you relize that you need to store the dob of each customer. Add a new column called dateOfbirth to the customer table.
ALTER TABLE CustomerTable ADD DateOfBirth Date;
-- update the dob column for thw existing customer in the customer table.
UPDATE CustomerTable 
SET DateOfBirth = '2002-05-06'
WHERE CustomerID = 123;

UPDATE CustomerTable 
SET DateOfBirth = '2000-05-09'
WHERE CustomerID = 124;

UPDATE CustomerTable 
SET DateOfBirth = '2001-10-10'
WHERE CustomerID = 125;

select  * from CustomerTable;

-- the company wants to rename the email column to ContactEmail to make it clearer. Modify the column name in the customer table.
ALTER TABLE customerTable
RENAME COLUMN Email TO ContactEmail;

select  * from CustomerTable;
-- A customer with customerID = 2 has requested to have their information removed from the system. Delete this customer's record from the customer table
DELETE FROM CustomerTable
WHERE customerID = 123;
select  * from CustomerTable;

-- The cumpany decides that storing customer phonenumber is no longer nessessary. Remove the phone number column from the customer table
ALTER TABLE customer
DROP COLUMN phoneNumber;
select  * from CustomerTable;
-- The cumpany wants to ensure that the dob column allows for storing more specific time information , not just the date, change the data type of the dob column from date to datetime.
ALTER TABLE customer
MODIFY DateOfBirth DATETIME;

select  * from CustomerTable;

-- after migrating to a new database system , the customer table is no longer needed . Drop the customer table from the database.

