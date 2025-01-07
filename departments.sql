USE employeedb;

-- Create the departments Table
CREATE TABLE departments(
   dept_id INTEGER PRIMARY KEY,
   dept_name VARCHAR(50),
   location VARCHAR(50)
);


-- Insert Data into the departments Table
INSERT INTO departments(dept_id,dept_name,location)
VALUES 
(1, 'HR', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Marketing', 'Chennai');

SELECT * FROM departments;


-- Create the employees Table
CREATE TABLE employees(
  empl_id INTEGER PRIMARY KEY,
  empl_name VARCHAR(20),
  dept_id INTEGER,
  FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
  );
  
-- Insert Data into the employees Table
INSERT INTO employees(empl_id,empl_name,dept_id)VALUES
(101, 'Rajesh Kumar', 1),
(102, 'Anita Sharma', 2),
(103, 'Vikram Singh', 3),
(104, 'Priya Iyer', 4),
(105, 'Amit Patel', 3),
(106, 'Sunita Reddy', 1),
(107, 'Manoj Desai', 2),
(108, 'Kavita Joshi', 4),
(109, 'Deepak Verma', 3),
(110, 'Rohit Gupta', 1);


SELECT * FROM employees;


-- Retrieve all employees with their department names and locations
SELECT empl_id,empl_name,
     (SELECT dept_name FROM departments WHERE departments.dept_id = employees.dept_id) AS dept_name,
     (SELECT location FROM departments WHERE departments.dept_id = employees.dept_id)AS location 
     FROM employees;
     

-- Find employees in the IT department
SELECT empl_name
FROM employees
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = 'IT');


-- Count employees in each department
SELECT dept_name,
    (SELECT COUNT(*) FROM employees WHERE employees.dept_id = departments.dept_id) AS total_employees
FROM departments;   


-- Update the location of a department
SET SQL_SAFE_UPDATES = 0;
UPDATE departments
SET location = 'Hydrabad'
WHERE dept_name = 'Marketing';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM departments; 

-- Remove an employee from the employees table
DELETE FROM employees WHERE empl_id = 104; 
SELECT * FROM employees;


-- Remove all employees from a specific department
DELETE FROM employees
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = 'finance');

SELECT * FROM departments;

-- Truncate the employees table
TRUNCATE TABLE employees;

-- Drop the employees table
DROP TABLE IF EXISTS employees;


-- Drop the department table
DROP TABLE IF EXISTS departments;