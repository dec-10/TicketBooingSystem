-- 字符串函数
SELECT 
    EmployeeID,
    UPPER(FirstName) AS UpperFirstName,
    LOWER(LastName) AS LowerLastName,
    LEN(FirstName + LastName) AS NameLength
FROM Employees;

-- 日期函数
SELECT 
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    DAY(OrderDate) AS OrderDay
FROM Orders;