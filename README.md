# Sales_analysis.sql
📊 Sales Data Analysis — SQL Project
An end-to-end SQL analysis of a sales dataset, exploring revenue trends, customer behavior, product performance, and operational health.
🗂️ Dataset
Table: analystlab_intern.sales_data_sample
Key columns: PRODUCTLINE, ORDERNUMBER, SALES, YEAR_ID, MONTH_ID, CUSTOMERNAME, STATUS, DEALSIZE, MSRP, PRICEEACH, QUANTITYORDERED, STATE, COUNTRY

  🔍 Analysis Sections
1. Product Line Performance
	•	Which product lines generated more than $500,000 in total sales?
	•	Average order value and order count per product line
	•	Product line with the highest total sales
2. Revenue & Sales Performance
	•	Total revenue by year
	•	Which months consistently peak in sales across all years?
	•	Top 10 customers by total sales
3. Profitability & Pricing
	•	Average discount rate per product line (MSRP - PRICEEACH)
	•	Products with the highest price-to-MSRP ratio
	•	Which deal sizes (Small / Medium / Large) contribute most to revenue?
	•	Product lines where price falls below MSRP by more than 30%
4. Order & Fulfilment Health
	•	Percentage of orders that are cancelled, disputed, or on hold
	•	Customers with the highest rate of non-shipped orders
	•	Average order value by state
5. Customer & Geography
	•	Which countries or territories generate the most revenue?
	•	How many unique customers per year — is the base growing?
	•	Customers who placed only one order (churn risk)
6. Product & Volume Analysis
	•	Which product line has the highest average quantity ordered?
	•	Products where price frequently falls below MSRP by more than 30%

💡 Sample Query
 -- Which product lines generated more than $500,000 in total sales?
SELECT DISTINCT PRODUCTLINE,
       COUNT(ORDERNUMBER) AS NumberOfOrders,
       SUM(SALES) AS TotalSales,
       AVG(SALES) AS AverageSales
FROM analystlab_intern.sales_data_sample
GROUP BY PRODUCTLINE
HAVING SUM(SALES) > 500000
ORDER BY TotalSales DESC;

🛠️ Tools Used
	•	MySQL Workbench — query editor and execution
	•	SQL — aggregations, CASE statements, HAVING, window logic
