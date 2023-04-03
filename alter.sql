ALTER TABLE company
	-- 1: drop unique company_name
	DROP CONSTRAINT company_company_name_key,
	-- 2: change default city name
	ALTER COLUMN company_city DROP DEFAULT,
	ALTER COLUMN company_city SET DEFAULT 'Saint-Petersburg',
	-- 3: rise up text size
	ALTER COLUMN company_city SET DATA TYPE varchar(100),
	 -- 4.1: add column
	ADD COLUMN country varchar(100) NOT NULL DEFAULT 'Russia';
	
-- 4.2: set data
UPDATE company
	SET country = 'Russia'
	WHERE company_city IN ('Moscow', 'Saint-Petersburg');

-- --------------------------------------

ALTER TABLE orders
	-- 1: rise up count type
	DROP CONSTRAINT orders_order_size_check,
	ADD CHECK (order_size > 0 AND order_size < 10000),
	-- 2: cost may be null
	ALTER COLUMN order_cost DROP NOT NULL,
	-- 3: create status variable
	ADD COLUMN status varchar(20),
	ADD CONSTRAINT status_check CHECK (status IN ('Принят', 'В работе', 'Выполнен'));
	
-- 4: add values into orders
UPDATE orders
	SET status = 'Принят'
	WHERE code = '13-AA-31';

UPDATE orders
	SET status = 'В работе'
	WHERE code = '22-BB-22';

UPDATE orders
	SET status = 'Выполнен'
	WHERE code = '31-CC-13';

-- 5.1: change status structure
CREATE TABLE status
(
status_code integer PRIMARY KEY,
 	status_name varchar(20) NOT NULL UNIQUE
);

-- 5.2: insert into status data
INSERT INTO status
	VALUES (1, 'Принят'),
		(2, 'В работе'),
		(3, 'Выполнен');

-- 5.3: clean up
ALTER TABLE orders
	DROP CONSTRAINT status_check,
	ALTER COLUMN status SET DATA TYPE integer
	USING (CASE WHEN status = 'Принят' THEN 1
		  		WHEN status = 'В работе' THEN 2
		  		WHEN status = 'Выполнен' THEN 3
		  END),
	ADD FOREIGN KEY (status)
		REFERENCES status(status_code);
