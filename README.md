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
<img align="right" width="500" height="450" src="https://drive.google.com/uc?id=1HHn4R9Ix-q_x6y1szUHl6xPp7qEb0WKt">

### Step 1: Create a new database  

This phase encompasses creating a database from scratch by importing multiple CSV files into SQL Server. To do it, I first created a new database called "MannedWolfPetCenterDB" using `CREATE DATABASE`;

### Step 2: Create each table of the database corresponding the datafiles of the .CSV files.

I created 5 tables using `CREATE TABLE`. For each, I specified the PRIMARY KEY:

### Step 3: Insert the .CSV files into the MannedWolfPetCenterDB's tables

With the tables created, I used `INSERT BULK` to insert the corresponding .CSV files from my computer into the new tables

## Creating a Data Model in SQL

### Step 1: Create the Empty Data Model (Without Relationships)
I created a diagram to display the initial data model by setting up a new DB Diagram. The image below shows the data model without any established relationships.

<div align="center">
  <img width="500" height="320" 
       src="https://drive.google.com/uc?id=13vkSjDcsHWd3Bx9m76MUaxjyL8oX2g0-">
</div>

### Step 2: Establish the Relationships Among the Primary Keys (PK) and Foreign Keys (FK)

Next, I used the `ALTER TABLE` statement to establish the relationships between each PK and its corresponding FK, as represented in the image above.

<div align="center">
  <img width="500" height="320" 
       src="https://drive.google.com/uc?id=1NPc9k9RbpJe9gcHcbza6zPkMgbZpIT69">
</div>

### Step 3: Display the Final Data Model

The final diagram visually represents the completed data model, showing the relationships between the tables according to their respective PK and FK.

<div align="center">
  <img width="500" height="320" 
       src="https://drive.google.com/uc?id=13vkSjDcsHWd3Bx9m76MUaxjyL8oX2g0-">
</div>

## Analyzing Sales Performance Across Years 

Business Problems: 

* _What is the overall sales gross revenue generated during the past three years?_
  
   - The total sales considering all periods is `$4,587,920` with a mean of `$211.30` per year. This number in isolation does not tell much. Because of that, I also analyzed Sales YTD in order to compare the sales growth over the months and years. If the company had a threshold to achieve, which could be from its own or based on market trends, then comparing the total sales to it would be an interesting KPI.
     
* _How are sales growting considering previous full-year performances?_

  - The total sales was `$1,655,673` in 2022, `$1,673,819` in 2023 and `$1,258,429` from Jan to Sept 2024. Considering the full-years, there was a growth of ~ `1.1% ($18.146)` in sales from 2022 to 2024. Ideally, this result should be compared to the company's growth goal and/or to market trends. Given that 2024 is not finished by the time the anaylsis was performed, I also performed a year-to-date (YTD) analysis in order to compare 2024 sales to the same period in 2022 and 2023.  

* Given that we have data until September, 2024, _Are we experiencing consistent growth or decline in sales during the same period across consecutive years?_

  - Sales YTD from January to September were `$1,239,682` in 2022, `$1,251,409` in 2023 and `$1,258,429` in 2024. This means that there was a growth of ~ `.56% ($7.020)` from 2024 compared to 2023 and ~`1.51% ($18.747)` compared to 2022. Moreover, there was a growth rate from ~ `.95% ($11.727)` considering the same period from 2022 to 2023. Even though the company has grown from 2023 to 2024, it has not grown on the same rate as the previous years comparison (i.e, 2022 to 2023). 
  
- Main KPIs Observed:

  * Total and Average Sales across all periods (2022 - 2024)
    - I used the `SUM` and the `AVG` functions to, respectively, sum up and return the average sales across all years, without grouping by year.

  <div align="center">
  <img width="1200" height="200" 
       src="https://drive.google.com/uc?id=1ORU_-b_dUiCeZygPqpoJ8VIwYBoAZ_4N">
</div>

  * Total and Average Sales per year (2022 - 2024)
    - I used the same functions described above to return the sum and the average sales while grouping by year. This was done by using the `GROUP BY` statement, which summarizes `Total Sales Per Year` and ``Sales Avg Per Year` by year.

  <div align="center">
  <img width="900" height="350" 
       src="https://drive.google.com/uc?id=1XT-lwW7VU8f2BNnoJ1njBXnDTFkje4tT">
</div>

  * Sales Year-To-Date (2022 - 2024)
    - I created a CTE (Common Table Expression) named `TOTAL_SALES`. This CTE returns the total sales grouped by year and month in `Sales` as well as the year and month in `YR` and `MO`, respectively;
    - The second `SELECT` makes use of these columns in order to calculate the total amount of sales up to the current line. It makes use of a Windon Function that groups `Sales` by year and orders calculation by both year and month from all lines above (`ROWS BETWEEN UNBOUNDED PRECEDING`) until the current row being evaluated (`CURRENT ROW`);
    - The second Windown Function creates `YR_SALES`, which calculates sales for the whole period;
    - I also made use of `FORMAT` in order to return the results in the current format and with zero decimals by using ``FORMAT(XXX, 'C0')`
    - I also renamed Sales as `SALES` to keep the formating I used for the other columns (all in capital letters);
    - The resulting .CSV file can be accessed HERE.
      
  <div align="center">
  <img width="900" height="350" 
       src="https://drive.google.com/uc?id=1K2of3tuQrPTJqntc2ePknuii0IP_ujxC">
</div>

   * Sales Year-On-Year considering Jan - September
       - The query follows the same rationale described above. However, in order to optimize processing, I filtered the period from Jan - Sept by adding the line below in the code, given that this was the period of interest. 
   
  <div align="center">
  <img width="900" height="350" 
       src="https://drive.google.com/uc?id=14gT5iQIZDqUYyj6Hqa0qFwytKmiiQCRE">
</div>

  * Rates of Growth (in R)
    - The code calculates the ratio of growth considering the full years (2023 and 2022) as well as the ratio of growth considering the YTD data extracted from SQL. Ratio of growth was calculated considering the following formula: `growthRate = ((current_year - comparison_year)/comparion_year)*100`  

 
  



  <img align="right" width="500" height="320" src="https://drive.google.com/uc?id=12Uq57n-5zp_Eo0GuFGSrNasFWk6jq7vk">


Click <a href="https://github.com/Larissa-Cury/E-commerceProject/tree/8ac17a02d44452e4108c29fb308b85404a9ba64a/SQL%20Files/Create%20DB" target="_blank">here</a> to access the SQL code in Github

<br><br>

