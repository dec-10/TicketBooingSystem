-- 子查询投影
-- 选择薪资高于平均薪资的员工
SELECT 
    FirstName, 
    LastName, 
    Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 选择有订单的客户
SELECT 
    CustomerID,
    CompanyName
FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);