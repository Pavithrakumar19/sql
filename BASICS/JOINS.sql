#JOINS

#self join
select * from students s1 join students s2 on s1.name=s2.name;

#inner joins-returns only matching records frorm both tables
SELECT s.name, d.department
FROM students s
INNER JOIN depts d
ON s.department = d.department;

#left join-returns all record from left table and matching records from right
SELECT s.name, d.department
FROM students s
left JOIN depts d
ON s.department = d.department;


#right join-returns all record from right table and matching records from left
SELECT s.name, d.department
FROM students s
RIGHT JOIN depts d
ON s.department = d.department;