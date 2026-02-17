SET SCHEMA 'goodreads_v2';

--task2:
SELECT first_name, last_name, id
FROM author
WHERE id = 23;

--task3:
SELECT title
FROM book
where id = 24358527;

--task4:
SELECT COUNT(*)
FROM profile;

--task5:
SELECT COUNT(*)
FROM profile
WHERE first_name = 'Jaxx';

--task6
SELECT first_name, COUNT(first_name)
from author
GROUP BY first_name
ORDER BY first_name;

--task7
SELECT title, page_count
FROM book
WHERE page_count IS NOT NULL
ORDER BY page_count DESC;

--task8
SELECT title, page_count
FROM book
WHERE page_count IS NOT NULL
ORDER BY page_count DESC;

--task9
SELECT *
FROM book
where year_published = 2017;

--task10
SELECT publisher_id
FROM book
where title = 'Tricked (The Iron Druid Chronicles,  #4)';

--task11
SELECT binding_id
FROM book
WHERE title = 'Fly by Night';

--task12
SELECT COUNT(*)
FROM book
WHERE isbn IS NULL;

--task13
SELECT COUNT(*)
FROM author
WHERE middle_name IS NOT NULL;

--task14
SELECT author_id, COUNT(*) as count
FROM book
GROUP BY author_id
ORDER BY count DESC;

--task15
SELECT MAX(page_count)
FROM book;

--task16
SELECT title, page_count
FROM book
WHERE page_count = (SELECT MAx(page_count) from book);

--task17
SELECT COUNT(*)
FROM book_read
WHERE status = 'read'
  AND profile_id = (SELECT id FROM profile where profile_name = 'Venom_Fate');


--task18
SELECT COUNT(*)
FROM book
WHERE author_id = (SELECT id FROM author WHERE first_name = 'Brandon' AND last_name = 'Sanderson');


--task19
SELECT COUNT(*)
FROM book_read
WHERE book_id = (SELECT id FROM book where title = 'Gullstruck Island');

--task20
SELECT COUNT(*)
FROM co_authors
WHERE author_id = (SELECT id FROM author WHERE first_name = 'Ray' AND last_name = 'Porter' );

--Task31
SELECT first_name,last_name,title
FROM author,book
WHERE book.author_id=author.id AND book.title LIKE '%The Summer Dragon%';
--OR
SELECT first_name,last_name
FROM author
WHERE id=(SELECT author_id
          FROM book
          WHERE title LIKE '%The Summer Dragon%');
--or
SELECT first_name,last_name
FROM author as a
JOIN book as b
on a.id=b.author_id
WHERE title LIKE '%The Summer Dragon%';

--Task32
SELECT type
FROM binding_type as bi
JOIN book as bo
on bi.id=bo.binding_id
WHERE title='Dead Iron (Age of Steam,  #1)';


--Task33
SELECT type,COUNT(*)
FROM binding_type AS bt
JOIN book AS b
on b.binding_id=bt.id
GROUP BY type;

--Task34
SELECT profile_name , COUNT(*)
FROM profile AS p
JOIN book_read AS b
on p.id=b.profile_id
GROUP BY profile_name;

--Task35
SELECT genre
FROM genre AS g
JOIN book_genre AS bg
ON g.id=bg.genre_id
JOIN book AS b
on bg.book_id=b.id
WHERE b.title='Hand of Mars (Starship''s Mage,  #2)';

--Task36
(SELECT first_name,last_name
FROM author AS a
JOIN book AS b
ON a.id=b.author_id
WHERE b.title= 'Dark One')
    union
(
SELECT a.first_name, a.last_name
FROM author a
JOIN co_authors c ON a.id = c.author_id
JOIN book b ON b.id = c.book_id
WHERE b.title = 'Dark One');

--TAsk37
SELECT b.title
FROM book_read AS br
JOIN book AS b ON b.id = br.book_id
WHERE br.status = 'read'
GROUP BY b.id, b.title
ORDER BY COUNT(*) DESC
LIMIT 1;

--Task38
SELECT DISTINCT b.title,page_count,bi.type
FROM book AS b
JOIN binding_type as bi
on b.binding_id=bi.id
WHERE page_count IS NOT NULL
ORDER BY page_count DESC
LIMIT 10;

--TASK39
SELECT bg.genre_id,COUNT(*),g.genre
FROM book_genre AS bg
JOIN genre as g
on bg.genre_id=g.id
group by genre_id,g.genre
order by genre_id

--Task40


































