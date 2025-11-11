-- | ANALIZA BIZNESOWA | --
-- | Customer Analytics | --

-- |CLV - Customer Lifetime Value|

-- Klienci którzy generują największą wartość sprzedaży
SELECT
	c.customer_unique_id,
	ROUND(SUM(oi.price+oi.freight_value)) as clv_value,
	COUNT(DISTINCT(o.order_id)) as orders_count,
	CASE
		WHEN c.customer_state IN ('RJ','SP','MG') THEN 1
		ELSE 0
	END as is_client_from_top3_state
FROM
	order_items oi
INNER JOIN
	orders o ON oi.order_id = o.order_id
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_unique_id,is_client_from_top3_state
ORDER BY
	clv_value DESC



-- Klienci którzy generują największą wartość sprzedaży według top3 regionów 
WITH top3_state as
(
SELECT
	c.customer_unique_id,
	ROUND(SUM(oi.price+oi.freight_value)) as clv_value,
	COUNT(DISTINCT(o.order_id)) as orders_count,
	CASE
		WHEN c.customer_state IN ('RJ','SP','MG') THEN 1
		ELSE 0
	END as is_client_from_top3_state
FROM
	order_items oi
INNER JOIN
	orders o ON oi.order_id = o.order_id
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_unique_id,is_client_from_top3_state
ORDER BY
	clv_value DESC
LIMIT 100
)
SELECT
	t3s.is_client_from_top3_state,
	SUM(clv_value) as clv_sum_value
FROM
	top3_state t3s
GROUP BY
	t3s.is_client_from_top3_state



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
	CASE
		WHEN c.customer_state IN ('RJ','SP','MG') THEN 1
		ELSE 0
	END as is_client_from_top3_state,
	EXTRACT(DAY FROM MAX(o.order_purchase_timestamp) - MIN(o.order_purchase_timestamp)) as client_lifetime_days,
	COUNT(*) as orders_count
FROM
	orders o
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_unique_id, c.customer_state
ORDER BY
	client_lifetime_days DESC, 
	orders_count;


-- Czas życia klienta mierzony od pierwszego do ostatniego zakupu według stanów
WITH top3_state as 
(
SELECT
	c.customer_unique_id,
	CASE
		WHEN c.customer_state IN ('RJ','SP','MG') THEN 1
		ELSE 0
	END as is_client_from_top3_state,
	EXTRACT(DAY FROM MAX(o.order_purchase_timestamp) - MIN(o.order_purchase_timestamp)) as client_lifetime_days,
	COUNT(*) as orders_count
FROM
	orders o
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_unique_id, c.customer_state
ORDER BY
	client_lifetime_days DESC, 
	orders_count
LIMIT 100
)
SELECT
	t3s.is_client_from_top3_state,
	COUNT(t3s.is_client_from_top3_state)
FROM
	top3_state t3s
GROUP BY
	t3s.is_client_from_top3_state















