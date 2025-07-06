-- Create index on bookings.user_id
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on payments.booking_id
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Create index on users.email
CREATE INDEX idx_users_email ON users(email);

-- Create index on bookings.start_date (optional, for filtering/sorting by date)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);