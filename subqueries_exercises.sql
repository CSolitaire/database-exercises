
-- 1.Find all the employees with the same hire date as employee 101010 using a sub-query. 

select first_name, last_name, hire_date
from employees
where hire_date in (
	select hire_date
	from employees
	where emp_no = 101010
);

-- 2.Find all the titles held by all employees with the first name Aamod.

-- 2. Find all the titles held by all employees with the first name Aamod

select title
from titles
where emp_no in ( 
	select emp_no
	from employees
	where first_name = 'Aamod'
);

-- 3.How many people in the employees table are no longer working for the company?

-- 4.Find all the current department managers that are female.