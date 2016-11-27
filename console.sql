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
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd001';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd002';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd003';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd004';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd005';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd006';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd007';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd008';
SELECT first_name, last_name, dept_no, emp_no FROM dept_emp INNER JOIN employees USING (emp_no) where dept_no = 'd009';

#Longesttttt first and last name
SELECT max(character_length(first_name)) FROM employees;
SELECT max(character_length(last_name)) FROM employees;
SELECT first_name FROM employees WHERE CHARACTER_LENGTH(first_name) = 14 LIMIT 1;
SELECT last_name FROM employees WHERE CHARACTER_LENGTH(last_name) = 16 LIMIT 1;

#Employee that have worked in the company for more than 10 years
SELECT first_name, last_name FROM employees WHERE 2016 - hire_date < 10;

#Ratio of the males/females in the sales department
SELECT dept_name, dept_no FROM departments; #007
SELECT gender, count(gender), dept_name FROM employees, departments WHERE gender = 'M' AND dept_no = 'd007';
SELECT gender, count(gender), dept_name FROM employees, departments WHERE gender = 'F' AND dept_no = 'd007';