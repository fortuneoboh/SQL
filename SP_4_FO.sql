CREATE VIEW order_details_view AS
SELECT o.order_id, o.customer_id, o.product_id,
    o.quantity, p.product_name, p.price,
    o.quantity * p.price AS total_price
FROM orders o
JOIN coffee_products p 
ON o.product_id = p.product_id
WHERE o.quantity > 2 
    AND p.price > 3.00;


