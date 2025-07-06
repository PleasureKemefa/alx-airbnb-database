# Index Performance Report – Airbnb Clone

## High-Usage Columns Identified
Based on the queries written so far, the following columns are frequently used in JOIN, WHERE, or ORDER BY clauses:
- `bookings.user_id`
- `bookings.property_id`
- `payments.booking_id`
- `users.email`
- `bookings.start_date`

## Indexes Created
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);