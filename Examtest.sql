set schema 'goodreads';
--SELECT
SELECT *
FROM book;

--WHERE
SELECT title,year_published
FROM book
WHERE year_published>2011;

--GroupBy
SELECT shelf,AVG(year_published)
FROM book
group by shelf;

--1
SELECT *
FROM book;

--2
SELECT title,avg_rating,page_count,my_rating m
FROM book
WHERE my_rating=5;

--3
SELECT *
FROM book
WHERE shelf LIKE 'to-read';

--4
SELECT DISTINCT publisher
FROM book
WHERE publisher IS NOT NULL;

--5
SELECT first_name,last_name
FROM author
ORDER BY last_name;

--6
SELECT title,author_id,year_published as year
FROM book
WHERE year_published<2020
ORDER BY year DESC;

--7
SELECT title,page_count
FROM book
where page_count>500;

--8
SELECT *
FROm book
WHERE date_finished IS NULL ;


--9