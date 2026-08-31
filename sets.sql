drop database if exists sets_ops;
create database if not exists sets_ops;
use sets_ops;

create table if not exists students(
stud_id int primary key,
stud_name varchar(20)
);

create table if not exists sports_students(
stud_id int primary key,
stud_name varchar(20)
);

truncate table students;
insert into students(stud_id,stud_name) values
(101,"Tanvi Patil"),
(102,"Siya Goyal"),
(103,"Shruti Mandana"),
(104,"Raghav Chadda"),
(105,"Rohit Sharma");

truncate table sports_students;
insert into sports_students(stud_id ,stud_name) values
(103,"Shruti Mandana"),
(104,"Raghav Chadda"),
(105,"Rohit Sharma"),
(106,"Mahi Dhoni"),
(107,"Virat Kohali");

select * from students;
select * from sports_students;

select * from students 
union 
select * from sports_students;

select * from students 
union all
select * from sports_students;



