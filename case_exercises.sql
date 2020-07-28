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

-- 3. How many employees were born in each decade? 
SELECT
	e.emp_no,
	substring(e.birth_date, 1, 4),
	case
		when substring(e.birth_date, 1, 4) in ('1950','1951', '1952','1953','1954', '1955','1956','1957','1958','1959') then '50'
		when substring(e.birth_date, 1, 4) in ('1960','1961', '1962','1963','1964', '1965','1966','1967','1968','1969') then '60'
	    when substring(e.birth_date, 1, 4) in ('1970','1971', '1972','1973','1974', '1975','1976','1977','1978','1979') then '70'
	    when substring(e.birth_date, 1, 4) in ('1980','1981', '1982','1983','1984', '1985','1986','1987','1988','1989') then '80'
		end as decade_born
from employees as e
join dept_emp as dp using(emp_no)
where dp.to_date > now()
order by decade_born

-- Bonus. What is the average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? 

select 
ah.dept_name, 
ah.salary
from 
(
select
	d.dept_no,
	d.dept_name,
	s.salary,
	s.emp_no,
	case
		when d.dept_name = 'Customer Service' then 'Customer Service' 	
		when d.dept_name = 'Development' then 'Development'	
		when d.dept_name = 'Finance' then 'Finance'
		when d.dept_name = 'Human Resources' then 'Human Resources'
		when d.dept_name = 'Marketing' then 'Marketing'
		when d.dept_name = 'Production' then 'Production'
		when d.dept_name = 'Quality Management' then 'Quality Management'
		when d.dept_name = 'Research' then 'Research'
		when d.dept_name = 'Sales' then 'Sales'
		end as unique_departments
from departments as d
join dept_emp as dp using(dept_no)
join salaries as s on s.emp_no = dp.emp_no
where s.to_date > now() and dp.to_date > now()
) as ah
order by dh.dept_name;