SELECT * 
FROM decodelab_intern.`dataset _for _data_analytics`;

---- 1 --- which prdocut generated the highest revenue
select product, Round(sum(TotalPrice),2) as Total_Revenue
FROM decodelab_intern.`dataset _for _data_analytics`
group by Product
order by Total_Revenue desc 
limit 1;

--- 2 --- what is the total sales revenue by year and month ----
select month,round(sum(TotalPrice),2) as Month_Revenue
FROM decodelab_intern.`dataset _for _data_analytics`
group by Month
order by  Month_Revenue desc;

select year,round(sum(TotalPrice),2) as Year_Revenue
FROM decodelab_intern.`dataset _for _data_analytics`
group by year
order by Year_Revenue desc;

---- 3 --- which customer segement pucharsed the most product
select CustomerID, max(Quantity) as Most_purchased
FROM decodelab_intern.`dataset _for _data_analytics`
group by CustomerID
order by  Most_purchased desc;

---- 4 --- what is the average order for each value for each product category-
select Product, round(avg(TotalPrice),2) as Avg_value
FROM decodelab_intern.`dataset _for _data_analytics`
group by Product
order by Avg_value;

--- 5 --- which shipping method is used most freqently?
select OrderStatus, count(*) as Shipping_method
FROM decodelab_intern.`dataset _for _data_analytics`
group by OrderStatus
order by Shipping_method desc;

--- 6 ---- What is the total quantity sold for each product?
select Product, Round(sum(TotalPrice),2) as Total_quantity
FROM decodelab_intern.`dataset _for _data_analytics`
group by Product
order by Total_quantity desc;

---- 7 ---- what percentage of orders were returned or cancelled?
select round(100.0*sum(case when OrderStatus in ("Returned","Cancelled")
then 1 else 0 end) / count(*),2) as PctReturnedOrCanceelled
FROM decodelab_intern.`dataset _for _data_analytics`;

---- 8 ---- which customers contributed the highest revenue?
select CustomerID, sum(TotalPrice) as Highest_revenue
FROM decodelab_intern.`dataset _for _data_analytics`
group by CustomerID 
order by Highest_revenue desc;

--- 9 --- what is the monthly sales growth?
select Month,round(sum(TotalPrice),2) as Sales_growth
FROM decodelab_intern.`dataset _for _data_analytics`
group by Month
order by Sales_growth desc;

--- 10 --- which payment method was most commonly ?
select PaymentMethod, count(*) as Mostpayment
from decodelab_intern.`dataset _for _data_analytics`
group by PaymentMethod 
order by Mostpayment desc;

---- 11 -- which payment that have the highest return rate?
 select PaymentMethod, count(PaymentMethod) as High
 from decodelab_intern.`dataset _for _data_analytics`
 group by ;





--- 11 --- which products has the highest returned rate?
Select Product,
    COUNT(
        CASE 
            WHEN OrderStatus = "Returned" 
            THEN 1 END) AS returned_orders,
COUNT(*) AS total_orders,
        ROUND(COUNT(CASE WHEN OrderStatus = "Returned" 
                THEN 1 END
        ) * 100.0 / COUNT(*),
    2) AS return_rate_percentage
FROM decodelab_intern.`dataset _for _data_analytics`
GROUP BY Product
ORDER BY return_rate_percentage DESC
LIMIT 1;

---- 12 ---17 wwhat the avg unit price product type? 
select Product, round(avg(UnitPrice),2)as Avg_unitPrice
from decodelab_intern.`dataset _for _data_analytics`
group by Product
order by  Avg_unitPrice desc;

--- 13 --- which order have unusually high quantities compared to others?
select OrderID,CustomerID,Product,Quantity
from decodelab_intern.`dataset _for _data_analytics`
WHERE Quantity = (SELECT MAX(Quantity) from decodelab_intern.`dataset _for _data_analytics`)
ORDER BY OrderID;



--- 14 --- which customers made repeated purchased?
select CustomerID,count(OrderID)as Repeated_order
from decodelab_intern.`dataset _for _data_analytics`
group by CustomerID
having count(OrderID)>1
order by Repeated_order;

--- 15 -- which proudt has thew lowest sale perfomance?
select Product, round(sum(TotalPrice),2)as Sale_performance
from decodelab_intern.`dataset _for _data_analytics`
group by Product
order  by Sale_performance asc;

--- 16 --- what is the percentage contribution of each product to total revenue?
select product,round(sum(TotalPrice),2) as totalreveune, round(100 *sum(TotalPrice)/ sum(sum(TotalPrice)) over(),2) as percentagecontribution
from decodelab_intern.`dataset _for _data_analytics`
group by Product
order by totalreveune;

---  17 --- which channel/source (instaram,facebook,referrals, etc) drive the most revenue?
select ReferralSource, round( sum(TotalPrice),2) as Most_Revenue
from decodelab_intern.`dataset _for _data_analytics`
group by ReferralSource
order  by Most_Revenue desc;

--- 18 --- what is the average quantity purchased per order?
SELECT 
    ROUND(AVG(total_quantity), 2) AS average_quantity_per_order
FROM (
    SELECT 
        OrderID,
        SUM(Quantity) AS total_quantity
    FROM  decodelab_intern.`dataset _for _data_analytics`
    GROUP BY OrderID
) AS order_summary;

SELECT 
    ROUND(AVG(Quantity), 2) AS average_quantity_per_order
from decodelab_intern.`dataset _for _data_analytics`;

---- 19 --- how many pending ,shipped,delivered and cancelled orders exist?
select OrderStatus, count(*) as Existing_order
from decodelab_intern.`dataset _for _data_analytics`
group by OrderStatus
order by Existing_order;

--- 20 --- which coupon code generated the highest number of sales?
select CouponCode, round(sum(TotalPrice),2)as No_of_sales
from decodelab_intern.`dataset _for _data_analytics`
group by CouponCode
order  by No_of_sales desc;

--- 21 --- which customers has not ordered in recent months?
select CustomerID, max(Month) as last_order_month
from decodelab_intern.`dataset _for _data_analytics`
group by CustomerID
order  by last_order_month desc;

---- 22 --- what is the top selling product in each month?
select product, month
from decodelab_intern.`dataset _for _data_analytics`;

--- 23 --- what is the total discount amount given per product?
select Product, round(sum(case CouponCode when "save10" then TotalPrice *0.10 WHEN "Winter15" then TotalPrice *0.15 else 0 end),2) as Total_discount
from decodelab_intern.`dataset _for _data_analytics` 
group by Product
order by Total_discount;





