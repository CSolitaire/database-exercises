-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 

SELECT
	e.emp_no,
	dp.dept_no,
	e.hire_date,
	dp.to_date,
	case
		when to_date > now() then 1
		when to_date < now() then 0
		end as is_current_employee
from employees as e
join dept_emp as dp using(emp_no)
;

-- 2. Write a query that returns all employee names, and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name. 

select
 	concat(e.first_name, ' ', e.last_name),
 	case
 when substring(lower(e.last_name),1,1) in ('a','b','c','d','e','f','g','h') then 'A-H'
 when substring(lower(e.last_name),1,1) in ('i','j','k','l','m','n','o','p','q') then 'I-Q'
 when substring(lower(e.last_name),1,1) in ('r','s','t','u','v','w','x','y','z') then 'R-Z'
 		end as alpha_group
from employees as e
order by e.last_name asc
;