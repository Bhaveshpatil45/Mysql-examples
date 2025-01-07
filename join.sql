USE employeesdb;

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

SELECT * FROM departments;
SELECT * FROM employees;

-- inner join - Retrieve all employees along with their department names and locations
SELECT e.empl_id, e.empl_name, d.dept_name, d.location
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- left join - Retrieve all employees and their departments. Include employees without a department (if any)
SELECT e.empl_id, e.empl_name,d.dept_name,d.location
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- right join - Retrieve all departments and the employees assigned to them. Include departments without employees
SELECT e.empl_id, e.empl_name,d.dept_name,d.location
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- full outer join - Retrieve all employees and departments, including unmatched rows from both tables 
-- (Note: MySQL does not support FULL OUTER JOIN directly. Use UNION to simulate it.)
SELECT e.empl_id, e.empl_name, d.dept_name, d.location
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.empl_id, e.empl_name, d.dept_name, d.location
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


-- cross join - Retrieve all possible combinations of employees and departments
SELECT e.empl_name,d.dept_name
FROM employees e
CROSS JOIN departments d;

-- self join - Find employees working in the same department
SELECT e1.empl_name AS employee1,e2.empl_name AS employee2,d.dept_name
FROM employees e1
INNER JOIN employees e2
ON e1.dept_id = e2.dept_id AND e1.empl_id = e2.empl_id
INNER JOIN departments d 
ON e1.dept_id = d.dept_id; 