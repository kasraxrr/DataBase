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

