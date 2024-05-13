CREATE VIEW customer_avg_order_view AS
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    o.order_id, o.order_date, p.product_name,
    o.quantity, p.price,
    o.quantity * p.price AS total_price,
    ROUND(
        (SELECT AVG(price)
        FROM coffee_products sub_p
        WHERE sub_p.product_id = o.product_id), 2
    ) AS average_product_price
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN coffee_products p 
ON o.product_id = p.product_id;