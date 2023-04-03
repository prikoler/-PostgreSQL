-- 1: create basic index
CREATE INDEX city_index
	ON company(company_city);
  
-- 2: create composite index
CREATE INDEX city_country_index
	ON company(company_city, country);

-- 3: create basic unique index
CREATE UNIQUE INDEX order_name_index
	ON orders(order_name);
  
-- 4: create composite index with desc sorting
CREATE INDEX order_cost_order_size
	ON orders(order_cost DESC, order_size DESC);
	
-- 5: create composite index with nulls first
CREATE INDEX date_plan_shipment_index
	ON progress(plan_date NULLS FIRST, shipment_date NULLS FIRST);
