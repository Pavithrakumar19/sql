#WHERE CLAUSE-USED TO FILTER RECORDS BASED ON A CONDITION

select * from STUDENTS WHERE department="CSE";

#WHERE WITH COMPARISON OPERATOR
select name from STUDENTS where age>=19;

#LIKE OPERATOR[PATTERN MATCHING]

#STARTS WITH
select * from STUDENTS where name LIKE 'A%';


#ENDS WITH
select * from STUDENTS WHERE name LIKE "%a";

#CONTAINS
select * from STUDENTS WHERE name LIKE "%n%";
#2nd letter is 'a'
select name from STUDENTS WHERE name LIKE "_a%";

#BETWEEN OPERATOR-used to filter values within a range
SELECT * FROM STUDENTS WHERE age BETWEEN 18 AND 22;

#ORDER BY -SORTING DATA
# sort in ascending order(default)
select name from STUDENTS order by age;

#sorting in descending order
select name from STUDENTS order by name DESC;

#sort by multiple col
select * from STUDENTS ORDER BY department ASC,age DESC;

#LIMIT-RESTRICT ROWS
# FIRST 5 RECODS
select * from STUDENTS LIMIT 5;

#TOP N QUERY
select * from STUDENTS ORDER BY age desc limit 1;

SELECT * FROM STUDENTS;
#OFFSET-PAGINATION[USED WITH LIMIT TO SKIP ROWS
SELECT * FROM STUDENTS ORDER BY st_id
LIMIT 2 OFFSET 2;