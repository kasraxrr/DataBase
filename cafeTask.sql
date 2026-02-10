set schema 'cafe';

select coffeeType type_,milktype milk, size cup_size
from coffeerecipies;

select count (distinct (coffeeType , shotCount))
from coffeerecipies;

select orders.orderid,orders.customer,unitprice/6.37 as unitprice_usd
from orders;

select *
from orders;

select sum(quantity * unitPrice) as total_revenue from orders;

SELECT COUNT(*)
FROM orders;

SELECT sum(orderid)
FROM orders;

SELECT MAX(unitprice)
FROM orders;

SELECT MIN(unitprice)
FROM orders;

SELECT *
FROM orders
WHERE ordertime BETWEEN '2025-08-01' AND '2025-08-02';

SELECT *
FROM orders
WHERE  coffeetype LIKE '_a%';

SELECT *
FROM orders
WHERE  customer LIKE '___';

SELECT customer,ordertime,SUM(quantity) as item
FROM orders
GROUP BY customer,ordertime;

SELECT customer,SUM(quantity*unitprice) AS revenue
FROM orders
GROUP BY customer
HAVING SUM(quantity*unitprice)>50
ORDER BY revenue;

SELECT coffeetype,size,shotcount,milktype
FROM coffeerecipies
ORDER BY  coffeetype ASC,size ASC,shotcount DESC ;