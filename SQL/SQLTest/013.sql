-- 函数投影
-- 计算每个部门的员工数量
SELECT 
    Department,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- 计算每个产品的平均订单数量
SELECT 
    ProductID,
    AVG(Quantity) AS AvgOrderQuantity
FROM OrderDetails
GROUP BY ProductID;

-- 计算每个部门的薪资统计
SELECT 
    Department,
    COUNT(*) AS EmployeeCount,
    MIN(Salary) AS MinSalary,
    MAX(Salary) AS MaxSalary,
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;