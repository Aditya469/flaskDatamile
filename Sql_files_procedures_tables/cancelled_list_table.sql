DROP TABLE IF EXISTS cancelled_list;

CREATE TABLE cancelled_list (
    account_id VARCHAR(10),
    stock_code VARCHAR(20),
    issue VARCHAR(10),
    required_date DATE,
    required_day VARCHAR(10),
    required_quantity INT,
    order_reference INT,
    location VARCHAR(20),
    message VARCHAR(20),
    week VARCHAR(10),
    PRIMARY KEY (account_id, stock_code, issue, required_date, required_quantity)
);