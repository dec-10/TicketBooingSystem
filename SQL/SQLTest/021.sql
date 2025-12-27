-- 获取订单的完整信息（客户、员工、产品）
SELECT 
    o.OrderID,
    c.CompanyName AS Customer,
    e.FirstName + ' ' + e.LastName AS SalesPerson,
    o.OrderDate,
    o.TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate >= '2023-01-01';