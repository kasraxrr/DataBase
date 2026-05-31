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

--21
SELECT book.title,co_authors.author_id
FROM co_authors
JOIN book
ON book.author_id=co_authors.author_id;

--22
SELECT book.title,author.last_name
FROM book
JOIN author
on book.author_id=author.author_id
WHERE shelf='currently-reading';

--23
SELECT *
FROM book
WHERE publisher LIKE 'Tor Books' AND my_rating=5;

--24
SELECT author.first_name,author.last_name,book_genre.genre
FROM author
JOIN book
ON book.author_id=author.author_id
JOIN book_genre
ON book_genre.book_id=book.book_id
WHERE book_genre.genre = 'science fiction';

--25
SELECT book.title,book.shelf
FROM book
ORDER BY shelf,title;

--26
SELECT publisher.publisher_name,book.title
FROM publisher
LEFT JOIN book
on book.publisher=publisher.publisher_name
ORDER BY title;

--27
SELECT book.title,author.first_name,author.last_name,genre.genre
FROM book
JOIN author
ON book.author_id = author.author_id
JOIN book_genre
ON book.book_id = book_genre.book_id
JOIN genre
ON book_genre.genre = genre.genre;

--28
SELECT COUNT(*)
FROM book;

--29
SELECT AVG(page_count)
FROM book;

--30
SELECT SUM(page_count)
FROM book
WHERE shelf='read';

--31
SELECT shelf,COUNT(*)
FROM book
GROUP BY shelf ;

--32
SELECT MAX(year_published),MIN(year_published)
FROM book;

--33
SELECT author_id,AVG(avg_rating) as avarage
FROM book
GROUP BY author_id;

--34
SELECT book.publisher,COUNT(*)
FROM book
GROUP BY publisher;

--35
SELECT binding_type,AVG(page_count) as avarage
FROM book
GROUP BY binding_type;

--36
SELECT COUNT(*),book_id
FROM book_genre
group by book_id;

--37
SELECT book.publisher,MAX(avg_rating)
FROM book
GROUP BY book.publisher
HAVING MAX(avg_rating)>4.5;

--38
SELECT book.author_id,COUNT(*)
FROM book
GROUP BY author_id
HAVING COUNT(*)>5;

--39
SELECT shelf,AVG(my_rating) as avg
FROM book
WHERE my_rating IS NOT NULL
GROUP BY shelf ;

--40
SELECT publisher,COUNT(*)
FROM book
WHERE page_count>400 AND publisher IS NOT NULL
GROUP BY publisher
HAVING COUNT(*)>3;

--Part 4: Subqueries & Advanced Filtering

--41
SELECT *
FROM book
WHERE page_count > (SELECT AVG(page_count) FROM book);


--42
SELECT title
FROM book
WHERE year_published = (SELECT MIN(year_published)FROM book);

--43
SELECT *
FROM book
WHERE author_id=(SELECT author_id FROM author WHERE last_name='Sanderson' LIMIT 1);

SELECT *
FROM book
JOIN author
on book.author_id = author.author_id
WHERE last_name='Sanderson';

--44