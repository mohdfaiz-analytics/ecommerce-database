CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR (50),
city VARCHAR (30),
phone VARCHAR (15)
);
SELECT * FROM orders;
CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR (30),
price DECIMAL(10,2)
);
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(20),
FOREIGN KEY (customer_id)REFERENCES customers(customer_id)
);
CREATE TABLE order_items(
item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY(product_id) REFERENCES products(product_id)
);
SELECT * FROM deliveries;

CREATE TABLE payments(
payment_id INT PRIMARY KEY,
order_id INT,
amount DECIMAL(10,2),
payment_method VARCHAR (20),
payment_status VARCHAR (20),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE deliveries(
delivery_id INT PRIMARY KEY,
order_id INT,
delivery_city VARCHAR (30),
delivery_status VARCHAR (20),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers VALUES
(1,'Amir','Bareilly','9870655566'),
(2,'Rahib','Delhi','9917814664'),
(3,'Rani','Mumbai','9012638438'),
(4,'Farah','Agra','7351913413'),
(5,'Saba','Bareilly','9988776655');
SELECT * FROM customers;

INSERT INTO products VALUES
(101,'Laptop','Electronics',55000),
(102,'Phone','Electronics',30000),
(103,'Headphone','Accesories',3000),
(104,'Backpack','Bags',1500),
(105,'Jeans','Clothes',2000);
SELECT * FROM products;

INSERT INTO orders VALUES
(1001,1,'2026-10-01','Delivered'),
(1002,2,'2026-10-02','Pending'),
(1003,3,'2026-10-03','Shipped'),
(1004,4,'2026-10-04','Delivered'),
(1005,5,'2026-10-05','Delivered');
SELECT * FROM orders;

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1002,102,2),
(3,1003,103,3),
(4,1004,104,1),
(5,1005,105,4);
SELECT * FROM order_items;

INSERT INTO payments VALUES
(201,1001,55000,'UPI','Paid'),
(202,1002,30000,'CARD','Paid'),
(203,1003,3000,'CASH','Pending'),
(204,1004,1500,'UPI','Paid'),
(205,1005,2000,'UPI','Paid');
SELECT * FROM payments;

INSERT INTO deliveries VALUES
(301,1001,'Bareilly','Delivered'),
(302,1002,'Delhi','Pending'),
(303,1003,'Mumbai','Shipped'),
(304,1004,'Agra','Delivered'),
(305,1005,'Bareilly','Delivered');
SELECT * FROM deliveries;

SELECT
	customers.customer_name,
    customers.city,
    orders.order_id,
    orders.order_date,
    products.product_name,
    order_items.quantity,
    payments.amount,
    payments.payment_status,
    deliveries.delivery_status
FROM customers
JOIN orders
	ON customers.customer_id = orders.order_id
JOIN order_items
	ON orders.order_Id = order_items.order_id
JOIN products
	ON order_items.product_id = products.product_id
JOIN payments 
	ON orders.order_id = payments.order_id
JOIN deliveries
	ON orders.order_id = deliveries.order_id;
    
SELECT *
FROM customers
JOIN orders USING (customer_id)
JOIN order_items USING (order_id)
JOIN products USING (product_id)
JOIN payments USING (order_id)
JOIN deliveries USING (order_id);