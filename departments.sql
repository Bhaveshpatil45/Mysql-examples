USE employeedb;

CREATE TABLE departments(
   dept_id INTEGER PRIMARY KEY,
   dept_name VARCHAR(50),
   location VARCHAR(50)
);


INSERT INTO departments(dept_id,dept_name,location)
VALUES 
(1, 'HR', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Marketing', 'Chennai');

SELECT * FROM departments;

CREATE TABLE employees(
  empl_id INTEGER PRIMARY KEY,
  empl_name VARCHAR(20),
  dept_id INTEGER,
  FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
  );
  
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

SELECT empl_id,empl_name,
     (SELECT dept_name FROM departments WHERE departments.dept_id = employees.dept_id) AS dept_name,
     (SELECT location FROM departments WHERE departments.dept_id = employees.dept_id)AS location 
     FROM employees;
     

SELECT empl_name
FROM employees
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = 'IT');


SELECT dept_name,
    (SELECT COUNT(*) FROM employees WHERE employees.dept_id = departments.dept_id) AS total_employees
FROM departments;   



SET SQL_SAFE_UPDATES = 0;
UPDATE departments
SET location = 'Hydrabad'
WHERE dept_name = 'Marketing';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM departments; 


DELETE FROM employees WHERE empl_id = 104; 
SELECT * FROM employees;

DELETE FROM employees
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name = 'finance');

SELECT * FROM departments;