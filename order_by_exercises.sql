use employees;
select database();

select * from employees;
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
-- 2. Modified to order by first name
select *
from `employees`
where first_name in ('Irena','Vidya','Maya')
order by first_name; 

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
-- 3. Modified to order by first name and then last name
select *
from `employees`
where first_name in ('Irena','Vidya','Maya')
order by first_name ASC, last_name ASC;

-- 4. Change the order by clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.
select *
from `employees`
where first_name in ('Irena','Vidya','Maya')
order by last_name ASC, first_name ASC;

-- 5. Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!
select *
from employees
where last_name like "%E%"
order by emp_no;

select *
from employees
where last_name like "E%"
order by emp_no;

select *
from employees
where last_name like 'e%'
or last_name like '%e'
order by emp_no;


-- 6. Now reverse the sort order for both queries.
select *
select *
from employees
where last_name like "%E%"
order by emp_no DESC;

select *
from employees
where last_name like "E%"
order by emp_no DESC;

select *
from employees
where last_name like 'e%'
or last_name like '%e'
order by emp_no DESC;

-- 7. Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
select *
from employees
where hire_date > '1990' and hire_date < '2000'
and birth_date like "%12-25"
order by hire_date DESC;

