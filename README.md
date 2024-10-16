## E-commerce Sales Project 
<img align="right" width="500" height="320" src="https://drive.google.com/uc?id=1dP7f8_ORmpAoVGIVIE5zeCCNPmubNNJJ">
This project analysis a 2-year interval data of a fictionous e-commerce company. The tools used in this project were R, SQL and Power Bi.

## Generating the data in R 

In total, I generated the following datasets using R programming language (in RStudio) to be latter evaluated in SQL and Power Bi. 

# Dimension Tables

1. **dim_customers**
   - `customer_id`: Unique identifier for each customer
   - `customer_name`: Name of the customer
   - `region`: Geographical region where the customer resides
   - `number_of_pets`: Number of pets owned by the customer

2. **dim_products**
   - `product_id`: Unique identifier for each product
   - `product_name`: Name of the product
   - `category`: Category of the product (e.g., Food, Toys)
   - `price`: Price of the product

3. **dim_distributors**
   - `distributor_id`: Unique identifier for each distributor
   - `distributor_region`: Geographical region of the distributor
   - `distributor_state`: State where the distributor is located
   - `longitude`: Longitude of the distributor's location
   - `latitude`: Latitude of the distributor's location

# Fact Table

4. **fact_sales**
   - `order_id`: Unique identifier for each order
   - `product_id`: Identifier of the purchased product
   - `customer_id`: Identifier of the customer making the purchase
   - `distributor_id`: Identifier of the distributor fulfilling the order
   - `sale_date`: Date of the sale
   - `quantity`: Quantity of products purchased
   - `total_amount`: Total amount for the purchase
   - `expected_delivery_date`: Estimated delivery date
   - `actual_delivery_date`: Actual delivery date
