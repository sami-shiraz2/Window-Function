create database window_function
go

create table sales
(
sale_id int,
sale_cust_id int,
sale_emp_id int,
sale_total float,
payment_method nvarchar(50)
);

insert into sales values
(1, 2 ,3, 24.4, 'card'),
(2, 4 ,3, 24.4, 'card'),
(3, 6 ,3, 244.4, 'card'),
(4, 8 ,3, 124.4, 'card'),
(5, 10 ,3, 524.4, 'card'),
(6, 12 ,3, 264.4, 'card'),
(7, 13 ,3, 247.4, 'card'),
(8, 14 ,3, 241.4, 'card'),
(9, 21 ,3, 254.4, 'card'),
(10, 15 ,3, 824.4, 'card'),
(11, 18 ,3, 924.4, 'card'),
(12, 12 ,3, 284.4, 'card'),
(13, 2 ,3, 248.4, 'card'),
(14, 2 ,3, 2554.4, 'card'),
(15, 2 ,3, 2465.4, 'card'),
(16, 2 ,3, 2422.4, 'card'),
(17, 2 ,3, 2422.4, 'card')

insert into sales values
(18, 2,3, 2422.4, 'card'),
(19, 2, 3, 6547.6, 'card')

select *  from sales

select * from sales
where sale_cust_id = 2 and payment_method like '%rd%' 

select sale_id, sale_cust_id, sale_total,
ROW_NUMBER() over (partition by sale_cust_id order by sale_total desc) AS row_rank,
Rank() over (partition by sale_cust_id order by sale_total desc) AS [rank],
Dense_rank() over (partition by sale_cust_id order by sale_total desc) AS [dense_rank],
NTILE(5) over (partition by sale_cust_id order by sale_total desc) AS ntil
from sales
order by sale_cust_id desc