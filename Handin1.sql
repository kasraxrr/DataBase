SET SCHEMA 'goodreads';

--TaskA(Select operations)
SELECT book_id,title,year_published as pub_year
FROM book;

SELECT DISTINCT shelf
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
/*single value rule = each cell can only have one value*/
SELECT  shelf,COUNT(book_id) AS total_books,AVG(avg_rating) AS average_shelf_rating
FROM book
GROUP BY shelf;
/*book read has no shelf*/

SELECT author_id, AVG(my_rating)
FROM book
GROUP BY author_id
HAVING AVG(my_rating) > 4.2;
/*author does not have rating*/

--TaskE(Order by)
SELECT *
FROM book
WHERE page_count IS NOT NULL
ORDER BY page_count DESC
LIMIT 10;
/*TOP 10 longest books*/

SELECT *
FROM book
ORDER BY title;

SELECT *
FROM book
WHERE year_published IS NOT NULL
ORDER BY year_published DESC;

--TaskF(Joins)
SELECT book_id,title,first_name,last_name
FROM book b
JOIN author a
ON b.author_id=a.author_id;

SELECT first_name,last_name,COUNT(*)
FROM author a
JOIN book b
on a.author_id=b.author_id
group by first_name, last_name;

/*What will a full outer join between publisher and book reveal?
  the full outer join will keep all the rows in both tables
  it means keeping the all publishers also the ones who have published no book and sets null in other sells
  and keeps all the books which have no publisher and setting null in publisher*/

  /*in your own words, describe how an inner join pairs rows
    a join that does not show null values and based on and attribute which
    is same in both tables*/

--Task G, Set operation
(SELECT *
FROM book
 WHERE shelf='read')
union
(SELECT *
FROM book
 WHERE shelf='to-read')

/*union removes the duplicated rows
  but union all does delete*/