# 📌 Project Title - Medicare Global Healthcare Analytics Suite

**Healthcare Analytics Suite** is a comprehensive Power BI reporting solution designed for hospitals and healthcare organizations. The project includes interactive and customized dashboards for key areas such as **In-patient (IP), Out-patient (OP), Emergency, Procedures, Surgeries, Revenue, Labs, etc.** This dashboard was imbedded in a multi-tier client-server and internet-based business solution (**YASASII**) that serves as a Hospital Information System (HIS). 

The **YASASII-HIS Data** is hosted in a **PostgreSQL** database, organized into tables, views, stored procedures, etc. The reports are tailored to meet client-specific requirements, ensuring insightful and actionable analytics. This solution also involves continuous bug fixing and enhancements for optimal performance and user satisfaction.

---

## 🧠 Purpose
The **Medicare Global Healthcare Analytics Suite** serves as a centralized strategic intelligence hub for hospital administrators and clinical leads. Its primary purpose is to transform raw data from the **YASASII Hospital Information System (HIS)** into actionable insights.

By visualizing data from the PostgreSQL database, the dashboard aims to:

* **Optimize Operational Efficiency:** Monitor patient throughput in Out-Patient (OP) and In-Patient (IP) departments to manage capacity.
* **Enhance Financial Oversight:** Track revenue streams across different payer types and departments to identify growth opportunities and leakages.
* **Improve Clinical Quality:** Analyze procedure and surgery volumes to ensure resource allocation aligns with patient needs.
* **Reduce Revenue Loss:** Monitor "No Show" rates for outpatients to improve appointment scheduling and resource utilization.

---

## 🚀 Key Features & Functional Modules

### 1. Outpatient (OP) Performance Analytics
This module tracks the high-volume traffic of the hospital.
* **Encounters Tracking:** Displays total, new, and follow-up encounters to distinguish between patient acquisition and retention.
* **Demographic Segmentation:** Breaks down patient visits by gender and age groups (e.g., 25–49 is a primary demographic).
* **Provider & Specialty Ranking:** Identifies top-performing doctors and departments (e.g., General Medicine and Cardiology) by encounter volume.
* **No Show Analysis:** Visualizes the percentage of missed appointments by month and department to trigger corrective actions.

### 2. In-Patient (IP) & Admission Insights
Focuses on bed management and the severity of cases within the hospital.
* **Admission Type Profiling:** Categorizes patients by IP, Day Case, or Emergency admissions.
* **Bed & Ward Management:** Detailed tracking of patient counts by "Room Class" (Deluxe, Ultra-Deluxe, AC Room) and specific Nursing Stations.
* **Average Length of Stay (LOS):** Analyzes the time spent in the hospital by nursing station to identify bottlenecks in discharge or care.

### 3. Procedures & Surgeries Intelligence
Detailed metrics on clinical interventions.
* **Procedure Volume:** Tracks total procedures (e.g., Ventilator, Hemodialysis, CT Scans) and their distribution by department.
* **Surgery Metrics:** Segments surgeries into Elective, Major, or Emergency and monitors the utilization of specific Operating Rooms (ORs).
* **Nationality Tracking:** Understands the patient base diversity, such as Indian vs. International patients.

### 4. Revenue & Financial Analytics
A comprehensive view of the hospital’s financial health.
* **Revenue Breakdown:** High-level cards showing Revenue With/Without VAT, Insurance Revenue, and Corporate Revenue.
* **Payer Type Distribution:** Analyzes the percentage of income from Self-Pay (the largest share at 84.33%), Insurance, and Corporate accounts.
* **Category-Specific Revenue:** Visualizes which services (ADT, Laboratory, Pharmacy, or specific Room Types) are the primary revenue drivers.

---

## 🛠 Dashboard Interactivity Features
* **Dynamic Filtering:** All pages include slicers for Date Range, Year, Quarter, Month, Department, Specialty, and Provider, allowing users to drill down into specific data points.
* **Comparative Visuals:** Uses a mix of Donut charts for market share (Payer Type), Bar charts for rankings (Top 10 Providers), and Line/Area charts for monthly trends.

## 🔍 Tools Used
* **SQL** (PostgreSQL)
* **Power BI**

---

##    Screenshots
*(Screenshots and dashboard PDF are in Screenshots folder)*
