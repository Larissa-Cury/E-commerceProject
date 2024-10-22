
-- Sales Year-to-date (filtered by Jan - Sept)

/*
Business Goal:
Calculate Year-over-Year (YOY) growth in total sales for Jan–Nov 2024 compared to Jan–Nov 2023 and Jan–Nov 2022. 
*/

USE ManedWolfPetCenterDB;

WITH SALES_JAN_SEPT (YR, MO, Sales)
AS(
	SELECT
		YEAR(S.sale_date) AS YR,
		MONTH(S.sale_date) AS MO,
		SUM(S.total_amount) AS Sales -- Total Sales Per YR and MO
	FROM fact_sales AS S
	WHERE MONTH(S.sale_date) <= 9 -- Only calculate dates from Jan (01) to September (09)
	GROUP BY YEAR(S.sale_date), MONTH(S.sale_date)
)
SELECT
	YR, MO,
	FORMAT(Sales, 'C0') AS SALES,
	FORMAT(SUM(Sales) OVER(
				PARTITION BY YR
				ORDER BY YR, MO ASC
				ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 'C0') AS YOY_SALES,
	FORMAT(SUM(Sales) OVER (
				PARTITION BY YR), 'C0') AS YR_SALES -- Compare the total sum of JAN - SEPT ROWISE
FROM SALES_JAN_SEPT;

--- Other way 

WITH SALES_JAN_SEPT(YR, MO, Sales)
AS(
	SELECT
		YEAR(S.sale_date) AS YR,
		MONTH(S.sale_date) AS MO,
		SUM(S.total_amount) AS Sales
	FROM fact_sales AS S
	WHERE MONTH(S.sale_date) <= 9 -- Only September
	GROUP BY YEAR(S.sale_date), MONTH(S.sale_date)
	)
SELECT
	YR, MO,
	FORMAT(Sales, 'C0') AS SALES,
	FORMAT(SUM(Sales) OVER(
				PARTITION BY YR
				ORDER BY MO), 'C0') AS YOY_SALES,
    FORMAT(SUM(Sales) OVER(
				PARTITION BY YR), 'C0') AS YR_Sales
FROM SALES_JAN_SEPT