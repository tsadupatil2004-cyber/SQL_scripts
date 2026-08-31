-- ============================================
-- STRING FUNCTIONS IN SQL
-- ============================================

-- Select database
USE CollegeDB;


-- ============================================
-- 1. CREATE TABLE
-- ============================================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Email VARCHAR(100)
);


-- ============================================
-- 2. INSERT SAMPLE DATA
-- ============================================

INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, Email)
VALUES
(1, 'Tanvi', 'Sadupatil', 'Data Science', 'tanvi@gmail.com'),
(2, 'Asha', 'Patil', 'Computer Science', 'asha@gmail.com'),
(3, 'Ravi', 'Sharma', 'Information Technology', 'ravi@gmail.com'),
(4, 'Neha', 'Deshmukh', 'Data Analytics', 'neha@gmail.com');


-- ============================================
-- 3. UPPER()
-- Converts text to uppercase
-- ============================================

SELECT UPPER(FirstName) AS Upper_Name
FROM Employees;


-- ============================================
-- 4. LOWER()
-- Converts text to lowercase
-- ============================================

SELECT LOWER(FirstName) AS Lower_Name
FROM Employees;


-- ============================================
-- 5. LENGTH()
-- Returns length in bytes
-- ============================================

SELECT FirstName, LENGTH(FirstName) AS Name_Length
FROM Employees;


-- ============================================
-- 6. CHAR_LENGTH()
-- Returns number of characters
-- ============================================

SELECT FirstName, CHAR_LENGTH(FirstName) AS Character_Count
FROM Employees;


-- ============================================
-- 7. CONCAT()
-- Combines two or more strings
-- ============================================

SELECT CONCAT(FirstName, ' ', LastName) AS Full_Name
FROM Employees;


-- ============================================
-- 8. CONCAT_WS()
-- Combines strings using a separator
-- ============================================

SELECT CONCAT_WS(' - ', FirstName, Department) AS Employee_Details
FROM Employees;


-- ============================================
-- 9. SUBSTRING()
-- Extracts part of a string
-- ============================================

SELECT FirstName,
       SUBSTRING(FirstName, 1, 3) AS Short_Name
FROM Employees;


-- ============================================
-- 10. LEFT()
-- Returns characters from the left
-- ============================================

SELECT FirstName,
       LEFT(FirstName, 3) AS Left_Characters
FROM Employees;


-- ============================================
-- 11. RIGHT()
-- Returns characters from the right
-- ============================================

SELECT FirstName,
       RIGHT(FirstName, 3) AS Right_Characters
FROM Employees;


-- ============================================
-- 12. TRIM()
-- Removes leading and trailing spaces
-- ============================================

SELECT TRIM('   Data Science   ') AS Trimmed_Text;


-- ============================================
-- 13. REPLACE()
-- Replaces part of a string
-- ============================================

SELECT Department,
       REPLACE(Department, 'Data', 'AI') AS Updated_Department
FROM Employees;