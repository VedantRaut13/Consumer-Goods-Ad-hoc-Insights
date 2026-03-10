# Consumer-Goods-Ad-hoc-Insights

Project Overview

This project is part of the Codebasics SQL Resume Challenge, where business-driven ad hoc requests were solved using SQL. The objective was to analyze sales, product, customer, and discount data to generate insights that support strategic decision-making for the company.


Tools & Technologies Used

SQL (MySQL)
Aggregate functions
Window functions (RANK, DENSE_RANK)
CTEs (Common Table Expressions)
Joins
Group By & Subqueries
Power BI for Visualisations

Business Questions Solved
1) Provide the list of markets in which customer  "Atliq  Exclusive"  operates its business in the  APAC  region.
   <img width="1202" height="597" alt="image" src="https://github.com/user-attachments/assets/23b244e2-0282-436d-b98e-bf95c9e1f6ce" />

2) What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
    unique_products_2020  unique_products_2021   percentage_chg
    <img width="728" height="141" alt="image" src="https://github.com/user-attachments/assets/7d9b5350-0234-4183-bce0-d295fe9dc463" />
	<img width="582" height="422" alt="image" src="https://github.com/user-attachments/assets/89d01bef-5a66-4990-aa81-d335362f3d77" />

3) Provide a report with all the unique product counts for each  segment  and  sort them in descending order of product counts. The final output contains 
   2 fields, segment product_count
   <img width="400" height="316" alt="image" src="https://github.com/user-attachments/assets/d56cee25-b224-44a2-a7da-5bd871320992" />
   <img width="701" height="402" alt="image" src="https://github.com/user-attachments/assets/51380d25-c0cd-4c8b-a37d-ccb8eb7e6e0f" />

4)  Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, 
	segment product_count_2020 product_count_2021 difference
    <img width="807" height="335" alt="image" src="https://github.com/user-attachments/assets/12f966ff-8a5c-4b04-8ba0-1884b3c47ef1" />
	<img width="592" height="331" alt="image" src="https://github.com/user-attachments/assets/67da0541-e721-4d22-abaa-2bc3f71dc2c5" />

5)  Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, 
	product_code product manufacturing_cost
	<img width="762" height="202" alt="image" src="https://github.com/user-attachments/assets/75312cd8-87d5-45bf-9c8b-dcb9d1d34e16" />

6)  Generate a report which contains the top 5 customers who received an average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
	Indian  market. The final output contains these fields, customer_code customer average_discount_percentage
	<img width="782" height="207" alt="image" src="https://github.com/user-attachments/assets/e0c6736a-2fea-46dc-82d5-8b95a7ae344d" />
	<img width="552" height="296" alt="image" src="https://github.com/user-attachments/assets/c23e0372-8713-45b8-b96d-93e6ebf12261" />

7)  Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
	high-performing months and take strategic decisions. The final report contains these columns: 
	Month Year Gross sales Amount
	<img width="606" height="522" alt="image" src="https://github.com/user-attachments/assets/58effe9c-b683-4a1e-83d5-285216a1f128" />
	<img width="1042" height="305" alt="image" src="https://github.com/user-attachments/assets/7521eac2-2b5b-4945-8e80-c315c14fa8cf" />

8)   In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, 
     Quarter total_sold_quantity
	<img width="491" height="217" alt="image" src="https://github.com/user-attachments/assets/0d362e76-dd99-4f9a-b5f4-40fef7ddb805" />
	<img width="648" height="313" alt="image" src="https://github.com/user-attachments/assets/a7c8ff42-b47c-4549-9907-d5e0c43f4778" />

9)  Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?  The final output  contains these fields, 
    channel gross_sales_mln percentage
	<img width="700" height="210" alt="image" src="https://github.com/user-attachments/assets/b4561046-6cc4-40c1-8992-e8f30e9b9bc9" />
	<img width="627" height="253" alt="image" src="https://github.com/user-attachments/assets/71e006fa-a05d-4c22-80b1-8fdc9a61ac71" />

10) Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these 
	fields, division product_code product total_sold_quantity rank_order
	<img width="1298" height="386" alt="image" src="https://github.com/user-attachments/assets/0dd64b98-c1cf-48e4-8b9f-3f609f537660" />
	<img width="492" height="242" alt="image" src="https://github.com/user-attachments/assets/00f83e60-beae-45b1-ba72-a0da6b14c938" />


