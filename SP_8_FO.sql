DELIMITER //

CREATE FUNCTION CalculateDiscount(
    total_spending DECIMAL(10, 2)
)
RETURNS DECIMAL(5, 2)
BEGIN
    DECLARE discount DECIMAL(5, 2);

    IF total_spending > 100.00 THEN
        SET discount = 10.00; 
    ELSE
        SET discount = 5.00; 
    END IF;

    RETURN discount;
END //

DELIMITER ;

SET @input_total_spending = 120.00;  

SET @discount_percentage = CalculateDiscount(@input_total_spending);

SELECT @input_total_spending AS total_spending,
    @discount_percentage AS discount_percentage;