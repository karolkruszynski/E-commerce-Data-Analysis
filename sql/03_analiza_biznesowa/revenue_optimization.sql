-- | Revenue Optimization |


-- Analiza metod płatności i sumy wartości zamówień
SELECT
	payment_type,
	COUNT(*) as number_of_payments,
	ROUND(SUM(payment_value)::numeric,2) as sales_value
FROM
	order_payments
GROUP BY
	payment_type
ORDER BY
	sales_value DESC
LIMIT 4;


-- Analiza metod płatności i średniej wartości zamówień
WITH sum_of_sales_per_payment_type as
(
SELECT
	payment_type,
	COUNT(*) as number_of_payments,
	ROUND(SUM(payment_value)::numeric,2) as sales_value
FROM
	order_payments
GROUP BY
	payment_type
)
SELECT
	s.payment_type,
	ROUND(AVG(s.sales_value),2) as avg_sales_value
FROM
	sum_of_sales_per_payment_type s
GROUP BY
	s.payment_type
ORDER BY
	avg_sales_value DESC
LIMIT 4;


-- Analiza rozkładu ratalnego według sumy wartości sprzedaży 
SELECT
	payment_installments,
	COUNT(*) as number_of_payments,
	ROUND(SUM(payment_value)::numeric,2) as sales_value
FROM
	order_payments
GROUP BY
	payment_installments
ORDER BY
	sales_value DESC;


-- Analiza rozkładu ratalnego według średniej wartości sprzedaży
WITH sum_per_instal as 
(
SELECT
	payment_installments,
	COUNT(*) as number_of_payments,
	ROUND(SUM(payment_value)::numeric,2) as sales_value
FROM
	order_payments
GROUP BY
	payment_installments
)
SELECT
	spi.payment_installments,
	ROUND(AVG(spi.sales_value),2) as avg_sales_value
FROM
	sum_per_instal spi
GROUP BY
	spi.payment_installments
ORDER BY
	avg_sales_value DESC;


-- Identyfikacja najdroższych produktów
SELECT
	DISTINCT(oi.product_id),
	oi.price,
	cn.product_category_name_english
FROM
	order_items oi
LEFT JOIN
	products p ON oi.product_id = p.product_id
LEFT JOIN
	category_name cn ON p.product_category_name = cn.product_category_name
ORDER BY
	price DESC
LIMIT 10;















	

