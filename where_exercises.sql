use employees;
select database();

select * from employees;

#Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
select `first_name`
from `employees`
where first_name in ('Irena','Vidya','Maya'); 

#Find all employees whose last name starts with 'E' — 7,330 rows
select *
from employees
where last_name like "E%";

#Find all employees hired in the 90s — 135,214 rows.
select *
from employees
where hire_date like "199%-%%-%%";

#Find all employees born on Christmas — 842 rows.
select *
from employees
where birth_date like "%%%%-12-25";

#Find all employees with a 'q' in their last name — 1,873 rows.
select *
from `employees`
where last_name like '%q%';


