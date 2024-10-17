## E-commerce Sales Project 
<img align="right" width="500" height="320" src="https://drive.google.com/uc?id=1dP7f8_ORmpAoVGIVIE5zeCCNPmubNNJJ">
This project analysis a 4-year interval data of a fictionous e-commerce company especilized in the Pet Market. The company mostly attends adults (20-60y) who own either a dog or a cat. The pet shop especializes in 5 different product categories (food, snacks, medicine, toys and hygine), for which the company offers 10 different products. The pet shop has delivery deals with 5 distribution centers in the city of Rio de Janeiro, in 5 different regions of the city (South, North, West, "Baixada Fluminense" and Downtown).
<br>
The tools used in this project were R, SQL and Power Bi.

<br><br>

## Generating the data in R 
<img align="right" width="500" height="320" src="https://drive.google.com/uc?id=1GYJsIZc6gqhxgwJAI6__pmzr1_loxYCZ">
In total, I generated the following datasets using R programming language (in RStudio) to be latter evaluated in SQL and Power Bi. 
<br> <br>
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
     -  `gender`: Gender of the customer
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
  
  1. **fact_sales**
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

<br><br>
<br><br>

## Importing .CSV files and creating a DB in SQL

### Step 1: Create a new database  

This phase encompasses creating a database from scratch by importing multiple CSV files into SQL Server. To do it, I first created a new database called "MannedWolfPetCenterDB" using CREATE DATABASE;

### Step 2: Create each table of the database corresponding the datafiles of the .CSV files.

I created 5 tables using CREATE TABLE. For each, I specified the PRIMARY KEY:

### Step 3: Insert the .CSV files into the MannedWolfPetCenterDB's tables

With the tables created, I used INSERT BULK to insert the corresponding CSV files from my computer into the new tables

## Creating a data model in SQL

### Step 1: Create the empty data model, still without the relantionships

I created a diagram to display the data model via creating a new DB Diagram. The picture displays it. 

### Step 2: Estabilishing the relantionships among the PK and FK of the tables. 

Now I'll be using ALTER TABLE to establish the relationships between each PK and its corresponding foreign keys (FK).


<br>
Click <a href="https://github.com/Larissa-Cury/E-commerceProject/tree/8ac17a02d44452e4108c29fb308b85404a9ba64a/SQL%20Files/Create%20DB" target="_blank">here</a> to access the SQL code in Github

<br><br>

### Step 3: BULK INSERT the .CSV files into the existing tables

## Creating the data model in SQL

In this step, I estabilished the relantionsips between the tables' PRIMARY KEYs to their corresponding FOREIGN KEYs in other tables



