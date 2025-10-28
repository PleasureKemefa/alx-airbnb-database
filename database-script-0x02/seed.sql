-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '+2348011111111', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '+2348022222222', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Brown', 'carol@example.com', 'hashed_pw_3', '+2348033333333', 'guest'),
('44444444-4444-4444-4444-444444444444', 'David', 'Williams', 'david@example.com', 'hashed_pw_4', '+2348044444444', 'admin');


-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaa1111-aaaa-1111-aaaa-1111aaaa1111', '11111111-1111-1111-1111-111111111111', 'Seaside Villa', 'Beautiful villa by the beach with ocean views', 'Lagos, Nigeria', 450.00),
('bbbb2222-bbbb-2222-bbbb-2222bbbb2222', '11111111-1111-1111-1111-111111111111', 'Downtown Apartment', 'Modern apartment close to major attractions', 'Abuja, Nigeria', 250.00);


-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book1111-book-1111-book-1111book1111', 'aaaa1111-aaaa-1111-aaaa-1111aaaa1111', '22222222-2222-2222-2222-222222222222', '2025-11-10', '2025-11-15', 2250.00, 'confirmed'),
('book2222-book-2222-book-2222book2222', 'bbbb2222-bbbb-2222-bbbb-2222bbbb2222', '33333333-3333-3333-3333-333333333333', '2025-12-01', '2025-12-03', 500.00, 'pending');


-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay1111-pay1-1111-pay1-1111pay1111', 'book1111-book-1111-book-1111book1111', 2250.00, 'credit_card'),
('pay2222-pay2-2222-pay2-2222pay2222', 'book2222-book-2222-book-2222book2222', 500.00, 'paypal');


-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('rev1111-rev1-1111-rev1-1111rev1111', 'aaaa1111-aaaa-1111-aaaa-1111aaaa1111', '22222222-2222-2222-2222-222222222222', 5, 'Absolutely stunning view! Highly recommended.'),
('rev2222-rev2-2222-rev2-2222rev2222', 'bbbb2222-bbbb-2222-bbbb-2222bbbb2222', '33333333-3333-3333-3333-333333333333', 4, 'Clean and modern, but a bit noisy at night.');


-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('msg1111-msg1-1111-msg1-1111msg1111', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, I’m interested in booking the Seaside Villa!'),
('msg2222-msg2-2222-msg2-2222msg2222', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, sure! The dates you mentioned are available.');