
use hr;

--  Task 1
create view task1 as
select city ,count(employee_id) as 'Number of Employee' from employees
join departments on  employees.department_id= departments.department_id 
join  locations on locations.location_id = departments.location_id 
group by city
order by count(employee_id) desc limit 5;

select*from task1;

-- TASK 2

select first_name,last_name,country_id,locations.city,department_name,salary from employees
join departments on  employees.department_id= departments.department_id 
join  locations on locations.location_id = departments.location_id
join task1 on task1.city=locations.city;

-- Task 3
select city ,count(employee_id) as 'Number of Employee' from employees
join departments on  employees.department_id= departments.department_id 
join  locations on locations.location_id = departments.location_id 
group by city
order by count(employee_id) desc limit 5;

-- Task 4
Select  employees.employee_id, concat(concat(first_name,' '),last_name) as 'Name', department_name, year(curdate())-year(hire_date) as 'Experience' from employees
join departments on departments.department_id = employees.department_id
where year(curdate())-year(hire_date)>=10;

-- Task 5 
-- create view task5 as
Select concat(concat(first_name,' '),last_name) as 'Manager_Name', manager_id, employee_id from employees
where year(curdate())-year(hire_date)>=10;
select  * from task5;
select  *from employees ;
select employee_id, task5.manager_name as 'Name' , task5.manager_id, concat(concat(employees.first_name,' '),employees.last_name) from employees
join task5 on employees.manager_id = task5.manager_id;


-- Task 6

Select distinct year(curdate())-year(hire_date) as 'Exp', country_id from employees 
join departments on departments.department_id = employees.department_id 
join  locations on locations.location_id = departments.location_id
group by country_id 
order by year(curdate())-year(hire_date) desc limit 3;


/* UPDATED task 5 */
create view test1 as 
select employee_id, concat(first_name,' ',last_name) as Manager from employees where employee_id in (select manager_id from employees group by manager_id);

select employees.employee_id, concat(first_name,' ',last_name)as emp_name, employees.manager_id, Manager  from employees

join test1 on employees.manager_id = test1.employee_id;

-- using self join
select e2.employee_id, concat(e2.first_name,' ',e2.last_name) as Emp_Name, concat(e1.first_name,' ',e1.last_name) as Manager, e2.manager_id from employees e1 , employees e2
where e1.employee_id in (select e1.manager_id from employees e1 group by e1.manager_id)
and e2.manager_id = e1.employee_id; 


alter table employees add (father varchar(60));


















