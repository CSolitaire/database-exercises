
-- 1.Find all the employees with the same hire date as employee 101010 using a sub-query. 

select first_name, last_name, hire_date
from employees
where hire_date in (
	select hire_date
	from employees
	where emp_no = 101010
);

-- 2. Find all the titles held by all employees with the first name Aamod

select title, count(*)
from titles
where emp_no in ( 
	select emp_no
	from employees
	where first_name = 'Aamod'
) 
group by title;

-- 3.How many people in the employees table are no longer working for the company?

select count(ee.emp_no) as employees_no_longer_employeed
from employees as ee
where not ee.emp_no in (
	select e.emp_no
	from employees as e
	join dept_emp as dp on dp.emp_no = e.emp_no and dp.to_date > now()
	join titles as t on t.emp_no = e.emp_no and t.to_date > now()
);

-- 4.Find all the current department managers that are female.