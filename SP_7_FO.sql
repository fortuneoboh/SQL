DELIMITER //

CREATE PROCEDURE CalculateCustomerSpending(
    IN customer_id_param INT,
    OUT total_spending DECIMAL(10, 2),
    OUT customer_category VARCHAR(20)
)
BEGIN
    DECLARE total_amount DECIMAL(10, 2);

    SELECT COALESCE(SUM(o.quantity * p.price), 0)
    INTO total_amount
    FROM orders o
    JOIN coffee_products p ON o.product_id = p.product_id
    WHERE o.customer_id = customer_id_param;

    SET total_spending = total_amount;

    IF total_spending > 50.00 THEN
        SET customer_category = 'High Spender';
    ELSE
        SET customer_category = 'Regular Spender';
    END IF;
END //

DELIMITER ;

CALL CalculateCustomerSpending(1, @total_spending, @customer_category);

SELECT @total_spending AS total_spending, @customer_category AS customer_category;