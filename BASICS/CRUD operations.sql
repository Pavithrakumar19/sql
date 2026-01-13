#CRUD OPERATIONS

#INSERT SINGLE RECORDS
INSERT INTO STUDENTS (st_id, name, email, age, department)
VALUES (1, 'Ananya', 'ananya@gmail.com', 18, 'CSE');

#INSERT WITHOUT DEFAULT COLOUMN
INSERT INTO STUDENTS (st_id, name, email, age)
VALUES (2, 'Rahul', 'rahul@gmail.com', 17);


#INSERTING MULTIPLE RECORDS
INSERT INTO students VALUES
(3, 'Sneha', 'sneha@gmail.com', 19, 'ECE'),
(4, 'Arjun', 'arjun@gmail.com', 20, 'MECH');

#VIEWING ALL RECCORDS
select * from STUDENTS;

#SELECT WITH SPECIFIC COLOUMNS
select name,age from STUDENTS;

#SELECT WITH SPECIFIC CONDITION
select name from STUDENTS where age>=18;

#SELECT USING AND /OR
select st_id,name from STUDENTS where age>=18 and department="CSE";

#UPDATING A SINGLE COLUMN
update STUDENTS SET department ="IT" where st_id =2;

SET SQL_SAFE_UPDATES = 0;
#updating multiple coloumn
UPDATE STUDENTS
SET age = 18, department = 'CSE'
WHERE name = 'Rahul';

#UPDATE USING A CONDITION
UPDATE STUDENTS SET department = "Science" where age >= 18;

#DELETING 
#DELETING A Specific RECCORD
DELETE FROM  STUDENTS WHERE age <=18;

#deleting all reccords from tables
delete from STUDENTS;
