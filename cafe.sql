CREATE SCHEMA cafe;
SET SCHEMA 'cafe';

CREATE DOMAIN statusDomain AS VARCHAR(6) CHECK(VALUE IN ('opened' , 'closed'));
CREATE DOMAIN roleDomain AS VARCHAR(7) CHECK(VALUE IN ('Manager' , 'Barista'));
CREATE DOMAIN phoneDomain AS CHAR(8) CHECK ( char_length(8) );
CREATE DOMAIN id AS NUMERIC(2);


CREATE TABLE Cafe(
    c_name VARCHAR(20) NOT NULl,PRIMARY KEY (c_name)
);


CREATE TABLE CostCenter(
    cc_id id NOT NULl,cc_name VARCHAR(20),type VARCHAR(20),status statusDomain,
    c_name VARCHAR(20),PRIMARY KEY (cc_id),
    FOREIGN KEY (cc_name) REFERENCES Cafe(c_name)
);

CREATE TABLE Employee(
    emp_id id NOT NULl,name VARCHAR(10),role roleDomain,phone phoneDomain,
    PRIMARY KEY (emp_id)
);

CREATE TABLE EmployeeManager(emp_id id,manager_id id NOT NULl,
    PRIMARY KEY (manager_id),FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE PurchaseOrder(po_id id NOT NULl,po_date DATE,supplier_id id,cc_id id
,PRIMARY KEY (po_id) ,
FOREIGN KEY(cc_id) REFERENCES CostCenter(cc_id),
FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE Supplier(supplier_id id NOT NULL,name VARCHAR(15),terms VARCHAR(20)
,PRIMARY KEY (supplier_id)
);

CREATE TABLE Payment(payment_id id NOT NULL ,methode VARCHAR(20),amount int,order_id id
 ,PRIMARY KEY (payment_id),FOREIGN KEY (order_id) REFERENCES Orders(order_id));

CREATE TABLE Orders(order_id id NOT NULL ,order_time TIME,cc_id id,emp_id id
,PRIMARY KEY (order_id),
FOREIGN KEY (cc_id)REFERENCES CostCenter(cc_id),
FOREIGN KEY (emp_id)REFERENCES Employee(emp_id));

CREATE TABLE Beans(
    beenId SERIAL PRIMARY KEY,
    beenName VARCHAR(20) NOT NULL,
    blendNote VARCHAR(20),
    Country VARCHAR(20)
    );

CREATE VIEW BeansCol as
    SELECT * FROM Beans
WHERE country='Col';

CREATE VIEW BeansBra AS
    SELECT * FROM Beans
Where Country='Bre' WITH CHECK OPTION ;

INSERT INTO Beans(beenName, blendNote, Country) VALUES ('dd','dd','Col');
INSERT INTO Beans(beenName, blendNote, Country) VALUES ('aa','aa','col');
INSERT INTO Beans(beenName, blendNote, Country) VALUES ('jj','oo','col');
INSERT INTO Beans(beenName, blendNote, Country) VALUES ('bb','nj','col');
INSERT INTO Beans(beenName, blendNote, Country) VALUES ('ii','ij','col');
INSERT INTO Beans(beenName, blendNote, Country) VALUES ('bb','c','bre');
INSERT INTO Beans(beenName, blendNote, Country) VALUES ('bb','e','Bre');
INSERT INTO BeansBra(beenName, Country) VALUES ('night owl','col/bre'),('columbia','col');

SELECT *
FROM BeansBra;

START TRANSACTION;

SELECT * FROM cafe.beans;
UPDATE cafe.beans SET country='Col' WHERE country='col';
SELECT * FROM cafe.beans;

COMMIT ;
SELECT * FROM cafe.beans;

START TRANSACTION ;

SELECT * FROM cafe.beans;
UPDATE cafe.beans SET country='bra' WHERE country='Bra';
SELECT * FROM cafe.beans;

ROLLBACK ;
SELECT * FROM cafe.beans;

SELECT *
FROM cafe.

