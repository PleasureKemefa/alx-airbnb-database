# Booking Table Partitioning Report – Airbnb Clone

## Objective
To improve performance on queries involving large volumes of booking data by partitioning the `bookings` table using the `start_date` column.

## Steps Taken
1. Renamed the original `bookings` table.
2. Created a partitioned `bookings` table using `PARTITION BY RANGE (start_date)`.
3. Created partitions for years: 2023, 2024, 2025.
4. Inserted all existing data into the new partitioned structure.

## Query Performance Test
### Test Query
```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';