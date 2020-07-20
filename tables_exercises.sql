SHOW databases;
USE employees;
SELECT database();
DESCRIBE employees;
# int, date, varchar, enum = Data types
# Numeric Column: dept_emp, dept_manager, employees, employees_with_departments, salaries, titles
# String Calumn: departments, employees, employees_with_departments, titles
# Date Types: dept_emp, dept_manager, employees, salaries, titles
#The employee table lists employee number and name, the department table lists department number and department name. They are linked together in the employees_with_departments table
SHOW CREATE TABLE dept_manager;
