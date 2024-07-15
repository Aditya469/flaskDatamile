-- create picklist table
DROP TABLE IF EXISTS picklist;

CREATE TABLE picklist (
    account_id VARCHAR(10),
    stock_code VARCHAR(20),
    issue VARCHAR(10),
    required_date DATE,
    required_day VARCHAR(10),
    required_quantity INT,
    order_reference VARCHAR(30),
    location VARCHAR(20),
    message VARCHAR(20),
    week VARCHAR(10),
    PRIMARY KEY (account_id, stock_code, issue, required_date, required_quantity)
);