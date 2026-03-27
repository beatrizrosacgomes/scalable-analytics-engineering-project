# Analytics Engineering Project  
**Author:** Beatriz Gomes  

---

## 🎯 Objective

Design and implementation of a scalable analytical data model to support business-driven questions, focusing on monthly sales variation and product performance analysis.

The solution was built following analytics engineering best practices, ensuring:

- Data consistency  
- Governance  
- Performance  
- Reusability  
- Future analytical scalability  

---

## 🧠 Analytical Approach

The development followed a structured analytical methodology:

1. Business understanding and requirement analysis  
2. Critical assessment of the existing data model  
3. Definition of architectural principles  
4. Evaluation of modeling approaches (Star Schema, Snowflake, OBT)  
5. Selection of the most suitable model based on trade-offs  
6. Implementation of dimensional architecture  
7. Creation of analytical views for consumption  
8. Proposal of future evolutions  

---

## 🏗 Data Architecture

The project follows a layered architecture pattern:

- **Trusted Layer** → Structured and cleaned source data  
- **Refined Layer** → Dimensional model (Star Schema)  
- **Semantic Layer** → Analytical views for business consumption  

### 📐 Dimensional Model

<img width="963" height="476" alt="image" src="https://github.com/user-attachments/assets/2a2760d4-a14d-4558-88b3-42d33f87d44e" />

The Star Schema was selected considering:

- Simplicity for analytical consumption  
- Performance in query execution  
- Alignment with self-service BI  
- Balance between normalization and usability  

### Fact Table

- Grain: **Order item level**
- Stores atomic metrics:
  - Quantity  
  - Unit price  
  - Net revenue  

### Dimensions

- Product  
- Category  
- Brand  
- Date  
- Region  

---

## 📊 Analytical Deliverables

The model supports key business analyses:

- Month-over-Month (MoM) revenue variation  
- Top 10 categories based on **Net Revenue** (primary ranking metric)  
- Sales analysis by region and time  
- Standardized KPI definitions  

### 📌 Analytical Definitions

- Net Revenue used as primary metric for ranking  
- Canceled orders excluded from analysis  
- Standardized calculation logic to ensure consistency  

### Example Views

- `vw_monthly_variation` → MoM comparison by category
  
  <img width="521" height="210" alt="image" src="https://github.com/user-attachments/assets/054a7a6d-4248-463a-b871-86ae900f7ee4" />
  
- `vw_top_10_categories` → Ranking based on net revenue

  <img width="189" height="249" alt="image" src="https://github.com/user-attachments/assets/ec771d57-efa4-47bf-8dd2-13675c558e6c" />

  

---

## 🛡 Governance & Data Quality

The solution incorporates data governance best practices:

- Standardization of keys and data types  
- Defined grain for fact table  
- Consistent metric definitions  
- Logical separation between layers  
- Data quality considerations:
  - Null handling  
  - Deduplication  
  - Referential integrity  

---

## 🔐 Security & Compliance

Prepared for secure and compliant data usage:

- Role-Based Access Control (RBAC) structure  
- Integration with IAM for access management  
- Designed for LGPD compliance:
  - Separation of sensitive data  
  - Possibility of anonymization/tokenization  
  - Controlled exposure via views  

---

## ⚙ Performance Optimization

- Query optimization using dimensional model  
- Reduced need for complex joins  
- Use of aggregated views for analytical consumption  
- Prepared for partitioning strategies  

---

## 🚀 Scalability & Future Evolution

The architecture enables future analytical growth:

### 📈 Advanced Analytics

- Year-over-Year (YoY) analysis  
- Trend analysis  
- Forecasting models  

### 🤖 Machine Learning Readiness

- Structured data for feature engineering  
- Historical consistency for modeling  
- Support for demand prediction  

### 🧩 Data Platform Evolution

- Semantic layer expansion  
- Self-service BI enablement  
- Data Quality monitoring frameworks  

---

## 💼 Business Impact

The solution enables:

- More reliable decision-making  
- Faster analytical insights  
- Reduced dependency on technical teams  
- Improved planning for demand and supply  
- Scalable foundation for data-driven initiatives  

---

## 🛠 Technologies

- SQL (BigQuery)  
- GCP  
- Dimensional Modeling  
- Analytical Views  
- Git (Version Control)
- DBdiagram

---

## 📷 Architecture & Model

### Star Schema

<img width="970" height="447" alt="image" src="https://github.com/user-attachments/assets/10904ba6-e6d7-4e03-964b-25265f6a6296" />

### Diagrams

<img width="852" height="716" alt="image" src="https://github.com/user-attachments/assets/8699b143-58ca-428f-a02f-e2e8d3e4111e" />

### Data Architecture Layers (GCP)

<img width="190" height="292" alt="image" src="https://github.com/user-attachments/assets/3e652455-4551-4c20-8c72-e6ac723638e9" />


---

## 📌 Notes

This repository contains a technical implementation developed for evaluation purposes, focusing on analytics engineering practices and scalable data modeling.
