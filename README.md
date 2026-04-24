# 🛒 **Brazilian E-Commerce Analytics (Olist) – End-to-End Data Pipeline & BI Dashboard**

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Data Modeling](https://img.shields.io/badge/Data_Modeling-Star_Schema-brightgreen?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-Advanced-blue?style=for-the-badge)

---

## 📌 **Project Overview**

This project presents an end-to-end analytical solution using the Brazilian E-Commerce Public Dataset by Olist. The goal was to transform raw transactional data into a scalable, high-performance Business Intelligence dashboard to analyze sales trends, customer behavior, and seller performance.

> **🚀 Project Evolution (v2.0):** Initially built using a flat, denormalized SQL view. I recently refactored the architecture into a proper **Star Schema** in Power BI, implementing a custom dynamic Date table and advanced **DAX Time Intelligence** measures, significantly improving model performance and analytical depth.

---

## 🏗️ **Data Architecture & Workflow**

### 1️⃣ **Staging & Production Layer (PostgreSQL)**

* **Raw Ingestion:** CSV data loaded into a staging schema using `TEXT` data types to prevent truncation and allow flexible profiling.
* **Data Cleaning & Typing:** Transformed raw data with strict data typing (`NUMERIC`, `TIMESTAMP`, `INT`), handled missing values, and applied business logic to preserve referential integrity.
* **Validation:** Reconciled revenue between SQL tables and the BI Fact table to guarantee 100% accuracy. Accounted for a 775-order discrepancy caused by intentional `INNER JOIN` logic filtering out incomplete records.

### 2️⃣ **Data Modeling (Power BI)**

* **Star Schema Setup:** Designed a Star Schema with a central `Fact_sales` table and multiple dimensions (`Dim_customers`, `Dim_products`, `Dim_sellers`).

<div align="center">
  <img width="1846" height="736" alt="Olist_star_schema" src="https://github.com/user-attachments/assets/5b86c5a5-8a5f-44b7-9750-e57c22eb1ae3" />
</div>
<br>

* **Continuous Date Table:** Generated a dynamic, continuous `Dim_date` table using DAX to ensure seamless compatibility with Time Intelligence functions.

<div align="center">
  <img width="1854" height="494" alt="image" src="https://github.com/user-attachments/assets/c1b7c942-7ae0-4fcb-8457-07778882278b" />
</div>
<br>

### 3️⃣ **Advanced DAX & Business Metrics**

Developed robust DAX measures to track critical business KPIs, enabling deep-dive analysis into period-over-period performance:

* **Time Intelligence:** `SalesYTD` (Year-to-Date), `SalesLY` (Last Year), and `YoY%_Sales_variance` to track growth trends.
* **Financial Metrics:** `Total_Gross_Revenue`, `Net_sales`, and `Total_shipping_cost`.
* **Behavioral Metrics:** `AvgTicket` (Average Order Value), `Total_orders`, and `Total_customers`.

<div align="center">
  <img width="592" height="57" alt="image" src="https://github.com/user-attachments/assets/8a1cfa35-b701-4608-b48f-52e17090f4ac" />
  <br><br>
  <img width="895" height="71" alt="image" src="https://github.com/user-attachments/assets/7ca7710c-a8f8-43ca-b576-5b6694082e24" />
</div>

---

## 📈 **Key Business Insights**

* **Revenue Trends:** Consistent revenue growth between Sep 2016 and May 2018, followed by a structural trend reversal starting in June 2018.

<div align="center">
  <img width="1293" height="722" alt="Executive summary" src="https://github.com/user-attachments/assets/3a70f627-63d7-420d-b965-88fb7ea5859b" />
</div>
<br>

* **Category Performance:** *Health & Beauty* is the leading category, contributing heavily to the total revenue.
* **Market Concentration:** A significant portion of revenue is concentrated among top-tier sellers and specific geographic regions (e.g., SP state).

<div align="center">
  <img width="1272" height="720" alt="Product customer Insights" src="https://github.com/user-attachments/assets/1ab0ebbd-66b7-45d0-82ce-ef8c442b2a74" />
</div>
<br>

---

## 💡 **Skills Demonstrated**

* **Data Engineering:** Relational Databases (PostgreSQL), ETL Pipelines, Data Cleansing, SQL Joins.
* **Data Modeling:** Star Schema design, Fact & Dimension tables logic.
* **Business Intelligence:** Advanced DAX (Time Intelligence, variables, dynamic tables), Power BI Dashboarding, KPI creation.
