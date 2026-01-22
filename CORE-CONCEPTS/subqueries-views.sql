#SUBQUERIES

BASIC SYNTAX
select col_name from table_name where col_name operator(select col_name from table_name);

#find students older than avg age
select * from students where age>(select avg(age) from students);

#subquery in selct
SELECT name,
(SELECT department FROM depts d WHERE d.dept_id = s.dept_id) AS Department
FROM students s;

#subquery in from
SELECT department, avg_age from(select department, AVG(age) as avg_age from students
GROUP BY department
) as dept_avg where avg_age > 18;


#VIEWS-Virtual table
#basic syntax
create view view_name as selct cols from table_name where condition;

#creating a simple view
create view stu_info as select name,age from students;

#use the view
select * from stu_info; 

#modify a view
 create or replace view stu_info  as  select name from students;
 
 #drop a view
 drop view stu_info;
