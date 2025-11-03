-- | ANALIZA BIZNESOWA | --
-- | Customer Analytics | --

-- | Charakterystyka demograficzna klientów |

-- [Liczba klientów według stanu]
SELECT
	customer_state,
	COUNT(DISTINCT(customer_unique_id)) as customer_count
FROM
	customers
GROUP BY
	customer_state
ORDER BY
	customer_count DESC;

-- [Liczba klientów w TOP10 miastach]
SELECT
	customer_city,
	COUNT(DISTINCT(customer_unique_id)) as customer_count
FROM
	customers
GROUP BY
	customer_city
ORDER BY
	customer_count DESC
LIMIT 10;



















