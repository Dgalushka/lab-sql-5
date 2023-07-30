USE SAKILA;
-- task 1
ALTER TABLE staff
DROP COLUMN picture;

-- task 2
insert into STAFF
values ('3', 'Tammy', 'Sanders', 79, 'Tammt.Sanders@sakilastaff.com', '2', '1','Tammy', ' ' , '2006-02-15 04:57:20');
SELECT * FROM STAFF;

-- task 3 


SELECT * FROM CUSTOMER
WHERE FIRST_NAME REGEXP 'TAMMY';

SELECT * FROM sakila.rental;

INSERT INTO RENTAL
VALUES ('16050', '2023-07-01 15:16:00', '2', '130',null,'1','2023-07-01 15:16:00');

-- task 4

SELECT * FROM CUSTOMER
WHERE active = 0;

DESCRIBE SAKILA.CUSTOMER;

drop table non_active_customers;

CREATE TABLE non_active_customers (
  `non_active_customer_id` smallint unsigned NOT NULL, -- AS PRIMARY KEY
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL ,
  `address_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` timestamp DEFAULT NULL
);

INSERT INTO non_active_customers 
SELECT *
FROM customer
WHERE active = 0;

SELECT * FROM non_active_customers;

ALTER TABLE non_active_customers 
DROP COLUMN active;

DELETE FROM customer 
WHERE customer_id in ( 
	SELECT customer_id 
	FROM non_active_customers);
