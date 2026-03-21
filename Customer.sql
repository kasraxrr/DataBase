CREATE SCHEMA test;
SET SCHEMA 'test';

CREATE TABLE Customer(
    id int,country_code CHAR(3),customer_name VARCHAR(20),PRIMARY KEY (id)
);

INSERT INTO Customer(id,country_code,customer_name)
VALUES (1,'DK','Anna'),
 (2,'USA','Victor'),
 (3,'SE','Dewin');


SELECT length(country_code) cc,octet_length(country_code) cc_stored,length(customer_name)cn,octet_length(customer_name) cn_stored
FROM Customer;



