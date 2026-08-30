# DQL (Data Query Language)
# DQL retrieves data from the database

# 1. select
drop database if exists dml_db;
create database if not exists dml_db;
use dml_db;

create table if not exists  Students(
rollno int primary key,
name varchar(20),
city varchar(20)
);

truncate table students;

insert into students(rollno, name,city) values
(1,'Ram','Pune'),
(2,'Nitin','Kolhapur'),
(3,'Riya','Pune'),
(4,'Meena','Mumbai'),
(5,'Raj','Kolhapur');


select * from students;

# 2. WHERE

select * from students where city='Pune';
select * from students where name like "R%";

# 3. ORDER BY
select * from students order by name ;

# 4 GROUP BY
select city, count(*)
from students
group by city;

# 5.HAVING
select city, count(*)
from students
group by city
having count(*)>1;

# 6. JOIN

create table if not exists Department(
dept_id int primary key,
rollno int,
name varchar(10),
dept_name varchar(20)
);

truncate table Department;
insert into Department(dept_id,rollno,name,dept_name) values
(101,1,'Ram','AI'),
(102,2,'Nitin','Data science'),
(103,3,'Riya','AI'),
(104,4,'Meena','Cyber security'),
(105,5,'Raj','Data Science');

select s.name,s.city ,d.dept_name
from students s
inner join Department d 
on s.rollno = d.rollno;



