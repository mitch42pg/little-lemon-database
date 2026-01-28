CREATE DATABASE IF NOT EXISTS littlelemon_db;
USE littlelemon_db;

-- Customers
CREATE TABLE customer_details (
    customerid INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    address VARCHAR(255),
    phonenumber VARCHAR(45)
);

-- Staff
CREATE TABLE staff_information (
    staffid INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    role VARCHAR(255),
    salary INT
);

-- Menu
CREATE TABLE menu (
    menuid INT PRIMARY KEY,
    cuisines VARCHAR(255),
    starters VARCHAR(255),
    courses VARCHAR(255),
    drinks VARCHAR(255),
    desserts VARCHAR(255),
    menuitemid INT
);

-- Menu Items
CREATE TABLE menuitems (
    menuitemid INT PRIMARY KEY,
    itemname VARCHAR(255),
    itemprice DECIMAL(5,2)
);

-- Orders
CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    date DATE,
    quantity INT,
    ordertype VARCHAR(255),
    totalcost DECIMAL(10,2),
    menuid INT,
    menuitemid INT,
    customerid INT,
    FOREIGN KEY (menuid) REFERENCES menu(menuid),
    FOREIGN KEY (menuitemid) REFERENCES menuitems(menuitemid),
    FOREIGN KEY (customerid) REFERENCES customer_details(customerid)
);

-- Order Delivery Status
CREATE TABLE order_delivery_status (
    orderdeliveryid INT PRIMARY KEY,
    deliverydate DATE,
    status VARCHAR(255),
    orderid INT,
    FOREIGN KEY (orderid) REFERENCES orders(orderid)
);

-- Bookings
CREATE TABLE bookings (
    bookingid INT PRIMARY KEY,
    date DATE,
    tablenumber INT,
    customerid INT,
    orderid INT,
    staffid INT,
    FOREIGN KEY (customerid) REFERENCES customer_details(customerid),
    FOREIGN KEY (orderid) REFERENCES orders(orderid),
    FOREIGN KEY (staffid) REFERENCES staff_information(staffid)
);
