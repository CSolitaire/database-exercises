SHOW databases;
USE employees;
SELECT database();
DESCRIBE employees;
# int, date, varchar, enum = Data types
# Numeric Column: dept_emp, dept_manager, employees, employees_with_departments, salaries, titles
# String Calumn: departments, employees, employees_with_departments, titles
# Date Types: dept_emp, dept_manager, employees, salaries, titles
#The employee table will list the department number that the employee is associated with, the department table show department number and department name
SHOW CREATE TABLE dept_manager;
