-- | IDENTYFIKACJA ANOMALII |
select * from orders;
select * from order_items; 	

-- ZAMÓWIENIA
SELECT
	o.order_id,
	oi.order_id,
	oi.order_item_id,
	oi.price,
	oi.freight_value
FROM
	orders o
INNER JOIN
	order_items oi ON o.order_id = oi.order_id
WHERE
	order_delivered_customer_date < order_delivered_carrier_date;



	