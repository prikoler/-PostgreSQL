-- 1.1: where
SELECT c.company_name, c. company_city, o.order_name
FROM company AS c, orders AS o, progress AS p
  WHERE c.code = p.company_code
	AND o.code = p.company_order
  ORDER BY c. company_city;
  
  
-- 1.1: join
SELECT c.company_name, c.company_city, o.order_name
FROM progress AS p
JOIN orders AS o
	ON o.code = p.company_order
JOIN company AS c
	ON c.code = p.company_code
ORDER BY c.company_city;


-- 2: count orders by status
SELECT s.status_name, COUNT(o.status)
	FROM orders AS o
	RIGHT JOIN status AS s ON o.status = s.status_code 
		GROUP BY s.status_name;
    

-- 3: count order in every city
SELECT cc.company_city, COUNT(*)
	FROM (
		SELECT p.done, c. company_city
		FROM progress AS p
		JOIN company AS c
		ON c.code = p.company_code
		WHERE p.done = true 
	) AS cc
		GROUP BY cc.company_city;
    

-- 4: not planned company_names
SELECT c.company_name
    FROM company AS c
      WHERE c.code NOT IN
        (SELECT p.company_code
         FROM progress AS p);
         
         
-- 5: cities contains >1 company
INSERT INTO progress
VALUES ('12A34', '22-BB-22','10.10.2022', true, '12.31.2022');

SELECT DISTINCT c. company_city
    FROM ( SELECT company_city, COUNT(*)
	FROM company
	GROUP BY company_city
	HAVING COUNT(*) >1) AS cc
	JOIN company AS c ON c. company_city = cc.company_city;
  

-- 6: company statistics: done or not_done
SELECT c.company_name AS "Предприятия",
   (SELECT COUNT(*) FROM progress AS p1
        WHERE c.code = p1.company_code AND p1.done = true
   ) AS "Выполненные заказы",
   (SELECT COUNT(*) FROM progress AS p2
         WHERE c.code = p2.company_code AND p2.done = false
   ) AS "Невыполненные заказы"
     FROM company AS c;
