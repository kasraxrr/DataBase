SET SCHEMA 'goodreads_v2';

--TaskA
SELECT id,title,year_published as pub_year
FROM book;

SELECT DISTINCT year_published
FROM book;
/*DISTINCT deletes the duplicated rows*/

 SELECT year_published*2
 FROM book;
/*calculates the published year *2 */

--TaskB
SELECT *
FROM book
WHERE year_published=2020;

SELECT *
FROM book
WHERE title LIKE 'The%' OR title LIKE '_a%'

SELECT *
FROM book
WHERE isbn IS NULL;
