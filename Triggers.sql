# SQL TRIGGERS — PRACTICAL

-- ============================================
-- SQL TRIGGERS PRACTICAL
-- ============================================

-- Create Database
DROP DATABASE IF EXISTS trigger_db;

CREATE DATABASE trigger_db;

USE trigger_db;


-- ============================================
-- 1. CREATE EMPLOYEE TABLE
-- ============================================

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary INT
);


-- ============================================
-- 2. BEFORE INSERT TRIGGER
-- Ensures minimum salary is 20,000
-- ============================================

DELIMITER //

CREATE TRIGGER check_salary
BEFORE INSERT
ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 20000 THEN
        SET NEW.salary = 20000;
    END IF;
END //

DELIMITER ;


-- Test BEFORE INSERT trigger
INSERT INTO Employee (emp_id, emp_name, salary)
VALUES (101, 'Raj', 15000);

-- Salary should become 20,000
SELECT * FROM Employee;


-- ============================================
-- 3. AFTER INSERT TRIGGER
-- Records newly added employees
-- ============================================

CREATE TABLE Employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(100)
);


DELIMITER //

CREATE TRIGGER employee_log
AFTER INSERT
ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_log(message)
    VALUES (CONCAT('Employee Added: ', NEW.emp_name));
END //

DELIMITER ;


-- Test AFTER INSERT trigger
INSERT INTO Employee (emp_id, emp_name, salary)
VALUES (102, 'Rakesh', 50000);

SELECT * FROM Employee_log;


-- ============================================
-- 4. BEFORE UPDATE TRIGGER
-- Prevents salary from becoming negative
-- ============================================

DELIMITER //

CREATE TRIGGER prevent_negative_salary
BEFORE UPDATE
ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = OLD.salary;
    END IF;
END //

DELIMITER ;


-- Test BEFORE UPDATE trigger
UPDATE Employee
SET salary = -500
WHERE emp_id = 101;

SELECT * FROM Employee;


-- ============================================
-- 5. AFTER UPDATE TRIGGER
-- Records salary changes
-- ============================================

CREATE TABLE Salary_Log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    old_salary INT,
    new_salary INT
);


DELIMITER //

CREATE TRIGGER salary_history
AFTER UPDATE
ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Salary_Log(old_salary, new_salary)
    VALUES (OLD.salary, NEW.salary);
END //

DELIMITER ;


-- Test AFTER UPDATE trigger
UPDATE Employee
SET salary = 65000
WHERE emp_id = 102;

SELECT * FROM Salary_Log;


-- ============================================
-- 6. AFTER DELETE TRIGGER
-- Stores deleted employee information
-- ============================================

CREATE TABLE deleted_emp (
    emp_id INT,
    emp_name VARCHAR(30)
);


DELIMITER //

CREATE TRIGGER backup_employee
AFTER DELETE
ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO deleted_emp(emp_id, emp_name)
    VALUES (OLD.emp_id, OLD.emp_name);
END //

DELIMITER ;


-- Test AFTER DELETE trigger
DELETE FROM Employee
WHERE emp_id = 101;

SELECT * FROM deleted_emp;


-- ============================================
-- 7. DISPLAY FINAL EMPLOYEE DATA
-- ============================================

SELECT * FROM Employee;


-- ============================================
-- 8. DISPLAY ALL TRIGGERS
-- ============================================

SHOW TRIGGERS;
