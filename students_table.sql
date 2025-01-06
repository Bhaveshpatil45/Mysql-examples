USE schooldb;
-- create the students table
CREATE TABLE students(
student_id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(10),
course_id INT
);

-- insert data into the students table
INSERT INTO students (student_id,name,age,gender,course_id)
VALUES (1, 'Sakshi Jaiswal',20,'Female',101),
	  (2, 'Bhavesh patil', 22, 'Male', 102),
      (3, 'Parag Patil', 21, 'Male', 103),
      (4, 'Aditi Jha', 23, 'Female', 104),
      (5, 'Urvashi Kolate', 24, 'Female', 105);
      
SELECT *FROM students;
