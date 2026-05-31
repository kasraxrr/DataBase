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


--Part 1: Basic Selection, Filtering, and Sorting

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
SELECT title,AVG(page_count) avg
FROM book
GROUP BY title
HAVING AVG(page_count) IS NOT NULL
ORDER BY avg DESC ;

--10
SELECT *
FROM book
WHERE title LIKE 'D%';

--11
SELECT *
FROM book
WHERE page_count BETWEEN 200 AND 400;

--12
SELECT DISTINCT binding_type
FROM book;

--13
SELECT *
FROM book
WHERE my_rating IS NOT NULL ;

--14
SELECT *
FROM author
WHERE middle_name IS NOT NULL;

--15
SELECT title , isbn
FROM book
WHERE title LIKE '%Empire%';

--Part 2: Joins & Relational Connections

--16
SELECT title,first_name,last_name
FROM book b
JOIN author a
ON a.author_id=b.author_id;

--17
SELECT book.title,book.publisher
FROM book;

--18
SELECT book.title,book.binding_type
FROM book
WHERE binding_type LIKE 'Hardcover';

--19
SELECT b.title,g.genre
FROM book b
JOIN book_genre g
on b.book_id=g.book_id;

--20
SELECT DISTINCT g.genre,a.first_name,a.last_name
FROM book_genre g
JOIN book b
on b.book_id=g.book_id
JOIN author a
on a.author_id=b.author_id
WHERE last_name LIKE 'Sanderson';
