use employees;
select database();
select * from employees
limit 10;

-- Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

select concat( first_name,' ',`last_name`) as full_name
from employees
where last_name like "%E%"
order by emp_no;

select concat( first_name,' ',`last_name`) as full_name
from employees
where last_name like "E%"
order by emp_no;

select concat( first_name,' ',`last_name`) as full_name
from employees
where last_name like 'e%'
or last_name like '%e'
order by emp_no;

-- Convert the names produced in your last query to all uppercase.

select upper(concat(first_name,' ',`last_name`)) as full_name
from employees
where last_name like "%E%"
order by emp_no;

select upper(concat(first_name,' ',`last_name`)) as full_name
from employees
where last_name like "E%"
order by emp_no;

select upper(concat(first_name,' ',`last_name`)) as full_name
from employees
where last_name like 'e%'
or last_name like '%e'
order by emp_no;

-- For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())

select concat( first_name,' ',`last_name`) as full_name
            ,hire_date()
from employees
where hire_date > '1990' and hire_date <'2000'
and birth_date like "%12-25"
              Case
              When datediff(day, curdate(), hire_date) > 0
              END
order by hire_date DESC;

select datediff(d, curdate(), hire_date)
from employees;

-- Find the smallest and largest salary from the salaries table.

select *
from salaries;

select min(salary) as min_salary, max(salary) as max_salary
from salaries;

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

select * 
from employees
limit 5;

select concat(lower(substring(first_name,1,1))
       , lower(substring(last_name,1,4))
       , "_"
       , substring(birth_date,6,2)
       , substring(birth_date,3,2))
from employees
limit 10;

select substring(birth_date,3,2)
from employees;


