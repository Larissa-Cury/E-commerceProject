 --                              This code was created by Larissa da S. Cury (https://github.com/Larissa-Cury)

 
 --*) The code creates a new DB called "ManedWolfPetCenterDB";
 --*) The code creates 5 tables in the "ManedWolfPetCenterDB" DB (4 Dim followed by 1 Fact Tables);
 --*) The code loads each corresponding CSV file into the created tables in the DB.
 
-- CREATE DATABASE ManedWolfPetCenterDB; -- Create the DB Called "ManedWolfPetCenterDB"

USE ManedWolfPetCenterDB -- Use DB Called "ManedWolfPetCenterDB"

-- 1/5 CREATE: DIM_CUSTOMERS

CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY, -- Set PK
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    registration_date DATE,
    age INT,
    gender VARCHAR(10),
    marital_status VARCHAR(20),
    number_of_pets INT,           
    loyalty_status VARCHAR(20),
    region VARCHAR(50)
);

-- Insert dim_customers in the created table in the db --

BULK INSERT dim_customers 
FROM 'C:/Users/laris/OneDrive/Documentos/Transição de Carreira/Portifolio/petshop/tables/dim_customers.csv'  
WITH (
    FIELDTERMINATOR = ',',  -- field delim
    ROWTERMINATOR = '\n',   -- line delim
    FIRSTROW = 2            -- uses header
); 

-- REPEAT THE PROCEDURE FOR THE OTHER TABLES


-- 2/5 CREATE: DIM_PRODUCTS

CREATE TABLE dim_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(100),
    category_id VARCHAR(50),
    pet_type VARCHAR(20),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Insert dim_products in the created table in the db --

BULK INSERT dim_products 
FROM 'C:/Users/laris/OneDrive/Documentos/Transição de Carreira/Portifolio/petshop/tables/dim_products.csv'  
WITH (
    FIELDTERMINATOR = ',',  -- field delim
    ROWTERMINATOR = '\n',   -- line delim
    FIRSTROW = 2            -- uses header
);

-- 3/5 CREATE: DIM_CATEGORY

CREATE TABLE dim_category (
    category_id VARCHAR(50) PRIMARY KEY,
    category_name VARCHAR(100),
    category_description VARCHAR(255)
);

-- Insert dim_category in the created table in the db --

BULK INSERT dim_category 
FROM 'C:/Users/laris/OneDrive/Documentos/Transição de Carreira/Portifolio/petshop/tables/dim_categories.csv'  
WITH (
    FIELDTERMINATOR = ',',  -- field delim
    ROWTERMINATOR = '\n',   -- line delim
    FIRSTROW = 2            -- uses header
);

-- 4/5 CREATE: DIM_DISTRIBUTORS

CREATE TABLE dim_distributors (
    distributor_id VARCHAR(50) PRIMARY KEY,
    distributor_region VARCHAR(50),
    distributor_location VARCHAR(100),
    distributor_state VARCHAR(10), -- I had to add extra n
    latitude  DECIMAL(9,6),
    longitude DECIMAL(9,6)
);

-- Insert distributors in the created table in the db --

INSERT INTO
		dim_distributors (
		distributor_id,
		distributor_region,
		distributor_location,
		distributor_state,
		latitude,
		longitude)
VALUES 
    ('D_1', 'South', 'Copacabana Palace', 'RJ', -22.96731, -43.17895),
    ('D_2', 'North', 'North Shopping', 'RJ', -22.88660, -43.25740),
    ('D_3', 'West', 'Barra Shopping', 'RJ', -22.99870, -43.36710),
    ('D_4', 'Baixada Fluminense', 'August, 25th Avenue', 'RJ', -22.91011, -43.17898),
    ('D_5', 'Downtown', 'Cinelândia', 'RJ', -22.79395, -43.33277);

-- OG CODE: 
-- Note. I was having trouble to bulk insert the table, so I've done it manually instead => 
--BULK INSERT dim_distributorsS
--FROM 'C:/Users/laris/OneDrive/Documentos/Transição de Carreira/Portifolio/petshop/tables/dim_distributors.csv'  
--WITH (
--    FIELDTERMINATOR = ',',  -- field delimiter
--    ROWTERMINATOR = '\n',   -- row delimiter
--    FIRSTROW = 2            --
--)

-- 5/5 CREATE: FACT_SALES

CREATE TABLE fact_sales (
    order_id INT PRIMARY KEY,
    product_id VARCHAR(50),
    customer_id INT,
    distributor_id VARCHAR(50),
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10, 2),
    expected_delivery_date DATE,
    actual_delivery_date DATE
);

-- Insert fact_sales in the created table in the db --

BULK INSERT fact_sales
FROM 'C:/Users/laris/OneDrive/Documentos/Transição de Carreira/Portifolio/petshop/tables/fact_sales.csv'  
WITH (
    FIELDTERMINATOR = ',',  -- field delimiter
    ROWTERMINATOR = '\n',   -- row delimiter
    FIRSTROW = 2            -- uses header
);




