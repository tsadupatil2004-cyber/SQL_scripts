## Aggregate functions 

drop database if exists New_db;
create database if not exists New_db;
use New_db;

create table if not exists Student(
Roll_no int auto_increment primary key,
name varchar(10),
course varchar(20),
marks int
) auto_increment = 1 ;
truncate table Student;

insert into Student(Roll_no,name,course,marks) values
(1,"Tanvi","Data Science",95.75);

insert into Student(name,course,marks) values
("Shweta","AI",99.00),
("Ram","Computer Science",89.70),
("Kishor","Finance","77.90");

select * from Student;

select sum(marks) as Total_marks from Student;

select count(*) as Total_rows from Student;

select avg(marks) as Avg_marks from Student;

select max(marks) as Max_marks from Student;

select  min(marks) as Max_marks from Student;

