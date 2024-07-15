-- Create Picklist from the sales_order table
DELIMITER //

DROP PROCEDURE IF EXISTS create_picklist//

CREATE PROCEDURE create_picklist()
BEGIN
    DELETE FROM picklist;
    
    INSERT INTO picklist (
        account_id, stock_code, issue, required_date, required_day,
        required_quantity, order_reference, location, message, week
    )
    SELECT
        account_id, stock_code, issue, required_date, 
        DAYNAME(required_date) AS required_day,
        required_quantity, order_reference, location, message, week
    FROM sales_order
    WHERE week IN ('Arrears', 'Week - 1', 'Week - 2', 'Week - 3', 'Week - 4')
    AND required_quantity > 0;
END //

DELIMITER ;