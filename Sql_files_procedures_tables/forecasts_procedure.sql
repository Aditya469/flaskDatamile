DELIMITER //

DROP PROCEDURE IF EXISTS generate_forecasts//

CREATE PROCEDURE generate_forecasts()
BEGIN
    DECLARE current_week_monday DATE;
    DECLARE current_month DATE;
    DECLARE i INT DEFAULT 0;

    -- Set the date of the current week's Monday
    SET current_week_monday = DATE(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY));
    
    -- Set the first day of the current month
    SET current_month = DATE_SUB(CURDATE(), INTERVAL DAYOFMONTH(CURDATE()) - 1 DAY);

    -- Create or replace weekly_forecasts table
    DROP TABLE IF EXISTS weekly_forecasts;
    CREATE TABLE weekly_forecasts (
        `account_id` VARCHAR(10),
        `Arrears` DECIMAL(10, 2),
        `Week - 1` DECIMAL(10, 2),
        `Week - 2` DECIMAL(10, 2),
        `Week - 3` DECIMAL(10, 2),
        `Week - 4` DECIMAL(10, 2),
        `Week - 5` DECIMAL(10, 2),
        `Week - 6` DECIMAL(10, 2),
        `Week - 7` DECIMAL(10, 2),
        `Week - 8` DECIMAL(10, 2),
        `Week - 9` DECIMAL(10, 2),
        `Week - 10` DECIMAL(10, 2),
        `Week - 11` DECIMAL(10, 2),
        `Week - 12` DECIMAL(10, 2),
        `Week - 13` DECIMAL(10, 2),
        `Week - 14` DECIMAL(10, 2),
        `Week - 15` DECIMAL(10, 2),
        `Week - 16` DECIMAL(10, 2),
        `Week - 17` DECIMAL(10, 2),
        `Week - 18` DECIMAL(10, 2),
        `Week - 19` DECIMAL(10, 2),
        `Week - 20` DECIMAL(10, 2),
        `Week - 21` DECIMAL(10, 2),
        `Week - 22` DECIMAL(10, 2),
        `Week - 23` DECIMAL(10, 2),
        `Week - 24` DECIMAL(10, 2),
        `Week - 25` DECIMAL(10, 2),
        `Week - 26` DECIMAL(10, 2),
        `Week - 27` DECIMAL(10, 2),
        `Week - 28` DECIMAL(10, 2),
        `Week - 29` DECIMAL(10, 2),
        `Week - 30` DECIMAL(10, 2),
        `Week - 31` DECIMAL(10, 2),
        `Week - 32` DECIMAL(10, 2),
        `Week - 33` DECIMAL(10, 2),
        `Week - 34` DECIMAL(10, 2),
        `Week - 35` DECIMAL(10, 2),
        `Week - 36` DECIMAL(10, 2),
        `Week - 37` DECIMAL(10, 2),
        `Week - 38` DECIMAL(10, 2),
        `Week - 39` DECIMAL(10, 2),
        `Week - 40` DECIMAL(10, 2),
        `Week - 41` DECIMAL(10, 2),
        `Week - 42` DECIMAL(10, 2),
        `Week - 43` DECIMAL(10, 2),
        `Week - 44` DECIMAL(10, 2),
        `Week - 45` DECIMAL(10, 2),
        `Week - 46` DECIMAL(10, 2),
        `Week - 47` DECIMAL(10, 2),
        `Week - 48` DECIMAL(10, 2),
        `Week - 49` DECIMAL(10, 2),
        `Week - 50` DECIMAL(10, 2),
        `Week - 51` DECIMAL(10, 2),
        `Week - 52` DECIMAL(10, 2)
    );

    -- Populate weekly_forecasts table
    INSERT INTO weekly_forecasts
    SELECT 
        account_id,
        SUM(CASE WHEN week = 'Arrears' THEN sale_price ELSE 0 END) AS Arrears,
        SUM(CASE WHEN week = 'Week - 1' THEN sale_price ELSE 0 END) AS `Week - 1`,
        SUM(CASE WHEN week = 'Week - 2' THEN sale_price ELSE 0 END) AS `Week - 2`,
        SUM(CASE WHEN week = 'Week - 3' THEN sale_price ELSE 0 END) AS `Week - 3`,
        SUM(CASE WHEN week = 'Week - 4' THEN sale_price ELSE 0 END) AS `Week - 4`,
        SUM(CASE WHEN week = 'Week - 5' THEN sale_price ELSE 0 END) AS `Week - 5`,
        SUM(CASE WHEN week = 'Week - 6' THEN sale_price ELSE 0 END) AS `Week - 6`,
        SUM(CASE WHEN week = 'Week - 7' THEN sale_price ELSE 0 END) AS `Week - 7`,
        SUM(CASE WHEN week = 'Week - 8' THEN sale_price ELSE 0 END) AS `Week - 8`,
        SUM(CASE WHEN week = 'Week - 9' THEN sale_price ELSE 0 END) AS `Week - 9`,
        SUM(CASE WHEN week = 'Week - 10' THEN sale_price ELSE 0 END) AS `Week - 10`,
        SUM(CASE WHEN week = 'Week - 11' THEN sale_price ELSE 0 END) AS `Week - 11`,
        SUM(CASE WHEN week = 'Week - 12' THEN sale_price ELSE 0 END) AS `Week - 12`,
        SUM(CASE WHEN week = 'Week - 13' THEN sale_price ELSE 0 END) AS `Week - 13`,
        SUM(CASE WHEN week = 'Week - 14' THEN sale_price ELSE 0 END) AS `Week - 14`,
        SUM(CASE WHEN week = 'Week - 15' THEN sale_price ELSE 0 END) AS `Week - 15`,
        SUM(CASE WHEN week = 'Week - 16' THEN sale_price ELSE 0 END) AS `Week - 16`,
        SUM(CASE WHEN week = 'Week - 17' THEN sale_price ELSE 0 END) AS `Week - 17`,
        SUM(CASE WHEN week = 'Week - 18' THEN sale_price ELSE 0 END) AS `Week - 18`,
        SUM(CASE WHEN week = 'Week - 19' THEN sale_price ELSE 0 END) AS `Week - 19`,
        SUM(CASE WHEN week = 'Week - 20' THEN sale_price ELSE 0 END) AS `Week - 20`,
        SUM(CASE WHEN week = 'Week - 21' THEN sale_price ELSE 0 END) AS `Week - 21`,
        SUM(CASE WHEN week = 'Week - 22' THEN sale_price ELSE 0 END) AS `Week - 22`,
        SUM(CASE WHEN week = 'Week - 23' THEN sale_price ELSE 0 END) AS `Week - 23`,
        SUM(CASE WHEN week = 'Week - 24' THEN sale_price ELSE 0 END) AS `Week - 24`,
        SUM(CASE WHEN week = 'Week - 25' THEN sale_price ELSE 0 END) AS `Week - 25`,
        SUM(CASE WHEN week = 'Week - 26' THEN sale_price ELSE 0 END) AS `Week - 26`,
        SUM(CASE WHEN week = 'Week - 27' THEN sale_price ELSE 0 END) AS `Week - 27`,
        SUM(CASE WHEN week = 'Week - 28' THEN sale_price ELSE 0 END) AS `Week - 28`,
        SUM(CASE WHEN week = 'Week - 29' THEN sale_price ELSE 0 END) AS `Week - 29`,
        SUM(CASE WHEN week = 'Week - 30' THEN sale_price ELSE 0 END) AS `Week - 30`,
        SUM(CASE WHEN week = 'Week - 31' THEN sale_price ELSE 0 END) AS `Week - 31`,
        SUM(CASE WHEN week = 'Week - 32' THEN sale_price ELSE 0 END) AS `Week - 32`,
        SUM(CASE WHEN week = 'Week - 33' THEN sale_price ELSE 0 END) AS `Week - 33`,
        SUM(CASE WHEN week = 'Week - 34' THEN sale_price ELSE 0 END) AS `Week - 34`,
        SUM(CASE WHEN week = 'Week - 35' THEN sale_price ELSE 0 END) AS `Week - 35`,
        SUM(CASE WHEN week = 'Week - 36' THEN sale_price ELSE 0 END) AS `Week - 36`,
        SUM(CASE WHEN week = 'Week - 37' THEN sale_price ELSE 0 END) AS `Week - 37`,
        SUM(CASE WHEN week = 'Week - 38' THEN sale_price ELSE 0 END) AS `Week - 38`,
        SUM(CASE WHEN week = 'Week - 39' THEN sale_price ELSE 0 END) AS `Week - 39`,
        SUM(CASE WHEN week = 'Week - 40' THEN sale_price ELSE 0 END) AS `Week - 40`,
        SUM(CASE WHEN week = 'Week - 41' THEN sale_price ELSE 0 END) AS `Week - 41`,
        SUM(CASE WHEN week = 'Week - 42' THEN sale_price ELSE 0 END) AS `Week - 42`,
        SUM(CASE WHEN week = 'Week - 43' THEN sale_price ELSE 0 END) AS `Week - 43`,
        SUM(CASE WHEN week = 'Week - 44' THEN sale_price ELSE 0 END) AS `Week - 44`,
        SUM(CASE WHEN week = 'Week - 45' THEN sale_price ELSE 0 END) AS `Week - 45`,
        SUM(CASE WHEN week = 'Week - 46' THEN sale_price ELSE 0 END) AS `Week - 46`,
        SUM(CASE WHEN week = 'Week - 47' THEN sale_price ELSE 0 END) AS `Week - 47`,
        SUM(CASE WHEN week = 'Week - 48' THEN sale_price ELSE 0 END) AS `Week - 48`,
        SUM(CASE WHEN week = 'Week - 49' THEN sale_price ELSE 0 END) AS `Week - 49`,
        SUM(CASE WHEN week = 'Week - 50' THEN sale_price ELSE 0 END) AS `Week - 50`,
        SUM(CASE WHEN week = 'Week - 51' THEN sale_price ELSE 0 END) AS `Week - 51`,
        SUM(CASE WHEN week = 'Week - 52' THEN sale_price ELSE 0 END) AS `Week - 52`
    FROM sales_order
    WHERE account_id BETWEEN 'BAM002' AND 'BAM018'
    GROUP BY account_id;

    -- Create or replace monthly_forecasts table
    DROP TABLE IF EXISTS monthly_forecasts;
    CREATE TABLE monthly_forecasts (
        `account_id` VARCHAR(10),
        `Arrears` DECIMAL(10, 2),
        `Month1` VARCHAR(20),
        `Month1_Value` DECIMAL(10, 2),
        `Month2` VARCHAR(20),
        `Month2_Value` DECIMAL(10, 2),
        `Month3` VARCHAR(20),
        `Month3_Value` DECIMAL(10, 2),
        `Month4` VARCHAR(20),
        `Month4_Value` DECIMAL(10, 2),
        `Month5` VARCHAR(20),
        `Month5_Value` DECIMAL(10, 2),
        `Month6` VARCHAR(20),
        `Month6_Value` DECIMAL(10, 2),
        `Month7` VARCHAR(20),
        `Month7_Value` DECIMAL(10, 2),
        `Month8` VARCHAR(20),
        `Month8_Value` DECIMAL(10, 2),
        `Month9` VARCHAR(20),
        `Month9_Value` DECIMAL(10, 2),
        `Month10` VARCHAR(20),
        `Month10_Value` DECIMAL(10, 2),
        `Month11` VARCHAR(20),
        `Month11_Value` DECIMAL(10, 2),
        `Month12` VARCHAR(20),
        `Month12_Value` DECIMAL(10, 2)
    );

    -- Populate monthly_forecasts table
    INSERT INTO monthly_forecasts
    SELECT 
        account_id,
        SUM(CASE WHEN required_date < current_week_monday THEN sale_price ELSE 0 END) AS Arrears,
        DATE_FORMAT(current_month, '%M %Y') AS Month1,
        SUM(CASE WHEN required_date >= current_week_monday AND required_date < DATE_ADD(current_month, INTERVAL 1 MONTH) THEN sale_price ELSE 0 END) AS Month1_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 1 MONTH), '%M %Y') AS Month2,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 1 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 2 MONTH) THEN sale_price ELSE 0 END) AS Month2_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 2 MONTH), '%M %Y') AS Month3,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 2 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 3 MONTH) THEN sale_price ELSE 0 END) AS Month3_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 3 MONTH), '%M %Y') AS Month4,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 3 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 4 MONTH) THEN sale_price ELSE 0 END) AS Month4_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 4 MONTH), '%M %Y') AS Month5,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 4 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 5 MONTH) THEN sale_price ELSE 0 END) AS Month5_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 5 MONTH), '%M %Y') AS Month6,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 5 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 6 MONTH) THEN sale_price ELSE 0 END) AS Month6_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 6 MONTH), '%M %Y') AS Month7,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 6 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 7 MONTH) THEN sale_price ELSE 0 END) AS Month7_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 7 MONTH), '%M %Y') AS Month8,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 7 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 8 MONTH) THEN sale_price ELSE 0 END) AS Month8_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 8 MONTH), '%M %Y') AS Month9,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 8 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 9 MONTH) THEN sale_price ELSE 0 END) AS Month9_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 9 MONTH), '%M %Y') AS Month10,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 9 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 10 MONTH) THEN sale_price ELSE 0 END) AS Month10_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 10 MONTH), '%M %Y') AS Month11,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 10 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 11 MONTH) THEN sale_price ELSE 0 END) AS Month11_Value,
        DATE_FORMAT(DATE_ADD(current_month, INTERVAL 11 MONTH), '%M %Y') AS Month12,
        SUM(CASE WHEN required_date >= DATE_ADD(current_month, INTERVAL 11 MONTH) AND required_date < DATE_ADD(current_month, INTERVAL 12 MONTH) THEN sale_price ELSE 0 END) AS Month12_Value
    FROM sales_order
    WHERE account_id BETWEEN 'BAM002' AND 'BAM018'
    GROUP BY account_id;

    -- Create or replace weekly_totals table
    DROP TABLE IF EXISTS weekly_totals;
    CREATE TABLE weekly_totals (
        `account_id` VARCHAR(10),
        `Arrears` DECIMAL(10, 2),
        `Weeks 1-9` DECIMAL(10, 2),
        `Weeks 10-18` DECIMAL(10, 2),
        `Weeks 19-27` DECIMAL(10, 2),
        `Weeks 28-36` DECIMAL(10, 2),
        `Weeks 37-45` DECIMAL(10, 2),
        `Weeks 46-52` DECIMAL(10, 2)
    );

    -- Populate weekly_totals table
    INSERT INTO weekly_totals
    SELECT 
        account_id,
        Arrears,
        (`Arrears` + `Week - 1` + `Week - 2` + `Week - 3` + `Week - 4` + `Week - 5` + `Week - 6` + `Week - 7` + `Week - 8` + `Week - 9`) AS `Weeks 1-9`,
        (`Week - 10` + `Week - 11` + `Week - 12` + `Week - 13` + `Week - 14` + `Week - 15` + `Week - 16` + `Week - 17` + `Week - 18`) AS `Weeks 10-18`,
        (`Week - 19` + `Week - 20` + `Week - 21` + `Week - 22` + `Week - 23` + `Week - 24` + `Week - 25` + `Week - 26` + `Week - 27`) AS `Weeks 19-27`,
        (`Week - 28` + `Week - 29` + `Week - 30` + `Week - 31` + `Week - 32` + `Week - 33` + `Week - 34` + `Week - 35` + `Week - 36`) AS `Weeks 28-36`,
        (`Week - 37` + `Week - 38` + `Week - 39` + `Week - 40` + `Week - 41` + `Week - 42` + `Week - 43` + `Week - 44` + `Week - 45`) AS `Weeks 37-45`,
        (`Week - 46` + `Week - 47` + `Week - 48` + `Week - 49` + `Week - 50` + `Week - 51` + `Week - 52`) AS `Weeks 46-52`
    FROM weekly_forecasts;

    -- Create or replace monthly_totals table
    DROP TABLE IF EXISTS monthly_totals;
    CREATE TABLE monthly_totals (
        `account_id` VARCHAR(10),
        `Arrears` DECIMAL(10, 2),
        `Months 1-6` DECIMAL(10, 2),
        `Months 7-12` DECIMAL(10, 2)
    );

     -- Populate monthly_totals table
    INSERT INTO monthly_totals
    SELECT 
        account_id,
        Arrears,
        (Arrears + Month1_Value + Month2_Value + Month3_Value + Month4_Value + Month5_Value + Month6_Value) AS `Months 1-6`,
        (Month7_Value + Month8_Value + Month9_Value + Month10_Value + Month11_Value + Month12_Value) AS `Months 7-12`
    FROM monthly_forecasts;

    -- Create or replace grand_total table
    DROP TABLE IF EXISTS grand_total;
    CREATE TABLE grand_total (
        `account_id` VARCHAR(10),
        `weekly_arrears` DECIMAL(10, 2),
        `weekly` DECIMAL(10, 2),
        `monthly_arrears` DECIMAL(10, 2),
        `monthly` DECIMAL(10, 2)
    );

    -- Populate grand_total table
    INSERT INTO grand_total
    SELECT 
        wt.account_id,
        wt.Arrears AS weekly_arrears,
        (wt.`Weeks 1-9` + wt.`Weeks 10-18` + wt.`Weeks 19-27` + wt.`Weeks 28-36` + wt.`Weeks 37-45` + wt.`Weeks 46-52`) AS weekly,
        mt.Arrears AS monthly_arrears,
        (mt.`Months 1-6` + mt.`Months 7-12`) AS monthly
    FROM weekly_totals wt
    JOIN monthly_totals mt ON wt.account_id = mt.account_id;

END //

DELIMITER ;