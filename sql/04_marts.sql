CREATE TABLE marts_retention AS
WITH baseline AS (
    SELECT
        week_num,
        AVG(retention_rate) AS baseline_rate
    FROM cohort_retention
    WHERE cohort_month < '2025-06-01'
    GROUP BY week_num
),
june AS (
    SELECT
        week_num,
        retention_rate AS june_rate
    FROM cohort_retention
    WHERE cohort_month = '2025-06-01'
)
SELECT
    b.week_num,
    ROUND(b.baseline_rate*100, 1) AS baseline_pct,
    ROUND(j.june_rate*100, 1) AS june_pct,
    ROUND((j.june_rate - b.baseline_rate)*100, 1) AS delta_pp
FROM baseline b
JOIN june j USING (week_num)
ORDER BY b.week_num;