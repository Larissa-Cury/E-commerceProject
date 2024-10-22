/*
👉 Overall Sales 

    - What is the total and average sales revenue across years ? 
    - What is the total and average revenue per year? 
*/

USE ManedWolfPetCenterDB;

 -- What is the total and average sales revenue across years ? 

SELECT
	FORMAT(SUM(S.total_amount),'C0') AS 'Total Sales', -- Sum up all data and format in $ style w/ 0 decimals
	FORMAT(AVG(S.total_amount), 'C2') AS 'Sales Avg' -- Avg all data and format in $ style w/ 2 decimals
FROM fact_sales AS S

   -- What is the total and average revenue per year? 
SELECT
    YEAR(S.sale_date) AS 'Year',
	FORMAT(SUM(S.total_amount), 'C0') AS 'Total Sales Per Year',
	FORMAT(AVG(S.total_amount), 'C2') AS 'Sales Avg Per Year'
FROM fact_sales AS S
GROUP BY (YEAR(S.sale_date))
ORDER BY YEAR DESC --Order in DESC order

