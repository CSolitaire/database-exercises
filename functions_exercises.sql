use employees;
select database();

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

select concat( first_name,' ',`last_name`) as full_name, (curdate()-hire_date ) as days_employed
from employees
where hire_date > '1990' and hire_date <'2000'
and birth_date like "%12-25"
order by hire_date DESC;

