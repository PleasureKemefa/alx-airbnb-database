# Performance Monitoring and Optimization – Airbnb Clone

## Objective
To monitor query performance using tools like `EXPLAIN ANALYZE` and optimize slow queries by applying schema adjustments and indexing.

---

## Tools Used
- `EXPLAIN` (MySQL/PostgreSQL): Shows how the query planner executes SQL.
- `ANALYZE`: Provides actual execution metrics (used in PostgreSQL).
- `SHOW PROFILE` (MySQL only): Displays detailed resource usage per query step.

---

## Monitored Queries and Analysis

### 🔍 Query 1: Get all bookings by a user
```sql
SELECT * FROM bookings WHERE user_id = 42;