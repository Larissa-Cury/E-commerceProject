 --                              This code was created by Larissa da S. Cury (https://github.com/Larissa-Cury)
 
 --*) The code stabilishes the relantionships among the PRIMARY (PK) and FOREIGN (FK) in the "ManedWolfPetCenterDB";

 USE ManedWolfPetCenterDB
 
-- 1/4 => FK in dim_products and PK in dim_category

ALTER TABLE dim_products  -- add the FK
ADD CONSTRAINT FK_dim_products_PK_dim_category  -- FK constraint for identification
FOREIGN KEY (category_id)  -- column that will act as the FK.
REFERENCES dim_category(category_id);  -- Reference the PK 

-- 2/4 => FK in fact_sales and PK in dim_products

ALTER TABLE fact_sales  -- add the FK
ADD CONSTRAINT FK_fact_sales_PK_dim_products  -- FK constraint for identification
FOREIGN KEY (product_id)  -- column that will act as the FK.
REFERENCES dim_products(product_id);  -- Reference the PK 

-- REPEAT FOR THE REMAINING TABLES




-- 3/4 => FK in fact_sales and PK in dim_customers

ALTER TABLE fact_sales  -- add the FK
ADD CONSTRAINT FK_fact_sales_PK_dim_customers  -- FK constraint for identification
FOREIGN KEY (customer_id)  -- column that will act as the FK.
REFERENCES dim_customers(customer_id);  -- Reference the PK 

-- 4/4 => FK in fact_sales and PK in dim_distributors

ALTER TABLE fact_sales  -- add the FK
ADD CONSTRAINT FK_fact_sales_PK_dim_distributors  -- FK constraint for identification
FOREIGN KEY (distributor_id)  -- column that will act as the FK.
REFERENCES dim_distributors(distributor_id);  -- Reference the PK 


