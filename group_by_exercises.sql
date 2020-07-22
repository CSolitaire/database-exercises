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

select distinct first_name, last_name
from employees
where last_name like 'e%e'
group by first_name, last_name;

-- 5. Find the unique last names with a 'q' but not 'qu'. Your results should be:

select distinct last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name;

-- 6. Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

select distinct first_name, last_name, count(*) as number_shared
from employees
where last_name like 'e%e'
group by first_name, last_name
order by number_shared desc;

-- 7. Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names

select count(`emp_no`) first_name, gender
from `employees`
where first_name = 'Irena' 
or first_name = 'Vidya' 
or first_name = 'Maya'
group by gender;

-- 8. Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames?

select   count(*) as number_shared
       , concat(lower(substring(first_name,1,1))
       , lower(substring(last_name,1,4))
       , "_"
       , substring(birth_date,6,2)
       , substring(birth_date,3,2)) as username
from employees
group by username
order by number_shared desc;

-- Yes, there appears to be duplicate usernames

-- 8. Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames?

select   count(*) as number_shared
       , concat(lower(substring(first_name,1,1))
       , lower(substring(last_name,1,4))
       , "_"
       , substring(birth_date,6,2)
       , substring(birth_date,3,2)) as username
from employees
group by username
order by number_shared desc;

-- Yes, there appears to be duplicate usernames

-- Bonus: How many duplicate usernames are there? 

select   count(*) as number_shared
       , concat(lower(substring(first_name,1,1))
       , lower(substring(last_name,1,4))
       , "_"
       , substring(birth_date,6,2)
       , substring(birth_date,3,2)) as username
from employees
group by username
order by number_shared desc;

-- Bonus: How many duplicate usernames are there? 

select username_count as username_count  
from   (select
       , concat(lower(substring(first_name,1,1))
       , lower(substring(last_name,1,4))
       , "_"
       , substring(birth_date,6,2)
       , substring(birth_date,3,2)) as username
from employees
group by username
order by number_shared desc)
where username_count >1
as temp; 