USE littlelemon_db;

INSERT INTO customer_details VALUES
(1,'Anna','Smith','1 Main St','555-0101'),
(2,'Brian','Chen','2 Main St','555-0102');

INSERT INTO staff_information VALUES
(1,'Mario','Lopez','Manager',50000),
(2,'Sara','Khan','Server',35000);

INSERT INTO menuitems VALUES
(1,'Pasta',12.50),
(2,'Burger',10.00);

INSERT INTO menu VALUES
(1,'Italian','Bruschetta','Pasta','Soda','Tiramisu',1);

INSERT INTO orders VALUES
(1,'2024-01-01',5,'Dine-in',100.00,1,1,1),
(2,'2024-01-02',3,'Takeaway',60.00,1,2,2);

INSERT INTO order_delivery_status VALUES
(1,'2024-01-03','Delivered',2);

INSERT INTO bookings VALUES
(1,'2024-01-10',5,1,1,2);
