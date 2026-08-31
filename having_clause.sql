-- ============================================
-- HAVING CLAUSE PRACTICAL
-- ============================================

-- Create Database
DROP DATABASE IF EXISTS mydb;

CREATE DATABASE mydb;

USE mydb;


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
-- 3. DISPLAY ALL RECORDS
-- ============================================

SELECT * FROM Employee;


-- ============================================
-- 4. GROUP BY
-- Count employees in each department
-- ============================================

SELECT
    department,
    COUNT(*) AS TotalEmployee
FROM Employee
GROUP BY department;


-- ============================================
-- 5. HAVING WITH COUNT()
-- Departments having more than 2 employees
-- ============================================

SELECT
    department,
    COUNT(*) AS TotalEmployee
FROM Employee
GROUP BY department
HAVING COUNT(*) > 2;


-- ============================================
-- 6. HAVING WITH AVG()
-- Departments where average salary > 60000
-- ============================================

SELECT
    department,
    AVG(salary) AS AverageSalary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 60000;


-- ============================================
-- 7. HAVING WITH SUM()
-- Departments where total salary > 100000
-- ============================================

SELECT
    department,
    SUM(salary) AS TotalSalary
FROM Employee
GROUP BY department
HAVING SUM(salary) > 100000;


-- ============================================
-- 8. WHERE + GROUP BY + HAVING
-- Departments in Pune having at least 1 employee
-- ============================================

SELECT
    department,
    COUNT(*) AS TotalEmployee
FROM Employee
WHERE city = 'Pune'
GROUP BY department
HAVING COUNT(*) >= 1;


-- ============================================
-- 9. COUNT EMPLOYEES IN EACH CITY
-- ============================================

SELECT
    city,
    COUNT(*) AS TotalEmployee
FROM Employee
GROUP BY city;


-- ============================================
-- 10. HAVING WITH CITY
-- Cities having more than 1 employee
-- ============================================

SELECT
    city,
    COUNT(*) AS TotalEmployee
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;


-- ============================================
-- 11. MAX() WITH GROUP BY
-- Highest salary in each department
-- ============================================

SELECT
    department,
    MAX(salary) AS HighestSalary
FROM Employee
GROUP BY department;


-- ============================================
-- 12. HIGHEST SALARY IN DATA SCIENCE
-- ============================================

SELECT
    department,
    MAX(salary) AS HighestSalary
FROM Employee
WHERE department = 'Data Science'
GROUP BY department;


-- ============================================
-- 13. AVERAGE SALARY BY CITY
-- ============================================

SELECT
    city,
    AVG(salary) AS AverageSalary
FROM Employee
GROUP BY city;


-- ============================================
-- 14. HAVING WITH AVERAGE SALARY
-- Cities where average salary > 55000
-- ============================================

SELECT
    city,
    AVG(salary) AS AverageSalary
FROM Employee
GROUP BY city
HAVING AVG(salary) > 55000;


-- ============================================
-- 15. HAVING WITH SUM()
-- Cities where total salary > 100000
-- ============================================

SELECT
    city,
    SUM(salary) AS TotalSalary
FROM Employee
GROUP BY city
HAVING SUM(salary) > 100000;


-- ============================================
-- 16. WHERE + GROUP BY + HAVING
-- Data Science employees with total salary > 100000
-- ============================================

SELECT
    department,
    COUNT(*) AS TotalEmployee,
    SUM(salary) AS TotalSalary
FROM Employee
WHERE department = 'Data Science'
GROUP BY department
HAVING SUM(salary) > 100000;