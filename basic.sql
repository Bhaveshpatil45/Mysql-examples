CREATE DATABASE schooldb;
-- using the created databse 
USE schooldb;
-- retrieving all data from the student table
SELECT * FROM students;

-- add a new column to the students table
ALTER TABLE students
ADD COLUMN grade_level INT;

-- drop the newly added column from the students table
ALTER TABLE students
DROP COLUMN grade_level;

-- drop the students table 
DROP TABLE IF EXISTS students;

-- Recreate the students table
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    course_id INT
);

-- insert data into the students table
INSERT INTO students (student_id,name,age,gender,course_id)
VALUES (1, 'Sakshi Jaiswal',20,'Female',101);

-- insert data into the students table with columns in a different order
INSERT INTO students(name, student_id, gender, age, course_id)
VALUES ('Bhavesh patil',2,'Male', 22, 102);

-- delete all rows from the students table 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM students;
SET SQL_SAFE_UPDATES = 1;

-- Retrieve all rows from the students table where student id is greater than 3
SELECT * FROM students WHERE student_id > 3;

-- retrieve all data from the students table again
SELECT * FROM students;

-- delete row from the students table where student_id is greater than 3
DELETE FROM students WHERE student_id > 3;

-- Retrieve all data from the students table after deletion
SELECT * FROM students;

-- remove all rows from the students table but keep the table structure  
TRUNCATE TABLE students;

-- retrieve all data from the students table after truncation
SELECT * FROM students;

-- Update the course_id of a specific student
UPDATE students
SET course_id = 106
WHERE student_id = 2;

-- retrieve data from the students table for a specific student
SELECT * FROM students WHERE 
student_id = 2;

-- get the total number of rows in the students table
SELECT COUNT(*) FROM students;

-- Group by gender and get counts for students having more than 1 student
SELECT gender, COUNT(*) AS
total_students
FROM students
GROUP BY gender
HAVING total_students> 1;

-- retrieve distinct student names
SELECT DISTINCT(name) FROM students;

-- insert new data into the students table
INSERT INTO students(student_id, name, age, gender, course_id)
VALUES (1001, 'Suman Duggal', 24, 'Female', 105);

SELECT * FROM students;
