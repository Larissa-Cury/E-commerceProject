/*
👉 Sales by Royalty Tier
	- How many customers are there in each category?
	- How much do the customers in each category the loyalty program spend per year?
	- What is the Average Transaction Value (ATV) for Gold, Silver, and Bronze tier customers?
	- What percentage of total revenue comes from each loyalty category?
*/

USE ManedWolfPetCenterDB;

SELECT
	C.loyalty_status AS LOYALTY_CAT,
	COUNT(S.customer_id) AS N_CUSTOMER, -- Count Customers that have made orders
	FORMAT(SUM(S.total_amount), 'C0') AS SALES,
	FORMAT(SUM(S.total_amount) / COUNT(S.order_id), 'C2') AS ATV, -- Average Transaction Value for each cat (_same result w/ AVG()_)
	FORMAT(SUM(S.total_amount) / (
							SELECT 
							SUM(total_amount)
							FROM fact_sales
							) * 100.0, 'N2') AS 'SALES %' -- Calculate contribution of each Cat to overall revenue
FROM fact_sales AS S
INNER JOIN dim_customers AS C ON C.customer_id = S.customer_id
GROUP BY C.loyalty_status
ORDER BY N_CUSTOMER DESC, 'SALES %' DESC -- Order from the greasted % to the lowest %

 -- What is the Average Transaction Value (ATV) for Gold, Silver, and Bronze tier customers?

