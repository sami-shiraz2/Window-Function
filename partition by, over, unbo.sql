create database window_function
go

create table Employees
(
Name nvarchar(50),
Gender nvarchar(50),
Salary int 
);

insert into Employees values
('Jhon', 'M', 1000),
('Zain', 'F', 2000),
('Khan', 'M', 3000),
('Joe', 'F', 4000),
('Lala', 'F', 5000),
('Jaffer', 'M', 6000),
('Ali', 'M', 7000),
('Baba', 'M', 8000),
('Amin', 'F', 9000),
('Noman', 'M', 9500)

-- select * from Employees

select Name, Gender, Salary,
AVG(Salary) over (order by Salary) AS Average,
COUNT(Salary) over (order by Salary) AS [Count],
SUM(Salary) over (order by Salary) AS [SUM] 
from Employees 

select Name, Gender, Salary,
AVG(Salary) over (order by Salary rows between unbounded preceding and unbounded following) AS Average,
COUNT(Salary) over (order by Salary rows between unbounded preceding and unbounded following) AS [Count],
SUM(Salary) over (order by Salary rows between unbounded preceding and unbounded following) AS [Sum]
from Employees 

-- partition by

Select Name, Gender, Salary,
AVG(Salary) over (partition by Gender order by Salary rows between unbounded preceding and unbounded following) AS Average,
Count(Salary) over (partition by Gender order by Salary rows between unbounded preceding and unbounded following) AS [Count],
SUM(Salary) over (partition by Gender order by Salary rows between unbounded preceding and unbounded following) AS [Sum]
From Employees

Select Name, Gender, Salary,
AVG(Salary) over (order by Salary rows between 1 preceding and 1 following) AS Average,
Count(Salary) over (order by Salary rows between 1 preceding and 1 following) AS [Count],
SUM(Salary) over (order by Salary rows between 1 preceding and 1 following) AS [Sum]
From Employees

Select Name, Gender, Salary,
AVG(Salary) over (order by Salary rows between 2 preceding and 2 following) AS Average,
Count(Salary) over (order by Salary rows between 2 preceding and 2 following) AS [Count],
SUM(Salary) over (order by Salary rows between 2 preceding and 2 following) AS [Sum]
From Employees

Select distinct(Gender), count(Gender) from Employees
group by Gender
