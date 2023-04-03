INSERT INTO company (code, company_name, company_address, phone)
VALUES ('12A34', 'APPLE', 'ул. Ленина', '+7-981-973-72-09'),
	   ('56D78', 'ASUS', 'пл. Восстания', '+7-915-006-20-42'),
                 ('90H12', 'HP', 'пр. Декабристов', '+7-914-121-38-95');

INSERT INTO orders
VALUES ('13-AA-31', 'Ноутбуки', 1000, 20),
	   ('22-BB-22', 'Планшеты', 800, 10),
	    ('31-CC-13', 'Смартфоны', 1000, 50);

UPDATE company
	SET phone = '+7-981-973-72-07'
	WHERE company_name = 'APPLE';

UPDATE orders
	SET order_cost = order_cost + 100,
	    order_size = order_size + 10
	WHERE order_name = 'Ноутбуки';
	
INSERT INTO progress (company_code, company_order, plan_date)
VALUES ('12A34', '13-AA-31', '10.10.2022'),
	   ('56D78', '22-BB-22', '10.10.2022'),
	    ('90H12', '31-CC-13', '11.10.2022'),
                  ('12A34', '31-CC-13', '12.10.2022');


UPDATE progress
	SET shipment_date = '12.31.2022',
	    done = true
	WHERE company_code = '12A34';
	
	
DELETE FROM progress
	WHERE plan_date = '11.10.2022';

UPDATE company
	SET code = '56D78'
	WHERE company_name = 'ASUS';
	
DELETE FROM company
	WHERE company_name = 'HP';
