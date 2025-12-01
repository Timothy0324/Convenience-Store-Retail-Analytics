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

### **1. Load the Full Database (Tables + Cleaned Data)**

Run the full MySQL dump file to automatically create all tables and insert all cleaned records:  
👉 [04_full_database_dump.sql](https://github.com/Timothy0324/Convenience-Store-Retail-Analytics/blob/main/sp_convenience_store_analysis/04_full_database_dump.sql)

### **2. Data Analytics SQL Queries**
All queries used in this project are available here:  
👉 [03_data_analytics_queries.sql](https://github.com/Timothy0324/Convenience-Store-Retail-Analytics/blob/main/sp_convenience_store_analysis/03_data_analytics_queries.sql)

### Raw Dataset
The original uncleaned dataset is provided for reference:  
👉 [Raw Dataset](https://github.com/Timothy0324/Convenience-Store-Retail-Analytics/blob/main/Dataset/original_raw_dataset.xlsx)

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
- **01820025008**  
- **NEWPORT 100’S**

**Recommendation:**  
Increase safety stock and review supply chain replenishment frequency to avoid out-of-stock situations.
<img width="474" height="650" alt="image" src="https://github.com/user-attachments/assets/1960cb9c-6658-4535-b506-c839dc85038e" />


---

### ⭐ 2. Products That Should Be Eliminated
Products with negative or minimal sales (often voids / returns):
- Low-demand medical supplies  
- Niche OTC products  
- Specialty home-care items  

**Recommendation:**  
Reduce shelf space and potentially discontinue these SKUs to improve inventory efficiency.
<img width="410" height="569" alt="image" src="https://github.com/user-attachments/assets/544570e8-e78d-4545-8968-145f171da3df" />


---

### ⭐ 3. Underperforming Stores (Lowest Total Sales)
Lowest-performing stores in the North region:
- **Store 978054**  
- **Store 978055**  
- **Store 978060**

**Recommendation:**  
Audit store layout, marketing tactics, staffing levels, and local competition.  
Consider promotions or assortment adjustments.
<img width="362" height="452" alt="image" src="https://github.com/user-attachments/assets/b825682c-0d0d-4130-bc6d-f491ef7f867b" />



---

### ⭐ 4. Highest-Grossing Product Groups
Top revenue categories:
- **OTHER CARDS**  
- **BRAND (general merchandise)**  
- **Allergy, Tabs & Caps**  

**Recommendation:**  
Expand shelf space for these high-demand groups and prioritize promotional placement.
<img width="563" height="634" alt="image" src="https://github.com/user-attachments/assets/a7e0eec0-2341-4f95-a313-fb7ddf4a9987" />


---

### ⭐ 5. Stores With the Fewest Transactions
Lowest transaction counts:
- **Store 978034**  
- **Store 978053**  
- **Store 978064**

**Recommendation:**  
Investigate foot traffic patterns, hours of operation, and neighborhood demographics.
<img width="567" height="644" alt="image" src="https://github.com/user-attachments/assets/ecb5c8c7-a254-4248-8b17-27bee8f4ad5d" />


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
