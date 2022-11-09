use hr;

-- -------------------------------------------TASK 1

select employee_id, first_name, last_name , department_name from employees 
join departments on employees.department_id = departments.department_id
order by  employee_id asc;



-- -------------------------------------------TASK 2

Select concat(first_name,' ',last_name) as Name,  salary from employees
where salary>(select avg(salary) from employees);

select avg(salary) from employees;

-- -------------------------------------------TASK 3
Select   concat(first_name,' ',last_name) as Name,  salary , department_name from employees
join departments on departments.department_id = employees.department_id
where salary<(select avg(salary) from employees) and department_name  regexp 'sales+';



-- 

select * from employees; -- for reference 

select * from departments where department_name  regexp 'sales+'; -- to cross check

-- -------------------------------------------TASK 4
 select concat (first_name, ' ', last_name) as 'Name' , salary from employees
 where salary> (select max(salary) from employees where job_id = 'IT_PROG')
 ORDER BY SALARY ASC;
 
 -- -------------------------------------------TASK 5
 select concat (first_name, ' ', last_name) as 'Name' , salary as 'Minimum Salary' from employees
 where salary=(select min(salary) from employees);
 
  select concat (first_name, ' ', last_name) as 'Name' , salary from employees
 ORDER BY SALARY ASC;
 
 
  -- -------------------------------------------TASK 6
  
 select concat (first_name, ' ', last_name) as 'Name'  from employees
 where salary>(select min(salary) from employees);
 
 create view task6 as /* create a view and stored the data to get the desire result after joining this with employees table*/
 select sum(salary)*60/100 as '60%_OF_SALARY', department_name, departments.department_id  from employees
 join departments on employees.department_id = departments.department_id
 group by department_name;
 select*from task6; 

 select concat (first_name, ' ', last_name) as employee_name , salary, department_id from employees
 where exists (select department_id from task6 where employees.department_id=task6.department_id and employees.salary>task6.`60%_OF_SALARY` );
 
 -- -------------------------------------------TASK 7
 
 create view task7 as 
 select first_name,last_name,country_id, employees.employee_id from employees
 join departments on departments.department_id=employees.department_id
 join locations on locations.location_id=departments.location_id
 where country_id='uk'; 
 select * from task7; -- THIS MANY EMPLOYEES WORK IN US 
 select concat (first_name, ' ', last_name) as employee_name,employee_id, manager_id from employees
 where exists (select employee_id from task7 where employees.manager_id=task7.employee_id);

  
-- -------------------------------------------TASK 8

(select first_name, last_name, salary  from employees
order by salary desc limit 10)
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Task8_s4_c2.csv'
fields terminated by ', '
lines terminated by '\n';

 
 
 
 
 
 
 

 
 
 
 
  
 
 

 
 







