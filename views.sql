-- 1: simple select view
CREATE VIEW order_members AS
	SELECT c.company_name, c.company_city, o.order_name
		FROM company AS c, orders AS o, progress AS p
		WHERE c.code = p.company_code
		AND o.code = p.company_order
	 		ORDER BY c.company_city;
-- 2: check first view
SELECT * FROM order_members;

-- 3: insert into progress and check first view
INSERT INTO progress
VALUES ('56D78', '13-AA-31', '03.03.2022', true, '04.05.2022');

SELECT * FROM order_members;

-- 4: use view with another select
SELECT order_name
FROM order_members
WHERE company_city = 'Moskow';

-- 5: save view and all data
CREATE MATERIALIZED VIEW order_members_MV
AS SELECT * FROM order_members;

-- 6: check view_mv
SELECT * FROM order_members_mv;

-- 7: check view_mv with insert
INSERT INTO progress
VALUES ('56D78', '31-CC-13', '2022-10-10',  true, '2022-12-31');

SELECT * FROM order_members_mv;

-- 8: check view_mv with insert and refresh
REFRESH MATERIALIZED VIEW order_members_mv;
SELECT * FROM order_members_mv;
