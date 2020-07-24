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

-- 5.Find the current salary of all current managers.

select concat(e.first_name, ' ', e.last_name) as full_name, d.dept_name, s.salary as salary
from employees as e
join dept_manager as dm on dm.emp_no = e.emp_no
join departments as d on d.dept_no = dm.dept_no
join salaries as s on s.emp_no = e.emp_no
where dm.to_date > curdate() and s.to_date > curdate()
order by d.dept_name;

-- 6.Find the number of employees in each department.

select d.dept_no, d.dept_name, count(dp.emp_no) as count
from departments as d
join dept_emp as dp on dp.dept_no = d.dept_no
where dp.to_date > curdate()
group by d.dept_no, d.dept_name
order by dept_name;


-- 7.Which department has the highest average salary? Hint: Use current not historic information.

select max(d.dept_name), avg(s.salary)
from departments as d
join dept_emp as dp on dp.dept_no = d.dept_no and dp.to_date > curdate()
join salaries as s on s.emp_no = dp.emp_no and s.to_date > curdate()
group by d.dept_name desc
limit 1;

-- 8. Who is the highest paid employee in the Marketing department?8.

select max(concat(e.first_name, ' ', e.last_name)) as full_name, max(s.salary)
from employees as e
join dept_emp as dp on dp.emp_no = e.emp_no and dp.to_date > curdate()
join departments as d on d.dept_no = dp.dept_no and d.dept_no = 'd001'
join salaries as s on s.emp_no = dp.emp_no and s.to_date > curdate()
group by s.salary
order by s.salary desc
limit 1;

-- 9. Which current department manager has the highest salary?

select max(concat(e.first_name, ' ', e.last_name)) as full_name, max(s.salary), d.dept_name
from employees as e
join dept_manager as dm on dm.emp_no = e.emp_no and dm.to_date > curdate()
join dept_emp as dp on dp.emp_no = e.emp_no and dp.to_date > curdate()
join departments as d on d.dept_no = dp.dept_no and d.dept_no = 'd001'
join salaries as s on s.emp_no = dp.emp_no and s.to_date > curdate()
group by s.salary
order by s.salary desc
limit 1;

Exercise Complete

-- 10.Bonus

SELECT CONCAT(employees.first_name, " ", employees.last_name) AS "Employee Name", departments.dept_name AS "Department Name", manager_name AS "Manager Name"
FROM employees
    JOIN dept_emp
        ON employees.emp_no = dept_emp.emp_no
    JOIN departments
        ON dept_emp.dept_no = departments.dept_no
    JOIN dept_manager
        ON dept_manager.dept_no = dept_emp.dept_no
-- The following subquery is a table that connects the current department manager name to their emp_no and its alias is manager_names

    JOIN(
        SELECT employees.emp_no, CONCAT(employees.first_name, " ", employees.last_name) AS manager_name
            FROM employees
                JOIN dept_manager
                    ON employees.emp_no = dept_manager.emp_no AND dept_manager.to_date > curdate()
    ) AS manager_names
WHERE dept_manager.to_date > curdate()
    AND dept_emp.to_date > curdate()
    AND dept_manager.emp_no = manager_names.emp_no;