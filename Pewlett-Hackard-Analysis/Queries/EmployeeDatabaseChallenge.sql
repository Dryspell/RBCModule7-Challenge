-- DELIVERABLE 1

-- DROP TABLE titles;
-- CREATE TABLE titles (
-- 	emp_no INT,
-- 	title VARCHAR(20),
-- 	from_date DATE,
-- 	to_date DATE
-- );
SELECT * FROM employees;
SELECT emp_no, first_name, last_name
FROM employees
AS emp_info;

SELECT * FROM titles;
SELECT PRIMARY KEY FROM titles;

SELECT title, from_date, to_date
FROM titles
AS title_info;

DROP TABLE merged_tbl;

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.birth_date, titles.title, titles.from_date, titles.to_date
INTO merged_tbl
FROM employees
RIGHT JOIN titles
ON employees.emp_no = titles.emp_no;

SELECT * FROM merged_tbl;

DROP TABLE retirement_titles;

SELECT *
INTO retirement_titles
FROM merged_tbl
WHERE birth_date >= '1952-01-01' AND birth_date < '1956-01-01'
ORDER BY emp_no;

SELECT * FROM retirement_titles;

DROP TABLE unique_titles;
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

--DELIVERABLE 2
DROP TABLE dept_emp;
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(4),
	from_date DATE,
	to_date DATE
);

SELECT * FROM dept_emp;

SELECT *
INTO titles_merge
FROM dept_merge

DROP TABLE membership_eligibility;

SELECT DISTINCT ON (emp_no) employees.emp_no, employees.first_name, employees.last_name, employees.birth_date, dept_emp.from_date, dept_emp.to_date, titles.title
INTO membership_eligibility
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN titles
ON employees.emp_no = titles.emp_no
WHERE dept_emp.to_date = '9999-01-01'AND employees.birth_date >= '1965-01-01' AND employees.birth_date < '1965-12-31'
ORDER BY employees.emp_no;

SELECT * FROM membership_eligibility;
