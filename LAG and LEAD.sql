select * from sales

-- LAG

select sale_cust_id,
sale_emp_id,
sale_total,
LAG(sale_total, 1, 0) over (order by sale_cust_id) AS PrevVal
from sales

-- LEAD

select sale_cust_id,
sale_emp_id,
sale_total,
LEAD(sale_total, 1, 0) over (order by sale_cust_id) AS NextVal
from sales

select * from sales