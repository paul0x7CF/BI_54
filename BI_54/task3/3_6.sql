WITH RankedProducts AS (
    SELECT 
        dp.ProductTopCategoryName AS `Product Top Category`,
        dp.ProductSubCategoryName AS `Product Sub Category`,
        dp.ProductName AS `Product Model`,
        SUM(fi.OrderQty) AS `Quantity Sold`,
        RANK() OVER (
            PARTITION BY dp.ProductTopCategoryName 
            ORDER BY SUM(fi.OrderQty) DESC
        ) AS `Rank`
    FROM Fact_InternetSales fi
    JOIN Dim_Product dp ON fi.ProductKey = dp.ProductKey
    GROUP BY dp.ProductTopCategoryName, dp.ProductSubCategoryName, dp.ProductName
)
SELECT 
    `Product Top Category`,
    `Product Sub Category`,
    `Product Model`,
    `Quantity Sold`
FROM RankedProducts
WHERE `Rank` <= 3
ORDER BY `Product Top Category`, `Quantity Sold` DESC;