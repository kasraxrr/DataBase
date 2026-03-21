CREATE SCHEMA playdate;
SET SCHEMA 'playdate';

CREATE DOMAIN name AS VARCHAR(20) NOT NULL;
CREATE DOMAIN description AS VARCHAR(150);
CREATE DOMAIN integer AS INTEGER CHECK (VALUE > 0);
CREATE DOMAIN smallint AS SMALLINT CHECK (VALUE > 0);

CREATE TABLE store (
    store_id smallint PRIMARY KEY,
    store_name name,
    store_address description NOT NULL
);

CREATE TABLE product (
    sku    VARCHAR(20)  NOT NULL PRIMARY KEY,
    item_name name
);

CREATE TABLE clerk (
    clerk_id smallint  NOT NULL PRIMARY KEY,
    clerk_firstname name
);

CREATE TABLE promotion (
    promo_code VARCHAR(20)  NOT NULL PRIMARY KEY,
    promo_name name
);

CREATE TABLE warranty (
    warranty_code    VARCHAR(20)  NOT NULL PRIMARY KEY,
    warranty_months  smallint    NOT NULL
);

CREATE TABLE receipt (
    store_id   smallint   NOT NULL,
    receipt_no INTEGER   NOT NULL,
    sale_time  Time NOT NULL ,
    clerk_id   smallint   NOT NULL,
    PRIMARY KEY (store_id,receipt_no)
    ,FOREIGN KEY (store_id) REFERENCES store(store_id)
    ,FOREIGN KEY (clerk_id) REFERENCES clerk(clerk_id)
);

CREATE TABLE receiptLine
(
    store_id      smallint  NOT NULL,
    receipt_no    INTEGER   NOT NULL,
    line_no       integer NOT NULL,
    sku           VARCHAR(50) NOT NULL,
    qty           integer NOT NULL,
    promo_code    VARCHAR(20),
    warranty_code VARCHAR(20),
    PRIMARY KEY (store_id,receipt_no,line_no)
    ,FOREIGN KEY (store_id) REFERENCES store(store_id)
    ,FOREIGN KEY (sku) REFERENCES product(sku)
    ,FOREIGN KEY (promo_code) REFERENCES promotion(promo_code)
    ,FOREIGN KEY (warranty_code) REFERENCES warranty(warranty_code)
    ,FOREIGN KEY (receipt_no) REFERENCES receipt(receipt_no)
);



INSERT INTO Store VALUES (1, 'PlayDate Copenhagen', 'Stroget 10');
INSERT INTO Store VALUES (2, 'PlayDate Aarhus', 'Aboulevarden 1');
INSERT INTO Store VALUES (3, 'Another Store', 'Nowhere');
INSERT INTO playdate.Receipt VALUES (1, NULL, NOW(), 1);/*error*/

SELECT *
FROM store


