-- ============================================================================
-- 1. DATABASE SETUP & DATA INSERTION
-- ============================================================================
drop database if exists subquery_db;
create database if not exists subquery_db;
use subquery_db;

-- Drop existing tables to allow clean re-runs
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create Schema
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Data
INSERT INTO departments VALUES 
(101, 'Engineering'), 
(102, 'Sales'), 
(103, 'Marketing');

INSERT INTO employees VALUES 
(1, 'Tanvi', 101, 90000.00),
(2, 'Ronit', 101, 75000.00),
(3, 'Ram', 101, 110000.00),
(4, 'Disha', 102, 60000.00),
(5, 'Seema', 102, 65000.00),
(6, 'Rahul', 103, 50000.00);

INSERT INTO products VALUES 
(201, 'Laptop', 'Electronics', 1200.00),
(202, 'Mouse', 'Electronics', 25.00),
(203, 'Monitor', 'Electronics', 300.00),
(204, 'Desk Chair', 'Furniture', 150.00);

INSERT INTO orders VALUES 
(301, 'Virat Kohali', '2026-01-15'),
(302, 'Neeta Ambani', '2026-02-10'),
(303, 'Rohit Sharama', '2026-03-01');

INSERT INTO order_items VALUES 
(301, 201, 1, 1200.00),
(301, 202, 2, 25.00),
(302, 203, 1, 300.00),
(303, 202, 1, 25.00);

-- ============================================================================
-- 2. SUBQUERY IMPLEMENTATIONS
-- ============================================================================

-- ----------------------------------------------------------------------------
-- TYPE 1: Scalar Subquery in WHERE Clause
-- Returns 1 row, 1 column.
-- Goal: Find employees earning more than the company average.
-- ----------------------------------------------------------------------------

SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees
);

-- ----------------------------------------------------------------------------
-- TYPE 2: Single-Column Multi-Row Subquery using IN
-- Returns 1 column, multiple rows.
-- Goal: Find products that have been ordered at least once.
-- ----------------------------------------------------------------------------
SELECT product_id, product_name, price
FROM products
WHERE product_id IN (
    SELECT DISTINCT product_id 
    FROM order_items
);

-- ----------------------------------------------------------------------------
-- TYPE 3: Subquery in SELECT Clause (Scalar)
-- Goal: Display each employee's salary along with the department average salary.
-- ----------------------------------------------------------------------------
SELECT 
    e.first_name,
    e.salary,
    (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id) AS dept_avg_salary
FROM employees e;

-- ----------------------------------------------------------------------------
-- TYPE 4: Derived Table (Subquery in FROM Clause)
-- Goal: Calculate total revenue per product and filter for revenue > 500.
-- Note: Derived tables MUST have an alias (here named 'product_summary').
-- ----------------------------------------------------------------------------
SELECT 
    product_summary.product_id, 
    product_summary.total_revenue
FROM (
    SELECT 
        product_id, 
        SUM(quantity * unit_price) AS total_revenue
    FROM order_items
    GROUP BY product_id
) AS product_summary
WHERE product_summary.total_revenue > 500.00;

-- ----------------------------------------------------------------------------
-- TYPE 5: Correlated Subquery
-- Outer query passes 'e1.department_id' into the inner query.
-- Goal: Find employees earning more than the average salary of THEIR department.
-- ----------------------------------------------------------------------------
SELECT e1.employee_id, e1.first_name, e1.department_id, e1.salary
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);

-- ----------------------------------------------------------------------------
-- TYPE 6: Using EXISTS and NOT EXISTS
-- Checks for row presence efficiently.
-- Goal: Find products that have NEVER been ordered.
-- ----------------------------------------------------------------------------
SELECT p.product_id, p.product_name
FROM products p
WHERE NOT EXISTS (
    SELECT 1 
    FROM order_items oi 
    WHERE oi.product_id = p.product_id
);

-- ----------------------------------------------------------------------------
-- TYPE 7: Subquery in HAVING Clause
-- Goal: Find departments whose total salary payout exceeds the average department total.
-- ----------------------------------------------------------------------------
SELECT department_id, SUM(salary) AS total_dept_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > (
    SELECT AVG(dept_total)
    FROM (
        SELECT SUM(salary) AS dept_total
        FROM employees
        GROUP BY department_id
    ) AS dept_sums
);

-- ----------------------------------------------------------------------------
-- MODERN ALTERNATIVE: Refactoring Type 4/7 Subqueries into CTEs
-- Common Table Expressions (WITH clause) make complex subqueries clean and readable.
-- ----------------------------------------------------------------------------
WITH ProductRevenue AS (
    SELECT 
        product_id, 
        SUM(quantity * unit_price) AS total_revenue
    FROM order_items
    GROUP BY product_id
)
SELECT p.product_name, pr.total_revenue
FROM ProductRevenue pr
JOIN products p ON p.product_id = pr.product_id
WHERE pr.total_revenue > 500.00;