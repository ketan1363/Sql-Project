create database pizza_stores;
use pizza_stores;

select * from pizza_sales;

/*1*Total Revenue*/
select round(sum(total_price),2) as Total_Revenue
from pizza_sales;

/*2*Average order value*/
select round(sum(total_price))/count(order_id) as Average_order_value
from pizza_sales;

/*3*Total pizzas sold*/
select sum(quantity) as total_pizzas_sold
from pizza_sales;

/*4*Total number of oreder place*/
select count(order_id) as Totall_order
from pizza_sales;

/*5*Average Pizza per order*/
select round(sum(quantity)/count(distinct order_id),2) as Avg_pizza_per_order
from pizza_sales;

/*1*Daily trend for total order*/
select sum(total_price) as total_price, order_date
from pizza_sales
group by order_date;

/*2*Monthly trend for total order*/
select sum(total_price), month
from pizza_sales
group by month;

/*3*Hourly trend for totalorder*/
SELECT EXTRACT(HOUR FROM order_time) AS hour_of_day , count(order_id)AS total_order
FROM pizza_sales
GROUP BY EXTRACT(HOUR FROM order_time)
ORDER BY hour_of_day;

/*4*Percentage of Sales by Pizza Category*/
select round(sum(total_price),2) as total_price , pizza_category
from pizza_sales
group by pizza_category;

/*5*total Pizza Sold by Pizza Category*/
select pizza_category, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_category;

/*6*Percentage of Sales by Pizza Size*/
select round(sum(total_price),2) as total_price, pizza_size
from pizza_sales
group by pizza_size;

/*7*Top 5 Best Sellers by Revenue, Total Quantity and Total Orders*/
select round(sum(total_price),2) as revenue, sum(quantity) as quantity, count(order_id)as total_order, pizza_name
from pizza_sales
group by pizza_name
order by revenue desc
limit 5;

/*8* Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders*/
select round(sum(total_price),2) as revenue , sum(quantity) as quantity, count(order_id) as total_order, pizza_name
from pizza_sales
group by pizza_name
limit 5;
