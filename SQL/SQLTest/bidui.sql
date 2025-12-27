SELECT ta3.*
FROM ta3
WHERE NOT EXISTS (
    SELECT 1 
    FROM ta2 
    WHERE ta2.column1 = ta3.column1
);