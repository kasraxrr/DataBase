SET SCHEMA 'goodreads';

--TaskA(Select operations)
SELECT id,title,year_published as pub_year
FROM book;

SELECT DISTINCT year_published
FROM book;
/*DISTINCT deletes the duplicated rows*/

 SELECT year_published*2
 FROM book;
/*calculates the published year *2 */

--TaskB(Filtering)
SELECT *
FROM book
WHERE year_published=2020;

SELECT *
FROM book
WHERE title LIKE 'The%' OR title LIKE '_a%';

SELECT *
FROM book
WHERE isbn IS NULL;

--TaskC(Aggregate operations)
SELECT COUNT(*)
FROM book;

SELECT MAX(page_count)
FROM book;

SELECT MIN(page_count)
FROM book;

SELECT AVG(page_count)
FROM book;

--TaskD(Group by and Having)
SELECT  shelf,COUNT(book_id) AS total_books,AVG(rating) AS average_shelf_rating
FROM book_read
GROUP BY shelf;
/*book read has no shelf*/

SELECT id, AVG(my_rating) AS
FROM author
GROUP BY id
HAVING AVG(my_rating) > 4.2;
/*author does not have rating*/

--TaskE(Order by)
SELECT *
FROM book
WHERE page_count IS NOT NULL
ORDER BY page_count DESC
LIMIT 5;

SELECT *
FROM book
ORDER BY title;

SELECT *
FROM book
WHERE year_published IS NOT NULL
ORDER BY year_published DESC;

--TaskF(Joins)

