-- Create a database to store data
CREATE DATABASE Class;

-- Create tables to organize data into
CREATE TABLE customers (
customer_id INT NOT NULL PRIMARY KEY,
first_name NVARCHAR(255) NOT NULL,
last_name NVARCHAR(255) NOT NULL,
email NVARCHAR(255) NOT NULL,
city NVARCHAR(255) NOT NULL,
state NVARCHAR(255) NOT NULL,
member_since DATETIME NOT NULL,
);

CREATE TABLE orders (
order_id INT NOT NULL PRIMARY KEY,
order_date DATETIME NOT NULL,
customer_id INT NOT NULL,
shipping_name NVARCHAR(255),
shipping_address NVARCHAR(255) NOT NULL,
shipping_city NVARCHAR(255) NOT NULL,
shipping_state NVARCHAR(255) NOT NULL,
shipping_zip NVARCHAR(255) NOT NULL,
order_subtotal DECIMAL NOT NULL
);

CREATE TABLE order_items (
product_id INT NOT NULL,
order_id INT NOT NULL,
quantity INT NOT NULL,
unit_price DECIMAL NOT NULL,
line_total DECIMAL NOT NULL
);

CREATE TABLE products (
product_id INT NOT NULL PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
product_desc VARCHAR(255),
cost DECIMAL NOT NULL,
sale_price DECIMAL NOT NULL
);
