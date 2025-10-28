Goal

Demonstrate that the schema is in Third Normal Form (3NF) — no repeating groups, no partial dependencies, no transitive dependencies.

Starting point (unnormalized hint)

An unnormalized single table attempt could try to put users, properties, bookings, payments, reviews, messages into one big rowset — this obviously creates repeating groups (multiple bookings per user) and redundancy (user details repeated for each booking).

Step-by-step normalization
1NF — Make sure each field is atomic

Ensure each attribute holds a single indivisible value (e.g., don’t store multiple phone numbers in a single phone_number column; if needed, create user_phones table).

Each row uniquely identified by a primary key (we use uuid for each entity).

2NF — Remove partial dependencies

2NF applies when there is a composite PK. Our design uses single-column primary keys (UUID), so partial dependencies are not an issue. For any table that might have had composite keys (e.g., a hypothetical property_availability(property_id, date)), ensure non-key columns depend on full key.

3NF — Remove transitive dependencies

Example: If we stored host_name on property instead of host_id, this would be a transitive dependency (property -> host_id -> user.name). We store host_id only.

All non-key attributes directly depend on the primary key of their table.

Final justification

users: all columns describe the user and depend on user_id.

properties: all columns describe the property and depend on property_id; host_id is a foreign key only.

bookings: all columns describe a booking and depend on booking_id.

payments, reviews, messages: similarly in 3NF.

If you need to track historical or multi-valued attributes (e.g., property amenities, multiple phones), create join tables (e.g., property_amenities, user_phones).
