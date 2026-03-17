# Global Superstore Sales Analytics Dashboard

## 1. Business Problem

Retail companies generate large volumes of transactional data but often struggle to extract meaningful insights from it. The goal of this project is to analyze sales performance, customer behavior, product profitability, and shipping operations to support data-driven business decisions.

## 2. Dataset

Dataset Used: Global Superstore Dataset

The dataset contains over 50,000 records including:

- Orders
- Customers
- Products
- Sales
- Profit
- Shipping information
- Geographic regions

## 3. Data Modeling

A Star Schema data model was implemented to optimize analytical performance.

Fact Table:
Sales Transactions

Dimension Tables:
- Customer
- Product
- Geography
- Date
- Shipping Mode

This model allows efficient filtering, aggregation, and business analysis.

## 4. Dashboard Development

An interactive Power BI dashboard was developed with four main pages:

Executive Overview  
Provides a high-level summary of sales performance and KPIs.

Product Analysis  
Analyzes top-performing products and category profitability.

Customer Analysis  
Examines customer contribution, purchasing patterns, and high-value customers.

Shipping & Operations  
Evaluates delivery time, shipping mode usage, and operational efficiency.

## 5. Key Metrics

Key KPIs implemented using DAX include:

- Total Sales
- Total Profit
- Profit Margin
- Sales Year-over-Year Growth
- Average Revenue per Customer
- Average Delivery Time

## 6. Business Insights

The analysis revealed several valuable insights:

- A small group of customers contributes significantly to overall revenue.
- Certain product categories generate high sales but lower profit margins.
- Sales performance varies significantly across regions.
- Shipping mode impacts delivery performance and customer satisfaction.

## 7. Tools Used

- SQL
- Power BI
- DAX
- Data Modeling
- Data Visualization
- Business Intelligence
