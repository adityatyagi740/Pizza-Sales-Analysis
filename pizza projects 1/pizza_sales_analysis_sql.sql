use pizza;
select * from pizza_sales;
desc pizza_sales;

#kpi 
#total_revenue

select round(sum(total_price),2) as total_revenue
from pizza_sales;

#average_order_value
select (sum(total_price)/count(distinct order_id)) as amount_per_order from pizza_sales;


#total_pizza sold
select sum(quantity) as pizza_sold from pizza_sales;


#total_order

select count(distinct order_id) as total_order from pizza_sales;


#pizza per order
select (sum(quantity)/count(distinct order_id)) as pizza_per_order from pizza_sales;

#charts
#day wise sales



select dayname(order_date) as days,count(distinct order_id) as daily_orders from pizza_sales
group by days
order by days ;

#hourly trend orders

select hour(order_time) as hour,count(distinct order_id) as daily_orders  from pizza_sales
group by hour
order by hour;


#percentage of total_sales by category 
select pizza_category,sum(total_price)*100 / (select sum(total_price)  from pizza_sales) as pct
from pizza_sales
group by  pizza_category;

#percentage of total_sales by size 
select pizza_size,sum(total_price)*100 / (select sum(total_price)  from pizza_sales) as pct
from pizza_sales
group by  pizza_size
order by pct desc ;



# five top seller

select pizza_name,count(quantity) as total_pizza_sale from pizza_sales
group by pizza_name
order by count(quantity) desc
limit 5;

#bottom seller
select pizza_name,count(quantity) as total_pizza_sale from pizza_sales
group by pizza_name
order by count(quantity) asc
limit 5;