# Data Warehouse and Analytics Project
This repository contains an end-to-end data warehousing and analytics project built to demonstrate practical data engineering and analytics skills. It covers the full pipeline: designing a data architecture, building ETL processes, modeling data for reporting, and producing SQL-based insights from the final data model.

## Project Overview
The project consolidates sales data from two source systems, an ERP and a CRM, into a single SQL Server data warehouse. The goal is to take raw, disconnected source files and turn them into a clean, well-modeled dataset that supports reliable business reporting.

The work is organized into two parts:

- **Data Engineering:** Designing and building the warehouse, including ETL pipelines and a star schema data model, so the data is structured for efficient analysis.

- **Data Analytics:** Writing SQL queries and reports on top of the warehouse to surface insights on customer behavior, product performance, and sales trends.


## Data Architecture
The warehouse follows a Medallion Architecture with three layers:

- **Bronze:** Raw data loaded as-is from the source CSV files (ERP and CRM) into SQL Server, with no transformation.
- **Silver:** Cleaned, standardized, and normalized data, ready for modeling.
- **Gold:** Business-ready data organized into a star schema, structured for reporting and analytics.

## Skills Demonstrated
This project reflects hands-on work across:
- SQL Server database development
- ETL pipeline design and implementation
- Data modeling (star schema, fact and dimension tables)
- Data cleaning and quality checks across multiple source systems
- SQL-based analytics and reporting

## Repository Structure

```
data-warehouse-project/
│
├── datasets/                           # Raw ERP and CRM source data
│
├── docs/                               # Architecture and documentation
│   ├── data_architecture.drawio        # Overall project architecture
│   ├── data_flow.drawio                # Data flow diagram
│   ├── data_models.drawio              # Star schema data models
│   ├── etl.drawio                      # ETL techniques and methods
│   ├── data_catalog.md                 # Field-level dataset documentation
│   ├── naming-conventions.md           # Naming conventions for tables, columns, files
│
├── scripts/                            # SQL scripts for ETL and transformation
│   ├── bronze/                         # Raw data extraction and loading
│   ├── silver/                         # Data cleaning and transformation
│   ├── gold/                           # Analytical data models
│
├── tests/                              # Data quality and validation scripts
│
├── README.md
├── LICENSE
└── requirements.txt
```

## Tools Used

- **SQL Server Express** for hosting the database
- **SQL Server Management Studio (SSMS)** for database development and querying
- **Draw.io** for architecture and data model diagrams
- **Git/GitHub** for version control

## Notes
Scope for this project is limited to the most recent snapshot of the data; historical tracking (slowly changing dimensions) is out of scope. Full documentation of the data model and naming conventions is in the `docs/` folder.

## License
This project is licensed under the MIT License. You are free to use, modify, and share it with proper attribution.
