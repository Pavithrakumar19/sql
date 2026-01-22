#INDEXES-used to speed up data retrieval[w/o indexes it performs a full table scan]

#PRIMARY KEY INDEX-automatically created
create table students ( stu_id INT PRIMARY KEY, NAME varchar(30));

select * from students;
#UNIQUE INDEX-ensures unique values
create UNIQUE INDEX idx_email on students(email);

#NORMAL[NON UNIQUE INEX]-improves search performance
create INDEX IDX_DEPT ON students(department);

#COMPOSITE INDEX-index on multiple columns
create index idx_dpt_age on students(department,age);

#checking for indexes on atble
show index from students;

#QUERY ANALYSIS USING EXPLAIN
EXPLAIN SELECT * FROM students WHERE department = 'CSE';
