## E-commerce Sales Project 
<img align="right" width="500" height="320" src="https://drive.google.com/uc?id=1dP7f8_ORmpAoVGIVIE5zeCCNPmubNNJJ">
This project analysis a 2-year interval data of a fictionous e-commerce company. The tools used in this project were R, SQL and Power Bi.

<br><br>
<br><br>
<br><br>

## Generating the data in R 

In total, I generated the following datasets using R programming language (in RStudio) to be latter evaluated in SQL and Power Bi. 

### Dimension Tables

1. **dim_customers**
   - `customer_id`: Unique identifier for each customer
   - `first_name`: Customer's first name
   - `last_name`: Customer's last name
   - `email`: Customer's email address
   - `phone`: Customer's phone number
   - `registration_date`: Date when the customer registered
   - `age`: Age of the customer
   - `marital_status`: Marital status of the customer
   - `number_of_pets`: Number of pets owned by the customer

2. **dim_products**
   - `product_id`: Unique identifier for each product
   - `product_name`: Name of the product
   - `category_id`: Identifier for the product category
   - `category`: Name of the product category
   - `pet_type`: Type of pet the product is for (e.g., dog, cat)
   - `price`: Price of the product
   - `stock_quantity`: Quantity of the product available in stock

3. **dim_categories**
   - `category_id`: Unique identifier for each product category
   - `category_name`: Name of the product category
   - `category_description`: Description of the product category

4. **dim_distributors**
   - `distributor_id`: Unique identifier for each distributor
   - `distributor_region`: Geographical region of the distributor
   - `distributor_state`: State where the distributor is located
   - `latitude`: Latitude of the distributor's location
   - `longitude`: Longitude of the distributor's location

### Fact Table

5. **fact_sales**
   - `order_id`: Unique identifier for each order
   - `product_id`: Identifier of the purchased product
   - `customer_id`: Identifier of the customer making the purchase
   - `distributor_id`: Identifier of the distributor fulfilling the order
   - `sale_date`: Date of the sale
   - `quantity`: Quantity of products purchased
   - `total_amount`: Total amount for the purchase
   - `expected_delivery_date`: Estimated delivery date
   - `actual_delivery_date`: Actual delivery date

