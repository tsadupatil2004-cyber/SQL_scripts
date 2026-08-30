# DML (Data Manipulation Language)
# DML works with the data stored inside tables.
<<<<<<< HEAD
=======

>>>>>>> e2a4043 (Update DML.sql)
-- =========================================
-- DML COMMANDS PRACTICAL
-- =========================================

-- Delete old database
DROP DATABASE IF EXISTS CollegeDB;

-- Create new database
CREATE DATABASE CollegeDB;

-- Select database
USE CollegeDB;


-- =========================================
-- CREATE TABLE
-- =========================================

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Marks DECIMAL(5,2)
);


-- =========================================
-- INSERT COMMAND
-- =========================================

INSERT INTO Students
(StudentID, Name, Age, Department, Marks)
VALUES
(1, 'Tanvi', 21, 'Data Science', 85.50),
(2, 'Asha', 20, 'Computer Science', 78.00),
(3, 'Ravi', 22, 'Data Science', 91.50),
(4, 'Neha', 21, 'IT', 82.00),
(5, 'Rahul', 23, 'Computer Science', 69.50);


-- Display records
SELECT * FROM Students;


-- =========================================
-- UPDATE COMMAND
-- =========================================

UPDATE Students
SET Marks = 88.00
WHERE StudentID = 1;

UPDATE Students
SET Department = 'Artificial Intelligence'
WHERE StudentID = 3;


-- Display updated records
SELECT * FROM Students;


-- =========================================
-- DELETE COMMAND
-- =========================================

DELETE FROM Students
WHERE StudentID = 5;


-- Display records after deletion
<<<<<<< HEAD
SELECT * FROM Students as Updated_student;
=======
SELECT * FROM Students as Updated_student;
>>>>>>> e2a4043 (Update DML.sql)
