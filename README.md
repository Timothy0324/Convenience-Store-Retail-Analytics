# Convenience Store Retail Analytics — From 3NF Database Design to Business Insights
Convenience Store Retail Analytics — From 3NF Database Design to Business Insights

## Executive Summary
This project rebuilds a messy retail dataset into a fully normalized **3NF relational database** and performs SQL-based analytics to answer business-critical questions for a convenience store chain operating in the **North region**.  

The workflow covers the full data lifecycle: **data cleaning → ERD design → MySQL physical schema → ETL → SQL analytics → business recommendations**.  

The final database supports robust analytics, enabling insights into product performance, store productivity, and revenue optimization.

---

## How to Run This Project
This project is fully reproducible using MySQL.  
Follow the steps below to recreate the database and execute all analytical queries.

---

### **1. Load the Full Database (Tables + Cleaned Data)**

Run the full MySQL dump file to automatically create all tables and insert all cleaned records:
👉 [04_full_database_dump.sql](https://github.com/Timothy0324/Convenience-Store-Retail-Analytics/blob/main/sp_convenience_store_analysis/04_full_database_dump.sql)

### **2. Data Analytics SQL Queries**
All queries used in this project are available here:  
👉 [03_data_analytics_queries.sql](https://github.com/Timothy0324/Convenience-Store-Retail-Analytics/blob/main/sp_convenience_store_analysis/03_data_analytics_queries.sql)

---

## Business Problem
The original raw dataset contained inconsistencies such as:
- Missing or invalid category codes (e.g., `"Z"`, `"RX"`),
- Non-normalized structure,
- Missing primary keys,
- Mixed data types (INT, text stored as numbers),
- No referential integrity.

The business needed answers to:
1. **Which products should always be in stock?**  
2. **Which products should be removed due to low demand?**  
3. **Which stores underperform in sales and transactions?**  
4. **Which product groups generate the most revenue?**  
5. **What operational improvements can drive profitability?**

A cleaned and normalized database was required before analysis.

---

## Methodology

### **A. Data Cleaning**
- Converted invalid category codes (`"Z"` → `0`, `"RX"` → numeric).
- Standardized datatypes (`INT`, `BIGINT`, expanded `VARCHAR` sizes).
- Ensured product hierarchy consistency.
- Filtered dataset to **North region**.

### **B. Logical Database Design (ERD)**
A fully normalized **3NF schema** was designed with the following tables:
- MajorProductCategory  
- ProductCategory  
- ProductSubCategory  
- ProductGroup  
- Product  
- Customer  
- StoreMaster  
- Order  
- SalesItem (composite PK: SalesOrderID + ProductNo)
<img width="737" height="791" alt="image" src="https://github.com/user-attachments/assets/0089bea6-df79-4db2-a320-5f35ea7a0127" />


### **C. Physical Database (MySQL)**
Created using:
- `CREATE TABLE`
- Primary/foreign keys
- Default timestamps
- Composite keys (SalesItem)
- Referential integrity across product hierarchy and transactions

### **D. SQL Analysis**
Conducted using:
- JOIN operations  
- GROUP BY aggregations  
- SUM, COUNT, and sorting  
- Region-specific filtering

---

## Skills Demonstrated
- **Database Modeling (ERD, 3NF)**  
- **SQL (JOINs, Aggregation, PK/FK Design)**  
- **ETL: MySQL Import Wizard & Data Cleaning**  
- **Logical to Physical Schema Conversion**  
- **Business Analytics & Insight Development**  
- **Data Documentation**  

---

## Results and Business Recommendations

### ⭐ 1. Top 3 Products to ALWAYS Keep in Stock
Based on total units sold in the North region:
- **MIDWEST FASTENER**  
- **NEWPORT / MARLBORO cigarettes**  
- **HERSHEY / KIT KAT candy products**

**Recommendation:**  
Increase safety stock and review supply chain replenishment frequency to avoid out-of-stock situations.

---

### ⭐ 2. Products That Should Be Eliminated
Products with negative or minimal sales (often voids / returns):
- Low-demand medical supplies  
- Niche OTC products  
- Specialty home-care items  

**Recommendation:**  
Reduce shelf space and potentially discontinue these SKUs to improve inventory efficiency.

---

### ⭐ 3. Underperforming Stores (Lowest Total Sales)
Lowest-performing stores in the North region:
- **Store 978054**  
- **Store 978053**  
- **Store 978057**

**Recommendation:**  
Audit store layout, marketing tactics, staffing levels, and local competition.  
Consider promotions or assortment adjustments.

---

### ⭐ 4. Highest-Grossing Product Groups
Top revenue categories:
- **OTHER CARDS**  
- **BRAND (general merchandise)**  
- **OTC Medications (Allergy, Sinus, Cold/Flu)**  

**Recommendation:**  
Expand shelf space for these high-demand groups and prioritize promotional placement.

---

### ⭐ 5. Stores With the Fewest Transactions
Lowest transaction counts:
- **Store 978034**  
- **Store 978053**  
- **Store 978057**

**Recommendation:**  
Investigate foot traffic patterns, hours of operation, and neighborhood demographics.

---

## Next Steps

To further enhance analytics and operational decision-making:

### Short-Term Enhancements
- Add **time-of-day** and **day-of-week** sales granularity.
- Run **basket analysis** to identify product affinity.
- Build **Tableau / Power BI dashboards**.

### Long-Term Enhancements
- Apply demand forecasting (ARIMA / Prophet).
- Integrate cost data for **profit margin analysis**.
- Add inventory tables to support **reorder recommendations**.
