# DCL (Data Control Language)
# DCL controls who can access the database and what they are allowed to do

# Commands
# 1. GRANT -- Give permissions
drop database if exists dcl_db;
create database if not exists dcl_db;
use dcl_db;

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

# Now user1 can read the table.
GRANT SELECT
ON Students
TO user1;

# 2. REVOKE -- Remove permissions.

# Now user1 can no longer read the table.
revoke select 
on Students
from user1;

