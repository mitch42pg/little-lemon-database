USE littlelemon_db;

DELIMITER //

-- Returns the maximum quantity in Orders
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(quantity) AS MaxQuantity FROM orders;
END//

-- Checks if a table is booked on a date (based on bookings table)
CREATE PROCEDURE ManageBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_count INT;

    SELECT COUNT(*)
    INTO booking_count
    FROM bookings
    WHERE date = booking_date
      AND tablenumber = table_number;

    IF booking_count > 0 THEN
        SELECT 'Table is already booked' AS BookingStatus;
    ELSE
        SELECT 'Table is available' AS BookingStatus;
    END IF;
END//

-- Adds a booking
CREATE PROCEDURE AddBooking(
    IN p_bookingid INT,
    IN p_bookingdate DATE,
    IN p_tablenumber INT,
    IN p_customerid INT,
    IN p_orderid INT,
    IN p_staffid INT
)
BEGIN
    INSERT INTO bookings (bookingid, date, tablenumber, customerid, orderid, staffid)
    VALUES (p_bookingid, p_bookingdate, p_tablenumber, p_customerid, p_orderid, p_staffid);

    SELECT 'New booking added' AS Confirmation;
END//

-- Updates booking date by booking id
CREATE PROCEDURE UpdateBooking(
    IN p_bookingid INT,
    IN p_newdate DATE
)
BEGIN
    UPDATE bookings
    SET date = p_newdate
    WHERE bookingid = p_bookingid;

    SELECT 'Booking updated' AS Confirmation;
END//

-- Cancels booking by booking id
CREATE PROCEDURE CancelBooking(IN p_bookingid INT)
BEGIN
    DELETE FROM bookings
    WHERE bookingid = p_bookingid;

    SELECT 'Booking cancelled' AS Confirmation;
END//

DELIMITER ;
