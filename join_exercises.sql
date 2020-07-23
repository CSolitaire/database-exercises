use join_example_db;

-- Join Example Database

-- 1.Use the join_example_db. Select all the records from both the users and roles tables.
select * from users;
select * from roles;

-- 2.Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

select users.name as user_name, roles.name as role_name
from users
join roles on users.role_id = roles.id;

select users.name as user_name, roles.name as role_name
from users
left join roles on users.role_id = roles.id;

select users.name as user_name, roles.name as role_name
from users
right join roles on users.role_id = roles.id;

-- 3.Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
select roles.name, count(users.name) as total_users_with_role
from users
left join roles on users.role_id = roles.id
group by roles.name;


-- 1.Employees Database

use employees;

-- 2.Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

select concat(e.first_name, ' ', e.last_name) as full_name, d.dept_name
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where dm.to_date > curdate();

-- 3.Find the name of all departments currently managed by women.

select concat(e.first_name, ' ', e.last_name) as full_name, d.dept_name, e.gender as gender
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where dm.to_date > curdate() and e.gender = 'F';

-- 4.Find the current titles of employees currently working in the Customer Service department.

select t.title, count(*)
from titles as t
join employees as e on t.emp_no = e.emp_no
join dept_emp as dp on dp.emp_no = e.emp_no 
where dp.dept_no = 'd009' and dp.to_date > curdate() and t.to_date > curdate()
group by t.title;