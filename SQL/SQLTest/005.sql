USE TestData
INSERT TestDataTable1 (ProductID, ProductName, Price, ProductDescription)
    VALUES (3, 'CFDVSDV', 1332.41213428, 'WVFVSDFVSDFVamp')
GO
UPDATE TestDataTable1
    SET ProductName = 'Flat Head Screwdriver'
    WHERE ProductID = 2
GO