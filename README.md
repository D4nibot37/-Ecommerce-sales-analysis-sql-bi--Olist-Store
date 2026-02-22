# Brazilian E-Commerce (Olist) – End-to-End SQL Data Pipeline & BI Analysis


---

<br>


## 📌 Project Overview

This project presents a complete analytical pipeline built using the Brazilian E-Commerce Public Dataset by Olist.

The objective was to:

- Design a structured SQL data pipeline  
- Clean and transform raw transactional data  
- Validate data integrity before reporting  
- Create an analytical sales view  
- Develop business dashboards in Power BI  


---

<br>


## 🏗️ Data Architecture

The pipeline follows a layered structure to ensure scalability, clarity, and data integrity.


---

<br>


### 1️⃣ Staging Layer (Raw Ingestion)

Raw CSV data is loaded into a `staging` schema using `TEXT` data types.

**Purpose**

- Guarantee smooth ingestion  
- Avoid truncation errors  
- Enable flexible profiling  
- Prepare data for structured transformation  


---

<br>


### 2️⃣ Production Layer (Clean Tables)

Data is transformed into structured tables with:

- Correct data types (NUMERIC, TIMESTAMP, INT)  
- Standardized formatting  
- Business logic applied  
- Referential integrity preserved  


---

<br>


### 3️⃣ Analytical View

A denormalized reporting view was created:

`public.view_sales_report`

This view integrates time, customer, seller, and revenue dimensions and serves as the source for BI reporting.


---

<br>


## 📊 Data Validation

All validation was performed in SQL before dashboard development.

- No duplicate primary keys detected  
- Revenue successfully reconciled between fact table and analytical view  
- 775-order discrepancy explained by INNER JOIN logic  
- No null or negative revenue values  


---

<br>


## 📈 Business Insights

- Revenue grew steadily between Sep 2016 and May 2018 (+1.15M).  
- Structural trend reversal observed from June 2018.  
- Health & Beauty is the leading category (16% of total revenue).  
- Revenue concentration exists across top sellers and regions.  
- Late 2018 decline reflects dataset limitation.  


---

<br>


## 🛠 Tools Used

- PostgreSQL  
- Power BI  
- GitHub  


---

<br>


## 🎯 Key Learning Outcomes

- Layered SQL architecture  
- Fact vs Dimension modeling  
- Data profiling and validation  
- Revenue reconciliation  
- BI storytelling  

