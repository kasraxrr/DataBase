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
WHERE author_id = (SELECT id FROM author WHERE first_name = 'Ray' AND last_name = 'Porter' )

--Task30
SELECT first_name,last_name,title
FROM author,book
WHERE book.author_id=author.id AND book.title LIKE '%The Summer Dragon%'
--OR
SELECT first_name,last_name
from author
WHERE id=(SELECT author_id
          FROM book
          WHERE title LIKE '%The Summer Dragon%')






























