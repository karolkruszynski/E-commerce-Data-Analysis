-- | Operational Efficiency |

-- Średni czas dostawy według regionów
SELECT
	c.customer_state,
	ROUND(AVG(o.order_delivered_customer_date::date - o.order_delivered_carrier_date::date)) as shipping_days
FROM
	orders o
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_state
ORDER BY
	shipping_days

-- Analiza opóźnienia dostaw (generalna)
WITH delays as
(SELECT
	order_id,
	CASE
		WHEN (order_estimated_delivery_date::date - order_delivered_customer_date::date) = 0 THEN 'On time'
		WHEN (order_estimated_delivery_date::date - order_delivered_customer_date::date) > 0 THEN 'Faster then expected'
		WHEN (order_estimated_delivery_date::date - order_delivered_customer_date::date) < 0 THEN 'Delayed'
		ELSE 'In delivery'
	END as delay
FROM
	orders
)
SELECT
	delay,
	COUNT(order_id) as order_count,
	ROUND((COUNT(order_id)::numeric / SUM(COUNT(order_id)) OVER ()) * 100, 2) as percent
FROM
	delays
GROUP BY
	delay
ORDER BY
	percent DESC;


-- Korelacja kosztu wysyłki vs wartość zamówienia
SELECT
	CORR(price, freight_value) as correlation
FROM
	order_items;
-- Add. Korelacja jest pozytywna lecz nie jest mocna wynosi: ~0.41 (skala -1 do 1)

-- Korelacja wartość zamówienia vs kosztu wysyłki według regionu klienta
SELECT
	c.customer_state,
	CORR(oi.price, oi.freight_value) as correlation
FROM
	order_items oi
INNER JOIN
	orders o ON oi.order_id = o.order_id
INNER JOIN
	customers c ON o.customer_id = c.customer_id
GROUP BY
	c.customer_state
ORDER BY
	correlation DESC;


-- Korelacja wartość zamówienia vs kosztu wysyłki według sprzedawcy
SELECT
	seller_id,
	CASE
		WHEN CORR(price, freight_value) IS NULL THEN 0
		ELSE CORR(price, freight_value)
	END as correlation
FROM
	order_items
GROUP BY
	seller_id
ORDER BY
	correlation DESC;






























	

