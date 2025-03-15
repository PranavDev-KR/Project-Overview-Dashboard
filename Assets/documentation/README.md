# 📌 Project Documentation: Department Budget & Project Performance Analysis

## **1. Overview**
This project analyzes **department budgets, project performance, and workforce financials** using **SQL and Power BI**. The primary objective is to identify **over-budget or underperforming projects** and ensure that department budgets align with operational expenses.

### **Key Business Questions Answered:**
- Which **projects and departments** are at risk of exceeding their budgets?
- How are project **budgets distributed** across departments?
- What are the **workforce costs** per department?
- How do **salary and project expenses** impact overall budget allocation?

---

## **2. Datasets Used**
The analysis is based on the following datasets:

| Dataset Name              | Description |
|---------------------------|-------------|
| `employees.csv`           | Employee details (ID, name, job title, salary, department) |
| `departments.csv`         | Department names and goals |
| `projects.csv`            | Project details (ID, name, budget) |
| `completed_projects.csv`  | Completed project details with budget information |
| `upcoming_projects.csv`   | Upcoming project details with budget allocation |
| `project_assignments.csv` | Links employees to projects |
| `Head_Shots.csv`          | Employee headshots (image URLs) |

---

## **3. Data Processing Steps**

### **Step 1: Load Data into SQL Server (SSMS)**
- All datasets were **imported into Microsoft SSMS** for structured querying.
- Relationships between tables were established (**Employees → Departments, Projects → Assignments, etc.**).

### **Step 2: SQL Querying and Data Transformation**
#### **2.1 Creating the Project Status Table**
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
#### **2.2 Employee Project Data Query**
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
- **Purpose:** This joins employee, department, and project details to analyze workforce financials and project performance.

### **Step 3: Load Data into Power BI**
- The cleaned and processed data from SQL Server was **loaded into Power BI**.

### **Step 4: Transform Data in Power BI**
- **Grouped Data** by `Department_Name` and `Department_Goals`.
- **Added Capital Calculation:**
```Power Query
= [Budget] * 0.5 - ([Salary Cost] * 2 + [Project Cost])
```
- **Added 2-Year Budget Calculation:**
```Power Query
= [Budget] * 0.5
```

---

## **4. Power BI Dashboard Design**
The **Project Overview Dashboard** provides an interactive analysis of **financials, workforce, and project performance**.

### **Dashboard Components:**
1️⃣ **Employee Information Panel**
   - Displays **headshot, name, job title, department, and compensation**.
   - Allows users to filter by employee ID.

2️⃣ **Project Distribution Visuals**
   - **Capital Breakdown (Donut Chart)**: Shows financial balance across projects.
   - **Project Budget Breakdown (Donut Chart)**: Highlights budget allocation per project.

3️⃣ **Department Financial Summary Table**
   - **Columns:** Project Cost, Salary Cost, Budget, 2-Year Budget, Capital.
   - **Negative capital values are highlighted** for easier identification.

4️⃣ **Project Budgets by Department**
   - **Bar chart visualization** representing budget allocation across departments.

5️⃣ **Project Budgets Breakdown**
   - Displays **individual project budgets** for analysis and comparisons.

6️⃣ **Dynamic Filters**
   - **Department Name & Project Status Filters** for interactive insights.

---

## **5. Key Insights & Findings**
📌 **Departments with Negative Capital:**
- Human Resources **(-$25,000)** exceeded budget allocations.
- Requires adjustments in budget planning.

📌 **High Budget Utilization:**
- Engineering and Marketing departments efficiently manage resources.
- Sales has the **largest allocated project budget ($150K)**.

📌 **Salary Costs Impact on Budget:**
- Higher salaries result in higher departmental budget allocation.
- **Salary optimization strategies** can improve financial balance.

---

## **6. Recommendations**
✅ **Optimize Over-Budget Departments:**
   - Reallocate budget for underperforming departments.
   - Analyze HR costs and optimize spending.

✅ **Improve Budget Forecasting:**
   - Set up **alerts for budget overruns** in Power BI.
   - Establish **trend analysis for future planning**.

✅ **Enhance Dashboard Usability:**
   - Implement **drill-through reports** for deeper financial breakdowns.
   - Add **historical trend analysis** for better decision-making.

---

## **7. Conclusion**
This **SQL & Power BI project successfully meets all objectives** by analyzing **department budgets, project financials, and workforce costs**. The interactive dashboard provides **clear insights into financial risks and project status**, allowing organizations to make **data-driven decisions for better budget management**.

🚀 **Next Steps:** Implement **automated trend analysis and predictive modeling** to improve budget efficiency further.

---
📎 **Repository Structure:**
```
Project-Overview-Dashboard/
│-- datasets/               # Contains project datasets
│-- images/                 # Screenshots of the Power BI dashboard
│-- sql_queries/            # SQL queries used for data extraction and transformation
│-- documentation/          # Detailed project documentation
│-- README.md               # Main project overview
```

📁 **[GitHub Repository](Assets/images/Dashboard.png)**


