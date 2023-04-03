ALTER TABLE company
	DROP CONSTRAINT company_company_name_key,
	ALTER COLUMN company_city DROP DEFAULT,
	ALTER COLUMN company_city SET DEFAULT 'Saint-Petersburg',
	ALTER COLUMN company_city SET DATA TYPE varchar(100),
	ADD COLUMN country varchar(100) NOT NULL DEFAULT 'Russia';;

UPDATE company
	SET country = 'Russia'
	WHERE company_city IN ('Moscow', 'Saint-Petersburg');


ALTER TABLE orders
	DROP CONSTRAINT orders_order_size_check,
	ADD CHECK (order_size > 0 AND order_size < 10000),
	ALTER COLUMN order_cost DROP NOT NULL,
	ADD COLUMN status varchar(20),
	ADD CONSTRAINT status_check CHECK (status IN ('Принят', 'В работе', 'Выполнен'));

UPDATE orders
	SET status = 'Принят'
	WHERE code = '13-AA-31';

UPDATE orders
	SET status = 'В работе'
	WHERE code = '22-BB-22';

UPDATE orders
	SET status = 'Выполнен'
	WHERE code = '31-CC-13';

CREATE TABLE status
(
status_code integer PRIMARY KEY,
 	status_name varchar(20) NOT NULL UNIQUE
);

INSERT INTO status
	VALUES (1, 'Принят'),
		(2, 'В работе'),
		(3, 'Выполнен');

ALTER TABLE orders
	DROP CONSTRAINT status_check,
	ALTER COLUMN status SET DATA TYPE integer
	USING (CASE WHEN status = 'Принят' THEN 1
		  		WHEN status = 'В работе' THEN 2
		  		WHEN status = 'Выполнен' THEN 3
		  END),
	ADD FOREIGN KEY (status)
		REFERENCES status(status_code);
