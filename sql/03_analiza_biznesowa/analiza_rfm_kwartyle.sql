-- | ANALIZA BIZNESOWA | --
-- | Customer Analytics | --

-- |Segmentacja klientów - RFM Analysis|
WITH customers_orders AS
(
	SELECT
		c.customer_unique_id,
		MAX(o.order_purchase_timestamp) as last_order,
		COUNT(DISTINCT(o.order_id)) as frequency,
		SUM(oi.price+oi.freight_value) as monetary
	FROM
		customers c
	INNER JOIN
		orders o ON c.customer_id = o.customer_id
	INNER JOIN
		order_items oi ON o.order_id = oi.order_id
	GROUP BY
		c.customer_unique_id
),
rfm AS
(
	SELECT
		customer_unique_id,
		frequency,
		monetary,
		EXTRACT(DAY FROM ('2018-12-31 00:00:00' - last_order)) as recency
	FROM
		customers_orders
),
rfm_quartiles AS
(
	SELECT
		customer_unique_id,
		frequency,
		monetary,
		recency,

		NTILE(4) OVER (ORDER BY recency ASC) as recency_quartile,
		NTILE(4) OVER (ORDER BY frequency DESC) as frequency_quartile,
		NTILE(4) OVER (ORDER BY monetary DESC) as monetary_quartile
	FROM
		rfm
)
SELECT
	*
FROM
	rfm_quartiles
ORDER BY
	recency_quartile ASC,
	frequency_quartile ASC,
	monetary_quartile ASC;



















