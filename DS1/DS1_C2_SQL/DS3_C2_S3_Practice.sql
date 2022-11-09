Use hr;

-- Task 1
Select employee_id, concat(concat(first_name,' '),last_name) as 'Name', department_name from employees 
JOIN Departments on employees.department_id = Departments.department_id WHERE department_name='IT';

-- Task  2

Select first_name, employees.job_id, job_title, min_salary, max_salary from jobs
JOIN employees on employees.job_id = jobs.job_id;


-- task 3

select city ,count(employee_id) as 'Number of Employee' from employees
join departments on  employees.department_id= departments.department_id 
join  locations on locations.location_id = departments.location_id 
group by city
order by count(employee_id) desc limit 10;


-- task 4

Select  employees.employee_id, concat(concat(first_name,' '),last_name) as 'Name', end_date from employees
join job_history on employees.department_id = job_history.department_id where end_date='1999-12-31';

-- task 5 
Select  employees.employee_id, first_name, department_name, year(curdate())-year(hire_date) as 'Experience' from employees
join departments on departments.department_id = employees.department_id
where year(curdate())-year(hire_date)>=25;















