create database Project;
use project;

select * from `new ecommerce merged file`;

ALTER TABLE `new ecommerce merged file`
MODIFY COLUMN `olist_order_payments_dataset.payment_value` INT;


-- Weekday Vs Weekend Payment Stats --  

select 'Weekend' as Weekend_Weekdays, sum(`olist_order_payments_dataset.payment_value`) as Payment_Stats
from `new ecommerce merged file`
where `Weekend/Weekdays` = 'Weekend'
union	
select 'Weekdays' as Weekend_Weekdays, sum(`olist_order_payments_dataset.payment_value`) as Payment_Stats
from `new ecommerce merged file`
where `Weekend/Weekdays` = 'Weekdays';

-- Orders with review Score and credit card payment -- 
 

select `olist_order_reviews_dataset.review_score`, 
count(`olist_order_payments_dataset.payment_type`) 
from `new ecommerce merged file` 
where `olist_order_payments_dataset.payment_type` = 'credit_card'
group by 1
order by 1;

-- Productwise Avergae Delivery Days -- 

select `olist_products_dataset.product_category_name` as Product_Name, 
round(avg(`Delivery Days`)) as Average_Delivery_Days
from `new ecommerce merged file`
group by 1
order by 2 desc
limit 5 ;

-- Average price and payment values from customers of sao paulo city -- 

select `customer_city` ,
round( avg(`olist_order_items_dataset.price`),1 )as Avg_Price,
round(avg (`olist_order_payments_dataset.payment_value`),1)as  Payment_Value
from `new ecommerce merged file`
where `customer_city` = 'sao paulo';

-- Relationship between shipping days  Vs review scores -- 

select `olist_order_reviews_dataset.review_score` as Review_Score, 
count(`Delivery Days`) as Shipping_Days
from `new ecommerce merged file`
group by 1
order by 1;

-- Top 5 profit Manking Cities -- 

select `olist_sellers_dataset.seller_city` as Top_5_Cities,
sum(`Profit`) as Profit
from `new ecommerce merged file`
group by 1
order by 2 desc
limit 5 ;





 



