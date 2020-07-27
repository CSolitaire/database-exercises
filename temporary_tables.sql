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

alter table employees_with_departments add full_name 
varchar(31)
;

describe employees_with_departments
;

     -- B. Update the table so that full name column contains the correct data
 
update employees_with_departments set full_name = concat(first_name, ' ', last_name)
;

select *
from employees_with_departments
limit 5
;

     -- C. Remove the first_name and last_name columns from the table.

alter table employees_with_departments drop column first_name
;
alter table employees_with_departments drop column last_name
;

select *
from employees_with_departments
limit 5
;
      -- D. What is another way you could have ended up with this same table?

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT e.emp_no, concat(e.first_name, ' ', e.last_name) as full_name, de.dept_no, d.dept_name
FROM employees.employees as e
JOIN employees.dept_emp de USING(emp_no)
JOIN employees.departments as d USING(dept_no)
LIMIT 100;

 -- 2. Create a temporary table based on the payment table from the sakila database.

show create table sakila.payment
;

create temporary table sakila_payment as
select payment_id, customer_id, staff_id, rental_id, amount,
payment_date, last_update
from sakila.payment
;

select *
from sakila_payment
limit 5
;

        -- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

ALTER TABLE sakila_payment ADD amount_v2 INT(50);

UPDATE sakila_payment SET amount_v2 = amount * 100;

ALTER TABLE sakila_payment MODIFY amount_v2 INT(50) AFTER amount;

ALTER TABLE sakila_payment DROP COLUMN amount;

ALTER TABLE sakila_payment CHANGE amount_v2 amount INT(50);

select *
from sakila_payment
limit 5
;

-- 3.Find out how the average pay in each department compares to the overall average pay. In order to make the comparison easier, you should use the Z-score for salaries. 




        -- 3a. In terms of salary, what is the best department to work for? The worst? 