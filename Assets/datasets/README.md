# 📂 Datasets Overview
This folder contains the datasets used for analyzing department budgets, project performance, and workforce financials in Power BI.

## 📄 Available Datasets
| File Name                 | Description |
|---------------------------|-------------|
| `employees.csv`           | Contains employee details (ID, name, job title, salary, department etc) |
| `departments.csv`         | Lists department names and goals |
| `projects.csv`            | Contains project details (ID, name, budget, etc) |
| `completed_projects.csv`  | Completed project details with budget info |
| `upcoming_projects.csv`   | Upcoming project details with budget allocation |
| `project_assignments.csv` | Links employees to projects |
| `Head_Shots.csv`          | AI generated image URLs for employee headshots |

## 📊 Data Usage
- **Employee & Department Data:** Used to analyze workforce structure and salary distribution.
- **Project Status:** Helps track completed and upcoming projects.
- **Financials:** Supports budget and cost analysis for departments.

## 🛠️ Data Processing Steps
1. **Loaded Datasets to Microsoft SQL Server Management Studio (SSMS):**
   - Imported all datasets into SSMS to enable structured querying.
   - Established relationships between tables (Employees → Departments, Projects → Assignments, etc.).

2. **Queried Data for Transformation:**
   - Used SQL queries to extract, clean, and aggregate relevant data.
   - Created views to organize data before loading into Power BI.

3. **Loaded Processed Data into Power BI:**
   - Connected SSMS to PowerBI and retrieved transformed data.
   - Created relationships and visualized insights using various Power BI features.

## 📌 How to Use
- Ensure all datasets are imported into SSMS before querying.
- Execute the provided SQL scripts from the `sql_queries/` folder to transform the data.
- Import the transformed tables into Power BI for visualization.

---
💡 *These datasets are crucial for monitoring project status, budget efficiency, and workforce impact.* 🚀


