-- Create the departments table
DROP TABLE departments,employees;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert sample data into departments
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

-- Create the employees table
CREATE TABLE employees (
    empl_id INT AUTO_INCREMENT PRIMARY KEY,
    empl_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert sample data into employees (optional)
INSERT INTO employees (empl_name, dept_id) VALUES
('Rajesh Kumar', 1),
('Anita Sharma', 2),
('Vikram Singh', 3);

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS add_employee;

-- Create the stored procedure
DELIMITER //

CREATE PROCEDURE add_employee(
    IN emp_name VARCHAR(50),
    IN emp_dept_id INT
)
BEGIN
    -- Check if the department exists
    IF EXISTS (SELECT 1 FROM departments WHERE dept_id = emp_dept_id) THEN
        -- Insert the employee
        INSERT INTO employees (empl_name, dept_id)
        VALUES (emp_name, emp_dept_id);
    ELSE
        -- Raise an error if the department doesn't exist
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department does not exist.';
    END IF;
END //

DELIMITER ;


-- Add an employee to an existing department
CALL add_employee('John Doe', 1);

-- Try adding an employee to a non-existent department
CALL add_employee('Jane Doe', 5);

-- View the employees table
SELECT * FROM employees;

-- View the departments table
SELECT * FROM departments;
