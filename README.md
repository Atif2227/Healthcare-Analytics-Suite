# 📌 Project Title - Medicare Global Healthcare Analytics Suite
Healthcare Analytics Suite is a comprehensive Power BI reporting solution designed for hospitals and healthcare organizations. The project includes interactive and customized dashboards for key areas such as In-patient (IP), Out-patient (OP), Emergency, Procedures, Surgeries, Revenue, Labs, etc.

Data is sourced from a PostgreSQL database, organized into SQL views, and validated for accuracy. The reports are tailored to meet client-specific requirements, ensuring insightful and actionable analytics. This solution also involves continuous bug fixing and enhancements for optimal performance and user satisfaction.

## Project Structure
```plaintext
Healthcare-Analytics-Suite/
├── Data/
│   ├── sample_data.csv          # Sample or anonymized dataset for testing
│   ├── data_dictionary.xlsx     # Data dictionary explaining database fields
├── Scripts/
│   ├── create_views.sql         # SQL script for creating views for IP, OP, Emergency, etc.
│   ├── data_validation.sql      # SQL script for validating data accuracy
│   ├── bug_fixing_notes.sql     # SQL notes/scripts for resolving common issues
├── Visualizations/
│   ├── HealthcareAnalytics.pbix # Power BI file containing the dashboards
│   ├── screenshots/
│       ├── ip_page.png          # Screenshot of the Inpatient (IP) dashboard
│       ├── op_page.png          # Screenshot of the Outpatient (OP) dashboard
│       ├── emergency_page.png   # Screenshot of the Emergency dashboard
│       ├── revenue_page.png     # Screenshot of the Revenue dashboard
├── Documentation/
│   ├── user_guide.pdf           # User guide for understanding and using the dashboards
│   ├── client_customization.md  # Notes on customization for different clients
├── LICENSE                      # Proprietary license for the project
├── README.md                    # Main documentation for the project
```

## License

This project is licensed under a **Proprietary License**.

- You are allowed to view and download the project for personal, non-commercial use only.
- Redistribution is permitted only in its original form with attribution.
- Modifications and commercial use are strictly prohibited without prior written permission.

For full details, see the [LICENSE](LICENSE) file.


### **Description of Key Components**
- **Data/**: Contains sample datasets used for testing and development.
- **Scripts/**: Includes SQL scripts for data processing and creating views.
- **Visualizations/**: Contains Power BI files and screenshots of reports.
- **Documentation/**: User guides or any related project documentation.







