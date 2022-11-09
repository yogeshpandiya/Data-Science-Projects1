



-- ---------------------------------TASK ONE -----------------------------------------------------

create database techmac_db;

use techmac_db;


-- ---------------------------------TASK TWO ----------------------------------------------------

create table techhyve_employees (

employee_ID varchar(30),
firstaname varchar(100),
lastname varchar(100), 
gender varchar(30),
age int

);

create table techsoft_employees (

employee_ID varchar(30),
firstaname varchar(100),
lastname varchar(100), 
gender varchar(30),
age int

);

create table techcloud_employees (

employee_ID varchar(30),
firstaname varchar(100),
lastname varchar(100), 
gender varchar(30),
age int
);

-- ---------------------------------------TASK 3 ---------------------------

alter table techcloud_employees add (ProficiencyLevel int);
alter table techsoft_employees add (ProficiencyLevel int);
alter table techhyve_employees add (ProficiencyLevel int);

-- ---------------------------------------TASK 4 --------------------------------

alter table techcloud_employees modify employee_ID int primary key;
alter table techsoft_employees modify employee_ID int primary key;
alter table techhyve_employees modify employee_ID int primary key;

alter table techcloud_employees modify column ProficiencyLevel int default 1 check (ProficiencyLevel<=5 and ProficiencyLevel>=1);
alter table techsoft_employees modify column ProficiencyLevel int default 1 check (ProficiencyLevel<=5 and ProficiencyLevel>=1);
alter table techhyve_employees modify column ProficiencyLevel int default 1 check (ProficiencyLevel<=5 and ProficiencyLevel>=1);

alter table techcloud_employees modify column age int check (age>=21 and age<=55);
alter table techsoft_employees modify column age int check (age>=21 and age<=55);
alter table techhyve_employees modify column age int check (age>=21 and age<=55);

-- -----------------------------TASK 5 ------------------------------------

insert into techcloud_employees values ('TC0001', 'Teresa' , 'Bryant', 'Female', 52, 2 );
insert into techcloud_employees values ('TC0002',	'Alexis'	,'Patterson',	'Male'	,48,	5);
insert into techcloud_employees values ('TC0003',	'Rose' , 'Bell',	'Female'	,42,	3);
insert into techcloud_employees values ('TC0004',	'Gemma',	'Watkins'	,'Female'	,44	,3);
insert into techcloud_employees values ('TC0005',	'Kingston', 	'Martinez', 	'Male', 29, 2);

insert into  techsoft_employees values ( 'TS0001'	,'Peter',	'Burtler', 	'Male'	,44,	4);
insert into  techsoft_employees values ('TS0002'	,'Harold'	,'Simmons'	,'Male',	54,	4);
insert into  techsoft_employees values ('TS0003'	,'Juliana'	,'Sanders'	,'Female'	,36	,2);
insert into  techsoft_employees values ( 'TS0004',	'Paul'	,'Ward'	,'Male'	,29	,2);
insert into  techsoft_employees values ('TS0005',	'Nicole'	,'Bryant',	'Female'	,30	,2);

insert into techhyve_employees values ( 'TH0001',	'Eli',	'Evans'	,'Male',	26,	1);
insert into techhyve_employees values ('TH0002',	'Carlos',	'Simmons'	,'Male'	,32	,2);
insert into techhyve_employees values ('TH0003',	'Kathie',	'Bryant','	Female',	25,	1);
insert into techhyve_employees values ('TH0004',	'Joey','Hughes	','Male',	41	,4);
insert into techhyve_employees values ('TH0005',	'Alice','	Matthews	','Female',	52,	4);

-- ----------------------------------------------TASK 6 ------------------------------------

create table if not exists techsoft_employees_bkp like techsoft_employees; 
create table if not exists techhyve_employees_bkp like techhyve_employees; 
create table if not exists techcloud_employees__bkp like techcloud_employees; 

-- --------------------------------------- TASK 7 -------------------------------------------

delete from techhyve_employees where employee_ID='TH0003';
delete from techhyve_employees where employee_ID='TH0005';

delete from techcloud_employees where employee_ID='TC0001'; 
delete from techcloud_employees where employee_ID='TC0004' ;

-- ----------------------------------------TASK 8 -----------------------------------------------


create table if not exists techhyvecloud_employees like techhyve_employees; 
INSERT IGNORE INTO techhyvecloud_employees select *from techcloud_employees;

truncate table techcloud_employees;
truncate table techhyve_employees;

-- ----------------------------------------Thanks ------------------------------------------------



select * from techhyvecloud_employees;
select * from techsoft_employees;
desc techsoft_employees;



