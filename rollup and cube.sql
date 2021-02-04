create database data_analysis
go

create table sales
(
continent varchar(50),
country varchar(50),
city varchar(50),
unit_sold integer
);

insert into sales values
('North_America', 'Canada', 'Toronto', 10000),
('North_America', 'Canada', 'Montreal', 5000),
('North_America', 'Canada', 'Vancouver', 15000),
('Asia', 'China', 'HongKong', 7000),
('Asia', 'China', 'Shangai', 3000),
('Asia', 'Japan', 'Tokyo', 5000),
('Euroupe', 'UK', 'Paris', 6000),
('Euroupe', 'UK', 'Mochester', 12000),
('Euroupe', 'France', 'London', 5000)

select * from sales

select continent, sum(unit_sold) AS Total_Unit_Sold
from sales
group by continent

select City, sum(unit_sold) AS Total_Unit_Sold
from sales
group by City

select Country, sum(unit_sold) AS Total_Unit_Sold
from sales
group by country

select Continent, Country, City, sum(unit_sold) AS Total_Unit_Sold
from sales
group by grouping sets(Continent, Country, City, ())

select Continent, Country, City, sum(unit_sold) AS Total_Unit_Sold
from sales
group by rollup(Continent, Country, City)

select Continent, Country, City, sum(unit_sold) AS Total_Unit_Sold
from sales
group by cube(Continent, Country, City)

select * from
[dbo].[Salary]

select Name, sum(Salary) AS Total_Salary
from [dbo].[Salary]
group by rollup(Name)

select Name, sum(Salary) AS Total_Salary
from [dbo].[Salary]
group by grouping sets(Name, ())

select Name, sum(Salary) AS Total_Salary
from [dbo].[Salary]
group by Name with Rollup

select Name, Department, Category, sum(Salary)
from Salary
group by rollup(Name, Department, Category)

select Name, Department, Category, sum(Salary)
from Salary
group by cube(Name, Department, Category)

select sum(Salary) from Salary