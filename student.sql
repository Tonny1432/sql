create database school
--use school
create table students(
student_id tinyint,
student_name varchar(20),
age smallint,
grade char(1),
marks int)
insert into students(student_id,student_name,age,grade,marks)
VALUES(101,'tonny',21,'A',90),
(102,'rebaca',22,'B',80),
(103,'alice',23,'A',90),
(104,'racheal',22,'C',70),
(105,'jhon',22,'C',70);

use school
alter table students
add student_email varchar(50)

use school
alter table students
alter column marks decimal(5,2)

UPDATE students SET student_email = 'student_1@gmail.com' WHERE student_id = 101;
UPDATE students SET student_email = 'student_2@gmail.com' WHERE student_id = 102;
UPDATE students SET student_email = 'student_3@gmail.com' WHERE student_id = 103;
UPDATE students SET student_email = 'student_4@gmail.com' WHERE student_id = 104;
UPDATE students SET student_email = 'student_5@gmail.com' WHERE student_id = 105;



select * from students
select student_name, marks from students
select student_name from students
where marks>=80
select student_name from students
where grade ='A'