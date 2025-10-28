# Schema (database-script-0x01)

This folder contains `schema.sql` — the DDL for the Airbnb clone database.

Target DB: PostgreSQL (tested with pg 13+). If you use MySQL, convert `ENUM` types and UUID generation accordingly.

How to run:

1. Ensure extensions for UUID are available (pgcrypto or uuid-ossp) or remove defaults and supply UUIDs in seed.
2. psql -d your_db -f
