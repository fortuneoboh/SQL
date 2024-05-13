CREATE VIEW product_summary_view AS
SELECT p.product_id, p.product_name,
    SUM(o.quantity) AS total_quantity_ordered,
    SUM(o.quantity * p.price) AS total_revenue
FROM coffee_products p
JOIN orders o 
ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;