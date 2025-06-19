## common table expressions ##
#A common table expression is a temporary result set that's named and which you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
# Temporary result sets are usually referred to in the execution of a single SELECT, INSERT, UPDATE, DELETE, or CREATE VIEW statement.
# CTEs are absolutely necessary to reduce complex queries down to standard readable and reusable pieces of code. 

WITH cte_example AS
(SELECT gender, AVG(salary), MAX(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY  gender 
)
 SELECT * 
 FROM cte_example;

### joining CTE's 
 WITH cte_example AS
 (SELECT employee_id, gender, birth_date 
 FROM employee_demographics
 WHERE birth_date > '1985-01-01'
 ),
cte_example2 AS
( SELECT employee_id, salary
FROM employee_salary
)
SELECT * 
FROM cte_example cte1
JOIN cte_example2 cte2
	ON cte1.employee_id = cte2.employee_id ;













