-- 动态投影
-- 动态获取表的列信息
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees';

-- 生成动态投影SQL（示例）
DECLARE @columns NVARCHAR(MAX);
SELECT @columns = COALESCE(@columns + ', ', '') + COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees' AND COLUMN_NAME NOT IN ('Salary', 'SSN');

EXEC('SELECT ' + @columns + ' FROM Employees');