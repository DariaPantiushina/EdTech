-- ============================
-- STAGING: Customers
-- ============================
CREATE TABLE stg_customers AS
SELECT
    customer_id,
    start_date,
    "group",
    user_type
FROM raw_customers
WHERE start_date IS NOT NULL;

-- ============================
-- STAGING: Activities
-- ============================
CREATE TABLE stg_activities AS
SELECT
    customer_id,
    DATE(event_ts) AS event_date,
    event_ts,
    event_type
FROM raw_activity_logs
WHERE customer_id IS NOT NULL;