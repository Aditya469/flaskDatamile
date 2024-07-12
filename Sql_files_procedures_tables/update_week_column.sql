DELIMITER //

DROP PROCEDURE IF EXISTS update_week_column//

CREATE PROCEDURE update_week_column()
BEGIN
    DECLARE current_week_monday DATE;
    DECLARE next_week_monday DATE;
    
    SET current_week_monday = DATE(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY));
    SET next_week_monday = DATE_ADD(current_week_monday, INTERVAL 7 DAY);
    
    UPDATE sales_order
    SET week = CASE
        WHEN required_date < current_week_monday THEN 'Arrears'
        WHEN required_date >= current_week_monday AND required_date < next_week_monday THEN 'Week - 1'
        ELSE CONCAT('Week - ', FLOOR((DATEDIFF(required_date, next_week_monday) / 7) + 2))
    END;
END //

DELIMITER ;