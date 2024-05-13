DELIMITER //

CREATE TRIGGER before_update_orders
	BEFORE UPDATE ON orders
	FOR EACH ROW
BEGIN
		SET NEW.product_name = UPPER(NEW.product_name);
END //

DELIMITER ;

