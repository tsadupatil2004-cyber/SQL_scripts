# SQL Sequence
# A Sequence is a database object that automatically generates unique numeric values, usually for primary keys or IDs
# Sequence Syntax  ->
# CREATE SEQUENCE sequence_name START WITH 1 INCREMENT BY 1;

# Parameters
# Parameter	Meaning
# START WITH --	First number
# INCREMENT BY -- 	Increment value
# MINVALUE	-- Smallest value
# MAXVALUE	-- Largest value
# CYCLE	-- Restart after max value
# NOCYCLE	-- Stop after max value
# CACHE	-- Store values in memory for faster access


# SQL SEQUENCE / AUTO_INCREMENT — PRACTICAL

-- ============================================
-- SQL SEQUENCE / AUTO_INCREMENT
-- ============================================

-- A sequence automatically generates unique
-- numeric values.
-- In MySQL, AUTO_INCREMENT is commonly used
-- for this purpose.


-- ============================================
-- 1. CREATE DATABASE
-- ============================================

DROP DATABASE IF EXISTS sequence_demo;

CREATE DATABASE sequence_demo;

USE sequence_demo;


-- ============================================
-- 2. AUTO_INCREMENT STARTING FROM 1
-- ============================================

CREATE TABLE Employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary INT
);


-- ============================================
-- 3. INSERT FIRST RECORD
-- ============================================

INSERT INTO Employee (emp_name, salary)
VALUES ('Rakesh', 50000);

SELECT * FROM Employee;


-- ============================================
-- 4. INSERT SECOND RECORD
-- ============================================

INSERT INTO Employee (emp_name, salary)
VALUES ('Tanvi', 60000);

SELECT * FROM Employee;


-- ============================================
-- 5. INSERT MULTIPLE RECORDS
-- ============================================

INSERT INTO Employee (emp_name, salary)
VALUES
('Ram', 70000),
('Neeta', 55000),
('Ganesh', 65000);

SELECT * FROM Employee;


-- ============================================
-- 6. AUTO_INCREMENT STARTING FROM 101
-- ============================================

CREATE TABLE Emp (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary INT
) AUTO_INCREMENT = 101;


-- ============================================
-- 7. INSERT RECORDS
-- ============================================

INSERT INTO Emp (emp_name, salary)
VALUES
('Rakesh', 50000),
('Tanvi', 60000),
('Ram', 70000),
('Neeta', 55000),
('Ganesh', 65000);


-- ============================================
-- 8. DISPLAY RECORDS
-- ============================================

SELECT * FROM Emp;


-- ============================================
-- 9. CHANGE AUTO_INCREMENT VALUE
-- ============================================

ALTER TABLE Emp AUTO_INCREMENT = 106;


-- Insert another employee
INSERT INTO Emp (emp_name, salary)
VALUES ('Priya', 58000);


-- Display final records
SELECT * FROM Emp;
