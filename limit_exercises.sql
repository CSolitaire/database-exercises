use employees;
select database();

-- List the first 10 distinct last name sorted in descending order. Your result should look like this:
select distinct last_name, first_name
from `employees`
where first_name in ('Irena','Vidya','Maya')
order by last_name DESC
limit 10;
