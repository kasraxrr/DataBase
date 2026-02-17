set schema 'cafe';

--Cross join
SELECT c.coffeetype,s.syrupname
FROM coffeerecipies c  cross join syrup s;

SELECT *
FROM coffeerecipies c CROSS JOIN cafe.syrup s
WHERE coffeetype='latte' AND milktype='oat';

--Inner join
SELECT c.coffeetype,s.syrupname
From coffeerecipies c JOIN Syrup s ON s.syrupid = c.syrupid;

--NaturalJoin
SELECT c.coffeetype,s.syrupname
From coffeerecipies c NATURAL JOIN syrup s;

--ThreeTableInnerJoins
SELECT o.orderId,o.customer,o.coffeeType,s.syrupname as syrup,ordertime
From Orders AS o
JOIN coffeerecipies AS c
ON o.coffeetype=c.coffeetype
AND o.milktype=c.milktype
JOIN syrup AS s
ON c.syrupid=s.syrupid
ORDER BY o.ordertime;

--LeftOuterJoin
SELECT c.coffeeType,c.milkType,s.syrupname
FROM coffeerecipies as c
LEFT JOIN syrup as s
on c.syrupid=S.syrupid;

--RightOuterJoin
SELECT c.coffeeType,c.milkType,s.syrupname
FROM coffeerecipies as c
RIGHT JOIN syrup as s
on c.syrupid=S.syrupid;

--FullOuterJoin
SELECT c.coffeeType,c.milkType,s.syrupname
FROM coffeerecipies as c
FULL OUTER JOIN syrup as s
on c.syrupid=S.syrupid;

--SetUnion
SELECT coffeetype FROM coffeerecipies
UNION ALL
SELECT coffeeType FROM orders
ORDER BY coffeetype;

SELECT coffeetype FROM coffeerecipies
UNION
SELECT coffeeType FROM orders
ORDER BY coffeetype;

(SELECT c.coffeeType,c.milkType FROM coffeerecipies AS c)
INTERSECT
(SELECT o.coffeeType,o.milkType FROM orders AS o)

