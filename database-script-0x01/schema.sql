BEGIN;
CREATE TABLE users (
user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL,
phone_number VARCHAR(20),
role role_enum NOT NULL DEFAULT 'guest',
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Properties
CREATE TABLE properties (
property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
host_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
location VARCHAR(255) NOT NULL,
pricepernight DECIMAL(10,2) NOT NULL CHECK (pricepernight >= 0),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Trigger to auto-update updated_at
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.updated_at = NOW();
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER set_timestamp
BEFORE UPDATE ON properties
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();


-- Bookings
CREATE TABLE bookings (
booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
property_id UUID NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
status booking_status_enum NOT NULL DEFAULT 'pending',
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
CHECK (end_date > start_date)
);


-- Payments
CREATE TABLE payments (
payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
booking_id UUID UNIQUE REFERENCES bookings(booking_id) ON DELETE CASCADE,
amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
payment_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
payment_method payment_method_enum NOT NULL
);


-- Reviews
CREATE TABLE reviews (
review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
property_id UUID NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
comment TEXT NOT NULL,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
UNIQUE (property_id, user_id) -- one review per user per property
);


-- Messages
CREATE TABLE messages (
message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
sender_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
recipient_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
message_body TEXT NOT NULL,
sent_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_host ON properties(host_id);
CREATE INDEX idx_bookings_property ON bookings(property_id);
CREATE INDEX idx_bookings_user ON bookings(user_id);
CREATE INDEX idx_payments_booking ON payments(booking_id);
CREATE INDEX idx_reviews_property ON reviews(property_id);
CREATE INDEX idx_messages_sender ON messages(sender_id);
CREATE INDEX idx_messages_recipient ON messages(recipient_id);


COMMIT;