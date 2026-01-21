create database student_analytics;
use student_analytics;

#CREATING REQUIRED TABLES
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) UNIQUE
);

CREATE TABLE students (
    st_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    age INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    st_id INT,
    course_id INT,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    FOREIGN KEY (st_id) REFERENCES students(st_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

#INSERTING DATA INTO TABLES
INSERT INTO departments (dept_name) VALUES ('Computer Science'), 
('Information Technology'), ('Data Science'), ('Electronics'), ('Mechanical');

INSERT INTO students (name, email, age, dept_id) VALUES ('Aarav Sharma','aarav@gmail.com',20,1),
 ('Meera Iyer','meera@gmail.com',21,3), ('Rohit Verma','rohit@gmail.com',22,2), 
 ('Sneha Patel','sneha@gmail.com',19,1), ('Karan Singh','karan@gmail.com',23,4), 
 ('Ananya Rao','ananya@gmail.com',20,3), ('Vikram Joshi','vikram@gmail.com',22,2), 
 ('Pooja Nair','pooja@gmail.com',21,1), ('Rahul Khanna','rahul@gmail.com',24,5), 
 ('Neha Gupta','neha@gmail.com',20,3), ('Arjun Mehta','arjun@gmail.com',21,1), 
 ('Divya Menon','divya@gmail.com',22,4), ('Siddharth Jain','sid@gmail.com',23,2), 
 ('Kavya Reddy','kavya@gmail.com',19,3), ('Nikhil Das','nikhil@gmail.com',21,5), 
 ('Ritu Malhotra','ritu@gmail.com',22,1), ('Aditya Kulkarni','aditya@gmail.com',20,2),
 ('Shreya Banerjee','shreya@gmail.com',21,3), ('Manish Pandey','manish@gmail.com',24,4),
 ('Isha Kapoor','isha@gmail.com',20,1), ('Amit Choudhary','amit@gmail.com',23,5), 
 ('Tanvi Shah','tanvi@gmail.com',19,2), ('Harsh Agrawal','harsh@gmail.com',22,3),
 ('Naina Sethi','naina@gmail.com',21,1), ('Rakesh Yadav','rakesh@gmail.com',24,4);
 
 INSERT INTO courses (course_name, dept_id) VALUES ('Database Systems',1), ('Operating Systems',1),
 ('Machine Learning',3), ('Data Analytics',3), ('Web Development',2), ('Computer Networks',2),
 ('Digital Electronics',4), ('Microprocessors',4), 
 ('Thermodynamics',5), ('Manufacturing Processes',5);
 
 INSERT INTO enrollments (st_id, course_id, marks) VALUES (1,1,85),(1,5,78),
 (2,3,92),(2,4,88),(3,5,74),(4,1,81), (4,3,79),(5,7,69),(6,3,90),(6,4,86),
 (7,6,72),(8,2,84), (9,9,68),(10,3,91),(11,1,88),(11,2,82),(12,8,73), (13,5,76),
 (13,6,80),(14,4,89),(15,10,71),(16,1,83), (17,6,78),(18,3,87),(18,4,90),(19,7,70),
 (20,2,85), (21,9,66),(22,5,74),(23,3,92),(23,4,88),(24,1,81), (25,8,75),(7,5,69),
 (10,4,93),(14,3,91),(17,5,77), (20,1,84),(22,6,73),(24,2,86);