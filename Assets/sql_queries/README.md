# 📂 SQL Queries Overview
This folder contains SQL scripts used for extracting and transforming data before loading into Power BI.

## 📄 Available SQL Script
| File Name               | Description |
|-------------------------|-------------|
| `project_queries.sql`   | Contains all SQL queries for project status, employee data, and department budget analysis. |

## 🛠️ SQL Queries
### **Project Queries**
This SQL script includes queries for:
1. **Project Status Table:** Combines completed and upcoming projects into a unified dataset.
2. **Employee Project Data:** Joins employees, departments, and projects for workforce financial analysis.

#### **Project Status Table**
```sql
WITH project_status AS (
    SELECT
        project_id,
        project_name,
        project_budget,
        'upcoming' AS status
    FROM upcoming_projects
    UNION ALL
    SELECT
        project_id,
        project_name,
        project_budget,
        'completed' AS status
    FROM completed_projects
)
```

#### **Employee Project Data**
```sql
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    e.salary,
    d.Department_Name,
    pa.project_id,
    ps.project_name,
    ps.project_budget,
    ps.status
FROM employees e
JOIN departments d
ON e.department_id = d.Department_ID
JOIN project_assignments pa
ON pa.employee_id = e.employee_id
JOIN project_status ps
ON pa.project_id = ps.project_id;
```

## 📌 How to Use
1. Open **Microsoft SQL Server Management Studio (SSMS)** or any SQL-compatible tool.
2. Run `project_queries.sql` to process all necessary data.
3. Export the processed data to Power BI for visualization.

---
💡 *This SQL script structures and prepares data for Power BI dashboards.* 🚀

