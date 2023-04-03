-- 1: insert into companies
INSERT INTO company (code, company_name, company_address, phone)
VALUES ('12A34', 'APPLE', 'ул. Ленина', '+7-981-973-72-09'),
	   ('56D78', 'ASUS', 'пл. Восстания', '+7-915-006-20-42'),
                 ('90H12', 'HP', 'пр. Декабристов', '+7-914-121-38-95');

-- 2: insert into orders
INSERT INTO orders
VALUES ('13-AA-31', 'Ноутбуки', 1000, 20),
	   ('22-BB-22', 'Планшеты', 800, 10),
	    ('31-CC-13', 'Смартфоны', 1000, 50);

-- 3: change company phone number
UPDATE company
	SET phone = '+7-981-973-72-07'
	WHERE company_name = 'APPLE';

-- 4: change cost and count for order
UPDATE orders
	SET order_cost = order_cost + 100,
	    order_size = order_size + 10
	WHERE order_name = 'Ноутбуки';
	
-- 5: insert into progress
INSERT INTO progress (company_code, company_order, plan_date)
VALUES ('12A34', '13-AA-31', '10.10.2022'),
	   ('56D78', '22-BB-22', '10.10.2022'),
	    ('90H12', '31-CC-13', '11.10.2022'),
                  ('12A34', '31-CC-13', '12.10.2022');

-- 6: set done_date progress
UPDATE progress
	SET shipment_date = '12.31.2022',
	    done = true
	WHERE company_code = '12A34';
	
-- 7: delete
DELETE FROM progress
	WHERE plan_date = '11.10.2022';

-- 8: update company_id and check progress UPDATE CASCADE
UPDATE company
	SET code = '56D78'
	WHERE company_name = 'ASUS';
