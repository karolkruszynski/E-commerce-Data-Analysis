-- | Sales Performance |

-- Trendy sprzedażowe miesięczne i kwartalne
WITH monthly_sales as
(
	SELECT
		ROUND(SUM(oi.price+oi.freight_value)::numeric,2) as sales,
		EXTRACT(MONTH FROM o.order_purchase_timestamp) as months
	FROM
		orders o
	INNER JOIN
		order_items oi ON o.order_id = oi.order_id
	GROUP BY 
		months
)
SELECT
	CASE
		WHEN months IN (1,2,3) THEN 'q1'
		WHEN months IN (4,5,6) THEN 'q2'
		WHEN months IN (7,8,9) THEN 'q3'
		ELSE 'q4'
	END as quarter,
	SUM(sales) as quarterly_sales
FROM
	monthly_sales
GROUP BY
	quarter
ORDER BY
	quarter;


-- Top produkty według sumy sprzedaży
SELECT
	oi.product_id,
	ROUND(SUM(oi.price + oi.freight_value)::numeric,2) as sales
FROM
	products p
INNER JOIN
	order_items oi ON p.product_id = oi.product_id
GROUP BY
	oi.product_id
ORDER BY
	sales DESC;


-- Top kategorie produktów według sumy sprzedaży
SELECT
	cn.product_category_name_english,
	ROUND(SUM(oi.price+oi.freight_value)::numeric,2) as sales
FROM
	order_items oi
INNER JOIN
	products p ON oi.product_id = p.product_id
LEFT JOIN
	category_name cn ON p.product_category_name = cn.product_category_name
GROUP BY
	cn.product_category_name_english
ORDER BY
	sales DESC;


-- Sezonowość sumy zamówień według miesięcy
SELECT
	ROUND(SUM(oi.price + oi.freight_value)) as sales,
	EXTRACT(MONTH FROM o.order_purchase_timestamp) as month
FROM
	orders o
INNER JOIN
	order_items oi ON o.order_id = oi.order_id
GROUP BY
	month
ORDER BY
	month;

-- Sezonowość sumy zamówień według dnia tygodnia
SELECT
	TO_CHAR(o.order_purchase_timestamp, 'day') as day_of_week,
	ROUND(SUM(oi.price + oi.freight_value)::numeric, 2) as sales
FROM
	orders o
INNER JOIN
	order_items oi ON o.order_id = oi.order_id
GROUP BY
	day_of_week
ORDER BY
	sales DESC;

-- Sezonowość sumy zamówień według godziny
SELECT
	ROUND(SUM(oi.price + oi.freight_value)) as sales,
	EXTRACT(HOUR FROM o.order_purchase_timestamp) as hour
FROM
	orders o
INNER JOIN
	order_items oi ON o.order_id = oi.order_id
GROUP BY
	hour
ORDER BY
	sales DESC;







































	

