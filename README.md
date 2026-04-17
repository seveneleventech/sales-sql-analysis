# 📊 Sales Performance Analysis Using SQL

## 📌 Overview
This project analyzes sales data to identify trends in revenue, profitability, regional performance, and customer behavior using SQL.

---

## 🎯 Business Questions
- How does revenue change over time?  
- Which product categories generate the most revenue and profit?  
- Which regions perform best?  
- Do returning customers contribute more revenue?  

---

## 🛠️ Tools Used
- SQL  
- PostgreSQL  

---

## 📂 Dataset
- 2000+ sales records  
- Includes product, region, customer, and transaction details  

---

## 📊 Key Insights
- January had the highest revenue  
- Clothing generated the most revenue  
- Furniture was the most profitable category  
- North region performed best  
- Revenue from new and returning customers is nearly equal  

---

## 🚀 Recommendations
- Focus on high-margin categories like Furniture  
- Improve performance in underperforming regions (South)  
- Strengthen customer retention strategies  

---

## 📸 Sample Query

```sql
SELECT 
    DATE_TRUNC('month', TO_DATE(sale_date, 'DD/MM/YYYY')) AS month,
    SUM(sales_amount::NUMERIC) AS total_revenue
FROM sales_raw
GROUP BY month
ORDER BY total_revenue DESC;
