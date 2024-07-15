-- create cancelled_lists from the sales_orders table.
DELIMITER //

DROP PROCEDURE IF EXISTS create_cancelled_list//

CREATE PROCEDURE create_cancelled_list()
BEGIN
    DELETE FROM cancelled_list;
    
    INSERT INTO cancelled_list (
        account_id, stock_code, issue, required_date, required_day,
        required_quantity, order_reference, location, message, week
    )
    SELECT
        account_id, stock_code, issue, required_date, 
        DAYNAME(required_date) AS required_day,
        required_quantity, order_reference, location, message, week
    FROM sales_order
    WHERE week IN ('Arrears', 'Week - 1', 'Week - 2', 'Week - 3', 'Week - 4')
    AND required_quantity = 0;
END //

DELIMITER ;