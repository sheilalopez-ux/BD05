-- Task 1--
SELECT * FROM classicmodels.customers;

-- Task 2
INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (124, 'H123', '2024-02-06', 845.00);
INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (151, 'H124', '2024-02-07', 70.00 );
INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (112, 'H125', '2024-02-05', 1024.00 );

-- Task 3
SELECT * FROM classicmodels.customers;

-- Task 4
UPDATE orders 
SET status = 'Cancelled',
    shippedDate = CURDATE(),
    comments = 'Order cancelled due to delay'
WHERE
    orderDate = '2003-09-28';
    
-- Task 6
UPDATE products
SET 
    buyPrice = buyPrice * 1.0002,
    MSRP = MSRP * 1.0002
WHERE
    quantityInStock > 500;
    
-- Task 7
DELETE FROM payments
WHERE customerNumber IN (
    SELECT customerNumber
    FROM customers
    WHERE salesRepEmployeeNumber IN (
        SELECT employeeNumber
        FROM employees
        WHERE lastName = 'Patterson'
    )
);

-- Task 8
DELETE FROM customers 
WHERE
    city = 'Lisboa'
    AND customerNumber NOT IN (SELECT 
        customerNumber
    FROM
        payments);

-- Task 9
INSERT INTO employees
(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
SELECT 
    customerNumber + 2000,
    contactLastName,
    contactFirstName,
    'x0000',
    'new@company.com',
    '1',
    NULL,
    'Sales Rep'
FROM customers;

-- Task 10
UPDATE orders 
SET 
    status = 'cancelled',
    shippedDate = CURDATE(),
    comments = 'order cancelled by management'
WHERE
    customerNumber = (SELECT 
            customerNumber
        FROM
            customers
        WHERE
            contactFirstName = 'Elizabeth '
                AND contactLastName = 'Lincoln');
   
        
