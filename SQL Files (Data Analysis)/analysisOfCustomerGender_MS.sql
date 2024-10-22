/*
👉 Analysis of Customer Behavior

1) Are there differences in purchases between male and female customers?
2) Do single and divorced customers spend differently compared to married costumers?

*/

USE ManedWolfPetCenterDB;

SELECT
    C.gender AS GENDER,
	FORMAT(SUM(S.total_amount), 'C0') AS SALES, -- Format to currency w/ no decimals
    FORMAT(SUM(S.total_amount) / (
	                        SELECT
							SUM(total_amount)
							FROM fact_sales) * 100.0, 'N2') AS 'SALES %' -- Calculate percentage of each gender to revenue
FROM fact_sales AS S
INNER JOIN dim_customers AS C ON C.customer_id = S.customer_id -- Join to obtain Customer's Gender Information
GROUP BY C.gender;

-- Sales by Year 

WITH SALES_CTE (YR, GENDER, SALES)
AS(
	SELECT
		YEAR(S.sale_date) AS YR,  -- Extract Year
		C.gender AS GENDER,
		SUM(S.total_amount) AS SALES -- Sum total sales
	FROM fact_sales AS S
	INNER JOIN dim_customers AS C ON C.customer_id = S.customer_id  -- Join to obtain Customer's Gender Information
	GROUP BY C.gender, YEAR(S.sale_date) -- Group by Gender and Year
)
SELECT 
	YR, GENDER, 
	FORMAT(SALES, 'C0') AS SALES, -- Format to currency w/ no decimals
	FORMAT(SALES / SUM(SALES) OVER (
					 PARTITION BY YR) * 100.0, 'N2') AS 'SALES %' -- Calculate percentage of each gender to revenue
FROM SALES_CTE 
ORDER BY YR, GENDER

-- Do single and divorced customers spend differently compared to married costumers?

SELECT
    C.marital_status AS 'MARITAL_STATUS',
	FORMAT(SUM(S.total_amount), 'C0') AS SALES, -- Format to currency w/ no decimals
    FORMAT(SUM(S.total_amount) / (
	                        SELECT
							SUM(total_amount)
							FROM fact_sales) * 100.0, 'N2') AS 'SALES %' -- Calculate percentage of each gender to revenue
FROM fact_sales AS S
INNER JOIN dim_customers AS C ON C.customer_id = S.customer_id -- Join to obtain Customer's Gender Information
GROUP BY C.marital_status
ORDER BY 'SALES %' DESC

-- Sales by Year 

WITH SALES_CTE (YR, MARITAL_STATUS, SALES)
AS(
	SELECT
		YEAR(S.sale_date) AS YR, -- Extract Year
		C.marital_status AS 'MARITAL_STATUS',
		SUM(S.total_amount) AS SALES 
	FROM fact_sales AS S
	INNER JOIN dim_customers AS C ON C.customer_id = S.customer_id -- Join to obtain Customer's Gender Information
	GROUP BY C.marital_status, YEAR(S.sale_date)
)
SELECT 
	YR, MARITAL_STATUS, 
	FORMAT(SALES, 'C0') AS SALES, -- Format to currency w/ no decimals
	FORMAT(SALES / SUM(SALES) OVER (
					 PARTITION BY YR) * 100.0, 'N2') AS 'SALES %' -- Calculate percentage of each gender to revenue
FROM SALES_CTE 
ORDER BY YR, MARITAL_STATUS, 'SALES %' DESC