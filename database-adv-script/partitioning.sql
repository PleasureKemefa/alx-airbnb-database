-- Step 1: Rename original bookings table
ALTER TABLE bookings RENAME TO bookings_original;

-- Step 2: Create new parent table with partitioning by start_date
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (you can add more based on your data range)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Insert data from original table into partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date)
SELECT id, user_id, property_id, start_date, end_date
FROM bookings_original;

-- Optional: Drop old table if everything works
-- DROP TABLE bookings_original;