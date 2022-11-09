

create database stylexcarz_db;

use stylexcarz_db;

-- TASK 2 

create table salespersons (

salespersonid int primary key,
salesperson_name varchar(40),
salesperson_city varchar(40),
commission_rate int

);

create table customers (

customerid int primary key,
c_firstname varchar(40),
c_lastname varchar(40),
c_city varchar(40),
c_rating int

);

create table orders (

orderid	int primary key,
amount int,
orderdate date,
salespersonid int , foreign key (salespersonid) references stylexcarz_db.salespersons (salespersonid),
customerid int, foreign key (customerid) references stylexcarz_db.customers (customerid)

);

-- TASK3 
insert into customers values(2001,	'Hoffman','	Anny','	London',100),
						(2002,'	Giovanni	','Jenny','	Rome',	200),
						(2003,'	Liu	','Williams','	San Jose',100),
						(2004	,'Grass','	Harry','	Berlin	',300),
						(2005,	'Clemens','	John','	London',	200), 
						(2006,	'Cisneros'	,'Fanny',	'San Jose'	,200),
						(2007,	'Pereira',	'Jonathan','Rome'	,300);

                        
insert into salespersons values(1001	,'William','	London',	12),
								(1002	,'Liam'	,'San Jose',	13),
                                (1003,	'Axelrod',	'New York'	,10),
                                (1004,	'James'	,'London',11),
                                (1005,	'Fran',	'London',	26),
                                (1007,	'Oliver', 'Barcelona',	15),
                                (1008,	'John',	'London',	0),
                                (1009,	'Charles', 'Florida',	0);
                                
insert into orders values (3001,123, '2021-02-01', 1009, 2007),	
							(3002,100, '2021-07-30', 1001, 2007),
							(3003, 187, '2021-10-02', 1001,2001),
                            (3005,201,'2021-10-09', 1003, 2003),
                            (3007,167,'2021-04-02', 1004,2002),
                            (3008,189, '2021-03-06',1002,2002),
                            (3009,145, '2021-10-10',1009,2005),
                            (3010,200, '2021-02-23',1007,2007),
                            (3011,100, '2021-09-18',1001,2004);
                                

						
-- TAKS 4
set sql_safe_updates=0;
UPDATE salespersons SET commission_rate=15 WHERE commission_rate<15;
select * from salespersons;

-- TASK 5

create table if not exists orders_bkp like orders;

-- TASK 6

create table if not exists orders_placed_history like orders;

delete from orders_placed_history where orderid=3005;
delete from orders_placed_history where orderid=3008;

-- TASK 7

update  customers set c_rating=c_rating+50  where customerid=2007;






			
