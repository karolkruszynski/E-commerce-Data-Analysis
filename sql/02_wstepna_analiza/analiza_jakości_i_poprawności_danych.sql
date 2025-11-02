-- | IDENTYFIKACJA BRAKUJĄĆYCH DANYCH, BŁĘDÓW, DUPLIKATÓW |

-- | UDZIAŁ PROCENTÓWY WARTOŚCI NULL W TABELACH |

-- KLIENCI
SELECT
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_count,
  COUNT(*) AS total_count,
  100.0 * SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS null_percentage
FROM customers;

-- SPRZEDAWCY
SELECT
  SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS null_count,
  COUNT(*) AS total_count,
  100.0 * SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS null_percentage
FROM sellers;
 	
-- PRODUKTY
SELECT
  SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_count,
  COUNT(*) AS total_count,
  100.0 * SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS null_percentage
FROM products;

SELECT
  SUM(CASE WHEN product_weight_g IS NULL THEN 1 ELSE 0 END) AS null_count,
  COUNT(*) AS total_count,
  100.0 * SUM(CASE WHEN product_weight_g IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS null_percentage
FROM products; -- 2 nulls

SELECT
  SUM(CASE WHEN product_height_cm IS NULL THEN 1 ELSE 0 END) AS null_count,
  COUNT(*) AS total_count,
  100.0 * SUM(CASE WHEN product_height_cm  IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS null_percentage
FROM products; -- 2 nulls

SELECT
  SUM(CASE WHEN product_width_cm IS NULL THEN 1 ELSE 0 END) AS null_count,
  COUNT(*) AS total_count,
  100.0 * SUM(CASE WHEN product_width_cm  IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS null_percentage
FROM products; -- 2 nulls

SELECT
  SUM(CASE WHEN product_length_cm IS NULL THEN 1 ELSE 0 END) AS null_count,
  COUNT(*) AS total_count,
  100.0 * SUM(CASE WHEN product_length_cm  IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS null_percentage
FROM products; -- 2 nulls


-- ZAMÓWIENIA / WALIDACJA NIE POPRAWNYCH ZAMÓWIEŃ 
SELECT
	order_id,
	customer_id,
	order_status
FROM
	orders
WHERE
	order_id IS NULL
OR
	customer_id IS NULL
OR
	order_status IS NULL
OR
	order_purchase_timestamp IS NULL;

-- WALIDACJA PORPAWNOŚCI RECENZJI
SELECT
	review_id
FROM
	order_reviews
WHERE
	order_id IS NULL;


-- WALIDACJA POPRAWNOŚCI PŁATNOŚCI
SELECT
	order_id,
	payment_value
FROM
	order_payments
WHERE
	payment_value IS NULL
OR
	payment_value <= 0;
-- jest 9 zamówień których wartość płatności wynosiła 0, potrzeba sprawdzić w dziale księgowości czy jest to poprawne


-- ZAMÓWIENIA I PRODUKTY
SELECT
	order_id,
	order_item_id,
	price,
	freight_value
FROM
	order_items
WHERE
	order_item_id IS NULL
OR
	price IS NULL
OR
	price <= 0 
OR
	freight_value IS NULL
OR
	freight_value < 0;
	










	