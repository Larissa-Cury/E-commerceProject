## E-commerce Sales Project 
<img align="right" width="500" height="320" src="https://drive.google.com/uc?id=1dP7f8_ORmpAoVGIVIE5zeCCNPmubNNJJ">
This project analysis a 2-year interval data of a fictionous e-commerce company. The tools used in this project were R, SQL and Power Bi.

<br><br>
<br><br>
<br><br>

## Generating the data in R 

In total, I generated the following datasets using R programming language (in RStudio) to be latter evaluated in SQL and Power Bi. 

<details>
  <summary>Dimension Tables</summary>
  
  1. **dim_customers**
     - `customer_id`: Unique identifier for each customer
     - `first_name`: Customer's first name
     - `last_name`: Customer's last name
     - `email`: Customer's email address
     - `phone`: Customer's phone number
     - `registration_date`: Date of customer registration
     - `age`: Age of the customer
     - `marital_status`: Customer's marital status
     - `number_of_pets`: Number of pets owned

  2. **dim_products**
     - `product_id`: Unique product identifier
     - `product_name`: Name of the product
     - `category_id`: Product category identifier
     - `category`: Name of the category
     - `pet_type`: Type of pet the product is for
     - `price`: Price of the product
     - `stock_quantity`: Available stock quantity

  3. **dim_categories**
     - `category_id`: Unique category identifier
     - `category_name`: Name of the category
     - `category_description`: Description of the category

  4. **dim_distributors**
     - `distributor_id`: Unique distributor identifier
     - `distributor_region`: Distributor's geographical region
     - `distributor_state`: State of the distributor
     - `latitude`: Latitude of distributor's location
     - `longitude`: Longitude of distributor's location

</details>

<details>
  <summary>Fact Table</summary>
  
  5. **fact_sales**
     - `order_id`: Unique order identifier
     - `product_id`: Purchased product identifier
     - `customer_id`: Customer identifier
     - `distributor_id`: Distributor identifier
     - `sale_date`: Date of the sale
     - `quantity`: Quantity purchased
     - `total_amount`: Total purchase amount
     - `expected_delivery_date`: Estimated delivery date
     - `actual_delivery_date`: Actual delivery date

</details>

