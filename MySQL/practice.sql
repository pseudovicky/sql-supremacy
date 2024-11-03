create database testDB;
use testDB;

drop database testDB;

-- BACKUP DATABASE testDB TO DISK = '/Users/vickykumar/LPU-MCA-Honours-Artificial-Intelligence-and-Machine-Learning-In-tie-up-with-IBM';

create table testUser (
	userID int primary key,
    fname varchar(30),
    lname varchar(30),
    address varchar(80),
    city varchar(30)
);

select * from testUser;

truncate table tableUser;

alter table testUser add DOB date;

alter table testUser
add Email varchar(30);

alter table testUser
drop column address;

alter table testUser
rename column DOB to DateOfBirth;

select * from testUser;

-- EXEC sp_rename 'testUser.lname',  'LastName', 'COLUMN';

alter table testUser add RollNo varchar(30);

-- alter table testUser alter column RollNo int ;
alter table testUser modify column RollNo int;

alter table testUser 
modify column RollNo int; 

alter table testUser 
modify RollNo varchar(20); 

alter table testUser 
modify RollNo int; 

alter table testUser
drop DateOfBirth;

alter table testUser 
drop column RollNo;


    