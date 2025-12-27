--公用表达式
-- 使用CTE进行复杂投影
WITH DepartmentStats AS (
    SELECT 
        Department,
        COUNT(*) AS EmployeeCount,
        AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY Department
),
HighPaidDepartments AS (
    SELECT Department
    FROM DepartmentStats
    WHERE AvgSalary > 50000
)
SELECT 
    e.FirstName,
    e.LastName,
    e.Department,
    e.Salary
FROM Employees e
INNER JOIN HighPaidDepartments h ON e.Department = h.Department
WHERE e.Salary > 60000;