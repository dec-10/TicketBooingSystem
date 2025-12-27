--条件投影
-- 选择特定部门的员工姓名
SELECT FirstName, LastName, Department
FROM Employees
WHERE Department = '销售部';

-- 选择价格高于50的产品
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 50;

-- 选择2010年以后入职的销售部门员工
SELECT 
    EmployeeID,
    FirstName + ' ' + LastName AS FullName,
    Department,
    HireDate
FROM Employees
WHERE Department = '销售部' AND YEAR(HireDate) >= 2010;

-- 选择库存量大于再订购水平的产品
SELECT 
    ProductID,
    ProductName,
    UnitsInStock,
    ReorderLevel
FROM Products
WHERE UnitsInStock > ReorderLevel;