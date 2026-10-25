-- Database Management & Inventory System Script
-- Student: Mustafa Mahadi Mohamed

-- =====================================================
-- 1. TABLE CREATION
-- =====================================================

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0),
    stock_quantity INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) 
        REFERENCES categories(category_id) ON DELETE CASCADE
);

CREATE TABLE stock_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    transaction_type VARCHAR(10) NOT NULL CHECK (transaction_type IN ('IN', 'OUT')),
    quantity INT NOT NULL CHECK (quantity > 0),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transaction_product FOREIGN KEY (product_id) 
        REFERENCES products(product_id) ON DELETE CASCADE
);

-- =====================================================
-- 2. DATA INSERTION
-- =====================================================

INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Gadgets and electronic devices'),
('Office Supplies', 'Items used for daily office tasks'),
('Furniture', 'Office and home furniture'),
('Hardware', 'Computer parts and accessories'),
('Stationery', 'Paper, pens, and notebook supplies');

INSERT INTO products (product_name, category_id, unit_price, stock_quantity) VALUES
('Laptop Dell XPS', 1, 1200.00, 15),
('Wireless Mouse', 4, 25.50, 50),
('Ergonomic Chair', 3, 180.00, 8),
('A4 Paper Ream', 2, 5.00, 100),
('USB-C Cable', 4, 12.00, 45);

INSERT INTO stock_transactions (product_id, transaction_type, quantity) VALUES
(1, 'IN', 10),
(2, 'IN', 30),
(3, 'OUT', 2),
(4, 'IN', 50),
(5, 'OUT', 5);

-- =====================================================
-- 3. QUERIES & JOINS
-- =====================================================

SELECT * FROM products;

SELECT p.product_name, c.category_name, p.unit_price, p.stock_quantity
FROM products p
JOIN categories c ON p.category_id = c.category_id;

SELECT t.transaction_id, p.product_name, t.transaction_type, t.quantity, t.transaction_date
FROM stock_transactions t
JOIN products p ON t.product_id = p.product_id;