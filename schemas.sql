/*
  Install mysql  -> https://dev.mysql.com/doc/mysql-osx-excerpt/5.5/en/osx-installation-pkg.html
  run the server 
  log in with 'root' user
  log in with  mysql -u root -p;

  create a super user like (https://dev.mysql.com/doc/refman/5.5/en/adding-users.html)
  in another termilal log in with the user info. 'sara'
  mysql -u sara -p;
  
  create a database --> nehal


  in another temilal nanigate to the folder where this file is and run this file

  mysql -u sara -p nehal < schemas.sql;



Now your database is populated 
*/


DROP TABLE IF EXISTS product_family;

CREATE TABLE product_family (
  ID_PRODUCT_FAMILY SERIAL PRIMARY KEY,
  PRODUCT_FAMILY_HANDLE VARCHAR(45) UNIQUE
);


DROP TABLE IF EXISTS product;

CREATE TABLE product (
  ID_PRODUCT SERIAL PRIMARY KEY,
  PRODUCT_SKU VARCHAR(255) UNIQUE,
  NUMBER_OF_RECIPES INT,
  NUMBER_OF_MEALS   INT,
  FK_PRODUCT_FAMILY INT REFERENCES product_family (ID_PRODUCT_FAMILY)
);

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  ID_CUSTOMER SERIAL PRIMARY KEY,
  FIRST_NAME VARCHAR(255),
  LAST_NAME VARCHAR(255),
  EMAIL VARCHAR(255),
  PASSWORD VARCHAR(255),
  CREATED_AT DATETIME,
  UPDATED_AT DATETIME
);


DROP TABLE IF EXISTS subscription;

CREATE TABLE subscription (
  ID_SUBSCRIPTION SERIAL PRIMARY KEY,
  STATUS VARCHAR(255),
  CREATED_AT DATETIME,
  UPDATED_AT DATETIME,
  FK_CUSTOMER INT REFERENCES customer (ID_CUSTOMER),
  FK_PRODUCT_SUBSCRIBED_TO INT REFERENCES product (ID_PRODUCT)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  ID_ORDER SERIAL PRIMARY KEY,
  ORDER_NUMBER VARCHAR(255),
  DELIVERY_DATE DATE,
  PURCHASE_PRICE DECIMAL(8,2),
  CREATED_AT DATETIME,
  UPDATED_AT DATETIME,
  FK_SUBSCRIPTION INT REFERENCES subscription (ID_SUBSCRIPTION),
  FK_PRODUCT INT REFERENCES product (ID_PRODUCT)
);

INSERT INTO product_family (PRODUCT_FAMILY_HANDLE) VALUES ('bags');
INSERT INTO product_family (PRODUCT_FAMILY_HANDLE) VALUES ('car');
INSERT INTO product_family (PRODUCT_FAMILY_HANDLE) VALUES ('truck');
INSERT INTO product_family (PRODUCT_FAMILY_HANDLE) VALUES ('dog');

INSERT INTO product (PRODUCT_SKU, NUMBER_OF_RECIPES, NUMBER_OF_MEALS, FK_PRODUCT_FAMILY) VALUES ('product_SKU_someUnqueVale', 5, 4, 1);
INSERT INTO product (PRODUCT_SKU, NUMBER_OF_RECIPES, NUMBER_OF_MEALS, FK_PRODUCT_FAMILY) VALUES ('product_SKU_someUnqueVale1', 5, 4, 2);
INSERT INTO product (PRODUCT_SKU, NUMBER_OF_RECIPES, NUMBER_OF_MEALS, FK_PRODUCT_FAMILY) VALUES ('product_SKU_someUnqueVale2', 5, 4, 3);
INSERT INTO product (PRODUCT_SKU, NUMBER_OF_RECIPES, NUMBER_OF_MEALS, FK_PRODUCT_FAMILY) VALUES ('product_SKU_someUnqueVale3', 5, 4, 3);



INSERT INTO customer (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD,CREATED_AT,UPDATED_AT ) VALUES ('Sara', 'Daqiq', 'sadaqiq@gmail.com', '12345', current_timestamp, current_timestamp);
INSERT INTO customer (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD,CREATED_AT,UPDATED_AT ) VALUES ('Sara', 'Daqiq', 'sadaqiq1@gmail.com', '12345', current_timestamp, current_timestamp);
INSERT INTO customer (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD,CREATED_AT,UPDATED_AT ) VALUES ('Sara', 'Daqiq', 'fancygirl83@hotmail.com', '12345', current_timestamp, current_timestamp);
INSERT INTO customer (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD,CREATED_AT,UPDATED_AT ) VALUES ('Sara', 'Daqiq', 'sadaqiq2@gmail.com', '12345', current_timestamp, current_timestamp);



INSERT INTO subscription (STATUS, CREATED_AT,UPDATED_AT, FK_CUSTOMER, FK_PRODUCT_SUBSCRIBED_TO ) VALUES ('Active', current_timestamp, current_timestamp, 1, 1);
INSERT INTO subscription (STATUS, CREATED_AT,UPDATED_AT, FK_CUSTOMER, FK_PRODUCT_SUBSCRIBED_TO ) VALUES ('Paused', current_timestamp, current_timestamp, 2, 2);
INSERT INTO subscription (STATUS, CREATED_AT,UPDATED_AT, FK_CUSTOMER, FK_PRODUCT_SUBSCRIBED_TO ) VALUES ('Active', current_timestamp, current_timestamp, 3, 3);
INSERT INTO subscription (STATUS, CREATED_AT,UPDATED_AT, FK_CUSTOMER, FK_PRODUCT_SUBSCRIBED_TO ) VALUES ('cancelled', current_timestamp, current_timestamp, 4, 4);



INSERT INTO orders (order_number,delivery_date, purchase_price, CREATED_AT,UPDATED_AT, FK_SUBSCRIPTION, FK_PRODUCT ) VALUES ('22', current_timestamp, 22.3, current_timestamp, current_timestamp,  1, 1);
INSERT INTO orders (order_number,delivery_date, purchase_price, CREATED_AT,UPDATED_AT, FK_SUBSCRIPTION, FK_PRODUCT ) VALUES ('23', current_timestamp, 33.2, current_timestamp, current_timestamp, 2, 2);
INSERT INTO orders (order_number,delivery_date, purchase_price, CREATED_AT,UPDATED_AT, FK_SUBSCRIPTION, FK_PRODUCT ) VALUES ('55', current_timestamp, 35.2, current_timestamp, current_timestamp, 3, 3);
INSERT INTO orders (order_number,delivery_date, purchase_price, CREATED_AT,UPDATED_AT, FK_SUBSCRIPTION, FK_PRODUCT ) VALUES ('67', current_timestamp, 77.2, current_timestamp, current_timestamp, 4, 4);

/*
select p.product_sku from subscription s join product p on s.FK_PRODUCT_SUBSCRIBED_TO =p.ID_PRODUCT where s.status='Active' and s.fk_customer in (select id_customer from customer where email='fancygirl83@hotmail.com');
select first_name c, product_sku p, delivery_date o, purchase_price o from customer c join subscription join orders o join product p on fk_customer=id_customer and fk_product_subscribed_to=id_product and fk_subscription=id_subscription;
*/








