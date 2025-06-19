# temporary tables 
#A temporary table in MySQL is a table that allows one to store a temporary 
#result set of a query and which one can reuse multiple times during one session.

# there are two ways to do this 
-- when creating a temp table from scrach 
CREATE TEMPORARY TABLE movies 
(first_name VARCHAR(50),
last_name VARCHAR(50),
fav_movie VARCHAR(100)
);

INSERT INTO movies 
VALUES ('Adams', 'Kembo', 'Peaky Blinders');

SELECT *
FROM movies;

## the other way to create a temp table is by selecting from another table 
 CREATE TEMPORARY TABLE sal_over_50k
 SELECT *
 FROM employee_salary
 WHERE salary >= 50000;


SELECT *
FROM sal_over_50k;




