DELIMITER //

CREATE PROCEDURE GetCustomerOrderSummary(
    IN customer_id_param INT,
    IN start_date_param DATE,
    OUT total_quantity_ordered INT,
    OUT total_revenue DECIMAL(10, 2)
)
BEGIN
    DECLARE total_quantity INT;
    DECLARE total_amount DECIMAL(10, 2);

    SELECT COALESCE(SUM(o.quantity), 0) AS total_quantity,
        COALESCE(SUM(o.quantity * p.price), 0) AS total_amount
    INTO total_quantity, total_amount
    FROM orders o
    JOIN coffee_products p 
    ON o.product_id = p.product_id
    WHERE o.customer_id = customer_id_param
        AND o.order_date >= start_date_param;

    SET total_quantity_ordered = total_quantity;
    SET total_revenue = total_amount;
END //

DELIMITER ;

CALL GetCustomerOrderSummary(5, '2023-01-01', @total_quantity, @total_revenue);

SELECT @total_quantity AS total_quantity_ordered, @total_revenue AS total_revenue;
