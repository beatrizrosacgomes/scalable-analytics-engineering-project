# Analytics Engineering Project
Author: Beatriz Gomes

## 🎯 Objective

Development of a dimensional data model to support monthly sales variation analysis by category and enable scalable analytical consumption.

The solution was designed following analytics engineering best practices, ensuring governance, performance, and future extensibility.

---

## 🏗 Data Architecture

The project follows a layered architecture:

- **Trusted Layer**: Raw structured data ingestion
- **Refined Layer**: Dimensional modeling (Star Schema)
- **Semantic Layer**: Analytical views for business consumption

### Fact Table
- Grain: Order item level
- Metrics stored atomically (e.g., net revenue)

### Dimensions
- Product
- Category
- Brand
- Date

---

## 📊 Analytical Deliverables

- Month-over-Month (MoM) revenue variation
- Top 10 categories based on Net Revenue
- Exclusion of canceled orders
- Standardized KPI definitions

### Example Views
- `vw_monthly_variation`
- `vw_top_10_categories`

---

## 🔐 Governance & Security

- Role-Based Access Control (RBAC) ready structure
- Logical separation between transactional and analytical layers
- Prepared for LGPD-compliant customer data inclusion (with anonymization strategies)

---

## 🚀 Scalability & Future Evolution

The model was designed to support:

- Year-over-Year (YoY) analysis
- Forecasting models
- Machine Learning feature engineering
- Self-service BI consumption
- Data Quality monitoring
- Query performance optimization

---

## 🛠 Technologies

- SQL
- GCP
- Dimensional Modeling
- Analytical Views
- Git Version Control

