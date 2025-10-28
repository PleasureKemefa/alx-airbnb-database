ER Diagram — Entities & Relationships (textual)
Entities (summary)

User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)

Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)

Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)

Payment (payment_id, booking_id, amount, payment_date, payment_method)

Review (review_id, property_id, user_id, rating, comment, created_at)

Message (message_id, sender_id, recipient_id, message_body, sent_at)

Relationships (cardinality & notes)

User (1) — (M) Property

host_id (Property) → user_id (User)

A user with role host owns properties.

User (1) — (M) Booking

user_id (Booking) → user_id (User)

A user (guest) can create many bookings.

Property (1) — (M) Booking

property_id (Booking) → property_id (Property)

A property can be booked many times.

Booking (1) — (1) Payment

booking_id (Payment) → booking_id (Booking)

Each booking may have 0 or 1 associated payment record in this design (we allow possibility of unpaid/pending bookings). If you want multiple payments per booking (installments), change cardinality.

Property (1) — (M) Review

property_id (Review) → property_id (Property)

User (1) — (M) Review

user_id (Review) → user_id (User)

User (1) — (M) Message (self-referencing)

sender_id & recipient_id (Message) → user_id (User)

Messages are self-referencing; a message links two users.
