

/*
1) QUERIES and SUB QUERIES
2) CLAUSES
3) JOINS
*/

show databases;

create database adv;
use adv;
# -------  QUERIES and SUB QUERIES --- #
/*
In MySQL, queries are used to retrieve data from one or more tables in a database. 
A query is essentially a request for information from the database. 
Subqueries, on the other hand, are queries that are embedded within other queries, 
allowing you to perform more complex operations and retrieve specific data based on the results of another query.
*/

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees VALUES
(1, 'John', 'Doe', 101, 50000.00),
(2, 'Jane', 'Smith', 102, 60000.00),
(3, 'Bob', 'Johnson', 101, 55000.00),
(4, 'Alice', 'Williams', 103, 70000.00);

-- 1. Basic SELECT Query: This query retrieves all columns from the employees table.
SELECT * FROM employees;

-- 2. Subquery in WHERE Clause:
SELECT first_name, last_name
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE first_name = 'John');

-- 3. Subquery in SELECT Clause:
SELECT first_name, last_name, (SELECT AVG(salary) FROM employees) AS avg_salary FROM employees;


#--------------- CLAUSES ---------------#
--  Each clause serves a specific purpose and can be used in various combinations to construct a comprehensive query or statement.

-- 1. SELECT Clause:The SELECT clause is used to specify the columns that you want to retrieve in a query.
SELECT first_name, last_name FROM employees;

-- 2. FROM Clause:The FROM clause specifies the table from which to retrieve the data.
SELECT * FROM employees;

-- WHERE Clause:The WHERE clause is used to filter the rows based on a specified condition.
SELECT * FROM employees WHERE salary > 60000;

-- 4. ORDER BY Clause:The ORDER BY clause is used to sort the result set based on one or more columns.
SELECT * FROM employees ORDER BY last_name ASC;
SELECT * FROM employees ORDER BY first_name ASC;

-- 5. GROUP BY Clause:The GROUP BY clause is used to group rows based on one or more columns and apply aggregate functions.
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id;


-- 6. HAVING Clause:The HAVING clause is used in combination with GROUP BY to filter the grouped data based on a condition.
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id HAVING AVG(salary) < 65000;

#----------- JOIN ----------------- #

/*
In MySQL, JOINs are used to combine rows from two or more tables based on a related column between them. 
There are several types of JOINs, 
1) INNER JOIN, 
2) LEFT JOIN (or LEFT OUTER JOIN), 
3) RIGHT JOIN (or RIGHT OUTER JOIN), 
4) FULL JOIN (or FULL OUTER JOIN).

*/

-- drop database joins;
 
 create database joins;
 use joins;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'vamsi', 'Reddy', 101, 50000.00),
(2, 'sai', 'Smith', 102, 60000.00),
(3, 'Bob', 'John', 101, 55000.00),
(4, 'Ali', 'Williams', 103, 70000.00);

INSERT INTO departments VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');

select * from departments;

-- 1. INNER JOIN: An INNER JOIN returns 'rows when there is a match in both tables based on the specified condition'.
SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- 2. LEFT JOIN (or LEFT OUTER JOIN):A LEFT JOIN returns all rows from the left table and the matching rows from the right table. 
-- If there is no match, NULL values are returned for columns from the right table.

SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;

-- 3. RIGHT JOIN (or RIGHT OUTER JOIN):A RIGHT JOIN returns all rows from the right table and the matching rows from the left table. 
-- If there is no match, NULL values are returned for columns from the left table.

SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;

-- 4. FULL JOIN (or FULL OUTER JOIN):
-- A FULL JOIN returns all rows when there is a match in either the left or right table.
-- If there is no match, NULL values are returned for columns from the table without a match.

SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id

UNION

SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;










