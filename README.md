# Consumer-Goods-Ad-hoc-Insights

Project Overview

This project is part of the Codebasics SQL Resume Challenge, where business-driven ad hoc requests were solved using SQL. The objective was to analyze sales, product, customer, and discount data to generate insights that support strategic decision-making for the company.


Tools & Technologies Used

SQL (MySQL)
Aggregate functions
Window functions (RANK, DENSE_RANK)
CTEs (Common Table Expressions)
Joins (INNER, LEFT)
Group By & Subqueries

Business Questions Solved
1) Provide the list of markets in which customer  "Atliq  Exclusive"  operates its business in the  APAC  region.
   <img width="1202" height="597" alt="image" src="https://github.com/user-attachments/assets/23b244e2-0282-436d-b98e-bf95c9e1f6ce" />

2)   What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
    unique_products_2020 
    unique_products_2021 
    percentage_chg

with cte1 as (
				select count(distinct p.product) as unique_products_2020
                from dim_product p
                join fact_gross_price gp
                on p.product_code = gp.product_code
                where gp.fiscal_year = 2020
			), 
cte2 as (
		   select count(distinct p.product) as unique_products_2021
		   from dim_product p
			join fact_gross_price gp
			on p.product_code = gp.product_code
			where gp.fiscal_year = 2021
		)
select unique_products_2020, 
		unique_products_2021,
		((unique_products_2021-unique_products_2020)/unique_products_2020)*100 as pct
		from cte1,cte2
    <img width="728" height="141" alt="image" src="https://github.com/user-attachments/assets/7d9b5350-0234-4183-bce0-d295fe9dc463" />
    
3) Provide a report with all the unique product counts for each  segment  and  sort them in descending order of product counts. The final output contains 
   2 fields, segment product_count

