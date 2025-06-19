#CASE STATEMENTS
-- allow you to add logic to select statements
SELECT first_name, last_name, age,
CASE 
	WHEN age <= 30 THEN 'young'
	WHEN age BETWEEN 30 AND 49 THEN 'elder'
    WHEN age >= 50 THEN 'dying' 
END age_bracket
 FROM employee_demographics;

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary*1.05
	WHEN salary > 50000 THEN salary*1.07
END new_sal,
CASE 
	WHEN dept_id = 6 THEN salary*0.10
END bonuses
FROM employee_salary;





















