/*
👉 Sales by Customers:
	- What is the average transaction value (ATV) ?
	- How does the aaverage transaction value (ATV) change over time (yearly)?
*/

USE ManedWolfPetCenterDB;

-- Overall ATV across years

SELECT
	FORMAT(SUM(S.total_amount) / COUNT(S.order_id), 'C2') AS 'OVERALL_ATV' -- Total Revenue / N. of Orders formated in currency w/ 2 decimals
FROM fact_sales AS S

-- Overall ATV across years by region

SELECT
    D.distributor_region AS 'REGION',
	FORMAT(SUM(S.total_amount) / COUNT(S.order_id), 'C2') AS 'ATV' -- Total Revenue / N. of Orders formated in currency w/ 2 decimals
FROM fact_sales AS S
INNER JOIN dim_distributors AS D ON D.distributor_id = S.distributor_id -- Join both to obtain Region information
GROUP BY D.distributor_region -- Group by Region
ORDER BY ATV DESC -- Order from the biggest ATV to lowest

-- ATV by Year  
SELECT
	YEAR(S.sale_date) AS YR, -- Obtain Year
	FORMAT(SUM(S.total_amount) / COUNT(S.order_id), 'C2') AS 'ATV' -- Total Revenue / N. of Orders formated in currency w/ 2 decimals
FROM fact_sales AS S
GROUP BY YEAR(S.sale_date) -- Group by Year
ORDER BY YR DESC -- Order from 2024 to 2022

-- ATV by Year and Region

SELECT
	YEAR(S.sale_date) AS YR, -- Obtain Year
    D.distributor_region AS 'REGION', -- Obtain Region
	FORMAT(SUM(S.total_amount) / COUNT(S.order_id), 'C2') AS 'ATV' -- Total Revenue / N. of Orders formated in currency w/ 2 decimals
FROM fact_sales AS S
INNER JOIN dim_distributors AS D ON D.distributor_id = S.distributor_id -- Join both to obtain Region information
GROUP BY D.distributor_region, YEAR(S.sale_date)
ORDER BY YR, ATV DESC -- Order from the greatest ATV to the lowest

