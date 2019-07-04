-- I did this part first so I didn't use the pre-created table code from quickdatabasediagrams.
-- However, I did check to make sure the schema tables also worked with the constraints, and they did, so both files are internally consistent.
CREATE TABLE departments (
    dept_no VARCHAR,
    dept_name VARCHAR
);

-- import data csv
select *
from departments;

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);
select *
from dept_emp;

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);
-- import data csv
select *
from dept_manager;

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	birth_date date DEFAULT ('now'::text)::date NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date date DEFAULT ('now'::text)::date NOT NULL
);
-- import data csv
select *
from employees;

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salaries INTEGER NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);
-- import data csv
select *
from salaries;

CREATE TABLE titles (
	emp_no INTEGER NOT NULL,
	title  VARCHAR NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);
-- import data csv
select *
from titles;

-- Q1
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salaries
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;

-- Q2
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
ORDER BY hire_date;

-- Q3
SELECT dp.dept_no, dp.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date AS "start_date", m.to_date AS "end_date"
FROM dept_manager AS m
INNER JOIN departments AS dp ON
dp.dept_no=m.dept_no
INNER JOIN employees AS e ON
e.emp_no=m.emp_no;

-- Q4
select de.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp as de
INNER JOIN departments AS dp ON
dp.dept_no=de.dept_no
INNER JOIN employees AS e ON
e.emp_no=de.emp_no;

-- Q5
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- Q6
select de.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp as de
INNER JOIN departments AS dp ON
dp.dept_no=de.dept_no
INNER JOIN employees AS e ON
e.emp_no=de.emp_no
WHERE dp.dept_name = 'Sales';

-- Q7
select de.emp_no, e.last_name, e.first_name, dp.dept_name
from dept_emp as de
INNER JOIN departments AS dp ON
dp.dept_no=de.dept_no
INNER JOIN employees AS e ON
e.emp_no=de.emp_no
WHERE dp.dept_name = 'Sales' or dp.dept_name = 'Development';

-- Q8
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" desc;




