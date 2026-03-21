CREATE SCHEMA playdate;
SET SCHEMA 'playdate';

CREATE DOMAIN name AS VARCHAR(20) NOT NULL;
CREATE DOMAIN description AS VARCHAR(150);
CREATE DOMAIN integer AS INTEGER CHECK (VALUE > 0);
CREATE DOMAIN smallint AS SMALLINT CHECK (VALUE > 0);

CREATE TABLE Store (
    store_id smallint PRIMARY KEY,
    store_name name,
    store_address description NOT NULL
);

CREATE TABLE product (
    sku    VARCHAR(20)  NOT NULL PRIMARY KEY,
    item_name name
);

CREATE TABLE Clerk (
    clerk_id smallint  NOT NULL PRIMARY KEY,
    clerk_firstname name
);

CREATE TABLE Promotion (
    promo_code VARCHAR(20)  NOT NULL PRIMARY KEY,
    promo_name name
);

CREATE TABLE Warranty (
    warranty_code    VARCHAR(20)  NOT NULL PRIMARY KEY,
    warranty_months  smallint    NOT NULL
);

CREATE TABLE ReceiptLine
(
    store_id      smallint  NOT NULL,
    receipt_no    INTEGER   NOT NULL,
    line_no       integer NOT NULL,
    sku           VARCHAR(50) NOT NULL,
    qty           integer NOT NULL,
    promo_code    VARCHAR(20),
    warranty_code VARCHAR(20),
    PRIMARY KEY (store_id,receipt_no,line_no)
);

CREATE TABLE Receipt (
    store_id   smallint   NOT NULL,
    receipt_no INTEGER   NOT NULL,
    sale_time  Time NOT NULL ,
    clerk_id   smallint   NOT NULL,
    PRIMARY KEY (store_id,receipt_no)
    ,FOREIGN KEY (store_id) REFERENCES Store(store_id)
    ,FOREIGN KEY (clerk_id) REFERENCES Clerk(clerk_id)
);


