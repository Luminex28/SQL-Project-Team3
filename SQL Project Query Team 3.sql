USE master;
GO

IF DB_ID('QuickCart') IS NOT NULL
BEGIN
    ALTER DATABASE QuickCart SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE QuickCart;
END
GO

CREATE DATABASE QuickCart;
GO

USE QuickCart;
GO

-- Creating Tables --
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Inserting Data into Tables --

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Books'),
(5, 'Sports'),
(6, 'Beauty'),
(7, 'Toys'),
(8, 'Furniture'),
(9, 'Groceries'),
(10, 'Accessories');

INSERT INTO Products VALUES
(1, 'iPhone 15', 1, 80000, 50),
(2, 'Laptop HP', 1, 65000, 30),
(3, 'Bluetooth Speaker', 1, 3000, 100),
(4, 'T-shirt', 2, 500, 200),
(5, 'Jeans', 2, 1200, 150),
(6, 'Microwave', 3, 7000, 40),
(7, 'Refrigerator', 3, 20000, 20),
(8, 'Novel Book', 4, 300, 120),
(9, 'Notebook Pack', 4, 200, 180),
(10, 'Cricket Bat', 5, 1500, 60),
(11, 'Football', 5, 800, 80),
(12, 'Face Cream', 6, 400, 90),
(13, 'Perfume', 6, 1200, 70),
(14, 'Toy Car', 7, 600, 110),
(15, 'Lego Set', 7, 2500, 50),
(16, 'Sofa', 8, 15000, 10),
(17, 'Dining Table', 8, 20000, 8),
(18, 'Rice 5kg', 9, 400, 200),
(19, 'Milk Pack', 9, 60, 300),
(20, 'Watch', 10, 2000, 75),
(21, 'Headphones', 1, 2500, 95),
(22, 'Jacket', 2, 2500, 60),
(23, 'Mixer Grinder', 3, 5000, 35),
(24, 'Yoga Mat', 5, 700, 85),
(25, 'Sunglasses', 10, 1500, 90);

INSERT INTO Customers VALUES
(101, 'Aman Sharma', 'aman@gmail.com', 'Delhi'),
(102, 'Riya Verma', 'riya@gmail.com', 'Mumbai'),
(103, 'Karan Mehta', 'karan@gmail.com', 'Pune'),
(104, 'Sneha Kapoor', 'sneha@gmail.com', 'Delhi'),
(105, 'Rahul Singh', 'rahul@gmail.com', 'Noida'),
(106, 'Priya Nair', 'priya@gmail.com', 'Bangalore'),
(107, 'Arjun Patel', 'arjun@gmail.com', 'Ahmedabad'),
(108, 'Neha Gupta', 'neha@gmail.com', 'Jaipur'),
(109, 'Vikas Yadav', 'vikas@gmail.com', 'Lucknow'),
(110, 'Simran Kaur', 'simran@gmail.com', 'Chandigarh'),
(111, 'Rohit Jain', 'rohit@gmail.com', 'Indore'),
(112, 'Anjali Das', 'anjali@gmail.com', 'Kolkata'),
(113, 'Manish Kumar', 'manish@gmail.com', 'Patna'),
(114, 'Pooja Shah', 'pooja@gmail.com', 'Surat'),
(115, 'Varun Malhotra', 'varun@gmail.com', 'Delhi'),
(116, 'Meera Iyer', 'meera@gmail.com', 'Chennai'),
(117, 'Aditya Roy', 'aditya@gmail.com', 'Kolkata'),
(118, 'Tanya Arora', 'tanya@gmail.com', 'Delhi'),
(119, 'Sahil Khan', 'sahil@gmail.com', 'Bhopal'),
(120, 'Nikita Joshi', 'nikita@gmail.com', 'Pune');

INSERT INTO Orders VALUES
(1,101,'2026-03-01','Completed'),
(2,102,'2026-03-02','Completed'),
(3,103,'2026-03-02','Cancelled'),
(4,104,'2026-03-03','Completed'),
(5,105,'2026-03-03','Completed'),
(6,106,'2026-03-04','Completed'),
(7,107,'2026-03-05','Completed'),
(8,108,'2026-03-05','Cancelled'),
(9,109,'2026-03-06','Completed'),
(10,110,'2026-03-06','Completed'),
(11,111,'2026-03-07','Completed'),
(12,112,'2026-03-08','Completed'),
(13,113,'2026-03-08','Completed'),
(14,114,'2026-03-09','Completed'),
(15,115,'2026-03-10','Cancelled'),
(16,116,'2026-03-10','Completed'),
(17,117,'2026-03-11','Completed'),
(18,118,'2026-03-11','Completed'),
(19,119,'2026-03-12','Completed'),
(20,120,'2026-03-12','Completed'),
(21,101,'2026-03-13','Completed'),
(22,102,'2026-03-14','Completed'),
(23,103,'2026-03-14','Completed'),
(24,104,'2026-03-15','Completed'),
(25,105,'2026-03-15','Completed'),
(26,106,'2026-03-16','Cancelled'),
(27,107,'2026-03-16','Completed'),
(28,108,'2026-03-17','Completed'),
(29,109,'2026-03-17','Completed'),
(30,110,'2026-03-18','Completed'),
(31,111,'2026-03-19','Completed'),
(32,112,'2026-03-20','Completed'),
(33,113,'2026-03-20','Completed'),
(34,114,'2026-03-21','Completed'),
(35,115,'2026-03-21','Completed'),
(36,116,'2026-03-22','Completed'),
(37,117,'2026-03-22','Cancelled'),
(38,118,'2026-03-23','Completed'),
(39,119,'2026-03-23','Completed'),
(40,120,'2026-03-24','Completed'),
(41,101,'2026-03-25','Completed'),
(42,102,'2026-03-26','Completed'),
(43,103,'2026-03-26','Completed'),
(44,104,'2026-03-27','Completed'),
(45,105,'2026-03-27','Completed'),
(46,106,'2026-03-28','Completed'),
(47,107,'2026-03-28','Completed'),
(48,108,'2026-03-29','Completed'),
(49,109,'2026-03-29','Completed'),
(50,110,'2026-03-30','Completed');

INSERT INTO OrderItems VALUES
(1,1,1,1,80000),
(2,1,3,2,3000),
(3,2,4,3,500),
(4,2,5,2,1200),
(5,3,10,1,1500),
(6,4,2,1,65000),
(7,5,8,2,300),
(8,6,6,1,7000),
(9,7,11,2,800),
(10,8,14,1,600),
(11,9,7,1,20000),
(12,10,9,3,200),
(13,11,21,1,2500),
(14,12,15,1,2500),
(15,13,18,2,400),
(16,14,20,1,2000),
(17,15,22,1,2500),
(18,16,23,1,5000),
(19,17,24,2,700),
(20,18,25,1,1500),
(21,19,12,3,400),
(22,20,13,1,1200),
(23,21,1,1,80000),
(24,22,4,2,500),
(25,23,10,1,1500),
(26,24,2,1,65000),
(27,25,5,2,1200),
(28,26,6,1,7000),
(29,27,11,1,800),
(30,28,14,2,600),
(31,29,7,1,20000),
(32,30,9,2,200),
(33,31,21,1,2500),
(34,32,15,1,2500),
(35,33,18,1,400),
(36,34,20,1,2000),
(37,35,22,2,2500),
(38,36,23,1,5000),
(39,37,24,1,700),
(40,38,25,2,1500),
(41,39,12,2,400),
(42,40,13,1,1200),
(43,41,3,2,3000),
(44,42,4,1,500),
(45,43,5,1,1200),
(46,44,6,1,7000),
(47,45,7,1,20000),
(48,46,8,2,300),
(49,47,9,3,200),
(50,48,10,1,1500),
(51,49,11,2,800),
(52,50,12,1,400),
(53,50,1,1,80000),
(54,49,2,1,65000),
(55,48,3,1,3000),
(56,47,4,2,500),
(57,46,5,1,1200),
(58,45,6,1,7000),
(59,44,7,1,20000),
(60,43,8,1,300);

-- Test Query --

SELECT p.product_id, p.product_name
FROM Products p
LEFT JOIN OrderItems oi ON p.product_id = oi.product_id
LEFT JOIN Orders o ON oi.order_id = o.order_id
AND o.order_date >= DATEADD(DAY, -30, GETDATE())
WHERE o.order_id IS NULL;


-- Testing for redundancy -- 
SELECT p.product_id, p.product_name, c.category_name
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;

-- Checking for duplicate Data --
SELECT category_name, COUNT(*)
FROM Categories
GROUP BY category_name
HAVING COUNT(*) > 1;

-- Checking if any product is wrongly stored -- 
SELECT *
FROM Products
WHERE product_name LIKE '%Electronics%';

-- Dependency Checking via grouping -- 
SELECT category_id, COUNT(DISTINCT product_name)
FROM Products
GROUP BY category_id;

USE QuickCart;
GO

-- ============================================================
--  SECTION 1 : ADD MISSING NOT NULL CONSTRAINTS
-- ============================================================

-- Products table
ALTER TABLE Products
    ALTER COLUMN price DECIMAL(10,2) NOT NULL;

ALTER TABLE Products
    ALTER COLUMN stock INT NOT NULL;

-- Orders table
ALTER TABLE Orders
    ALTER COLUMN order_date DATE NOT NULL;

ALTER TABLE Orders
    ALTER COLUMN status VARCHAR(20) NOT NULL;

-- OrderItems table
ALTER TABLE OrderItems
    ALTER COLUMN quantity INT NOT NULL;

ALTER TABLE OrderItems
    ALTER COLUMN price DECIMAL(10,2) NOT NULL;

GO

-- ============================================================
--  SECTION 2 : ADD MISSING CHECK CONSTRAINTS
-- ============================================================

-- Products: price must be greater than zero
ALTER TABLE Products
    ADD CONSTRAINT chk_product_price
    CHECK (price > 0);

-- Products: stock cannot go negative
ALTER TABLE Products
    ADD CONSTRAINT chk_product_stock
    CHECK (stock >= 0);

-- OrderItems: quantity must be at least 1
ALTER TABLE OrderItems
    ADD CONSTRAINT chk_orderitem_quantity
    CHECK (quantity > 0);

-- OrderItems: price at time of purchase must be positive
ALTER TABLE OrderItems
    ADD CONSTRAINT chk_orderitem_price
    CHECK (price > 0);

-- Orders: status must be one of three valid values only
ALTER TABLE Orders
    ADD CONSTRAINT chk_order_status
    CHECK (status IN ('Completed', 'Cancelled', 'Pending'));

GO

-- ============================================================
--  SECTION 3 : ADD INDEXES ON FOREIGN KEY COLUMNS
-- ============================================================

-- Products -> Categories
CREATE NONCLUSTERED INDEX idx_products_category_id
    ON Products (category_id);

-- Orders -> Customers
CREATE NONCLUSTERED INDEX idx_orders_customer_id
    ON Orders (customer_id);

-- Orders: filter by date and status frequently
CREATE NONCLUSTERED INDEX idx_orders_date_status
    ON Orders (order_date, status);

-- OrderItems -> Orders
CREATE NONCLUSTERED INDEX idx_orderitems_order_id
    ON OrderItems (order_id);

-- OrderItems -> Products
CREATE NONCLUSTERED INDEX idx_orderitems_product_id
    ON OrderItems (product_id);

GO

-- ============================================================
--  SECTION 4 : TRIGGER 1 — DEDUCT STOCK ON ORDER PLACEMENT
--  Fires AFTER a new row is inserted into OrderItems.
--  Subtracts the ordered quantity from Products.stock.
-- ============================================================

CREATE OR ALTER TRIGGER trg_DeductStock
ON OrderItems
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET    p.stock = p.stock - i.quantity
    FROM   Products p
    JOIN   inserted i ON p.product_id = i.product_id;

    -- Safety check: if any stock went negative, roll back
    IF EXISTS (
        SELECT 1
        FROM   Products p
        JOIN   inserted i ON p.product_id = i.product_id
        WHERE  p.stock < 0
    )
    BEGIN
        RAISERROR ('Insufficient stock for one or more products. Order cancelled.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- ============================================================
--  SECTION 5 : TRIGGER 2 — RESTORE STOCK ON CANCELLATION
--  Fires AFTER the status column in Orders is updated.
--  Adds quantities back to Products.stock when an order
--  is changed to 'Cancelled'.
-- ============================================================

CREATE OR ALTER TRIGGER trg_RestoreStock
ON Orders
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Only run when the status column was actually changed
    IF UPDATE(status)
    BEGIN
        UPDATE p
        SET    p.stock = p.stock + oi.quantity
        FROM   Products p
        JOIN   OrderItems oi ON p.product_id = oi.product_id
        JOIN   inserted  i   ON oi.order_id  = i.order_id
        JOIN   deleted   d   ON i.order_id   = d.order_id
        WHERE  i.status = 'Cancelled'
          AND  d.status <> 'Cancelled';  -- Prevent double-restore
    END
END;
GO

-- ============================================================
--  SECTION 6 : VERIFY EVERYTHING WORKS
-- ============================================================

-- 6A : Check current stock levels before test
SELECT product_id, product_name, stock
FROM   Products
WHERE  product_id IN (1, 3);

-- 6B : Simulate a new order + order item (should deduct stock)
INSERT INTO Orders VALUES (51, 101, GETDATE(), 'Pending');
INSERT INTO OrderItems VALUES (61, 51, 1, 2, 80000);  -- 2x iPhone 15

-- 6C : Confirm stock was deducted (iPhone 15 should drop by 2)
SELECT product_id, product_name, stock
FROM   Products
WHERE  product_id = 1;

-- 6D : Cancel that order (should restore stock)
UPDATE Orders SET status = 'Cancelled' WHERE order_id = 51;

-- 6E : Confirm stock was restored
SELECT product_id, product_name, stock
FROM   Products
WHERE  product_id = 1;

-- 6F : Confirm CHECK constraint works (this should FAIL — expected)
-- Uncomment the line below to test:
-- INSERT INTO OrderItems VALUES (99, 1, 1, -5, 500);

-- 6G : Final stock overview
SELECT p.product_id, p.product_name, c.category_name, p.stock
FROM   Products  p
JOIN   Categories c ON p.category_id = c.category_id
ORDER  BY p.stock ASC;

GO