-- ProductDetail
CREATE TABLE ProductDetail (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Products VARCHAR(255) NOT NULL
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
    (101, 'John Doe', 'Laptop, Mouse'),
    (102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
    (103, 'Emily Clark', 'Phone');

-- OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100) NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL
);

INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
    (101, 'John Doe', 'Laptop', 2),
    (101, 'John Doe', 'Mouse', 1),
    (102, 'Jane Smith', 'Tablet', 3),
    (102, 'Jane Smith', 'Keyboard', 1),
    (102, 'Jane Smith', 'Mouse', 2),
    (103, 'Emily Clark', 'Phone', 1);


-- Achieving 1NF 
SELECT OrderID, CustomerName, Product
FROM (
  VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone')
) AS ProductDetail(OrderID, CustomerName, Product);

-- Achieving 2NF 
-- Customers table
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- OrderProducts table (removes partial dependency)
SELECT OrderID, Product, Quantity
FROM OrderDetails;