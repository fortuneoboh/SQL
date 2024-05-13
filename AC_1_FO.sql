CREATE VIEW customer_spending_view AS
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COALESCE(SUM(o.quantity * p.price), 0) AS total_spending,
    IF(COALESCE(SUM(o.quantity * p.price), 0) > 10, 'High Spender', 'Regular Spender') AS spending_category
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
LEFT JOIN coffee_products p 
ON o.product_id = p.product_id
WHERE o.order_date >= '2023-02-01' 
    AND p.price > 2.00 
GROUP BY c.customer_id, full_name;