-- =====================================
-- Analysis: Churn by Customer Tenure
-- Purpose: Analyze churn across
-- customer tenure groups.
-- =====================================

SELECT
CASE 
WHEN tenure <= 12 THEN 'O-12 MONTHS'
WHEN tenure <= 24 THEN '13-24 MONTHS'
WHEN tenure <= 48 THEN '25-48 MONTHS'
ELSE '49-72 MONTHS'
END AS tenure_group,
COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS customers_lost,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telco_customer
GROUP BY tenure_group
ORDER BY MIN(tenure);
