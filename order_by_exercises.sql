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

