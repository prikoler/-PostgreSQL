CREATE TABLE Company
(
code varchar(5) PRIMARY KEY CHECK (code SIMILAR TO '[0-9]{2}[A-Z][0-9]{2}'),
 	company_name text NOT NULL UNIQUE,
 	company_city text NOT NULL DEFAULT 'Moskow',
   	company_address text,
phone varchar(16) CHECK (phone SIMILAR TO '\+7\-[0-9]{3}\-[0-9]{3}\-[0-9]{2}\-[0-9]{2}')
);

CREATE TABLE Orders
(
code varchar(8) PRIMARY KEY CHECK(code SIMILAR TO '[0-9]{2}\-[A-Z]{2}\-[0-9]{2}'),
order_name text NOT NULL,
order_cost numeric NOT NULL CHECK(order_cost > 0),
order_size integer NOT NULL CHECK(order_size < 500)
);

CREATE TABLE Progress
(
company_code varchar(5),
 	company_order varchar(8),
 
 	plan_date date NOT NULL DEFAULT NOW(),
done bool DEFAULT false,
shipment_date date,

CONSTRAINT valid_data CHECK (plan_date < shipment_date),
	 
 	PRIMARY KEY (company_order, company_code),
 
 FOREIGN KEY (company_code) REFERENCES company (code)
  ON UPDATE CASCADE
 	  ON DELETE RESTRICT,
 FOREIGN KEY (company_order) REFERENCES orders (code)
  ON UPDATE CASCADE
 	  ON DELETE RESTRICT
);
