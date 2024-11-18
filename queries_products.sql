-- Comments in SQL Start with dash-dash --
CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price FLOAT NOT NULL,
    can_be_returned BOOLEAN NOT NULL
);
-- Inserting data into the Product table
INSERT INTO Product(name, price, can_be_returned) VALUES ('chair', 44.00, 'false');

INSERT INTO Product(name, price, can_be_returned) VALUES ('stool', 25.99, 'true');

INSERT INTO Product(name, price, can_be_returned) VALUES ('table', 124.00, 'false');

-- Selecting all data from the Product table
SELECT * FROM Product;

-- Selecting only the name column from the Product table
SELECT name FROM Product;

-- Selecting the name and price columns from the Product table
SELECT name, price FROM Product;

-- Inserting a new row into the Product table
INSERT INTO Product(name, price, can_be_returned) VALUES ('couch', 124.00, 'true');

-- Selecting rows where can_be_returned is true
SELECT * FROM Product WHERE can_be_returned = 'true';

-- Selecting rows where price is less than 44.00
SELECT * FROM Product WHERE price < 44.00;

-- Selecting rows where price is between 22.50 and 99.99
SELECT * FROM Product WHERE price BETWEEN 22.50 AND 99.99;

-- Updating the price of all rows by subtracting 20
UPDATE Product SET price = price - 20;

-- Deleting rows where price is less than 25
DELETE FROM Product WHERE price < 25;

-- Updating the price of all rows by adding 20
UPDATE Product SET price = price + 20;

-- Updating the can_be_returned of all rows to true
UPDATE Product SET can_be_returned = 'true';
