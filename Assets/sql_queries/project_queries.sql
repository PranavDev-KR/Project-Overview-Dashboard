--- project status table
with project_status as (
SELECT
	project_id,
	project_name,
	project_budget,
	'upcoming' as status
FROM upcoming_projects
UNION all
SELECT
	project_id,
	project_name,
	project_budget,
	'completed' as status
FROM completed_projects)

---emp table

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
ON pa.project_id = ps. project_id;