use college_db;

#creating a table
CREATE TABLE students (
student_id INT PRIMARY KEY,
name VARCHAR(50),
age INT,
department VARCHAR(30)
);

#to show all available tables in the database
show tables;

#view table structure
describe students;

#deleting a table
DROP table students;

#creating another table employeee
CREATE table employee(id  INT PRIMARY KEY,
EMP_NAME VARCHAR(50),
DESIGNATION VARCHAR(30));


#Contraints in sql-PRIMARY KEY,FOREIGN KEY,NULL,UNIQUE,DEFAULT ETC
CREATE TABLE STUDENTS (
st_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
age INT CHECK (age >= 16),
department VARCHAR(30) DEFAULT 'General'
);

DESCRIBE STUDENTS;

#FOREIGN KEY
CREATE TABLE orders (
order_id INT PRIMARY KEY,
st_id INT,
FOREIGN KEY (st_id) REFERENCES STUDENTS(st_id)
);

