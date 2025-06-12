-- Basic SQL Commands

-- Creating tables
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);

CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Inserting data
INSERT INTO employees VALUES (1, 'John Doe', 'HR', 50000.00);
INSERT INTO employees VALUES (2, 'Jane Smith', 'IT', 75000.00);
INSERT INTO employees VALUES (3, 'Mark Brown', 'Finance', 60000.00);
INSERT INTO employees VALUES (4, 'Lucy Grey', 'IT', 80000.00);

INSERT INTO departments VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

-- Selecting data
SELECT * FROM employees;
SELECT name, salary FROM employees;
SELECT * FROM employees WHERE department = 'IT';

-- Updating data
UPDATE employees SET salary = salary + 5000 WHERE department = 'HR';

-- Deleting data
DELETE FROM employees WHERE id = 3;

-- Filtering with conditions
SELECT * FROM employees WHERE salary > 60000;
SELECT * FROM employees WHERE department = 'IT' AND salary > 70000;

-- Sorting results
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY name ASC;

-- Limiting results
SELECT * FROM employees LIMIT 2;

-- Aggregate functions
SELECT COUNT(*) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT SUM(salary) FROM employees;

-- Grouping data
SELECT department, COUNT(*) FROM employees GROUP BY department;
SELECT department, AVG(salary) FROM employees GROUP BY department;

-- Using HAVING clause
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 1;

-- Joining tables
SELECT employees.name, departments.name AS department_name
FROM employees
JOIN departments ON employees.department = departments.name;

-- Aliases
SELECT name AS employee_name, salary AS monthly_salary FROM employees;

-- BETWEEN operator
SELECT * FROM employees WHERE salary BETWEEN 60000 AND 80000;

-- IN operator
SELECT * FROM employees WHERE department IN ('IT', 'Finance');

-- LIKE operator
SELECT * FROM employees WHERE name LIKE 'J%';

-- NULL values
CREATE TABLE projects (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);

INSERT INTO projects VALUES (1, 'Migration', 1);
INSERT INTO projects VALUES (2, 'Security Audit', NULL);

SELECT * FROM projects WHERE manager_id IS NULL;

-- ALTER TABLE
ALTER TABLE employees ADD COLUMN email VARCHAR(100);

-- DROP column (syntax varies by DBMS, optional example)
-- ALTER TABLE employees DROP COLUMN email;

-- DELETE all rows
DELETE FROM employees;

-- TRUNCATE table
-- TRUNCATE TABLE employees;

-- DROP table
-- DROP TABLE projects;