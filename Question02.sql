CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    total_amount DECIMAL(10, 2),
    order_date DATE
);

INSERT INTO customer (full_name, email, phone) VALUES
('Alice Johnson', 'a@gmail.com', '123-456-7890'),
('Bob Smith', 'b@gmail.com', '234-567-8901'),
('Charlie Brown', 'c@gmail.com', '345-678-9012');

INSERT INTO orders (customer_id, total_amount, order_date) VALUES
(1, 150.75, '2024-01-15'),
(2, 200.00, '2024-02-20'),
(3, 50.25, '2024-03-10');


CREATE VIEW v_order_summary AS
(   
    SELECT c.full_name, o.total_amount, o.order_date
    FROM customer AS c
    JOIN orders AS o 
    ON c.customer_id = o.customer_id
); 

SELECT * FROM v_order_summary; 

CREATE VIEW v_monthly_sales AS 
( 
    SELECT EXTRACT(MONTH FROM order_date) SUM(total_amount) 
    FROM orders GROUP BY EXTRACT(MONTH FROM order_date)
) 

SELECT * FROM v_monthly_sales; 

