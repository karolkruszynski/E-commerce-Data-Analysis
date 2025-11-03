-- | ANALIZA BIZNESOWA | --
-- | Customer Analytics | --

-- |CLV - Customer Lifetime Value|

-- Klienci którzy generują największą wartość sprzedaży
SELECT
	c.customer_unique_id,
	ROUND(SUM(oi.price+oi.freight_value)) as clv_value,
	COUNT(DISTINCT(o.order_id)) as orders_count
FROM
	order_items oi
INNER JOIN
	orders o ON oi.order_id = o.order_id
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_unique_id
ORDER BY
	clv_value DESC
LIMIT 10;

-- Średnia wartość zamówienia dla klienta
SELECT
	c.customer_unique_id,
	SUM(oi.price+oi.freight_value) / COUNT(DISTINCT(o.order_id)) as avg_clv_value
FROM
	order_items oi
INNER JOIN
	orders o ON oi.order_id = o.order_id
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_unique_id
ORDER BY
	avg_clv_value DESC;

-- Czas życia klienta mierzony od pierwszego do ostatniego zakupu.
SELECT
	c.customer_unique_id,
	EXTRACT(DAY FROM MAX(o.order_purchase_timestamp) - MIN(o.order_purchase_timestamp)) as client_lifetime_days,
	COUNT(*) as orders_count
FROM
	orders o
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_unique_id
ORDER BY
	client_lifetime_days DESC, 
	orders_count;




















