# Opis tabel i kolumn

## category_name
- **product_category_name**: text
- **product_category_name_english**: text

## customers
- **customer_id**: text
- **customer_unique_id**: text
- **customer_zip_code_prefix**: text
- **customer_city**: text
- **customer_state**: text

## geolocation
- **geolocation_zip_code_prefix**: text
- **geolocation_lat**: text
- **geolocation_lng**: text
- **geolocation_city**: text
- **geolocation_state**: text

## order_items
- **order_id**: text
- **order_item_id**: bigint
- **product_id**: text
- **seller_id**: text
- **shipping_limit_date**: date
- **price**: double precision
- **freight_value**: double precision

## order_payments
- **order_id**: text
- **payment_sequential**: bigint
- **payment_type**: text
- **payment_installments**: bigint
- **payment_value**: double precision

## order_reviews
- **review_id**: text
- **order_id**: text
- **review_score**: bigint
- **review_comment_title**: text
- **review_comment_message**: text
- **review_creation_date**: date
- **review_answer_timestamp**: timestamp with time zone

## orders
- **order_id**: text
- **customer_id**: text
- **order_status**: text
- **order_purchase_timestamp**: timestamp without time zone
- **order_approved_at**: timestamp without time zone
- **order_delivered_carrier_date**: timestamp without time zone
- **order_delivered_customer_date**: timestamp without time zone
- **order_estimated_delivery_date**: timestamp without time zone

## products
- **product_id**: text
- **product_category_name**: text
- **product_name_lenght**: bigint
- **product_description_lenght**: bigint
- **product_photos_qty**: bigint
- **product_weight_g**: double precision
- **product_length_cm**: double precision
- **product_height_cm**: double precision
- **product_width_cm**: double precision

## sellers
- **seller_id**: text
- **seller_zip_code_prefix**: bigint
- **seller_city**: text
- **seller_state**: text


# Znalezione problemy

## ZAMÓWIENIA
- **Problem**: Data dostarczenia do klienta jest wcześneijsza niż data dostarczenia przez kuriera.
- **Potencjalne źródło problemu**: Źle skonfigurowany system powiadomień od firmy kurierskiej.
- **Potencjalne konsekwencje**: Złe dane wpływają na KPI i ocenę czasu dostawy do klienta (wydłużają ją sztucznie lub przyśpieszają)

