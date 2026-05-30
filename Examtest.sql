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

