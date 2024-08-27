-- variable and datatypes 
num int
name varchar(30)

CREATE TABLE StudentDetails (
   Student_Id INT AUTO_INCREMENT,       
   First_name VARCHAR (100) NOT NULL,       
   Last_name VARCHAR (100) NOT NULL,      
   Date_Of_Birth DATE NOT NULL,       
   Class VARCHAR (10) NOT NULL,       
   Contact_Details BIGINT NOT NULL,      
   PRIMARY KEY(Student_Id )       
); 

