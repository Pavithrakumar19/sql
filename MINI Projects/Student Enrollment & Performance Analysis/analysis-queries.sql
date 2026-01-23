show tables;

#TOTAL STUDENTS PER DEPT
select count(*) as total_students, d.dept_name from students s JOIN departments d on s.dept_id =d.dept_id 
group by d.dept_name;

#TOTAL COURSES OFFERED BY EACH DEPT
select count(s.course_id) as total_courses, d.dept_name from courses s JOIN departments d on s.dept_id =d.dept_id 
group by d.dept_name;

#top five perfoming students
select s.name, e.marks from students s join enrollments e on s.st_id=e.st_id order by e.marks desc limit 5;


#AVG MARKS PER COURSE
SELECT c.course_name,
ROUND(AVG(e.marks), 2) AS avg_marks
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY avg_marks DESC;

#Students enrolled in more than one course
select s.name,
COUNT(e.course_id) AS courses_enrolled
from students s join enrollments e ON s.st_id = e.st_id
GROUP BY s.name
having courses_enrolled > 1
order by courses_enrolled DESC;

#Department-wise average performance
select d.dept_name,
ROUND(AVG(e.marks), 2) AS dept_avg_marks
from departments d
join students s ON d.dept_id = s.dept_id
join enrollments e ON s.st_id = e.st_id
group by d.dept_name
ORDER BY dept_avg_marks DESC;

#Courses with average marks below 75 (needs improvement)
select c.course_name,
ROUND(AVG(e.marks), 2) AS avg_marks
from courses c
join  enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
having avg_marks < 75;

#High-performing students (any subject score >= 90)
select distinct s.name, e.marks
FROM students s
join enrollments e on s.st_id = e.st_id
where e.marks >= 90
ORDER BY e.marks DESC;

#Create a view for department performance summary
CREATE OR REPLACE VIEW department_performance_summary AS
SELECT d.dept_name,
COUNT(DISTINCT s.st_id) AS total_students,
COUNT(e.enroll_id) AS total_enrollments,
ROUND(AVG(e.marks), 2) AS avg_marks
from departments d
left join students s ON d.dept_id = s.dept_id
left join  enrollments e ON s.st_id = e.st_id
group by  d.dept_name;

#View usage
SELECT * FROM department_performance_summary;
