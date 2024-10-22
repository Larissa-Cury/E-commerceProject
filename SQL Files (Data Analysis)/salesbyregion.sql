
/*
👉 Sales by Region:

	- What is the total and average sales revenue for each region (South, North, West, Baixada Fluminense, Downtown)?
	 - Which region contributes the most to overall sales?
	- How much does each category sells in each region?
	- Which category sells more in each region?
*/

USE ManedWolfPetCenterDB; 

-- Calculate sales per region and how much each region contributes total sales

SELECT 
	d.distributor_region AS REGION,
	FORMAT(SUM(S.total_amount), 'C0') AS SALES,
	FORMAT(AVG(S.total_amount), 'C2') AS AVG_SALES,
	FORMAT(SUM(S.total_amount) / (
		                        SELECT SUM(total_amount) 
		  						FROM fact_sales) * 100.0, 'N2') AS 'SALES %'  -- Subquery to calculate TOTAL SALES without grouping by Region
FROM fact_sales AS S 
INNER JOIN dim_distributors AS D ON D.distributor_id = S.distributor_id
GROUP BY d.distributor_region
ORDER BY SUM(S.total_amount) DESC

-- How much does each category sells in each region?
-- Which region sells more of each category? (what's the rank?)

WITH SALES_CTE (CATEGORY_NAME, REGION, SALES, AVG_SALES)
AS(
	SELECT 
		CAT.category_name AS 'CATEGORY_NAME',
		D.distributor_region AS REGION,
		FORMAT(SUM(S.total_amount), 'C0') AS SALES,
		FORMAT(AVG(S.total_amount), 'C2') AS AVG_SALES
	FROM fact_sales AS S 
	INNER JOIN dim_distributors AS D ON D.distributor_id = S.distributor_id
	INNER JOIN dim_products AS P ON P.product_id = S.product_id
	INNER JOIN dim_category AS CAT on CAT.category_id = P.category_id
	GROUP BY CAT.category_name, d.distributor_region
)
SELECT
	CATEGORY_NAME, REGION,
		RANK () OVER (  
					PARTITION BY CATEGORY_NAME
					ORDER BY SALES DESC) AS SALES_RANK,
	SALES, AVG_SALES
FROM SALES_CTE

-- Which category sells more in each region?
SELECT 
	D.distributor_region AS REGION,
	CAT.category_name AS 'CATEGORY NAME',
	RANK() OVER (	
				 PARTITION BY D.distributor_region
				 ORDER BY SUM(S.total_amount) DESC) AS SALES_RANK,
	FORMAT(SUM(S.total_amount), 'C0') AS SALES,
	FORMAT(AVG(S.total_amount), 'C2') AS AVG_SALES
FROM fact_sales AS S 
INNER JOIN dim_distributors AS D ON D.distributor_id = S.distributor_id
INNER JOIN dim_products AS P ON P.product_id = S.product_id
INNER JOIN dim_category AS CAT on CAT.category_id = P.category_id
GROUP BY CAT.category_name, d.distributor_region


