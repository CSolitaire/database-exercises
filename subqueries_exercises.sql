
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

select ee.first_name, ee.last_name 
from employees as ee
where ee.emp_no in (
	select e.emp_no
	from employees as e
	join dept_manager as dm on dm.emp_no = e.emp_no
	where dm.to_date > now()
	and e.gender = 'f'
);

-- 5. Find all the employees that currently have a higher than average salary.	
	
SELECT e.first_name,
        e.last_name,
        s.salary
FROM employees AS e
JOIN salaries AS s ON s.emp_no = e.emp_no AND s.to_date > CURDATE()
WHERE s.salary >
    (SELECT AVG(salary)
    FROM salaries);

-- 6. How many current salaries are within 1 standard deviation of the highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

select count(e.emp_no) as emp_sal_greater_than_one_sd_above_max
from employees as e
join salaries as s on s.emp_no = e.emp_no
where s.to_date > curdate()
and salary > (
	select (max(s.salary) - stddev(s.salary))
	from salaries as s
)
;





