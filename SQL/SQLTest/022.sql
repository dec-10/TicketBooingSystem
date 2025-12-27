-- 显示所有部门信息，即使该部门没有员工
SELECT 
    d.DepartmentName,
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    e.Salary
FROM Employees e
RIGHT JOIN Department d ON e.Department = d.DepartmentName
ORDER BY d.DepartmentName, e.Salary DESC;