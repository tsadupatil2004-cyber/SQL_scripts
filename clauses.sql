-- ============================================
-- SQL CLAUSES PRACTICAL
-- ============================================

-- Create Database
DROP DATABASE IF EXISTS clause_demo;

CREATE DATABASE clause_demo;

USE clause_demo;


-- ============================================
-- 1. CREATE TABLE
-- ============================================

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    department VARCHAR(30),
    city VARCHAR(20),
    salary INT
);


-- ============================================
-- 2. INSERT DATA
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


-- ============================================
-- 3. SELECT CLAUSE
-- ============================================

SELECT * FROM Employee;


-- ============================================
-- 4. WHERE CLAUSE
-- Display employees from Data Science
-- ============================================

SELECT *
FROM Employee
WHERE department = 'Data Science';


-- ============================================
-- 5. WHERE WITH AND
-- Pune employees with salary greater than 60000
-- ============================================

SELECT *
FROM Employee
WHERE city = 'Pune'
AND salary > 60000;


-- ============================================
-- 6. WHERE WITH OR
-- Employees from Mumbai or Pune
-- ============================================

SELECT *
FROM Employee
WHERE city = 'Mumbai'
OR city = 'Pune';


-- ============================================
-- 7. WHERE WITH NOT
-- Employees who are NOT from AI department
-- ============================================

SELECT *
FROM Employee
WHERE NOT department = 'AI';


-- ============================================
-- 8. DISTINCT CLAUSE
-- Display unique cities
-- ============================================

SELECT DISTINCT city
FROM Employee;


-- ============================================
-- 9. ORDER BY - ASCENDING
-- Display employees according to salary
-- ============================================

SELECT *
FROM Employee
ORDER BY salary ASC;


-- ============================================
-- 10. ORDER BY - DESCENDING
-- Display employees according to salary
-- ============================================

SELECT *
FROM Employee
ORDER BY salary DESC;


-- ============================================
-- 11. LIMIT CLAUSE
-- Display first 3 employees
-- ============================================

SELECT *
FROM Employee
LIMIT 3;


-- ============================================
-- 12. HIGHEST SALARY
-- ============================================

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 1;


-- ============================================
-- 13. TOP 3 SALARIES
-- ============================================

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;


-- ============================================
-- 14. LIKE CLAUSE
-- Names starting with R
-- ============================================

SELECT *
FROM Employee
WHERE emp_name LIKE 'R%';


-- ============================================
-- 15. LIKE CLAUSE
-- Names ending with 'a'
-- ============================================

SELECT *
FROM Employee
WHERE emp_name LIKE '%a';


-- ============================================
-- 16. LIKE CLAUSE
-- Names containing 'ta'
-- ============================================

SELECT *
FROM Employee
WHERE emp_name LIKE '%ta%';


-- ============================================
-- 17. LIKE CLAUSE
-- Second letter is 'a'
-- ============================================

SELECT *
FROM Employee
WHERE emp_name LIKE '_a%';


-- ============================================
-- 18. IN OPERATOR
-- Employees from Pune or Mumbai
-- ============================================

SELECT *
FROM Employee
WHERE city IN ('Pune', 'Mumbai');


-- ============================================
-- 19. BETWEEN OPERATOR
-- Employees with salary between 50000 and 70000
-- ============================================

SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 70000;


-- ============================================
-- 20. NOT BETWEEN
-- Employees whose salary is NOT between 50000 and 70000
-- ============================================

SELECT *
FROM Employee
WHERE salary NOT BETWEEN 50000 AND 70000;


-- ============================================
-- 21. IS NULL
-- Display employees with NULL city
-- ============================================

SELECT *
FROM Employee
WHERE city IS NULL;


-- ============================================
-- 22. IS NOT NULL
-- Display employees whose city is available
-- ============================================

SELECT *
FROM Employee
WHERE city IS NOT NULL;


-- ============================================
-- 23. MULTIPLE CONDITIONS
-- Data Science employees from Pune
-- ============================================

SELECT *
FROM Employee
WHERE department = 'Data Science'
AND city = 'Pune'
AND salary > 60000;


-- ============================================
-- 24. ORDER BY MULTIPLE COLUMNS
-- First by department, then salary descending
-- ============================================

SELECT *
FROM Employee
ORDER BY department ASC, salary DESC;
