use student_analytics;

#CTE-COMMON TABLE EXPRESSION[LIKE A TEMP VIEW]
#CTW IS A TEMPORARY NAMED RESULT SET  THAT YOU CAN REFENCE WITHIN A SELECT,INSERT,UPDATEETC STATEMENT

#BASIC SYNTAX
WITH cte_name AS (
SELECT column1, column2
FROM table_name
WHERE condition)
SELECT * FROM cte_name;

#avg marks per student
WITH student_avg AS (
SELECT st_id, AVG(marks) AS avg_marks
FROM enrollments
GROUP BY st_id
)
SELECT s.name, student_avg.avg_marks FROM student_avg
JOIN students s ON student_avg.st_id = s.st_id

#students above dept avg
WITH dept_avg AS (
SELECT s.dept_id, AVG(e.marks) AS dept_avg_marks
FROM students s
JOIN enrollments e ON s.st_id = e.st_id
GROUP BY s.dept_id
)
SELECT s.name, d.dept_name, e.marks
FROM students s
JOIN enrollments e ON s.st_id = e.st_id
JOIN departments d ON s.dept_id = d.dept_id
JOIN dept_avg da ON s.dept_id = da.dept_id
WHERE e.marks > da.dept_avg_marks;


#recursive CTE-USED FOR HEIRARCHIAL DATA
WITH RECURSIVE numbers AS (
SELECT 1 AS n
UNION ALL
SELECT n + 1 FROM numbers WHERE n < 5
)
SELECT * FROM numbers;
