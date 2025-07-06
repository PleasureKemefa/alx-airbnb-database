-- Get the total number of bookings made by each user
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id;

-- Rank properties based on the total number of bookings (most booked = rank 1)
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS property_rank
FROM 
    bookings
GROUP BY 
    property_id;