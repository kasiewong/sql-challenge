--1.List the following detials of each employee: employee number, first name, last name, gender, and salary.
SELECT employees.emp_no AS "Employee Number", 
		employees.first_name AS "First Name", 
		employees.last_name AS "Last Name", 
		employees.gender AS "Gender", 
		salaries.salary AS "Salary"
FROM employees INNER JOIN salaries 
		ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--2. List employees who were hired in 1986.
SELECT *
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, first name, last name, & start and end employment dates
SELECT departments.dept_no AS "Department Number", 
		departments.dept_name AS "Department Name", 
		dept_manager.emp_no AS "Manager Employee Number", 
		employees.first_name AS "First Name", 
		employees.last_name AS "Last Name", 
		dept_manager.from_date AS "Start Employment Date", 
		dept_manager.to_date AS "End Employment Date"
FROM departments INNER JOIN dept_manager 
		ON dept_manager.dept_no = departments.dept_no INNER JOIN employees 
		ON employees.emp_no = dept_manager.emp_no;

--4. List the department of each employee with the following information: 
-- employee number, first name, last name, and department name.
SELECT dept_emp.emp_no AS "Employee Number", 
		employees.first_name AS "First Name", 
		employees.last_name AS "Last Name", 
		departments.dept_name AS "Department Name"
FROM dept_emp INNER JOIN employees 
		ON employees.emp_no = dept_emp.emp_no INNER JOIN departments 
		ON departments.dept_no = dept_emp.dept_no
ORDER BY "Employee Number";

--5. List all employees whose first name is "Hercules" and last names begin with "B".
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, first name, last name, and department name.
SELECT dept_emp.emp_no AS "Employee Number", 
		employees.first_name AS "First Name", 
		employees.last_name AS "Last Name", 
		departments.dept_name AS "Department Name"
FROM dept_emp INNER JOIN employees 
		ON employees.emp_no = dept_emp.emp_no INNER JOIN departments 
		ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY "Employee Number";

--7. List all employees in the Sales & Development departments, including their employee number, first name, last name, and department name
SELECT dept_emp.emp_no AS "Employee Number", 
		employees.first_name AS "First Name", 
		employees.last_name AS "Last Name", 
		departments.dept_name AS "Department Name"
FROM dept_emp INNER JOIN employees 
	ON employees.emp_no = dept_emp.emp_no INNER JOIN departments 
	ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY "Employee Number";

--8. In descending order, list the frequency count of employee last names, ie. how many employees share each last name
SELECT employees.last_name, 
COUNT(last_name) AS "Last Name Count", 
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;