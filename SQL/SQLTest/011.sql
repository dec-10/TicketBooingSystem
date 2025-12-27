-- 获取所有不重复的部门名称
SELECT DISTINCT Department
FROM Employees;

UPDATE Customers
SET City='杭州' WHERE [CustomerID]=3

SELECT  City, Country
FROM Customers;
-- 获取不重复的城市和国家组合
SELECT DISTINCT City, Country
FROM Customers;

-- 获取不重复的年份
SELECT DISTINCT YEAR(OrderDate) AS OrderYear
FROM Orders;

-- 获取不重复的姓名首字母
SELECT DISTINCT LEFT(FirstName, 1) AS FirstInitial
FROM Employees;