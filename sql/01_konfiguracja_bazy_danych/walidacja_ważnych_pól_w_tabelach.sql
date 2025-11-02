SELECT COUNT(*) FROM orders WHERE customer_id IS NULL;
SELECT COUNT(*) FROM order_items WHERE price < 0;
SELECT COUNT(*) FROM geolocation WHERE geolocation_city IS NULL;
SELECT COUNT(*) FROM customers WHERE customer_city IS NULL;
SELECT COUNT(*) FROM products WHERE product_id IS NULL;
SELECT COUNT(*) FROM sellers WHERE seller_id IS NULL;
SELECT COUNT(*) FROM order_payments WHERE order_id IS NULL;
