#OPERATORS
/* operators are symbols or keywords used to perform operations on values and expressions. 
They are fundamental components in SQL queries, allowing you to filter, compare, and manipulate data. 
Here are some common types of operators in MySQL:
1) Arithmetic Operators:
2) Comparison Operators:
3) Logical Operators:
4) Concatenation Operator:
5) LIKE Operator:
6) IN Operator:
7) IS NULL / IS NOT NULL:
8) BETWEEN Operator:
*/

show databases;

# Arithmetic Operators:
show databases;

create database sum;
use sum;
-- Creating a sample table
CREATE TABLE numbers (
    a INT,
    b INT
);

-- Inserting some sample data
INSERT INTO numbers (a, b) VALUES
    (10, 3),
    (15, 7),
    (25, 5);
    
-- Performing arithmetic operations
SELECT
    a,
    b,
    a + b AS sum_result,
    a - b AS difference_result,
    a * b AS product_result,
    a / b AS division_result,
    a % b AS modulus_result
FROM
    numbers;
    
    
# Comparison Operators
CREATE TABLE products (
    product_id INT,
    product_name varchar(30),
    price INT,
    stock_quantity int
);

insert into products (product_id,product_name,price,stock_quantity)
values
(1,'rice',30,40),
(2,'Dal',96,47),
(3,'fruit',70,30);

select * from products;

#Equal to (=)
SELECT * FROM products WHERE price = 30;

#Not equal to (<> or !=):
SELECT * FROM products WHERE product_id != 2;

#Less than (<):
SELECT * FROM products WHERE price < 90;

#Greater than (>):
SELECT * FROM products WHERE stock_quantity > 40;

#Less than or equal to (<=):
SELECT * FROM products WHERE price <= 25;

#Greater than or equal to (>=):
SELECT * FROM products WHERE stock_quantity >= 50;

# Logical Operators

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
);

INSERT INTO employees VALUES (1, 'John', 'Doe', 50000, 'Sales');
INSERT INTO employees VALUES (2, 'Jane', 'Smith', 60000, 'Marketing');
INSERT INTO employees VALUES (3, 'Bob', 'Johnson', 55000, 'Sales');
INSERT INTO employees VALUES (4, 'Alice', 'Williams', 70000, 'Finance');
INSERT INTO employees VALUES (5, 'Charlie', 'Brown', 48000, 'Marketing');

#AND Operator:
-- Retrieve employees from the Sales department with a salary greater than 50000
SELECT * FROM employees
WHERE department = 'Sales' AND salary > 50000;

#OR Operator:
-- Retrieve employees from the Sales department or with a salary greater than 60000
SELECT * FROM employees
WHERE department = 'Sales' OR salary > 60000;

# NOT Operator:
-- Retrieve employees not from the Marketing department
SELECT * FROM employees
WHERE NOT department = 'Marketing';

#----- Concatenation Operator:-----------#
-- Create a database
CREATE DATABASE IF NOT EXISTS example_database;
USE example_database;

-- Create a table
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT
);

-- Insert some data
INSERT INTO employees VALUES (1, 'John', 'dev', 50000);
INSERT INTO employees VALUES (2, 'Sai', 'Smith', 60000);
INSERT INTO employees VALUES (3, 'Bob', 'John', 55000);

-- Concatenation using ||
SELECT employee_id, first_name || ' ' || last_name AS full_name
FROM employees;

-- Concatenation using CONCAT()
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

#-------------- LIKE Operator ------------#


-- Create a table
CREATE TABLE IF NOT EXISTS ele_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

-- Insert some data
INSERT INTO ele_products VALUES (1, 'Mobile Phone');
INSERT INTO ele_products VALUES (2, 'Laptop');
INSERT INTO ele_products VALUES (3, 'Tablet');
INSERT INTO ele_products VALUES (4, 'Smartwatch');

-- Use LIKE to find products with names starting with 'Mobile'
SELECT * FROM ele_products
WHERE product_name LIKE 'Mobile%';

-- Find products with names containing 'Phone'
SELECT * FROM ele_products
WHERE product_name LIKE '%Phone%';

-- Find products with names ending with 'Tablet'
SELECT * FROM ele_products
WHERE product_name LIKE '%Tablet';

#------------- IN Operator: ---------------#
-- Create a departments table
-- Create a table
CREATE TABLE IF NOT EXISTS employees_dep (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

-- Insert some data
INSERT INTO employees_dep VALUES (1, 'John', 'sin', 'Sales');
INSERT INTO employees_dep VALUES (2, 'Sri', 'Smith', 'Marketing');
INSERT INTO employees_dep VALUES (3, 'Bob', 'John', 'Sales');
INSERT INTO employees_dep VALUES (4, 'Ali', 'Williams', 'Finance');
INSERT INTO employees_dep VALUES (5, 'Char', 'Brown', 'Marketing');

-- Use IN to find employees in 'Sales' or 'Marketing'
SELECT * FROM employees_dep
WHERE department IN ('Sales', 'Marketing');


#----------------- IS NULL / IS NOT NULL -------------#
-- Create a table
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Insert some data with NULL values in the last_name column
INSERT INTO students VALUES (1, 'Vamsi', 'Reddy');
INSERT INTO students VALUES (2, 'Sai', NULL);
INSERT INTO students VALUES (3, 'Bob', 'John');
INSERT INTO students VALUES (4, 'Kumar', NULL);

-- Find students with a null last_name
SELECT * FROM students WHERE last_name IS NULL;


-- Find students with a non-null last_name
SELECT * FROM students
WHERE last_name IS NOT NULL;


#------------- BETWEEN Operator --------------#
-- Create a table
CREATE TABLE IF NOT EXISTS products_val (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Insert some data
INSERT INTO products_val VALUES (1, 'Laptop', 800.00);
INSERT INTO products_val VALUES (2, 'Smartphone', 200.00);
INSERT INTO products_val VALUES (3, 'Tablet', 120.00);
INSERT INTO products_val VALUES (4, 'Headphones', 60.00);
INSERT INTO products_val VALUES (5, 'Camera', 150.00);

-- Find products with prices between $50 and $100
SELECT * FROM products_val WHERE price BETWEEN 50.00 AND 100.00;

-- Find products with prices outside the range $50 to $100
SELECT * FROM products_val WHERE price NOT BETWEEN 50.00 AND 100.00;














