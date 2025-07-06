-- Get all bookings with the user who made each booking
SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

-- Get all properties and their reviews (even properties without reviews)
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.comment,
    reviews.rating
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

-- Get all users and bookings (even users without bookings or bookings without users)
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;