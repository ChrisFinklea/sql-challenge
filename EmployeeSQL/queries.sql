--List the employee number, last name, first name, sex, and salary of each employee (2 points)
select employees.emp_no,
	employees.last_name, 
	employees.first_name,
	employees.sex,
	salaries.salary 
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
select first_name, last_name, hire_date 
from employees
where EXTRACT(YEAR FROM hire_date) = 1986
order by hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
select dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	titles.title
from dept_manager
inner join employees on dept_manager.emp_no = employees.emp_no
inner join departments on dept_manager.dept_no = departments.dept_no
inner join titles on employees.emp_title_id = titles.title_id;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
select dept_emp.dept_no,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
select first_name,
	last_name,
	sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
select employees.emp_no,	
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
select employees.emp_no,	
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
select last_name, count(last_name)
from employees
group by last_name
order by count desc;
