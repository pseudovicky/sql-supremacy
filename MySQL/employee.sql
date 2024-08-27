Create database ORG;
Use ORG;


CREATE TABLE Employees (
   EmployeeID int unique primary key,
   LastName varchar(255) not null,
   FirstName varchar(255)not null,
   Email varchar(255) unique not null,
   PhoneNumber varchar(20) check (PhoneNumber REGEXP '^[0-9]{10,15}$'),
   Salary int CHECK (Salary BETWEEN 30000 AND 2000000)
);

INSERT INTO Employees (EmployeeID, LastName, FirstName, Email, PhoneNumber, Salary) VALUES
(1, 'Smith', 'John', 'john.smith@example.com', '5551234567', 55000),
(2, 'Johnson', 'Emily', 'emily.johnson@example.com', '5552345678', 62000),
(3, 'Williams', 'Michael', 'michael.williams@example.com', '5553456789', 75000),
(4, 'Brown', 'Jessica', 'jessica.brown@example.com', '5554567890', 80000),
(5, 'Jones', 'Daniel', 'daniel.jones@example.com', '5555678901', 90000),
(6, 'Garcia', 'Laura', 'laura.garcia@example.com', '5556789012', 67000),
(7, 'Miller', 'Christopher', 'christopher.miller@example.com', '5557890123', 72000),
(8, 'Davis', 'Sarah', 'sarah.davis@example.com', '5558901234', 51000),
(9, 'Rodriguez', 'David', 'david.rodriguez@example.com', '5559012345', 53000),
(10, 'Martinez', 'Sophia', 'sophia.martinez@example.com', '5550123456', 61000),
(11, 'Hernandez', 'James', 'james.hernandez@example.com', '5551230987', 100000),
(12, 'Lopez', 'Olivia', 'olivia.lopez@example.com', '5552340987', 45000),
(13, 'Gonzalez', 'Joshua', 'joshua.gonzalez@example.com', '5553450987', 95000),
(14, 'Wilson', 'Mia', 'mia.wilson@example.com', '5554560987', 64000),
(15, 'Anderson', 'Benjamin', 'benjamin.anderson@example.com', '5555670987', 88000),
(16, 'Thomas', 'Abigail', 'abigail.thomas@example.com', '5556780987', 60000),
(17, 'Taylor', 'Alexander', 'alexander.taylor@example.com', '5557890987', 120000),
(18, 'Moore', 'Isabella', 'isabella.moore@example.com', '5558900987', 70000),
(19, 'Jackson', 'Andrew', 'andrew.jackson@example.com', '5559010987', 53000),
(20, 'Martin', 'Charlotte', 'charlotte.martin@example.com', '5550123987', 65000),
(21, 'Lee', 'William', 'william.lee@example.com', '5551234560', 95000),
(22, 'Perez', 'Evelyn', 'evelyn.perez@example.com', '5552345670', 58000),
(23, 'Thompson', 'Samuel', 'samuel.thompson@example.com', '5553456780', 87000),
(24, 'White', 'Amelia', 'amelia.white@example.com', '5554567890', 92000),
(25, 'Harris', 'Elijah', 'elijah.harris@example.com', '5555678900', 98000),
(26, 'Sanchez', 'Ava', 'ava.sanchez@example.com', '5556789010', 63000),
(27, 'Clark', 'Joseph', 'joseph.clark@example.com', '5557890120', 150000),
(28, 'Ramirez', 'Victoria', 'victoria.ramirez@example.com', '5558901230', 53000),
(29, 'Lewis', 'Liam', 'liam.lewis@example.com', '5559012340', 105000),
(30, 'Robinson', 'Grace', 'grace.robinson@example.com', '5550123450', 110000);




SELECT  * FROM employees;

INSERT INTO Employees (EmployeeID, LastName, FirstName, Email, PhoneNumber, Salary) VALUES
(40, 'Kumar', 'Vicky', 'sudovicky@gmail.com', '7295818429', 70000);

SELECT  * FROM employees;


CREATE TABLE Department (
   DepartmentID int unique primary key,
   DepartmentName varchar(50) not null,
   ManagerName varchar(50)not null
);

INSERT INTO Department (DepartmentID, DepartmentName, ManagerName) VALUES
(99,'Testing','rohan'),
(100,'Development','vicky'),
(111, 'Human Resources', 'Alice Johnson'),
(112, 'Finance', 'Robert Smith'),
(103, 'Engineering', 'Emily Davis'),
(104, 'Sales', 'Michael Brown'),
(105, 'Marketing', 'Sarah Taylor'),
(106, 'IT', 'David Wilson'),
(107, 'Customer Support', 'Laura Martinez'),
(108, 'Legal', 'James Anderson'),
(109, 'Operations', 'Jessica Thomas'),
(110, 'Product Development', 'Christopher White');


select * from Department;

ALTER TABLE Employees
ADD DepartmentID int;

select * from Employees;

ALTER TABLE Employees
ADD CONSTRAINT fk_Department
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

-- UPDATE Employees
select * from Employees;


-- INSERT INTO Department (DepartmentID, DepartmentName, ManagerName) VALUES






-- ALTER TABLE Employees
-- ADD CONSTRAINT fk_Department
-- FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

-- alter table employees 
-- add DepartmentID int FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

select * from Department;
select * from Employees;

-- alter table Employees
-- foreign key (DapartmentID) references Employeees(EmployeeID);
-- DepartmentID int foreign key references department(DepartmentID);
-- FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)


-- 11:44:07	INSERT INTO Employees (EmployeeID, LastName, FirstName, Email, PhoneNumber, Salary) VALUES (1, 'Smith', 'John', 'john.smith@example.com', '555-1234', 55000), (2, 'Johnson', 'Emily', 'emily.johnson@example.com', '555-5678', 62000), (3, 'Williams', 'Michael', 'michael.williams@example.com', '555-9876', 72000), (4, 'Brown', 'Jessica', 'jessica.brown@example.com', '555-3456', 48000), (5, 'Jones', 'Daniel', 'daniel.jones@example.com', '555-2345', 51000), (6, 'Garcia', 'Laura', 'laura.garcia@example.com', '555-6789', 58000), (7, 'Miller', 'Christopher', 'christopher.miller@example.com', '555-8765', 67000), (8, 'Davis', 'Sarah', 'sarah.davis@example.com', '555-5432', 49000), (9, 'Rodriguez', 'David', 'david.rodriguez@example.com', '555-6543', 53000), (10, 'Martinez', 'Sophia', 'sophia.martinez@example.com', '555-4321', 61000), (11, 'Hernandez', 'James', 'james.hernandez@example.com', '555-7890', 70000), (12, 'Lopez', 'Olivia', 'olivia.lopez@example.com', '555-3450', 47000), (13, 'Gonzalez', 'Joshua', 'joshua.gonzalez@example.com', '555-1230', 56000), (14, 'Wilson', 'Mia', 'mia.wilson@example.com', '555-6780', 59000), (15, 'Anderson', 'Benjamin', 'benjamin.anderson@example.com', '555-7895', 65000), (16, 'Thomas', 'Abigail', 'abigail.thomas@example.com', '555-4567', 52000), (17, 'Taylor', 'Alexander', 'alexander.taylor@example.com', '555-9870', 71000), (18, 'Moore', 'Isabella', 'isabella.moore@example.com', '555-6540', 46000), (19, 'Jackson', 'Andrew', 'andrew.jackson@example.com', '555-3210', 54000), (20, 'Martin', 'Charlotte', 'charlotte.martin@example.com', '555-9879', 62000), (21, 'Lee', 'William', 'william.lee@example.com', '555-1239', 60000), (22, 'Perez', 'Evelyn', 'evelyn.perez@example.com', '555-9874', 48000), (23, 'Thompson', 'Samuel', 'samuel.thompson@example.com', '555-4569', 57000), (24, 'White', 'Amelia', 'amelia.white@example.com', '555-6784', 64000), (25, 'Harris', 'Elijah', 'elijah.harris@example.com', '555-5439', 68000), (26, 'Sanchez', 'Ava', 'ava.sanchez@example.com', '555-2349', 49000), (27, 'Clark', 'Joseph', 'joseph.clark@example.com', '555-7899', 71000), (28, 'Ramirez', 'Victoria', 'victoria.ramirez@example.com', '555-8769', 53000), (29, 'Lewis', 'Liam', 'liam.lewis@example.com', '555-4329', 67000), (30, 'Robinson', 'Grace', 'grace.robinson@example.com', '555-1235', 72000)	Error Code: 3819. Check constraint 'employees_chk_1' is violated.	0.0078 sec

