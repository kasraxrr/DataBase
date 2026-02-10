SET SCHEMA 'goodreads_v2';

--task2:
SELECT first_name,last_name,id
FROM author
WHERE id=23;

--task3:
SELECT title
FROM book
where id=24358527;

--task4:
SELECT COUNT(*)
FROM profile;

--task5:
SELECT COUNT(*)
FROM profile
WHERE first_name='Jaxx';

--task6
SELECT first_name,COUNT(first_name)
from author
GROUP BY first_name
ORDER BY first_name;

--task7
SELECT title,page_count
FROM book
WHERE page_count IS NOT NULL
ORDER BY page_count DESC ;

--task8
SELECT title,page_count
FROM book
WHERE page_count IS NOT NULL
ORDER BY page_count DESC ;









































