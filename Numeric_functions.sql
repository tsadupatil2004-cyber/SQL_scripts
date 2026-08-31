# NUMERICAL FUNCTIONS — SQL PRACTICAL

-- ============================================
-- NUMERICAL FUNCTIONS IN SQL
-- ============================================

DROP DATABASE IF EXISTS numeric_practice;

CREATE DATABASE numeric_practice;

USE numeric_practice;


-- ============================================
-- 1. CREATE EMPLOYEE TABLE
-- ============================================

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    rating DECIMAL(4,2)
);


-- ============================================
-- 2. INSERT DATA
-- ============================================

INSERT INTO Employee
(emp_id, emp_name, salary, bonus, rating)
VALUES
(101, 'Rakesh', 50555.75, 5500.50, 4.67),
(102, 'Tanvi', 60444.35, 6200.75, 4.25),
(103, 'Ram', 45789.90, 4500.25, 3.78),
(104, 'Neeta', 75888.65, 8500.90, 4.92),
(105, 'Ganesh', -1200.50, 5000.40, 3.45),
(106, 'Priya', 55333.25, -1500.25, 4.10);


-- ============================================
-- 3. DISPLAY DATA
-- ============================================

SELECT * FROM Employee;


-- ============================================
-- 4. ABS()
-- Returns absolute value
-- ============================================

SELECT
    emp_name,
    salary,
    ABS(salary) AS absolute_salary
FROM Employee;


-- ============================================
-- 5. CEIL() / CEILING()
-- Rounds value upward
-- ============================================

SELECT
    emp_name,
    rating,
    CEIL(rating) AS ceiling_rating
FROM Employee;


-- ============================================
-- 6. FLOOR()
-- Rounds value downward
-- ============================================

SELECT
    emp_name,
    rating,
    FLOOR(rating) AS floor_rating
FROM Employee;


-- ============================================
-- 7. ROUND()
-- Rounds to specified decimal places
-- ============================================

SELECT
    emp_name,
    salary,
    ROUND(salary, 0) AS rounded_salary,
    ROUND(salary, 1) AS rounded_salary_1_decimal
FROM Employee;


-- ============================================
-- 8. TRUNCATE()
-- Removes decimal digits without rounding
-- ============================================

SELECT
    emp_name,
    salary,
    TRUNCATE(salary, 1) AS truncated_salary
FROM Employee;


-- ============================================
-- 9. MOD()
-- Returns remainder after division
-- ============================================

SELECT
    emp_id,
    MOD(emp_id, 2) AS remainder
FROM Employee;


-- ============================================
-- 10. POWER()
-- Calculates power of a number
-- ============================================

SELECT
    emp_name,
    rating,
    POWER(rating, 2) AS rating_square
FROM Employee;


-- ============================================
-- 11. SQRT()
-- Calculates square root
-- ============================================

SELECT
    emp_name,
    rating,
    SQRT(rating) AS square_root
FROM Employee;


-- ============================================
-- 12. SIGN()
-- Returns:
-- 1  = positive
-- 0  = zero
-- -1 = negative
-- ============================================

SELECT
    emp_name,
    salary,
    SIGN(salary) AS salary_sign
FROM Employee;


-- ============================================
-- 13. GREATEST()
-- Returns the greatest value
-- ============================================

SELECT
    emp_name,
    salary,
    bonus,
    GREATEST(salary, bonus) AS greatest_value
FROM Employee;


-- ============================================
-- 14. LEAST()
-- Returns the smallest value
-- ============================================

SELECT
    emp_name,
    salary,
    bonus,
    LEAST(salary, bonus) AS smallest_value
FROM Employee;


-- ============================================
-- 15. RAND()
-- Generates a random number between 0 and 1
-- ============================================

SELECT
    emp_name,
    RAND() AS random_number
FROM Employee;


-- ============================================
-- 16. Calculate total salary + bonus
-- ============================================

SELECT
    emp_name,
    salary,
    bonus,
    salary + bonus AS total_amount
FROM Employee;


-- ============================================
-- 17. Calculate 10% bonus
-- ============================================

SELECT
    emp_name,
    salary,
    ROUND(salary * 0.10, 2) AS calculated_bonus
FROM Employee;


-- ============================================
-- 18. Calculate salary after 5% increment
-- ============================================

SELECT
    emp_name,
    salary,
    ROUND(salary * 1.05, 2) AS increased_salary
FROM Employee;

