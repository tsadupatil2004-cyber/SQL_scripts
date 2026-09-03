-- =====================================================
-- ACID PROPERTIES IN SQL
-- Example: Bank Money Transfer
-- =====================================================

DROP DATABASE IF EXISTS acid_demo;
CREATE DATABASE acid_demo;

USE acid_demo;


-- =====================================================
-- 1. CREATE TABLE
-- =====================================================

CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance DECIMAL(10,2)
);

-- =====================================================
-- 2. INSERT SAMPLE DATA
-- =====================================================

INSERT INTO Account
(account_id, account_holder, balance)
VALUES
(101, 'Tanvi', 50000.00),
(102, 'Rahul', 30000.00);


-- Check initial balance
SELECT * FROM Account;


-- =====================================================
-- A — ATOMICITY
-- =====================================================
-- Atomicity means:
-- Either ALL operations of a transaction are completed,
-- or NONE of them are completed.
--
-- Example:
-- Transfer ₹5000 from Tanvi to Rahul.
-- =====================================================

START TRANSACTION;

UPDATE Account
SET balance = balance - 5000
WHERE account_id = 101;

UPDATE Account
SET balance = balance + 5000
WHERE account_id = 102;

COMMIT;


-- Check updated balances
SELECT * FROM Account;


-- =====================================================
-- ROLLBACK DEMONSTRATION
-- =====================================================
-- If an error occurs before COMMIT,
-- we can undo the transaction.
-- =====================================================

START TRANSACTION;

UPDATE Account
SET balance = balance - 2000
WHERE account_id = 101;

UPDATE Account
SET balance = balance + 2000
WHERE account_id = 102;

-- Cancel the transaction
ROLLBACK;


-- Check balances
-- Changes made after START TRANSACTION are undone.
SELECT * FROM Account;

-- =====================================================
-- C — CONSISTENCY
-- =====================================================
-- Consistency means:
-- The database must remain valid before and after
-- every transaction.
--
-- PRIMARY KEY and CHECK constraints help maintain
-- consistency.
-- =====================================================

CREATE TABLE Account_Consistent (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance DECIMAL(10,2) CHECK (balance >= 0)
);


INSERT INTO Account_Consistent
VALUES
(201, 'Amit', 25000.00),
(202, 'Priya', 35000.00);


-- This is valid
UPDATE Account_Consistent
SET balance = 20000
WHERE account_id = 201;


-- This will fail because balance cannot be negative
-- UPDATE Account_Consistent
-- SET balance = -5000
-- WHERE account_id = 201;


SELECT * FROM Account_Consistent;


-- =====================================================
-- I — ISOLATION
-- =====================================================
-- Isolation means:
-- Multiple transactions can execute at the same time
-- without incorrectly interfering with each other.
--
-- MySQL InnoDB supports transaction isolation levels.
-- =====================================================

-- Check current isolation level
SELECT @@transaction_isolation;


-- Set isolation level
SET SESSION TRANSACTION ISOLATION LEVEL
READ COMMITTED;


-- Start a transaction
START TRANSACTION;

SELECT *
FROM Account
WHERE account_id = 101;

COMMIT;


-- Other common isolation levels:
--
-- READ UNCOMMITTED
-- READ COMMITTED
-- REPEATABLE READ
-- SERIALIZABLE


-- =====================================================
-- D — DURABILITY
-- =====================================================
-- Durability means:
-- Once COMMIT is successfully executed,
-- the changes are permanently saved.
-- =====================================================

START TRANSACTION;

UPDATE Account
SET balance = balance + 1000
WHERE account_id = 101;

COMMIT;


-- The ₹1000 increase is now committed.
SELECT * FROM Account;


-- =====================================================
-- FINAL ACCOUNT DATA
-- =====================================================

SELECT
    account_id,
    account_holder,
    balance
FROM Account;