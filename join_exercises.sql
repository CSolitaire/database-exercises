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



-- for next session
use employees;