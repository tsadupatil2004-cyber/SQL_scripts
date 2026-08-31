# GROUP BY CLAUSE — SQL PRACTICAL

-- ============================================
-- GROUP BY CLAUSE PRACTICAL
-- ============================================

-- Create Database
DROP DATABASE IF EXISTS db;

CREATE DATABASE db;

USE db;


-- ============================================
-- 1. CREATE CUSTOMER TABLE
-- ============================================

CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(20),
    country VARCHAR(20),
    salary INT,
    age INT
);


-- ============================================
-- 2. INSERT CUSTOMER DATA
-- ============================================

INSERT INTO customer
(cust_id, cust_name, country, salary, age)
VALUES
(1, 'Tanvi', 'UK', 80000, 22),
(2, 'Ram', 'India', 60000, 25),
(3, 'Robert', 'UK', 70000, 24),
(4, 'Samy', 'USA', 100000, 30),
(5, 'Siya', 'India', 50000, 28),
(6, 'Bob', 'USA', 90000, 22),
(7, 'Ronit', 'India', 50000, 25),
(8, 'Nupur', 'India', 60000, 30);


-- ============================================
-- 3. DISPLAY CUSTOMER DATA
-- ============================================

SELECT * FROM customer;


-- ============================================
-- 4. GROUP BY COUNTRY
-- Count customers in each country
-- ============================================

SELECT
    country,
    COUNT(*) AS customer_count
FROM customer
GROUP BY country;


-- ============================================
-- 5. TOTAL SALARY BY COUNTRY
-- ============================================

SELECT
    country,
    SUM(salary) AS total_salary
FROM customer
GROUP BY country;


-- ============================================
-- 6. AVERAGE SALARY BY COUNTRY
-- ============================================

SELECT
    country,
    AVG(salary) AS average_salary
FROM customer
GROUP BY country;


-- ============================================
-- 7. HIGHEST SALARY BY COUNTRY
-- ============================================

SELECT
    country,
    MAX(salary) AS highest_salary
FROM customer
GROUP BY country;


-- ============================================
-- 8. LOWEST SALARY BY COUNTRY
-- ============================================

SELECT
    country,
    MIN(salary) AS lowest_salary
FROM customer
GROUP BY country;


-- ============================================
-- 9. CREATE EMPLOYEE TABLE
-- ============================================

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    department VARCHAR(30),
    city VARCHAR(20),
    salary INT
);


-- ============================================
-- 10. INSERT EMPLOYEE DATA
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
-- 11. DISPLAY EMPLOYEE DATA
-- ============================================

SELECT * FROM Employee;


-- ============================================
-- 12. COUNT EMPLOYEES BY DEPARTMENT
-- ============================================

SELECT
    department,
    COUNT(*) AS dept_count
FROM Employee
GROUP BY department;


-- ============================================
-- 13. TOTAL SALARY BY DEPARTMENT
-- ============================================

SELECT
    department,
    SUM(salary) AS total_salary
FROM Employee
GROUP BY department;


-- ============================================
-- 14. AVERAGE SALARY BY DEPARTMENT
-- ============================================

SELECT
    department,
    AVG(salary) AS average_salary
FROM Employee
GROUP BY department;


-- ============================================
-- 15. HIGHEST SALARY BY DEPARTMENT
-- ============================================

SELECT
    department,
    MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;


-- ============================================
-- 16. LOWEST SALARY BY DEPARTMENT
-- ============================================

SELECT
    department,
    MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;


-- ============================================
-- 17. GROUP BY MULTIPLE COLUMNS
-- Count employees by department and city
-- ============================================

SELECT
    department,
    city,
    COUNT(*) AS employee_count
FROM Employee
GROUP BY department, city;


-- ============================================
-- 18. TOTAL SALARY BY DEPARTMENT AND CITY
-- ============================================

SELECT
    department,
    city,
    SUM(salary) AS total_salary
FROM Employee
GROUP BY department, city;


-- ============================================
-- 19. AVERAGE SALARY BY DEPARTMENT AND CITY
-- ============================================

SELECT
    department,
    city,
    AVG(salary) AS average_salary
FROM Employee
GROUP BY department, city;


-- ============================================
-- 20. GROUP CUSTOMER BY NAME AND COUNTRY
-- ============================================

SELECT
    cust_name,
    country,
    COUNT(*) AS customers
FROM customer
GROUP BY cust_name, country;
