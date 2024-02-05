/*
SQL Aggregate Functions
SQL String Functions
*/
#database 

show databases;
#drop database functions;
create database functions;
use functions;

#------ SQL Aggregate Functions -------#
/*
SQL aggregate functions are used to perform calculations on sets of values. 
These functions operate on multiple rows of data and return a single value, summarizing the information in the dataset. 
*/
-- Creating a table for sales data
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    sale_date DATE,
    quantity INT,
    unit_price DECIMAL(10, 2)
);

-- Inserting sample data into the sales table
INSERT INTO sales (sale_id, product_name, sale_date, quantity, unit_price) VALUES
(1, 'Laptop', '2022-01-15', 3, 1200.00),
(2, 'Smartphone', '2022-01-20', 5, 599.99),
(3, 'Tablet', '2022-02-05', 2, 299.99),
(4, 'Headphones', '2022-02-15', 10, 49.99),
(5, 'Laptop', '2022-03-10', 2, 1300.00);

-- COUNT():Counts the number of rows in a result set.
SELECT COUNT(*) AS total_sales FROM sales;

-- SUM():Calculates the sum of a numeric column.
SELECT SUM(quantity) AS total_quantity, SUM(unit_price * quantity) AS total_revenue FROM sales;

-- AVG():Calculates the average value of a numeric column.
SELECT AVG(unit_price) AS average_price FROM sales;

-- MIN() and MAX():Retrieve the minimum and maximum values from a column.
SELECT MIN(unit_price) AS min_price, MAX(unit_price) AS max_price FROM sales;

-- GROUP BY:Groups the result set by one or more columns.
SELECT product_name, SUM(quantity) AS total_quantity FROM sales GROUP BY product_name;

-- HAVING: Filters the results of a GROUP BY query based on a condition.
SELECT product_name, SUM(quantity) AS total_quantity FROM sales GROUP BY product_name HAVING total_quantity > 5;



# --------- SQL String Functions ---------#
-- string functions that allow you to manipulate and perform operations on character strings.


-- Creating a table for employee data
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Inserting sample data into the employees table
INSERT INTO employees (employee_id, first_name, last_name, email, salary) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 50000.00),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 60000.00),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', 55000.00);


-- Functions ----

-- CONCAT():Concatenates two or more strings.
SELECT CONCAT(first_name, '  ', last_name) AS full_name FROM employees;

-- LENGTH():Returns the length of a string.
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- UPPER() and LOWER():Converts a string to uppercase or lowercase.
SELECT first_name, UPPER(first_name) AS upper_name, LOWER(first_name) AS lower_name FROM employees;

-- SUBSTRING():Extracts a substring from a string.
SELECT first_name, SUBSTRING(first_name, 1, 2) AS substring_name FROM employees;

-- LEFT() and RIGHT():Retrieves a specified number of characters from the left or right of a string.
SELECT first_name, LEFT(first_name, 1) AS left_name, RIGHT(first_name, 2) AS right_name FROM employees;

-- TRIM():Removes leading and trailing spaces from a string.

SELECT email, TRIM(email) AS trimmed_email FROM employees;

-- REPLACE():Replaces occurrences of a specified substring with another substring.
SELECT email, REPLACE(email, '@example.com', '@company.com') AS new_email FROM employees;






