-- Day 1: Basic SQL Commands and Table Creation

-- Creating a 'students' table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    enrollment_date DATE
);

-- Creating a 'books' table
CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    year INT
);

-- Inserting data into 'students'
INSERT INTO students VALUES (1, 'Alice', 'Math', '2023-01-10');
INSERT INTO students VALUES (2, 'Bob', 'Science', '2023-01-11');
INSERT INTO students VALUES (3, 'Charlie', 'Math', '2023-01-12');
INSERT INTO students VALUES (4, 'Daisy', 'English', '2023-01-13');

-- Inserting data into 'books'
INSERT INTO books VALUES (1, 'Harry Potter', 'J.K. Rowling', 1997);
INSERT INTO books VALUES (2, 'To Kill a Mockingbird', 'Harper Lee', 1960);
INSERT INTO books VALUES (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925);

-- Day 2: Data Manipulation and Filtering

-- Updating records
UPDATE books SET year = 2000 WHERE title = 'Harry Potter';

-- Deleting records
DELETE FROM books WHERE year < 1950;

-- Filtering with WHERE, AND, OR
SELECT * FROM books WHERE author = 'J.K. Rowling';
SELECT * FROM books WHERE author = 'J.K. Rowling' AND year > 1995;

-- Sorting and limiting data
SELECT * FROM books ORDER BY title ASC;
SELECT * FROM books ORDER BY year DESC;
SELECT * FROM books LIMIT 2;

-- Creating 'authors' table and linking it to 'books'
CREATE TABLE authors (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Adding 'author_id' to books
ALTER TABLE books ADD COLUMN author_id INT;
UPDATE books SET author_id = 1 WHERE title = 'Harry Potter';
UPDATE books SET author_id = 2 WHERE title = 'To Kill a Mockingbird';
UPDATE books SET author_id = 3 WHERE title = 'The Great Gatsby';

-- Inserting into authors
INSERT INTO authors VALUES (1, 'J.K. Rowling');
INSERT INTO authors VALUES (2, 'Harper Lee');
INSERT INTO authors VALUES (3, 'F. Scott Fitzgerald');

-- INNER JOIN example
SELECT books.title, authors.name FROM books INNER JOIN authors ON books.author_id = authors.id;

-- Day 3: Functions, Grouping, and Transactions

-- Using string functions
SELECT UPPER(name) FROM students;
SELECT LOWER(name) FROM students;
SELECT CONCAT(name, ' is enrolled in ', course) FROM students;

-- Using numeric functions
SELECT COUNT(*) FROM students;
SELECT AVG(id) FROM students;

-- Using date functions
SELECT NOW();
SELECT DATE_FORMAT(enrollment_date, '%d-%M-%Y') FROM students;

-- Grouping and aggregation
SELECT course, COUNT(*) FROM students GROUP BY course;
SELECT course, COUNT(*) FROM students GROUP BY course HAVING COUNT(*) > 1;

-- Transaction simulation
START TRANSACTION;
UPDATE students SET course = 'Physics' WHERE name = 'Alice';
UPDATE students SET course = 'Chemistry' WHERE name = 'Bob';
ROLLBACK;

-- E-commerce real-world use case

-- Creating e-commerce tables
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE
);

-- Inserting data into e-commerce tables
INSERT INTO customers VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');
INSERT INTO products VALUES (1, 'Laptop', 70000), (2, 'Phone', 30000), (3, 'Tablet', 20000);
INSERT INTO orders VALUES (1, 1, 2, '2023-04-10'), (2, 2, 1, '2023-04-11'), (3, 1, 3, '2023-04-12');

-- Retrieve all orders by a customer
SELECT * FROM orders WHERE customer_id = 1;

-- Show top-selling products
SELECT product_id, COUNT(*) AS total_sales FROM orders GROUP BY product_id ORDER BY total_sales DESC;

-- Find customers who have not made a purchase
SELECT * FROM customers WHERE id NOT IN (SELECT customer_id FROM orders);