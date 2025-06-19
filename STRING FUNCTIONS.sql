-- STRING FUNCTIINS 
### FINDING THE LEGNTH 


SELECT length('snowfall');

SELECT first_name, length(first_name)
FROM employee_demographics
ORDER BY 2; ## USE CASE, WORKING WITH PHONE NUMBERS, ENSURING THAT THEY ARE TEN CHARATERS LONG 

#UPPER LOWER FOR STANDADIZATION 
SELECT upper('snowfall');

SELECT lower('TOPBOY');

SELECT first_name, upper(first_name)
FROM employee_demographics;

SELECT first_name,lower(first_name)
FROM employee_demographics;

# TRIM, LEFT TRIM AND RIGHT TRIM 
-- GETS RID OF THE SPACE INFRONT OR THE END AND GET RID OF IT 
SELECT trim('     SNOW           ');

SELECT Ltrim('     SNOW           ');

SELECT Rtrim('     SNOW           ');

#LEFT AND RIGHT  
SELECT  first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 3)
FROM employee_demographics;

#### SUBSTRINGS ##
SELECT first_name,
SUBSTRING(first_name, 3, 2)
FROM employee_demographics;

## SUBSTRINGS AND DATES
SELECT first_name, last_name,
substring(birth_date, 6, 2) BirthMonth
FROM employee_demographics;

#replace , it replaes a chaater with a specific character that you want 
# taking an example  replacing 'a' with 'z' 

SELECT first_name,
REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

#LOCATE 
SELECT locate('m', 'Adams');

SELECT first_name, 
locate('An', first_name)
from employee_demographics;

#### concatenation 
-- combines multiple columns into one
SELECT first_name,last_name,
concat(first_name, ' ',  last_name) FullName
FROM employee_demographics;









