/*
👉 Analysis of Customer Behavior

2) Do customers with more pets spend more ? 
2) Do customers with more pets spend more on specific categories ? 

*/

USE ManedWolfPetCenterDB;

WITH N_CTE(CUSTOMER_ID, SALES, N_OF_PETS)
AS(
	SELECT
		S.customer_id AS CUSTUMER_ID,
		S.total_amount AS SALES,
		CASE 
			WHEN C.number_of_pets = 1 THEN 'One pet'  -- Classify who owns 1 pet
			WHEN C.number_of_pets = 2 THEN 'Two Pets' -- Classify who owns 2 pets
			ELSE 'More than 2' -- Classify who owns more than 2 pets
		END AS N_OF_PETS
	FROM fact_sales AS S
	INNER JOIN dim_customers AS C ON C.customer_id = S.customer_id -- Join to obtain how many pets each customer has
)
SELECT
	N_OF_PETS,
	COUNT(CUSTOMER_ID) AS N_CLIENTS,
	FORMAT(SUM(SALES), 'C0') AS ALL_SALES -- Sum up Sales 
FROM N_CTE
GROUP BY N_OF_PETS  -- Group by pet ownership status
ORDER BY  ALL_SALES DESC; -- Order in descending way


-- 2) How does each customer profile spend on each category?

WITH N_CTE_CAT(CUSTOMER_ID, CAT_NAME, PURCHASE, N_OF_PETS)
AS(
	SELECT
	    S.customer_id AS CUSTOMER_ID,
		CAT.category_name AS CAT_NAME, -- Category Name
		S.total_amount AS PURCHASE,    
		CASE 
			WHEN C.number_of_pets = 1 THEN 'One pet'  -- Classify who owns 1 pet
			WHEN C.number_of_pets = 2 THEN 'Two Pets' -- Classify who owns 2 pets
			ELSE 'More than 2' -- Classify who owns more than 2 pets
		END AS N_OF_PETS
	FROM fact_sales AS S
	INNER JOIN dim_customers AS C ON C.customer_id = S.customer_id 
	INNER JOIN dim_products AS P ON P.product_id = S.product_id
	INNER JOIN dim_category AS CAT ON CAT.category_id = P.category_id
)
SELECT
CAT_NAME,
	N_OF_PETS,
		RANK() OVER (
					PARTITION BY CAT_NAME
					ORDER BY SUM(PURCHASE) DESC) AS SALES_RANK, -- Obtain RANK for each Category in descending way
	FORMAT(SUM(PURCHASE), 'C0') AS SALES -- Sum up Sales
FROM N_CTE_CAT
GROUP BY N_OF_PETS, CAT_NAME -- Group by both Number of Pets and Category Name
