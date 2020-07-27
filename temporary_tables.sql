use darden_1032;

-- 1. Using the example from the lesson, re-create the employees_with_departments table.

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
FROM employees.employees as e
JOIN employees.dept_emp de USING(emp_no)
JOIN employees.departments as d USING(dept_no)
LIMIT 100;

select *
from employees_with_departments

     -- A. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns


-- B. Update the table so that full name column contains the correct data
-- C. Remove the first_name and last_name columns from the table.
-- D. What is another way you could have ended up with this same table?

