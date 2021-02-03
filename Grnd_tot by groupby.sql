select sale_cust_id, sale_emp_id, sale_total,
LAG(sale_total) over (partition by sale_cust_id order by sale_cust_id) AS PrevValue
from sales

-- Running Difference

select sale_cust_id, sale_emp_id, sale_total,
LAG(sale_total,1,0) over (partition by sale_cust_id order by sale_cust_id) AS PrevValue,
sale_total - LAG(sale_total,1, 0) over (partition by sale_cust_id order by sale_cust_id) AS Running_difference
from sales

create view [rank] 
AS
(
select sale_cust_id, sale_emp_id, sale_total,
DENSE_RANK() over (order by sale_total) As Ranking
from sales
)

select * from [rank]
where Ranking = 6

-- Total with group by and over

select sale_cust_id, sum(sale_total) as cust_total,
sum(sum(sale_total)) over (order by (select null)) as grand_total
from sales
group by sale_cust_id