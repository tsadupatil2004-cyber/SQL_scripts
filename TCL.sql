# TCL (Transaction Control Language)

-- ============================================
-- TCL (Transaction Control Language)
-- ============================================

-- Select database
USE CollegeDB;


-- ============================================
-- 1. CREATE TABLE
-- ============================================

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Balance DECIMAL(10,2)
);


-- ============================================
-- 2. INSERT INITIAL DATA
-- ============================================

INSERT INTO Accounts
(AccountID, AccountHolder, Balance)
VALUES
(101, 'Tanvi', 50000.00),
(102, 'Asha', 30000.00),
(103, 'Ravi', 40000.00);

-- Save initial data permanently
COMMIT;


-- ============================================
-- 3. COMMIT
-- ============================================

-- Start a transaction
START TRANSACTION;

-- Update Tanvi's balance
UPDATE Accounts
SET Balance = Balance - 5000
WHERE AccountID = 101;

-- Update Asha's balance
UPDATE Accounts
SET Balance = Balance + 5000
WHERE AccountID = 102;

-- Make the changes permanent
COMMIT;

-- Check the result
SELECT * FROM Accounts;


-- ============================================
-- 4. ROLLBACK
-- ============================================

START TRANSACTION;

-- Make a temporary change
UPDATE Accounts
SET Balance = Balance - 10000
WHERE AccountID = 101;

-- Undo the transaction
ROLLBACK;

-- Check the result
SELECT * FROM Accounts;


-- ============================================
-- 5. SAVEPOINT
-- ============================================

START TRANSACTION;

-- First update
UPDATE Accounts
SET Balance = Balance + 2000
WHERE AccountID = 103;

-- Create savepoint
SAVEPOINT sp1;

-- Second update
UPDATE Accounts
SET Balance = Balance - 3000
WHERE AccountID = 102;

-- Rollback only the second update
ROLLBACK TO SAVEPOINT sp1;

-- Make the first update permanent
COMMIT;

-- Check final result
SELECT * FROM Accounts;