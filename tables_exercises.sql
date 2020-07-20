SHOW databases;
USE employees;
SELECT database();
DESCRIBE employees;
DESCRIBE departments;
Describe dept_emp;
describe dept_manager;
describe employees_with_departments;
describe salaries;
describe titles;
# int, date, varchar, enum = Data types
# Numeric Column: salaries
# String Calumn: titles, employees
# Date Types: employees, titles, salaries, dept_manager
#The employee table lists employee number and name, the department table lists department number and department name. They are linked together in the employees_with_departments table
#SHOW CREATE TABLE dept_manager;
