create database assignment1;
use assignment1
-- create a table for salesman table
create table salesman(Salesman_id tinyint,Salesman_Name varchar(25),Commission smallint,City varchar(25),Age tinyint)
insert  into salesman(Salesman_id,Salesman_Name,Commission,City,Age)
values
(101,'Joe', 50 ,'California',17),
(102,'simon',75,'Texas',25),
(103,'Jessie',105,'Florida',35),
(104,'Danny',100,'Texas',22),
(105,'Lia',65,'New jersy',30);

-- create the custome table 

create table customer(Salesman_id tinyint,Customer_id smallint,Customer_name varchar(25),Purchase_amount smallint)

insert into customer(salesman_id,customer_id,customer_name,purchase_amount)
values
(101,2345,'Andrew',550),
(103,1575,'Lucky',4500),
(104,2345,'Andrew',4000),
(107,3747,'Remona',2700),
(110,4004,'Julia',4545);

-- create the order table
create table orders( Order_id smallint,Customer_id smallint,Salesman_id tinyint,Order_date date ,Amount int)

insert into orders(order_id,customer_id,salesman_id,order_date,amount)
values
(5001,2345,101,'2021-07-04',500),
(5003,1234,105,'2022-02-15',1500);

select * from salesman
select * from customer
select * from orders


-- TASKS
--1)
insert into orders(order_id,customer_id,salesman_id,order_date,amount)
values
(5002,3747,103,'2022-11-19',2000)
select * from orders
--2)
ALTER TABLE salesman
ALTER COLUMN salesman_id TINYINT NOT NULL;

alter table salesman
add constraint pk_salesman
primary key(salesman_id);

alter table salesman
add constraint df_city
default 'paris' for city;

INSERT INTO salesman (Salesman_id, Salesman_Name, Commission, City, Age)
VALUES
(107, 'Unknown_107', 0, 'Paris', 30),      --Data is inserted in the parent table so that all foreign key values in the child table                                             
(110, 'Unknown_110', 0, 'Paris', 30);      --have matching records, ensuring referential integrity.

alter table customer
add constraint fk_salesman_id foreign key (salesman_id) references salesman(salesman_id);

alter table customer
alter column customer_name varchar(25) not null;

select * from salesman
select * from customer

--3)
 select * from customer  where Customer_name like'%N' and Purchase_amount> 500
 --4)
 select salesman_id from salesman union select salesman_id from customer
 select salesman_id from salesman union all select salesman_id from customer

 --5)
 select order_date,salesman_name,customer_name,Commission,city from orders inner join salesman on   salesman.salesman_id = orders.salesman_id 
 inner join customer on customer.salesman_id=salesman.Salesman_id
 where Purchase_amount between 500 and 1000
 --6)
SELECT 
    s.Salesman_id,
    o.Customer_id,
    o.Order_id,
    o.Order_date,
    o.Amount
FROM salesman s
RIGHT JOIN orders o
    ON s.Salesman_id = o.Salesman_id;
