USE mystery;

#Finding out the tables in the database
show tables;

#Showing the attributes of the tables
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

#Find the number of the records of the tables
SELECT count(*) FROM departments;
SELECT count(*) FROM dept_emp;
SELECT count(*) FROM dept_manager;
SELECT count(*) FROM employees;
SELECT count(*) FROM salaries;
SELECT count(*) FROM titles;

#Find the primary keys and foreign keys of the tables

#Number of employee
SELECT count(emp_no) FROM employees;

#Number and names of the diff roles of the employee
SELECT DISTINCT title FROM titles;

#The highest, lowest, and average salaries
SELECT salary FROM salaries;
SELECT max(salary), min(salary), avg(salary) FROM salaries;

#List the top 10 highest paid employee
SELECT salary FROM salaries ORDER BY salary DESC LIMIT 10;

#Total money pay as salaries
SELECT sum(salary) FROM salaries;

#The oldest and youngest employees
SELECT birth_date, first_name, last_name FROM employees ORDER BY birth_date DESC LIMIT 1; #youngest
SELECT birth_date, first_name, last_name FROM employees ORDER BY birth_date LIMIT 1; #old

#The most recently hired employee
SELECT hire_date FROM employees ORDER BY hire_date DESC LIMIT 1;

#How many male and female employees
SELECT count(gender) FROM employees WHERE gender = 'M';
SELECT count(gender) FROM employees WHERE gender = 'F';

#Number of employees under 55 years old
SELECT first_name, last_name FROM employees WHERE 2016 - birth_date < 55;

#Names and number of employees in different department
SELECT dept_name FROM departments;
SELECT dept_name, first_name, last_name FROM departments, employees ORDER BY dept_name;

#Name of employees working in three different department
SELECT first_name, last_name, dept_name;

#Employees that have worked in the company for more than 10 years

#Ratio of the males/females in the sales department

#Longesttttt first nameeeeee
SELECT first_name FROM employees;