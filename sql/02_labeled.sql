CREATE TABLE labeled_weeks AS
WITH base AS (
    SELECT
        c.customer_id,
        c.start_date,
        DATE_TRUNC('month', c.start_date) AS cohort_month,
        a.event_date
    FROM stg_customers c
    LEFT JOIN stg_activities a USING (customer_id)
),
weekly AS (
    SELECT
        customer_id,
        cohort_month,
        start_date,
        event_date,
        CASE
            WHEN event_date >= start_date AND event_date < start_date + INTERVAL '7 day'  THEN 1
            WHEN event_date >= start_date + INTERVAL '7 day' AND event_date < start_date + INTERVAL '14 day' THEN 2
            WHEN event_date >= start_date + INTERVAL '14 day' AND event_date < start_date + INTERVAL '21 day' THEN 3
        END AS week_num
    FROM base
)
SELECT DISTINCT
    customer_id,
    cohort_month,
    week_num
FROM weekly
WHERE week_num IS NOT NULL;