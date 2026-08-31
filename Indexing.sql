# INDEXING IN SQL — PRACTICAL
-- ============================================
-- INDEXING IN SQL
-- ============================================

-- Create Database
DROP DATABASE IF EXISTS index_demo;

CREATE DATABASE index_demo;

USE index_demo;


-- ============================================
-- 1. CREATE EMPLOYEE TABLE
-- ============================================

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    department VARCHAR(30),
    city VARCHAR(20),
    salary INT
);


-- ============================================
-- 2. INSERT EMPLOYEE DATA
-- ============================================

INSERT INTO Employee
(emp_id, emp_name, department, city, salary)
VALUES
(101, 'Rakesh', 'Data Science', 'Kolhapur', 50000),
(102, 'Tanvi', 'Web Development', 'Pune', 45000),
(103, 'Ram', 'Cyber Security', 'Mumbai', 60000),
(104, 'Neeta', 'Data Science', 'Pune', 70000),
(105, 'Ganesh', 'AI', 'Nagpur', 55000),
(106, 'Priya', 'Web Development', 'Mumbai', 48000),
(107, 'Harshada', 'Data Science', 'Pune', 80000),
(108, 'Rohit', 'AI', 'Kolhapur', 52000);


-- Display Employee data
SELECT * FROM Employee;


-- ============================================
-- 3. PRIMARY INDEX
-- ============================================

-- MySQL automatically creates an index
-- when a PRIMARY KEY is defined.

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20)
);

INSERT INTO emp (emp_id, emp_name)
VALUES
(1, 'Johan'),
(2, 'Bob');

-- Search using Primary Key
SELECT *
FROM emp
WHERE emp_id = 1;


-- Check Primary Key index
SHOW INDEX FROM emp;


-- ============================================
-- 4. UNIQUE INDEX
-- ============================================

CREATE TABLE student (
    stud_id INT PRIMARY KEY,
    email VARCHAR(100),
    UNIQUE (email)
);

-- First email
INSERT INTO student
VALUES (1, 'abc@gmail.com');

-- Different email
INSERT INTO student
VALUES (2, 'xyz@gmail.com');

-- The following statement will produce
-- a duplicate-key error because email is UNIQUE.
-- INSERT INTO student
-- VALUES (3, 'abc@gmail.com');

SELECT * FROM student;

-- Check indexes
SHOW INDEX FROM student;


-- Alternative way to create a UNIQUE INDEX
CREATE TABLE Student2 (
    stud_id INT PRIMARY KEY,
    email VARCHAR(100)
);

CREATE UNIQUE INDEX email_index
ON Student2(email);


-- ============================================
-- 5. NORMAL INDEX
-- ============================================

-- Allows duplicate values and improves
-- searching/filtering on the indexed column.

CREATE INDEX emp_city
ON Employee(city);

-- Search using indexed column
SELECT *
FROM Employee
WHERE city = 'Pune';


-- Check index
SHOW INDEX FROM Employee;


-- ============================================
-- 6. COMPOSITE INDEX
-- ============================================

-- Index created using multiple columns.

CREATE INDEX idx_dept_city
ON Employee(department, city);

-- Search using both indexed columns
SELECT *
FROM Employee
WHERE department = 'Data Science'
AND city = 'Pune';


-- Check indexes
SHOW INDEX FROM Employee;


-- ============================================
-- 7. FULL-TEXT INDEX
-- ============================================

-- Used for text searching in TEXT columns.

CREATE TABLE Books (
    id INT PRIMARY KEY,
    description TEXT,
    FULLTEXT(description)
);


-- Insert book descriptions
INSERT INTO Books
VALUES
(1, 'It is a Java book developed by James Gosling at Sun Microsystems USA.'),
(2, 'Python is an interpreted programming language.'),
(3, 'Java is platform independent.'),
(4, 'SQL is used for database management.');


-- ============================================
-- 8. FULL-TEXT SEARCH
-- ============================================

-- Search for Java
SELECT *
FROM Books
WHERE MATCH(description)
AGAINST('Java');


-- Search multiple words
SELECT *
FROM Books
WHERE MATCH(description)
AGAINST('Java programming');


-- ============================================
-- 9. BOOLEAN FULL-TEXT SEARCH
-- ============================================

-- Find rows containing Java
SELECT *
FROM Books
WHERE MATCH(description)
AGAINST('+Java' IN BOOLEAN MODE);


-- Find Java but NOT Python
SELECT *
FROM Books
WHERE MATCH(description)
AGAINST('+Java -Python' IN BOOLEAN MODE);


-- Find words starting with "prog"
SELECT *
FROM Books
WHERE MATCH(description)
AGAINST('prog*' IN BOOLEAN MODE);


-- ============================================
-- 10. CREATE FULLTEXT INDEX LATER
-- ============================================

CREATE TABLE Articles (
    id INT PRIMARY KEY,
    content TEXT
);

-- Create FULLTEXT index after table creation
CREATE FULLTEXT INDEX article_text
ON Articles(content);


-- ============================================
-- 11. DISPLAY ALL INDEXES
-- ============================================

SHOW INDEX FROM Employee;

SHOW INDEX FROM Books;

SHOW INDEX FROM student;

