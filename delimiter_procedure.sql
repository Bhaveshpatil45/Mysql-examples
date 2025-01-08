USE companydb;

DELIMITER //

CREATE PROCEDURE getEmployeeNameProc(IN e_id INT, OUT emp_name VARCHAR(120))
BEGIN
	SELECT name INTO emp_name FROM employee WHERE emp_id = e_id;
END //

DELIMITER ;

SET @emp_name = '';


CALL getEmployeeNameProc(5,@emp_name);

SELECT @emp_name;