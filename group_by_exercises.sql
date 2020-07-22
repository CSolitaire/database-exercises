use employees;

-- 2. In your script, use DISTINCT to find the unique titles in the titles table.

select distinct title
from titles;

-- 3. Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY

select distinct last_name
from employees
where last_name like 'e%e'
group by last_name;

-- 4. Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.

select first_name, distinct last_name
from employees
where last_name like 'e%e'
group by last_name;

-- 5. Find the unique last names with a 'q' but not 'qu'. Your results should be:

select distinct first_name, last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name;
