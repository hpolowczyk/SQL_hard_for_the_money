-- Data Analysis

-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary

SELECT emp.emp_no, last_name, first_name, gender, salary
FROM employees AS emp
JOIN salaries AS s ON emp.emp_no = s.emp_no;

-- List employees who were hired in 1986.

SELECT * 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number,
-- last name, first name, and start and end employment dates.

SELECT m.dept_no, dept_name, m.emp_no, last_name, first_name, from_date, to_date
FROM dept_manager AS m
JOIN departments AS d ON m.dept_no = d.dept_no
JOIN employees AS emp ON m.emp_no = emp.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees AS emp
JOIN dept_emp AS d_emp ON emp.emp_no = d_emp.emp_no
JOIN departments AS d ON d_emp.dept_no = d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * 
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees AS emp
JOIN dept_emp AS d_emp ON emp.emp_no = d_emp.emp_no
JOIN departments AS d ON d_emp.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees AS emp
JOIN dept_emp AS d_emp ON emp.emp_no = d_emp.emp_no
JOIN departments AS d ON d_emp.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names 

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;