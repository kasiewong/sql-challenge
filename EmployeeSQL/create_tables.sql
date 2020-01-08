
CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY REFERENCES employees(emp_no),
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE titles (
	id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
);