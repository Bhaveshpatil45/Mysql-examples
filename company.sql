CREATE DATABASE IF NOT EXISTS companydb;

USE compantdb;

DROP TABLE IF EXISTS department;

CREATE TABLE department(
	dept_id INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO department(dept_id,name) VALUES
(1,'IT'),
(2,'Engineering'),
(3,'Sales'),
(4,'Marketing'),
(5,'Finance'),
(6,'Support'),
(7,'Operations'),
(8,'HR'),
(9,'Business Development');


DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
	emp_id INTEGER PRIMARY KEY,
    name VARCHAR(150),
    city VARCHAR(60),
    dept_id INTEGER,
    manager_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);

INSERT INTO employee(emp_id,name,city,dept_id) VALUES
(1,'Bhavesh','Pune',1);

INSERT INTO employee(emp_id,name,city,dept_id,manager_id) VALUES
(2,'Shubham','Mumbai',2,1),
(3,'Kiran','Pune',4,1),
(4,'Himanshu','Delhi',7,1),
(5,'Rohit','Indore',9,1),
(6,'Sakshi','Gurugram',5,1),
(7,'Vidya','Noida',3,1),
(8,'Lokesh','Bengluru',6,1),
(9,'Aditi','Hydrabad',9,1);


SELECT * FROM department;
SELECT * FROM employee;
