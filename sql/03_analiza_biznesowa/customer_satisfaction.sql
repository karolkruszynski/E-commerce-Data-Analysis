-- | Customer Satisfaction |

-- Wpływ czasu dostawy na oceny klientów
WITH delays as
(SELECT
	order_id,
	CASE
		WHEN (order_estimated_delivery_date::date - order_delivered_customer_date::date) = 0 THEN 'On time'
		WHEN (order_estimated_delivery_date::date - order_delivered_customer_date::date) > 0 THEN 'Faster than expected'
		WHEN (order_estimated_delivery_date::date - order_delivered_customer_date::date) < 0 THEN 'Delayed'
		ELSE 'In delivery'
	END as delivery_status
FROM
	orders
)
SELECT
	d.delivery_status,
	ROUND(AVG(orv.review_score)::numeric,2) as avg_review_score,
	COUNT(orv.review_score) as count_of_reviews
FROM
	delays d
LEFT JOIN
	order_reviews orv ON d.order_id = orv.order_id
GROUP BY
	d.delivery_status
ORDER BY
	avg_review_score DESC;


-- Analiza recenzji według kategorii
SELECT
	cn.product_category_name_english,
	ROUND(AVG(orv.review_score)::numeric,2) as avg_review_score,
	COUNT(orv.review_score) as count_of_reviews
FROM
	order_reviews orv
INNER JOIN
	order_items oi ON orv.order_id = oi.order_id
INNER JOIN
	products p ON oi.product_id = p.product_id
LEFT JOIN
	category_name cn ON p.product_category_name = cn.product_category_name
GROUP BY
	cn.product_category_name_english
ORDER BY
	count_of_reviews DESC;
	

-- Czynniki wpływające na satysfakcję: czas dostawy w dniach, koszt wysyłki, cena produktu
(
	SELECT
		order_id,
		ROUND(AVG(order_estimated_delivery_date::date - order_delivered_customer_date::date)) as delay
	FROM
		orders
	GROUP BY
		order_id
)
SELECT
	CORR(dd.delay, orv.review_score) as corr_delay_review_score,
	CORR(oi.freight_value,orv.review_score) as corr_freight_review_score,
	CORR(oi.price,orv.review_score) as corr_price_review_score
FROM
	delivery_in_days dd
INNER JOIN
	order_items oi ON dd.order_id = oi.order_id
INNER JOIN
	order_reviews orv ON oi.order_id = orv.order_id
INNER JOIN
	products p ON oi.product_id = p.product_id





















	

