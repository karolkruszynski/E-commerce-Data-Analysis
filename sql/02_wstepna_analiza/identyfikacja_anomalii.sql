-- | IDENTYFIKACJA ANOMALII |
select * from orders;
select * from order_items; 	

-- ZAMÓWIENIA
SELECT
	o.order_id,
	oi.order_id,
	oi.order_item_id,
	o.order_delivered_customer_date,
	o.order_delivered_carrier_date
FROM
	orders o
INNER JOIN
	order_items oi ON o.order_id = oi.order_id
WHERE
	order_delivered_customer_date < order_delivered_carrier_date;
-- Problem polega na tym że data dostarczenia do klienta jest wcześneijsza niż data dostarczenia przez kuriera.

SELECT
	order_id
FROM
	order_items
WHERE
	price <= 0;

-- OPINIE
SELECT
	review_id,
	review_creation_date,
	review_answer_timestamp
FROM
	order_reviews
WHERE
	review_creation_date > review_answer_timestamp::date;




	