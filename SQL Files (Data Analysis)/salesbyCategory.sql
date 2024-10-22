
-- Sales by Product Cateogory 

/*
  _What is the total and average sales revenue for each product category (food, snacks, medicine, toys, hygiene) across years ?_
  _What is the total and average sales revenue for each product category (food, snacks, medicine, toys, hygiene) per year?_
  _Which product has the greatest and the lowest sales across years and in each year?_
*/

USE ManedWolfPetCenterDB;

SELECT
    CAT.category_name AS 'CATEGORY NAME', -- Return CAT_Name 
	FORMAT(SUM(S.total_amount), 'C0') AS SALES, -- Format in $ w/ 0 decimal
	FORMAT(AVG(S.total_amount), 'C2') AS AVG_SALES -- Format in $ w/ 2 decimals
FROM fact_sales AS S
INNER JOIN dim_products AS P ON P.product_id = S.product_id -- Join S and P by "Product Id"
INNER JOIN dim_category AS CAT ON CAT.category_id = P.category_id -- Join CAT and P by "Category Id"
GROUP BY CAT.category_name -- Group by Category
ORDER BY SUM(S.total_amount) DESC -- Order from the highiest cat to the lowest 

-- Breaking down total and avg sales of products by year

SELECT
    YEAR(S.sale_date) AS YR, -- Extract YEAR 
    CAT.category_name AS 'CATEGORY NAME', -- Return CAT_Name 
	FORMAT(SUM(S.total_amount), 'C0') AS SALES, -- Format in $ w/ 0 decimal
	FORMAT(AVG(S.total_amount), 'C2') AS AVG_SALES -- Format in $ w/ 2 decimals
FROM fact_sales AS S
INNER JOIN dim_products AS P ON P.product_id = S.product_id -- Join S and P by "Product Id"
INNER JOIN dim_category AS CAT ON CAT.category_id = P.category_id -- Join CAT and P by "Category Id"
GROUP BY CAT.category_name, YEAR(S.sale_date) -- Group by both YR and Category
ORDER BY YEAR(S.sale_date), SUM(S.total_amount) DESC -- Order by year from the highiest cat to the lowest 