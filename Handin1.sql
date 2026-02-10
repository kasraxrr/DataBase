SET SCHEMA 'goodreads_v2';

SELECT id,title,year_published as pub_year
FROM book;