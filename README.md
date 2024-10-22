## E-commerce Sales Project 
<img align="right" width="500" height="320" src="https://drive.google.com/uc?id=1dP7f8_ORmpAoVGIVIE5zeCCNPmubNNJJ">
This project analysis a 3-year interval data of a fictionous e-commerce company especilized in the Pet Market. The pet shop especializes in 5 different product categories (food, snacks, medicine, toys and hygine), for which the company offers 10 different products. The pet shop has delivery deals with 5 distribution centers in the city of Rio de Janeiro, in 5 different regions of the city (South, North, West, "Baixada Fluminense" and Downtown).

* The project aims to demonstrate some of my skills with `R`, `SQL` and `Power Bi` along with my critical and analytical thinking skills. I broke it down into sections to improve organization and readability. 

- Part 1:
  - Creating the data in R
    
- Part 2:
  - Importing the .CSV files into `SQL SERVER`;
  - Creating the database called `MannedWolfDB`;
  - Creating the data model by estabilishing the relantionships between primary and foreign keys in the tables
  
- Part 3: 
 - In this part, I discuss in details many business problems that might arise when analysing the data. For each problem,
   - I provide an explanation based on the data analysis performed in `SQL`;
   - Explain throughtly each `SQL QUERY` I used to obtain the relevant _Key Performance Indicators_ (KPIs);
   - Provide a printscreen of the `SQL QUERY` to improve readability of this project
     
- Part 4 (which I'm currently in)
   - I'm developing a dashboard in `Power Bi` in order to improve visualization and also to address other potential KPIs.
  

<br>

***The tools used in this project were R, SQL and Power Bi***

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
  
   - The total sales considering all periods is `$4,587,920` with a mean of `$211.30`. This number in isolation does not tell much. If the company had a threshold to achieve, which could be from its own or based on market trends, then comparing the total sales to it would be an interesting KPI. I then calculated the total and average sales per year.
     
* _How are sales growing considering previous full-year performances?_

  - The total sales was `$1,655,673` in 2022, `$1,673,819` in 2023 and `$1,258,429` from Jan to Sept 2024. Considering the full-years, there was a growth of ~ `1.1% ($18.146)` in sales from 2022 to 2024. Ideally, this result should be compared to the company's growth goal and/or to market trends. Given that 2024 was not finished by the time the anaylsis was performed, I also performed a year-to-date (YTD) analysis in order to compare 2024 sales to the same period in 2022 and 2023.  

* _Are we experiencing consistent growth or decline in sales during the same period across consecutive years?_ (Given that we have data until September, 2024)

  - Sales YTD from January to September were `$1,239,682` in 2022, `$1,251,409` in 2023 and `$1,258,429` in 2024. This means that there was a growth of ~ `.56% ($7.020)` from 2024 compared to 2023 and ~ `1.51% ($18.747)` compared to 2022. Moreover, there was a growth rate from ~ `.95% ($11.727)` considering the same period from 2022 to 2023. Even though the company has grown from 2023 to 2024, it has not grown on the same rate as the previous years comparison (i.e, 2022 to 2023). 
  
-- Main KPIs Observed:

  * Total and Average Sales across all periods (2022 - 2024)
    - I used the `SUM` and the `AVG` functions to, respectively, sum up and return the average sales across all years, without grouping by year.

  <div align="center">
  <img width="1200" height="200" 
       src="https://drive.google.com/uc?id=1ORU_-b_dUiCeZygPqpoJ8VIwYBoAZ_4N">
</div>

* Total and Average Sales per year (2022 - 2024)
    - I used the same functions described above to return the sum and the average sales while grouping by year. This was done by using the `GROUP BY` statement, which summarizes `Total Sales Per Year` and `Sales Avg Per Year` by year.

  <div align="center">
  <img width="900" height="350" 
       src="https://drive.google.com/uc?id=1XT-lwW7VU8f2BNnoJ1njBXnDTFkje4tT">
</div>

  * Sales Year-To-Date (2022 - 2024)
    - I created a CTE (Common Table Expression) named `TOTAL_SALES`. This CTE returns the total sales grouped by year and month in `Sales` as well as the year and month in `YR` and `MO`, respectively;
    - The second `SELECT` makes use of these columns in order to calculate the total amount of sales up to the current line. It makes use of a Windon Function that groups `Sales` by year and orders calculation by both year and month from all lines above (`ROWS BETWEEN UNBOUNDED PRECEDING`) until the current row being evaluated (`CURRENT ROW`);
    - The second Windown Function creates `YR_SALES`, which calculates sales for the whole period;
    - I also made use of `FORMAT` in order to return the results in the current format and with zero decimals by using `FORMAT(XXX, 'C0')`
    - I also renamed Sales as `SALES` to keep the formating I used for the other columns (all in capital letters);
    - The resulting .CSV file can be accessed HERE.
      
  <div align="center">
  <img width="900" height="350" 
       src="https://drive.google.com/uc?id=1K2of3tuQrPTJqntc2ePknuii0IP_ujxC">
</div>

   * Sales Year-On-Year considering Jan - September
       - The query follows the same rationale described above. However, in order to optimize processing, I filtered the period from Jan - Sept by adding the `WHERE` statement below in the code, given that this was the period of interest. 
   
  <div align="center">
  <img width="900" height="350" 
       src="https://drive.google.com/uc?id=14gT5iQIZDqUYyj6Hqa0qFwytKmiiQCRE">
</div>

  * Rates of Growth (in R)
    - The code calculates the ratio of growth considering the full years (2023 and 2022) as well as the ratio of growth considering the YTD data extracted from SQL. Ratio of growth was calculated considering the following formula: `growthRate = ((current_year - comparison_year)/comparion_year)*100`

## Analysis of Average Transaction Value (ATV)

Business Problems: 

* _What is the average transaction value (ATV) ?_
  - The `Average Transaction Value` considering all years is `$211.30`.
* _What is the average transaction value (ATV) by region? Which has the highiest and the lowest ATV?_
  - The breakdown of ATV per region is depicted in the following table, which was obtained by running the SQL query detailed below. Across years, `South` had the highiest ATV and `Baixada Fluminense` had the lowest one. However, it is worth noticing that there is not a big difference among all distributors' regions and that all regions are slightly above the overall ATV. 
  
<div align="center">

| Region              | ATV     |
|---------------------|---------|
| South               | $214.98 |
| West                | $212.39 |
| North               | $210.60 |
| Downtown            | $209.43 |
| Baixada Fluminense  | $209.05 |

</div>

* _How does the aaverage transaction value (ATV) change over time (yearly)?_
  - The break down of ATV by year is displayed in the table below. Putting together with the analysis obtained in `Analyzing Sales Performance Across Years` (please check above), despite the company's growth from one year to the other, the growth does not seem to be so expressive.

<div align="center">
  
| Year | ATV     |
|------|---------|
| 2024 | $212.07 |
| 2023 | $212.12 |
| 2022 | $209.90 |

</div>

*  _How does the aaverage transaction value (ATV) change over time (yearly) by region?_
  
    - It is interesting to notice that there was some variation considering which region had the highiest and lowest ATV in the 3-year span. For example, while South was leading in 2022 an ATV of `$218.87`, North, which had the lowest ATV in 2022 (`$201.78`), had the greatest ATV in both 2023 and 2024 of `$215.10`and `$216.71`, respectively. It is also worth noticing that the greatest ATV was in 2022. Even though the difference does not seem to be so expressive, it might be interesting to look for reasons why this happened nonetheless.
    - The .CSV file obtained from the SQL query detailed below can be found <a href="https://github.com/Larissa-Cury/E-commerceProject/blob/fcaf5d332fdc92d5e520b56545bdd5793730c895/CSV%20Files%20Extracted%20from%20SQL/results_atv_by_region_by_year.csv" target="_blank">HERE</a>.

* Other interesting KPIs regarding ATV for further analysis: 
   - ATV considering each product category (across and per year)
   - ATV considering each product category, considering the region (across and per year)
   - ATV considering consumer profile (across and per year) 

-- Main KPIs Observed: 
  * Overall ATV across years and Overall ATV across years by region
    - The Average Transaction Value (ATV) was calculated by dividing the total revenue of the company (`SUM(S.total_amount)`) by the number of orders (`COUNT(S.order_id)`)
    - The first query returns the overall ATV value across years, without breaking down by either Year or Region (or any other interesting variable);
    - I used `ÌNNER JOIN` in the second query to obtain region information by joining `dim_distributors` and `fact_sales` by the `distributor_id` key;
    - Then, I grouped the data by `Region` to obtain the overall ATV by region

     <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1K0D4O5hqt-OIoSKRROtjor95lIRk1Tib">
      </div>

  * ATV by Year
    - I used the same rationale described in `Overall ATV across years and Overall ATV across years by region` to obtain the ATV by year;
    - Here, however, I added `GROUP BY` to group the data by Year, which I extracted using the `YEAR` function;

      <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1S5b4w4K43_r_Uf5b0vbggUvZBW9fcLrb">
      </div>
   
  * ATV by Year and Region
    - I used the exactly same rationale I used to obtain `ATV by Year`, with some additions;
    - I used `ÌNNER JOIN` to join `dim_distributors` to `fact_sales` by the `distributor_key` in order to obtain the information regarding `Region`
    - Then, I used this column to group the data by region and year using `GROUP BY`
    - Finally, I ordered the data so that the regions with the greatest ATV values would be displayed before the ones with the lowest, in desciding order.

      <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1PD33-_r2pnSWzbxXleUK0a14PnPtuXOv">
      </div>
   
## Analyzing Sales by Product Category

Business Problems: 

* _What is the total and average sales revenue for each product category (food, snacks, medicine, toys, hygiene) across years ? Which product category had the highest total sales and which had the lowest?_
  - `Food` had the greatest revenue considering the whole dataset while `Toys` had the lowest. The results are summarized in descending way (from the highiest to the lowest) in the table below:
    
<div align="center">

| CATEGORY   | SALES     | AVG_SALES |
|------------|-----------|-----------|
| Food       | $1,321,316 | $261.08  |
| Hygiene    | $923,419   | $216.82  |
| Snacks     | $839,891   | $201.46  |
| Medicine   | $781,598   | $188.84  |
| Toys       | $721,696   | $176.67  |

</div>

* _What is the total and average sales revenue for each product category (food, snacks, medicine, toys, hygiene) per year? Which product category had the highest total sales and which had the lowest?_
  - The breakdown of sales by category by year followed the same trend as the overall sales across years. That is, `Food` had the greatest revenue while `Toys` had the lowest in all years. The .CSV file containing the result of the SQL query explained below can be found <a href="https://github.com/Larissa-Cury/E-commerceProject/blob/3d23ab00069ecf1fabf508ef87eefd9d8fb2ea75/CSV%20Files%20Extracted%20from%20SQL/results_category_sales.csv" target="_blank">HERE</a>

* Additional insights:
  - Overall, it makes sense that `Food` is the product category with the highiest revenue across years given that it is a main necessity. However, the company could invest on marketing and on promotions to sell more `Toys`. For example, a promotion in which a client buys some type of food and has a discount on a toy;
  - The company could also be interested in breaking down the sales by product category by region and/or costumer profile to see if the consumption pattern differs depending on who is buying and where the purchase is being made. 

-- Main KPIs observed:

* Total revenue per category across years
  - Given that there is no information about the category in `fact_sales`, I made use of multiple JOINS in order to be able to return the product category name (please check the diagram above for reference). I first made use of `INNER JOIN` to join the `fact_sales` to `dim_product` by the `product_id` key;
  - Then, because I wanted to return the Category Name, I joined `dim_product` with `dim_category` by the `category_id` key;
  - I made use of the aggregate functions `SUM` and `AVG` to, respectively, return the sum and average of sales (column `total_amount` in `fact_sales`);
  - In order to group the results by category, I made use of `GROUP BY` to group the results by `category_name`, which I renamed in capital letters to match the pattern of the other columns;
  - Finally, I ordered the data from the category with the highiest revenue to the one with the lowest using `ORDER BY`
  
   <div align="center">
  <img width="900" height="350" 
       src="https://drive.google.com/uc?id=1YamHFoFIekGtjPWtg0oEiPaPz0Q540Nh">
  </div>

 * Total revenue per category per year
   - The code follows the same rationale as the above one for the overall sales across years. Differently from it, however, here I extracted the year from `sale_date` in `fact_sales` and used this column to group the data using `GROUP BY`

       <div align="center">
       <img width="900" height="350" 
       src="https://drive.google.com/uc?id=1xJZze7ZLxlKpz3X-5J2h5ORpe44sSIgz">
      </div>

## Analyzing Sales by Distributor Region

Business Problems: 

* _What is the total and average sales revenue for each region (South, North, West, Baixada Fluminense, Downtown)? Which region contributes the most to overall sales?_
  - The sales breakdown per distributor sales indicates a roughtly balanced contribution to overall sales by region **(considering all years together)**. These results are displayed in the table below:

<div align="center">

| REGION              | SALES     | AVG_SALES | SALES % |
|---------------------|-----------|-----------|---------|
| South               | $969,756  | $214.98   | 21.14   |
| Downtown            | $920,022  | $209.43   | 20.05   |
| Baixada Fluminense   | $914,586  | $209.05   | 19.93  |
| North               | $913,182  | $210.60   | 19.90   |
| West                | $870,374  | $212.39   | 18.97   |
  
</div>

* _How much does each category sells in each region? Which region sells more of within category?_
  - The full breakdown of how much each category sells within each region can be found <a href="https://github.com/Larissa-Cury/E-commerceProject/blob/d1a97874ab3797e39ca81479810caec2c9a6abfb/CSV%20Files%20Extracted%20from%20SQL/results_rank_of_sales_by_category_by_region.csv" target="_blank">HERE</a>, which is the .CSV file I exported from the SQL query explained below. The full breakdown of the ranks with each category can also be found in the same file.
    - Overall, all categories sell more in the `Sounth` region, despite `Hygiene`, which is more sold in `Downtown`. Here I present a filtered version of the table:

* _Which category sells more in each region?_
 - The analysis indicates that `Food` is the #1 category in all regions, which matches the overall trend of the company (see `Sales by Category` above). The break down of revenue per category within each region can be found <a href="https://github.com/Larissa-Cury/E-commerceProject/blob/146e6b0f053f3a34a12cc6b31db8195b5f9dd808/CSV%20Files%20Extracted%20from%20SQL/results_rank_of_sales_by_region_by_category.csv" target="_blank">HERE</a>, which is the the .CSV file I extracted from the SQL query explained below.

* Further analysis:
  - It would also be interesting to examine the sales breakdown by distributor region by year. That is, to analyse each year individually. This could give insights of possible trends over the years and also guide future actions. 
 
-- Main KPIs Observed:

* Overall Sales per distributor region and percentage of contribution of each region to overall sales
   - Given that the information about distributors is not present in `fact_sales`, I first used `ÌNNER JOIN` with `dim_distributors` by `distributor_id` in order to have access to the information about `distributor_region`
   - Then, I used the aggregate functions `SUM` and `AVG` to  obtain the sum and average of sales (considering all years together);
   - After it, I used `GROUP BY` to group the data per `distributor_region`;
   - I ordered the data in descending way considering the sales sum;
   - After doing that (you can run this query), I added a subquery that returns the overall sales without breaking sales down by region (i.e, without grouping it) and used it to obtain the % of each distributor region to the overall sales.
 
   <div align="center">
       <img width="900" height="350" 
       src="https://drive.google.com/uc?id=1Wm-d7_qNu88K76zW2vqRNQ7ew6mUu9pd">
      </div>

* Overall Sales by Category broken down by Region
     - As I did previously to return the `Sales by Category` KPIs (please check above), I made use of multiple joins in order to obtain the product category name;
     - I made use of `SUM` and `ÀVG` to obtain the sum and average of sales;
     - Then, I extracted the Category Name from `dim_category` and Region from `dim_distributors` and used these columns to group the data using `GROUP BY`
     - I put this query inside a `Common Table Expression (CTE)` named `Sales_CTE` because I wanted to use this data to rank each region within each category according to their contribution to the sales of that category in descending way;
     -  In order to do it, I made use of window functions. Precisely, I used `RANK()` to obtain the rank of each category (this is why I used `PARTITION BY CATEGORY_NAME` considering the descending order of `Sales`. I named this `SALES_RANK`
 
     <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1uSOiY6p4DrXudG_dIQQNanP-iyxKPOOR">
      </div>

* Overall Sales by Region broken down by Category
  - The rationale I used here is the exactly same as I did for the previous KPI. However, this is a "simpler" way of doing so without using the CTE. So, instead of using the CTE here I used `ORDER BY SUM(S.total_amount)` to order each category in descending way within each region (this is why I also used `PARTITION BY D.distributor_region`).
  - *Note*. Even though this way might seem easier, I prefer using the CTE because it makes the code clear and more readable.

     <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1jU30MBc3yROO1HwCFaGv4Rw17S1tvySr">
      </div>

## Analysis of Customer Behavior and Profile

Business Problems: 

* _Do customers with more pets spend more ?_
  - The analysis detailed obtained with the SQL query detailed below indicates that customers who have more than 2 pets spend more than both customers who own either 1 or 2 pets. However, owners of 1 pet still spent slightly more than owners of 2 pets. Moreover, the number of clients with more than 2 pets make up almost as twice the number of the other 2 categoies.
  -  The results are broken down in the table below:
 
<div align="center">

| N_OF_PETS    | N_CLIENTS | ALL_SALES    |
|--------------|-----------|--------------|
| More than 2  | 10,785    | $2,257,720   |
| One pet      | 5,503     | $1,171,412   |
| Two pets     | 5,425     | $1,158,788   |
  
</div>

* _Do customers with different numbers of pets spend differently considering each category?_

  - A shop pattern can be observed across product categories. That is, customers who own more than 2 pets are the top spenders in all categories while customers with 1 or 2 pets variate. For example, customers with one pet are the second top spends in `Food`, `Hygine` and `Toys` while customers with 2 pets are the second top spenders in `Medicine` and `Snacks`. This behavior is not expected given that an additional pet should imply the necessity of more expenses. Maybe factors such as region, family income, program fidelity, among others, might be causing this behavior.
  - The .CSV file obtained from the SQL query can be acessed <a href="https://github.com/Larissa-Cury/E-commerceProject/blob/0ccd97fd27cdacb1e870188d4c3a4a7c25dac66f/CSV%20Files%20Extracted%20from%20SQL/results_number_of_pets_by_category.csv" target="_blank">HERE</a>.
  

* _Are there differences in purchases between male and female customers?_? 
 - There seems to be a balance between males and females in terms of how much each gender contribute to purchase. Considering overall sales, females contribute around `48.12%` while males contribute `51.88`. This pattern was also observed when breaking down sales by year (See KPIs below).

* _Do single and divorced customers spend differently compared to married costumers_?
  - Single and divorced customers contribute the most to both overall and within-year sales. The overall contribution of single customers is `32.73%` and of divorced is `34.57%` while married costumers contribute to `32.70%` to sales. This pattern repeats itself when breaking the data down by year. Hence, while married costumers make up 1/3 of sales, single and divorced contribute to 2/3 of sales. 

* Additional Insights and Further Analysis
  - It would be interesting to cross the information regarding gender and marital status in order to see if there are differences in purchasing considering both variables simulteneously.

-- Main KPIs Observed:

* Overall Sales and Number of Clients by Pet Owenership
  - For this query, I used `CASE WHEN` to create an additional column called `N_OF_PETS` tha classifies each customer in terms of how many pets they own;
  - In order to do it, I used `INNER JOIN` to join `dim_customers` to `fact_table` by the `customer_id` key to obtain information about pet ownership;
  - I then inserted this query into a Commom Table Expression (CTE) called `N_CTE` which returns `Customer_id`, `Sales` and `N_of_Pets`;
  - I then selected the `N_OF_PETS` column from the CTE and used `COUNT` to count how many costumers were there in the database. I also used `SUM` to sum sales;
  - I then used `GROUP BY` because I wanted the results (aka, `Number of Clients` and `Sales` to be grouped by `N_OF_PETS`;
  - Finally, I ordered the results in descending way considering `ALL SALES`;
 
    <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=17riSdJCmPMKxI0WBRkT32E1vB0fZkfgd">
    </div>

* Overall Sales by Pet Ownership and Category
    - I followed the same rationale I described in `Overall Sales and Number of Clients by Pet Owenership` to conditionally create the `N_of_Pets` column;
    - I used the same sequence of multiple `INNER JOINS` I described in `XX` to obtain the product category;
    - I inserted this query in a CTE called `N_CTE_CAT`;
    - I made use of the Window Function `RANK` to rank the dataset considering the top spenders in each category (`PARTITION BY CAT_NAME`) considering their pet ownsership status ordering from the greatest to the lowest considering sales (`ORDER BY SUM(PURCHASE) DESC`);
    - Then, I also used  `SUM(PURCHASE)` because I wanted to calculate the total overall revenue considering how many pets a client owns;
    - Finally, to obtain this result, I grouped the query by `N_OF_PETS` and `CAT_NAME`

    <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1N84idb3pBPkO8Z3RLaz4-ftrs_fdIQ6n">
    </div>


* Overall Sales by Gender
  - I first joinned `fact_sales` and ``dim_customers` by the `customer_id` key in order to have access to information about the customers;
  - Then, I summed up the sales amount and grouped by gender;
  - After that, I included a subquery which calculates the total sales without grouping it;
  - With this subquery, I calculates the percentage each gender contributed to overall sales
 
    <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1Avkrk6Tr3eyJE-ub16z5bPMXwsEQ7Qlp">
    </div>

* Sales by Gender breaking down by year
  - I followed a same rationale as in calculating `Overall Sales by Gender``. Here, however, I inserted the query into a Common Table Expression (CTE) because I wanted to calculate the proportion each gender contributed to sales within the years;
  - In order to achieve it, I made use of a window function to summarize the years revenue and used it to calculate the percentage each gender contributed to sales within years
 
    <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1aTpXoTO4bVwA5l3RtIds8tGYqeNII0ZR">
    </div>

  * Overall Sales by Marital Status
    - I adopted the exact same rationale I adoped to calculate `Overall Sales by Gender`, only changing `Gender` for `Marital_Status`
   
    <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1ueDPJm_xRcA4TIU-vA73Q1RiPOkLKfL1">
    </div>
      
  * Overall Sales by Marital Status breaking down by year
    - I adopted the exact same rationale I adoped to calculate `Overall Sales by Gender  breaking down by year`, only changing `Gender` for `Marital_Status`

    <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1STEUdBpIgMRPdhG7hs6Wi5lcSV7_osXl">
    </div>
 
## Evaluation of Membership Program (Sales by Membership Category)

Business Problems:

* _How many customers are there in each category? How much do the customers in each category the loyalty program have spent across years?_
  - In total, there are `13315` customers in the Bronze category, `6220` in the Silver and `2178` in the Gold category. Overall, they spent `$2,818,529`, `$1,320,416` and `$448,975`, respectively.

* _What is the Average Transaction Value (ATV) for Gold, Silver, and Bronze tier customers?_
    - The ATV for each category is `$211.68` for Bronze, `$212.29` for Silver and `$206.14` for Gold customers.
* _What percentage of total revenue comes from each loyalty category?_
  - Considering all years together, Bronze members contributed to ~ `61.43%` of sales, followed by `28.78%` silver and `9.79%` of Gold members.

 - The data indicates that the Membership program is not working properly, specially given that Gold members have an ATG lower than the other categories. The silver clients also do not have an ATV much greater than Bronze ones. This issue needs to be addressed;
 - I generated the results of all these questions in a single SQL query, which resulted in the following table:

<div align="center">

| LOYALTY_CAT | N_CUSTOMERS | ALL_SALES   | ATV     | SALES % |
|-------------|-------------|-------------|---------|---------|
| Bronze      | 13,315      | $2,818,529  | $211.68 | 61.43   |
| Silver      | 6,220       | $1,320,416  | $212.29 | 28.78   |
| Gold        | 2,178       | $448,975    | $206.14 | 9.79    |
 </div>  

* Other insights:
  - An analysis of the same KPIs could be done while grouping the data by Year in order to better understand if this overall pattern repeats itself and make predictos. Moreover, if the breakdown per year is, indeed, informative, it could inform when the Membership program succeeded annd when it stopped doing so.
  - The breakdown of customers by their membership status could also benefit from observing other variables that influence customer behavior, such as demographic and profile characteristics. 

-- Main KPIs Observed:

* Overall Sales, Average Transaction Value and Sales % by Membership Category
  - I first joined `fact_sales` with `dim_customers` by the `customer_id` key because I needed to obtain information about customer membership from `dim_customers`;
  - I first calculated how many active customers were there with `COUNT(S.customer_id)` and the overall sales (`SUM(S.total_amount)`);
  - I then grouped the data by `C.loyalty_status` using `GROUP BY` because I wanted to see the results per membership category
  - After it, I calculated ATV by dividing total sales by the number of customers in the database (_note:_ this could also be achieved using `AVG`);
  - I calculated the % each category contributed to overall sales by using a subquery which returns the total amount of sales while not grouping the data;
  - Finally, I used `ORDER BY` to order the data in a descending way;
  - I used formating when necessary just to improve visualization.
 
    <div align="center">
       <img width="900" height="450" 
       src="https://drive.google.com/uc?id=1ZWfMzQ2DuIhe6ai_7_n71tvYHGKAh_Ff">
    </div>

Click <a href="https://github.com/Larissa-Cury/E-commerceProject/tree/8ac17a02d44452e4108c29fb308b85404a9ba64a/SQL%20Files/Create%20DB" target="_blank">here</a> to access the SQL code in Github

<br><br>

