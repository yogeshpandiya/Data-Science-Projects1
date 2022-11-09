use stylexcarz_db;
-- 1
select * from salespersons where salesperson_city='London';

-- 2
select * from salespersons where commission_rate=0;

-- 3
select * from salespersons order by commission_rate desc limit 3;


-- 4 q1
select avg(commission_rate) from salespersons;

-- 4q2
select * from salespersons where commission_rate<16.37;
-- 5
select * from salespersons where commission_rate<16.37 and salesperson_city = 'London';

-- 6 
select * from salespersons where salesperson_city in ('Florida','Barcelona','San Jose');

-- 7 
select avg(c_rating) from customers;

select * from customers  where c_rating<207.14 order by c_rating asc ;

-- 8
select * from customers  where c_rating>207.14 order by c_rating desc ;

-- 9
select c_city from customers  where c_rating>207.14 order by c_rating desc ;

-- 10

select * from customers  order by c_rating desc;

-- 11

select * from customers where c_firstname regexp '^j__n';

-- 12

select avg(amount),max(amount) from orders;

-- 13 

select count(orderid) from orders;

-- 14 
select monthname(orderdate), avg(amount),max(amount) from orders group by monthname(orderdate) order by monthname(orderdate);








