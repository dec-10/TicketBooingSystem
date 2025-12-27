-- 显示所有部门，包括没有员工的部门
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Department d
LEFT JOIN Employees e ON d.DepartmentName = e.Department
GROUP BY d.DepartmentName
ORDER BY EmployeeCount DESC;