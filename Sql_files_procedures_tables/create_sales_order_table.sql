DROP TABLE IF EXISTS sales_order;

CREATE TABLE sales_order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id VARCHAR(10),
    stock_code VARCHAR(20),
    issue VARCHAR(10),
    required_date DATE,
    required_quantity INT,
    order_reference INT,
    location VARCHAR(10),
    message VARCHAR(20),
    last_delivery_note INT,
    last_delivery_date DATE,
    week VARCHAR(10),
    month VARCHAR(20),
    unit_price DECIMAL(10, 2),
    sale_price DECIMAL(10, 2),
    UNIQUE KEY unique_sales_order (account_id, stock_code, issue, required_date, required_quantity)
);