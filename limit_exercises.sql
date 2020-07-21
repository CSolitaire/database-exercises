use employees;
select database();

-- List the first 10 distinct last name sorted in descending order. Your result should look like this:
select distinct last_name
from employees
order by last_name desc
limit 10;

-- Find your query for employees born on Christmas and hired in the 90s from order_by_exercises.sql. Update it to find just the first 5 employees. Their names should be:

select *
from employees
where hire_date >'1990'
and hire_date <'2000'
and birth_date like '%12-25'
order by birth_date, hire_date desc
limit 5;

-- Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results. The employee names should be:

select *
from employees
where hire_date >'1990'
and hire_date <'2000'
and birth_date like '%12-25'
order by birth_date, hire_date desc
limit 5 offset 45;

-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?

-- Offset is the starting point for displayed values where limit idetifies how many values ca be displayed