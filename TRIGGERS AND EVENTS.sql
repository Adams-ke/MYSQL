-- TRIGGERS AND EVENTS
-- A trigger is a stored program in MySQL that automatically executes in response to certain events on a table, 
-- such as INSERT, UPDATE, or DELETE.


SELECT * 
FROM  employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert 
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN 
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Andy', 'Kibe', 'CEO-Yaafrika', 1000000, 7);

SELECT * 
FROM  employee_demographics;

delete 
from employee_demographics
where employee_id = 13;

### EVENTS
-- An event in MySQL is a scheduled task that runs at specific time intervals or at a specific time. It's like a cron job inside MySQL.


DELIMITER $$
CREATE EVENT retirerees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN 
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;