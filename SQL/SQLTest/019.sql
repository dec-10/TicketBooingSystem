CREATE TABLE Department
    (DepartmentID int PRIMARY KEY NOT NULL,
    DepartmentName varchar(25) NOT NULL,
    DepartmentDescription varchar(max) NULL)
GO
INSERT Department (DepartmentID, DepartmentName, DepartmentDescription)
    VALUES (1, '销售部', 'WVFVSDFVSDFVamp'),
    (2, '技术部', 'WVFVSfgdfgDFVSDFVamp'),
    (3, '人力资源部', 'WVFVamp')
GO
-- 仅筛选出所有员工及其所属部门名称
SELECT 
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS FullName,
    e.Department,
    e.Salary
FROM Employees e

-- 根据员工表和部门表，筛选出在员工表中，部门信息与部门表一致的数据
SELECT 
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS FullName,
    e.Department,
    e.Salary
FROM Employees e
-- inner join 数据表2 on 等值连接条件
INNER JOIN Department d ON e.Department = d.DepartmentName;