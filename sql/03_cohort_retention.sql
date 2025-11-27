CREATE TABLE cohort_retention AS
WITH cohort_sizes AS (
    SELECT
          cohort_month,
          COUNT(*) AS cohort_size
    FROM stg_customers
    GROUP BY cohort_month
),
active_weeks AS (
    SELECT
        cohort_month,
        week_num,
        COUNT(DISTINCT customer_id) AS active_users
    FROM labeled_weeks
    GROUP BY cohort_month, week_num
)
SELECT
    a.cohort_month,
    a.week_num,
    a.active_users,
    a.active_users * 1.0 / c.cohort_size AS retention_rate
FROM active_weeks a
JOIN cohort_sizes c USING (cohort_month);