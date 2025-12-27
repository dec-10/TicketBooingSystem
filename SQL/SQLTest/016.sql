-- TOP
-- 选择前10个最高薪资的员工
SELECT TOP 10
    FirstName,
    LastName,
    Salary
FROM Employees
ORDER BY Salary DESC;

-- 选择前5%的产品
SELECT TOP 5 PERCENT
    ProductName,
    UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

--OFFSET-FETCH
-- 分页查询：跳过前20条，取接下来的10条
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Department
FROM Employees
ORDER BY EmployeeID
OFFSET 20 ROWS
FETCH NEXT 10 ROWS ONLY;