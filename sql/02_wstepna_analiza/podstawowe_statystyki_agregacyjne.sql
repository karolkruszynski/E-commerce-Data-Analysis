-- | WSTĘPNA ANALIZA |

-- | PODSTAWOWE ROZKŁADY DANYCH |

-- ROZKŁAD WARTOŚCI ZAMÓWIEŃ
SELECT
	MIN(price),
	MAX(price),
	ROUND(AVG(price))
FROM
	order_items;

-- ROZKŁAD WARTOŚCI FRACHTU
SELECT
	MIN(freight_value),
	MAX(freight_value),
	ROUND(AVG(freight_value))
FROM
	order_items;

-- ILOŚĆ ZAMÓWIONYCH PRODUKTÓW
SELECT
	product_id,
	COUNT(*) as qty_of_sold_products
FROM
	order_items 
GROUP BY
	product_id
ORDER BY
	2 DESC;

-- ROZKŁAD CECH PRODUKTÓW
SELECT
	MIN(product_weight_g) as min_weight,
	MAX(product_weight_g) as max_weight,
	ROUND(AVG(product_weight_g)) as avg_weight,
	MIN(product_length_cm) as min_len,
	MAX(product_length_cm) as max_len,
	ROUND(AVG(product_length_cm)) as avg_len,
	MIN(product_height_cm) as min_height,
	MAX(product_height_cm) as max_height,
	ROUND(AVG(product_height_cm)) as avg_height,
	MIN(product_width_cm) as min_width,
	MAX(product_width_cm) as max_width,
	ROUND(AVG(product_width_cm)) as avg_width
FROM
	products;

-- ILOŚĆ PRODUKTÓW PER KATEGORIA
SELECT
	product_category_name,
	COUNT(*)
FROM
	products
GROUP BY
	product_category_name
ORDER BY
	2 DESC;

-- LOKACJA SPRZEDAWCÓW
SELECT
	seller_city,
	COUNT(*)
FROM
	sellers
GROUP BY
	seller_city
ORDER BY
	2 DESC;

-- LOKACJA KLIENTÓW
SELECT
	customer_city,
	COUNT(*)
FROM
	customers
GROUP BY
	customer_city
ORDER BY
	2 DESC;

-- STATUSY ZAMÓWIEŃ
SELECT
	order_status,
	COUNT(*)
FROM
	orders
GROUP BY
	order_status
ORDER BY
	2 DESC;

-- ROZKŁAD OCEN
SELECT
	review_score,
	COUNT(*)
FROM
	order_reviews
GROUP BY
	review_score
ORDER BY
	2 DESC;

-- ROZKŁAD SPOSOBÓ PŁATNOŚCI
SELECT
	payment_type,
	COUNT(*)
FROM
	order_payments
GROUP BY
	payment_type
ORDER BY
	2 DESC;
























	