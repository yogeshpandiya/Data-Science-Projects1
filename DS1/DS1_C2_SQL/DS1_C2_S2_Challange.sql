use hr;
-- 1
select count(employee_id) from employees;

-- 2
select department_id, count(employee_id) from employees group by department_id;

-- 3
select first_name, salary from employees where salary>6000;

-- 4
select count(employee_id) from employees where salary>20000;

-- 5
select * from employees where commission_pct IS NOT NULL;

-- 6
select concat(concat(first_name,' '),last_name) from employees where commission_pct IS NULL;

-- 7 
select employee_id, concat(concat(first_name,' '),last_name), email, phone_number from employees where commission_pct IS NOT NULL;

-- 8 
select department_id, salary from employees group by department_id order by salary desc limit 3;

-- 9 
select job_id from employees;

select * from employees where job_id regexp'CLERK+';

-- 10 
select count(job_id), avg(salary) from employees where job_id regexp'CLERK+';

-- 11 
select department_id, count(department_id), salary from employees group by department_id having salary between 7000 and 10000 and department_id is not null;






