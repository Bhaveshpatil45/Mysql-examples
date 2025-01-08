USE companydb;

DELIMITER //
CREATE FUNCTION getEmployeeNameFunc(e_id INT) RETURNS VARCHAR(120)
READS SQL DATA 
BEGIN
		DECLARE emp_name VARCHAR(120);
		SELECT name INTO emp_name FROM employee WHERE emp_id = e_id;
	RETURN emp_name;
END //

DELIMITER ;

SELECT getEmployeeNameFunc(5);