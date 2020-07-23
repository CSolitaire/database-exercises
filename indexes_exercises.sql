
-- USE your employees database. DESCRIBE each table and inspect the keys and see which columns have indexes and keys.

use employees;

describe departments;
SHOW INDEXES FROM departments;
# primary key = dept_no, unique key = dept_name
# index = departments (table not values)

describe dept_emp;
SHOW INDEXES FROM dept_emp;
# primary key = emp_no and dept_no, no unique key
# index = dept_emp (table and value)

describe dept_manager;
SHOW INDEXES FROM dept_manager;
# primary key emp_no and dept_no, no unique key
# index = dept_manager (table not value)

describe employees;
SHOW INDEXES FROM employees;
# primary key emp_no, no unique key
# index = employees (table not value)

describe employees_with_departments;
SHOW INDEXES FROM employees_with_departments;
# primary key = 0 and no unique key
# Index = 0

describe salaries;
SHOW INDEXES FROM salaries;
# primary key = emp_no and from_date
# Index = salaries (table not value)

describe titles;
SHOW INDEXES FROM titles;
# primary key = emp_no, title, from_date
# Index = (table name not value)
