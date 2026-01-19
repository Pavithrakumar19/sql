#group by-groups rows that have same values in specified cols

#counting students per department
select department ,count(*) as total_students from students group by department;

#avg age per dep
SELECT department, AVG(age) AS avg_age
FROM students
GROUP BY department;

#HAVING CLAUSE-used to filter grouped data
SELECT department, COUNT(*) AS total_students FROM students GROUP BY department HAVING COUNT(*) > 2;

#dept with avg age >18
SELECT department, AVG(age) AS avg_age
FROM students
GROUP BY department
HAVING AVG(age) > 18;