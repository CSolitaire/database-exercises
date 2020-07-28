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

