USE TestData
-- Returns only two of the records in the table
SELECT *
    FROM dbo.TestDataTable1
    WHERE ProductID < 60
GO