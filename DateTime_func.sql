-- ============================================
-- DATE AND TIME FUNCTIONS IN MYSQL
-- ============================================


drop database if exists date_time_db;
create database if not exists date_time_db;
use date_time_db;
-- ============================================
-- 1. CREATE TABLE
-- ============================================

create table Employee(
emp_id int primary key,
emp_name varchar(20),
joining_date date,
joining_time time,
last_login datetime
);
-- ============================================
-- 2. INSERT SAMPLE DATA
-- ============================================

INSERT INTO Employee
(emp_id, emp_name, joining_date, joining_time, last_login)
VALUES
(1, 'Tanvi', '2024-06-15', '09:30:00', '2026-08-31 09:45:30'),
(2, 'Rahul', '2023-03-20', '10:15:00', '2026-08-30 10:20:15'),
(3, 'Priya', '2025-01-10', '09:00:00', '2026-08-29 09:10:45'),
(4, 'Amit', '2022-11-25', '11:00:00', '2026-08-28 11:25:20');

-- ============================================
-- 3. CURRENT DATE AND TIME FUNCTIONS
-- ============================================

-- Current date
select curdate();

-- Current time
select curtime();

-- Current date and time
SELECT NOW();

-- Current date and time
SELECT CURRENT_TIMESTAMP();

-- ============================================
-- 4. EXTRACT YEAR, MONTH AND DAY
-- ============================================

-- Extract year
select emp_name , year(joining_date) as joining_year from Employee;

-- Extract month
SELECT emp_name, MONTH(joining_date) AS joining_month
FROM Employee;

-- Extract day
SELECT emp_name, DAY(joining_date) AS joining_day
FROM Employee;

-- ============================================
-- 5. DAYNAME(), MONTHNAME()
-- ============================================

-- Get day name
SELECT emp_name,
       DAYNAME(joining_date) AS joining_day_name
FROM Employee;

-- Get month name
SELECT emp_name,
       MONTHNAME(joining_date) AS joining_month_name
FROM Employee;

-- ============================================
-- 6. HOUR(), MINUTE(), SECOND()
-- ============================================

-- Extract hour
SELECT emp_name,
       HOUR(joining_time) AS joining_hour
FROM Employee;

-- Extract minute
SELECT emp_name,
       MINUTE(joining_time) AS joining_minute
FROM Employee;

-- Extract second
SELECT emp_name,
       SECOND(joining_time) AS joining_second
FROM Employee;


-- ============================================
-- 7. DATEDIFF()
-- Difference between two dates
-- ============================================
SELECT emp_name,
       DATEDIFF(CURDATE(), joining_date) AS days_worked
FROM Employee;


-- ============================================
-- 8. TIMEDIFF()
-- Difference between two times
-- ============================================

SELECT TIMEDIFF('18:00:00', joining_time) AS time_difference
FROM Employee;

select timediff(curtime() , joining_time) as time_diff from Employee ;

-- ============================================
-- 9. DATE_ADD()
-- Add days/months/years to a date
-- ============================================

-- Add 30 days
SELECT emp_name,
       joining_date,
       DATE_ADD(joining_date, INTERVAL 30 DAY) AS after_30_days
FROM Employee;

-- Add 1 year
SELECT emp_name,
       joining_date,
       DATE_ADD(joining_date, INTERVAL 1 YEAR) AS after_1_year
FROM Employee;

-- ============================================
-- 10. DATE_SUB()
-- Subtract days/months/years
-- ============================================

-- Subtract 30 days
SELECT emp_name,
       joining_date,
       DATE_SUB(joining_date, INTERVAL 30 DAY) AS before_30_days
FROM Employee;

-- Subtract 1 year
SELECT emp_name,
       joining_date,
       DATE_SUB(joining_date, INTERVAL 1 YEAR) AS before_1_year
FROM Employee;

-- ============================================
-- 11. LAST_DAY()
-- Find last day of a month
-- ============================================

SELECT emp_name,
       joining_date,
       LAST_DAY(joining_date) AS month_last_day
FROM Employee;


-- ============================================
-- 12. DATE_FORMAT()
-- Format date
-- ============================================

SELECT emp_name,
       DATE_FORMAT(joining_date, '%d-%m-%Y') AS formatted_date
FROM Employee;

-- Example:
-- %d = Day
-- %m = Month
-- %Y = Four-digit year


-- ============================================
-- 13. EXTRACT()
-- Extract specific date part
-- ============================================

SELECT emp_name,
       EXTRACT(YEAR FROM joining_date) AS year
FROM Employee;

SELECT emp_name,
       EXTRACT(MONTH FROM joining_date) AS month
FROM Employee;

SELECT emp_name,
       EXTRACT(DAY FROM joining_date) AS day
FROM Employee;


-- ============================================
-- 14. QUARTER()
-- Find quarter of the year
-- ============================================

SELECT emp_name,
       joining_date,
       QUARTER(joining_date) AS quarter
FROM Employee;


-- ============================================
-- 15. WEEK()
-- Find week number
-- ============================================

SELECT emp_name,
       joining_date,
       WEEK(joining_date) AS week_number
FROM Employee;

-- ============================================
-- 16. DAYOFWEEK()
-- Returns day number
-- ============================================

SELECT emp_name,
       joining_date,
       DAYOFWEEK(joining_date) AS day_number
FROM Employee;

-- ============================================
-- 17. COMPLETE PRACTICAL QUERY
-- ============================================

SELECT
    emp_id,
    emp_name,
    joining_date,

    YEAR(joining_date) AS year,
    MONTH(joining_date) AS month,
    MONTHNAME(joining_date) AS month_name,
    DAY(joining_date) AS day,
    DAYNAME(joining_date) AS day_name,

    DATEDIFF(CURDATE(), joining_date) AS days_worked

FROM Employee;
