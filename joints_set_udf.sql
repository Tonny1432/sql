create database joints
use joints
--Create an ‘Orders’ table which comprises of these columns: ‘order_id’,
--‘order_date’, ‘amount’, ‘customer_id’.
-- Insert 5 new records.
create table orders( order_id smallint,order_date date, amount bigint,customer_id smallint)
insert orders values 
(100,'2025-12-25',1050,300),
(101,'2024-12-20',2050,301),
(102,'2023-12-15',3050,302),
(103,'2022-12-10',5050,303),
(104,'2021-12-5',6050,304);

--update orders set customer_id = 304 where amount = 6050
create table customer( customer_id smallint, customer_name varchar(25),menu varchar(20))
insert customer values
(301,'Tonny','briyani'),
(302,'James','buger'),
(303,'Alex','pepsi'),
(304,'Wiliam','french fries'),
(305,'John','noodles'),
(306,'jonny','fired rice'),
(307,'Mike','meals'),
(308,'Tyson','pancake');

select * from orders
select * from customer
--Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’
 --column
select c.customer_id from customer as c inner join orders as o on c.customer_id = o.customer_id;
-- Make left and right joins on ‘Customer’ and ‘Orders’ tables on the
--‘customer_id’ column.
select * from orders
select * from customer
select c.customer_id,c.customer_name,c.menu,o.order_id,o.order_date,o.amount 
from customer as c right join orders as o on c.customer_id = o.customer_id;
select c.customer_id,c.customer_name,c.menu,o.order_id,o.order_date,o.amount 
from customer as c left join orders as o on c.customer_id = o.customer_id;
--Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column.
select * from orders
select * from customer
select c.customer_id,c.customer_name,c.menu,o.order_id,o.order_date,o.amount 
from customer as c full outer join orders as o on c.customer_id = o.customer_id;
--Update the ‘Orders’ table and set the amount to be 1000 where
--‘customer_id’ is 300.
update orders
set amount =1000 where customer_id = 300

select * from orders
 --Use the inbuilt functions and find the minimum, maximum and average
 --amount from the orders table
select min(amount) as minimum_amount , max(amount) as maximum_amount,avg(amount)as average_amount from orders
--Create a user-defined function which will multiply the given number with10
create function multiply(@a int )
returns int 
as
begin 
return( @a *10)
end;
select dbo.multiply(10) as multiply_number
--Use the case statement to check if 100 is less than 200, greater than 200
--or equal to 200 and print the corresponding value.
DECLARE @num INT = 200
IF @num < 200
    PRINT 'number less than 200'
ELSE IF @num > 200
    PRINT 'number is greater than 200'
ELSE
    PRINT 'number is equal to 200'
--Using a case statement, find the status of the amount. Set the status of the
--amount as high amount, low amount or medium amount based upon the
--condition.
select amount,
 case
 when amount <= 1000 then 'low amount'
 when amount between 2000 and 4000 then 'medium amount'
 else 'high amount'
 end as amount_status
 from orders
 --Create a user-defined function, to fetch the amount greater than then given
 --input.
 create function tab_order(@a int)
 returns table
 as
 return
 ( select * from orders where amount >@a );
end;
 select * from tab_order(500)
-- Arrange the ‘Orders’ dataset in  increasing and decreasing orders of amount
 select * from orders order by amount desc ;
 select * from orders order by amount asc ;
--Create a table with the name ‘Employee_details1’ consisting of these
--columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with
--the name ‘Employee_details2’ consisting of the same columns as the first
--table.

create table employee_details1(emp_id smallint,emp_name varchar(25),emp_salary bigint)
insert employee_details1 values
(500,'hari',25000),
(501,'shanmugam',20000),
(502,'jaya',22000);

create table employee_details2(emp_id smallint,emp_name varchar(25),emp_salary bigint)
insert employee_details2 values
(500,'sree ram',15000),
(501,'sherin',10000),
(502,'shanmugam krishan',12000),
(503,'surya',18000),
(504,'thanesh',22000);
----------------------------------
select * from employee_details1
select * from employee_details2


 --drop table employee_details1

--Apply the UNION ,INTERSECT,EXCEPT opoperator on these two tables

select  * from employee_details1 union select  * from employee_details2;
select  * from employee_details1 intersect select  * from employee_details2;
select  * from employee_details1 except select  * from employee_details2;