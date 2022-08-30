select count(*)
from Superstore..[Orders]

select *
from Superstore..[Orders]
order by 1

--checking whether Order ID is primary key or not (being a primary key means that each order ID must have just one row):
select [Order ID], count(*)
from Superstore.. [Orders]
group by [Order ID]
having count(*)>1

select *
from Superstore..[Orders]
where [Order ID] = 'AG-2013-8490'
-- here we see that the above Order ID has 5 rows associated with it, hence Order ID column is not the primary key

-- now, checking whether Row ID and Order ID together are a primary key or not:
select [Row ID],[Order ID], count(*)
from Superstore..[Orders]
group by [Row ID],[Order Date]
having count(*)>1

select * from Superstore..Orders
where [Ship Date]<[Order Date]

select distinct [Ship Mode] from Superstore..Orders

-- finding out number of days between the order date and ship date
select DATEDIFF(DAY, [Order Date], [Ship Date]) as NumofDays, *
from Superstore..Orders
where [Ship Mode] = 'Second Class'

-- running min and max functions
select min(a.NumofDays), max(a.NumofDays)
from(
select DATEDIFF(DAY, [Order Date], [Ship Date]) as NumofDays, *
from Superstore..Orders
where [Ship Mode] = 'Same Day' ) a


--to know the count of orders made by customers
select [Customer ID], [Order ID], count(*)
from Superstore..Orders
group by [Customer ID], [Order ID]
order by [Customer ID]

select * from Superstore..Orders
where [Order ID] = 'CA-2011-138100'