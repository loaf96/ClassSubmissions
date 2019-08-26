-- #1
create table emp_info (emp_no, first_name, last_name, gender, salary) as
select
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.gender,
	salaries.salary
from 
	salaries
FULL JOIN employees
on salaries.emp_no=employees.emp_no
order by salaries.emp_no;

-- #2
select * from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- #3 
create view manager_info as 
select
	employees.first_name,
	employees.last_name,
	employees.emp_no,
	dept_manager.dept_no,
	departments.dept_name,
	titles.title,
	titles.from_date,
	titles.to_date
from employees
join dept_manager
on (employees.emp_no=dept_manager.emp_no)
join departments
on (dept_manager.dept_no=departments.dept_no)
join titles
on (employees.emp_no=titles.emp_no)
where titles.title='Manager';

select * from manager_info;

-- #4
select 
	first_name,
	last_name,
	emp_no,
	dept_name
from manager_info;

-- #5
select
	*
from employees
where first_name='Hercules'
and last_name ilike 'B'||'%';

-- #6
create view sales_emp as 
select 
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from dept_emp
join employees
on (dept_emp.emp_no=employees.emp_no)
join departments
on (departments.dept_no=dept_emp.dept_no)
where departments.dept_name='Sales';

-- #7
create view dev_emp as
select
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from dept_emp
join departments
on (dept_emp.dept_no=departments.dept_no)
join employees
on (employees.emp_no=dept_emp.emp_no)
where departments.dept_name='Development'
;

select * from dev_emp;

-- #8
select 
	last_name,
	count(employees.last_name)
from employees
where employees.last_name=employees.last_name
group by employees.last_name
order by count(employees.last_name) desc;

