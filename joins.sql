-- ============================================
-- SQL JOINS PRACTICAL
-- ============================================

CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;


-- ============================================
-- 1. CREATE EMPLOYEE TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    department VARCHAR(50)
);


-- ============================================
-- 2. INSERT EMPLOYEE DATA
-- ============================================

INSERT INTO Employee (emp_id, emp_name, department)
VALUES
(101, 'Rakesh Patil', 'Data Science'),
(102, 'Tanvi Patil', 'Web Dev'),
(103, 'Ram Kapoor', 'Cybersecurity'),
(104, 'Neeta Ambani', 'Data Science');


-- ============================================
-- 3. CREATE PROJECTS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS Projects (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(50),
    emp_id INT
);


-- ============================================
-- 4. INSERT PROJECT DATA
-- ============================================

INSERT INTO Projects (pro_id, pro_name, emp_id)
VALUES
(1, 'Zero Trust System', 103),
(2, 'E-Commerce Portal', 102),
(3, 'AI Prediction Model', 101),
(4, 'Mobile App', NULL);


-- ============================================
-- 5. VIEW TABLES
-- ============================================

SELECT * FROM Employee;

SELECT * FROM Projects;


-- ============================================
-- 6. INNER JOIN
-- Returns only matching records
-- ============================================

SELECT
    Employee.emp_id,
    Employee.emp_name,
    Employee.department,
    Projects.pro_name
FROM Employee
INNER JOIN Projects
ON Employee.emp_id = Projects.emp_id;


-- ============================================
-- 7. LEFT JOIN
-- Returns all employees and matching projects
-- ============================================

SELECT
    Employee.emp_id,
    Employee.emp_name,
    Employee.department,
    Projects.pro_name
FROM Employee
LEFT JOIN Projects
ON Employee.emp_id = Projects.emp_id;


-- ============================================
-- 8. RIGHT JOIN
-- Returns all projects and matching employees
-- ============================================

SELECT
    Employee.emp_id,
    Employee.emp_name,
    Employee.department,
    Projects.pro_name
FROM Employee
RIGHT JOIN Projects
ON Employee.emp_id = Projects.emp_id;


-- ============================================
-- 9. FULL OUTER JOIN
-- MySQL does not directly support FULL OUTER JOIN.
-- We can achieve it using LEFT JOIN + RIGHT JOIN
-- with UNION.
-- ============================================

SELECT
    Employee.emp_id,
    Employee.emp_name,
    Employee.department,
    Projects.pro_id,
    Projects.pro_name
FROM Employee
LEFT JOIN Projects
ON Employee.emp_id = Projects.emp_id

UNION

SELECT
    Employee.emp_id,
    Employee.emp_name,
    Employee.department,
    Projects.pro_id,
    Projects.pro_name
FROM Employee
RIGHT JOIN Projects
ON Employee.emp_id = Projects.emp_id;


-- ============================================
-- 10. JOIN USING ALIAS
-- Shorter and easier query
-- ============================================

SELECT
    e.emp_name,
    e.department,
    p.pro_name
FROM Employee AS e
INNER JOIN Projects AS p
ON e.emp_id = p.emp_id;