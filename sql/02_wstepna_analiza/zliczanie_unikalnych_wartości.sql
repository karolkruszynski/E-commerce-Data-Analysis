-- WSTĘPNA ANALIZA

-- ZLICZENIE UNIKALNYCH ILOŚCI:
-- KLIENTÓW
SELECT
	COUNT(DISTINCT(customer_unique_id)) as unique_clients
FROM
	customers;

-- ZAMÓWIEŃ
SELECT
	COUNT(DISTINCT(order_id))
FROM
	orders;

-- SPRZEDAWCÓW
SELECT
	COUNT(DISTINCT(seller_id))
FROM
	sellers;