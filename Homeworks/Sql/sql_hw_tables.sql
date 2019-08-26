create table titles (
	emp_no int,
	title varchar,
	from_date varchar,
	to_date varchar
);

create table salaries (
	emp_no int,
	salary int,
	from_date varchar,
	to_date varchar
);
create table departments (
	dept_no varchar,
	dept_name text
);

create table dept_emp (
	emp_no int,
	dept_no varchar,
	from_date date,
	to_date date
);

create table dept_manager(
	dept_no varchar,
	emp_no int,
	from_date date,
	to_date date
);

create table employees (
	emp_no int,
	birth_date date,
	first_name text,
	last_name text,
	gender text,
	hire_date date
);

copy titles from 'C:\Users\zackf\Documents\GitHub\GTATL201905DATA3\09-SQL\Homework\Instructions\Data\titles.csv' with (format CSV, header true);
copy salaries from 'C:\Users\zackf\Documents\GitHub\GTATL201905DATA3\09-SQL\Homework\Instructions\Data\salaries.csv' with (format CSV, header true);
copy departments from 'C:\Users\zackf\Documents\GitHub\GTATL201905DATA3\09-SQL\Homework\Instructions\Data\departments.csv' with (format CSV, header true);
copy dept_emp from 'C:\Users\zackf\Documents\GitHub\GTATL201905DATA3\09-SQL\Homework\Instructions\Data\dept_emp.csv' with (format CSV, header true);
copy dept_manager from 'C:\Users\zackf\Documents\GitHub\GTATL201905DATA3\09-SQL\Homework\Instructions\Data\dept_manager.csv' with (format CSV, header true);
copy employees from 'C:\Users\zackf\Documents\GitHub\GTATL201905DATA3\09-SQL\Homework\Instructions\Data\employees.csv' with (format CSV, header true);

