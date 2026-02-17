/* 1.  Provide the list of markets in which customer  
 "Atliq  Exclusive"  operates its business in the  APAC  region. */

Select * 
from dim_customer
where  customer = "Atliq Exclusive" and region = "APAC"

/* 2  What is the percentage of unique product increase in 2021 vs. 2020? The 
final output contains these fields, 
unique_products_2020 
unique_products_2021 
percentage_chg  */

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
    

/* 3 #  Provide a report with all the unique product counts for each  segment  and 
sort them in descending order of product counts. The final output contains 
2 fields, 
segment 
product_count */

select segment,count(distinct(product)) as product_count
from dim_product
group by segment
order by product_count desc


 /* 4 Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
segment 
product_count_2020 
product_count_2021 
difference */

with cte1 as (
				select p.segment,count(distinct p.product) as unique_products_2020
                from dim_product p
                join fact_gross_price gp
                on p.product_code = gp.product_code
                where gp.fiscal_year = 2020
                group by p.segment
			), 
cte2 as (
			select p.segment, count(distinct p.product) as unique_products_2021
		    from dim_product p
			join fact_gross_price gp
			on p.product_code = gp.product_code
			where gp.fiscal_year = 2021
			group by p.segment
		)
select cte1.segment,
unique_products_2020,
unique_products_2021,
(unique_products_2020-unique_products_2021) as diff
from cte1
join cte2
on cte1.segment = cte2.segment


/*  5 # Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields, 
product_code 
product 
manufacturing_cost */

with cte1 as (
	select p.product_code, p.product, m.manufacturing_cost 
	from dim_product p
	join fact_manufacturing_cost m
	on p.product_code = m.product_code
	where m.manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)),
cte2 as(
	select p.product_code, p.product, m.manufacturing_cost 
	from dim_product p
	join fact_manufacturing_cost m
	on p.product_code = m.product_code
	where m.manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
	)
select * from cte1
union
select * from cte2;

/* 6 Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
customer_code 
customer 
average_discount_percentage */

select c.customer_code, 
		c.customer , 
        AVG(d.pre_invoice_discount_pct)*100 as average_discount_percentage 
        from dim_customer c
        join fact_pre_invoice_deductions d
        on c.customer_code = d.customer_code
        where d.fiscal_year = 2021
        group by c.customer_code, c.customer
        order by average_discount_percentage desc
        limit 5
        
/* 7 Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. 
The final report contains these columns: 
Month 
Year 
Gross sales Amount */

select Month(m.date) as Month,
		Year(m.date) as Year,
		round(sum(m.sold_quantity * g.gross_price)) as Gross_sales_Amount 
        from fact_sales_monthly m
        join dim_customer c
        on m.customer_code=c.customer_code
        join fact_gross_price g
        on g.product_code = m.product_code
        where c.customer = "Atliq Exclusive"
        group by Month, Year;


 /* 8  In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
Quarter 
total_sold_quantity */

Select Case
			when Month(date) in (1,2,3) then 1
            when Month(date) in (4,5,6) then 2
            when Month(date) in (7,8,9) then 3
		else 4
        end as quater,
		sum(sold_quantity) as total_sold_quantity
		from fact_sales_monthly
        where fiscal_year = 2020
        group by quater
        order by total_sold_quantity desc
        
        
/* 9. Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution?  The final output  contains these fields, 
channel 
gross_sales_mln 
percentage */

with cte1 as (
				select c.channel,
				round(sum(m.sold_quantity * g.gross_price/1000000),2) as gross_sales_mln
				from dim_customer c
				join fact_sales_monthly m
				on c.customer_code = m.customer_code
				join fact_gross_price g 
				on m.product_code=g.product_code 
                where m.fiscal_year = 2021
				group by c.channel
            ),
cte2 as (
			select
					round(sum(gross_sales_mln),2) as total_gross_sales_mln
            from cte1 
		)
select cte1.channel,
       cte1.gross_sales_mln,
       round((cte1.gross_sales_mln/cte2.total_gross_sales_mln)*100,2) as pct
       from cte1,cte2
       order by cte1.gross_sales_mln desc
		

	
/* 10. Get the Top 3 products in each division that have a high
-- total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
--         division
--         product_code
--         product
--         total_sold_quantity
--         rank_order */

with cte1 as (  
				select
				p.division,
                p.product_code,
                p.product,
                sum(m.sold_quantity) as total_quantity
                from dim_product p
                join fact_sales_monthly m
                on p.product_code = m.product_code
                where m.fiscal_year = 2021
                group by p.division,
                p.product_code,
                p.product
                ),
cte2 as (
			select * , 
			dense_rank() 
			over(partition by division order by total_quantity desc) as rank_order
			from cte1 
		)
select * from cte2
where rank_order <=3
