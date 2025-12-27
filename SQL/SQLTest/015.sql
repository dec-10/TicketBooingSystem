-- 条件投影
-- 根据薪资水平分类员工
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE 
        WHEN Salary < 30000 THEN 'Low'
        WHEN Salary BETWEEN 30000 AND 60000 THEN 'Medium'
        ELSE 'High'
    END AS SalaryLevel
FROM Employees;

-- 根据多个条件分类产品
SELECT 
    ProductID,
    ProductName,
    UnitPrice,
    UnitsInStock,
    CASE 
        WHEN UnitsInStock = 0 THEN 'Out of Stock'
        WHEN UnitsInStock < 10 THEN 'Low Stock'
        WHEN UnitsInStock < 50 THEN 'Medium Stock'
        ELSE 'Well Stocked'
    END AS StockStatus,
    CASE 
        WHEN UnitPrice < 20 THEN 'Budget'
        WHEN UnitPrice < 100 THEN 'Standard'
        ELSE 'Premium'
    END AS PriceCategory
FROM Products;