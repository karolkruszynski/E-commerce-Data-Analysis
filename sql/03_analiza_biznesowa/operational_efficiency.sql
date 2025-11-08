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





































	

