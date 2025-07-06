# Query Optimization Report – Airbnb Clone

## Initial Query Summary
The original query retrieves all booking data along with user, property, and payment details using multiple JOINs.

## Performance Analysis (Using EXPLAIN)
- Full table scans observed on `bookings`, `users`, `payments`.
- Joins used large datasets, slowing down execution.
- No WHERE clause or column selection caused unnecessary data processing.

## Optimization Steps Taken
- Removed unused columns to minimize data transfer.
- Aliased tables for readability.
- Ensured indexes exist on `bookings.user_id`, `bookings.property_id`, `payments.booking_id` to improve join efficiency.
- Replaced SELECT * with specific columns.

## Result
- Reduced query execution time.
- Lower memory and CPU usage.
- Faster response on large datasets.

## Recommendations
- Keep foreign key columns indexed.
- Use EXPLAIN regularly to check query plans.
- Avoid large joins unless necessary.
- Archive or partition old booking data for better performance.

---

## Author
Pleasure Kemefa – ALX Software Engineering Program