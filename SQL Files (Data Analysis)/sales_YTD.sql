
/*
👉 Overall Sales 
    - Calculate Year-to-Date (YTD) 
*/

USE ManedWolfPetCenterDB;

WITH TOTAL_SALES(YR, MO, Sales) -- The CTE provies the Sum of Sales by Year and Month
AS(
	SELECT
		YEAR(S.sale_date) AS 'YR',
		MONTH(S.sale_date) AS 'MO',
		SUM(S.total_amount) AS 'Sales'
	FROM fact_sales AS S
	GROUP BY YEAR(S.sale_date), MONTH(S.sale_date) -- Group by Year and Month in ASC order
)
SELECT 
	YR, MO, 
	FORMAT(Sales, 'C0') AS SALES, -- Format as $ w/ no decimals
	FORMAT(SUM(Sales) OVER (    -- Sum Up "Sales", group by YEAR and order the calculations by MO
						PARTITION BY YR
						ORDER BY MO), 'C0') AS YTD_SALES, -- Format as $ w/ no decimals
	FORMAT(SUM(Sales) OVER (
						PARTITION BY YR), 'C0') AS SALES_YEAR -- Sales per Year
FROM TOTAL_SALES
ORDER BY YR, MO;

-- Achieving Same Result With FRAMES 

WITH TOTAL_SALES(YR, MO, Sales) -- The CTE provies the Sum of Sales by Year and Month
AS(
	SELECT
		YEAR(S.sale_date) AS 'YR',
		MONTH(S.sale_date) AS 'MO',
		SUM(S.total_amount) AS 'Sales'
	FROM fact_sales AS S
	GROUP BY YEAR(S.sale_date), MONTH(S.sale_date) -- Group by Year and Month in ASC order
)
SELECT
	YR, MO,
	FORMAT(Sales, 'C0') AS SALES, -- Format as $ w/ no decimals
	FORMAT(SUM(Sales) OVER (
				PARTITION BY YR
				ORDER BY YR, MO ASC
				ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 'C0') AS YTD_SALES, -- Select everything until current row
	FORMAT(SUM(Sales) OVER (
				PARTITION BY YR), 'C0') AS YR_SALES -- Sum up Sales for the whole period 
FROM TOTAL_SALES

