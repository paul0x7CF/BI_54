SELECT 
    dp.ProductTopCategoryName AS `Product Top Category`,
    dp.ProductSubCategoryName AS `Product Sub Category`,
    dp.ProductName AS `Product Model`,
    SUM(fi.OrderQty) AS `Quantity Sold`
FROM Fact_InternetSales fi
JOIN Dim_Product dp ON fi.ProductKey = dp.ProductKey
GROUP BY dp.ProductTopCategoryName, dp.ProductSubCategoryName, dp.ProductName
ORDER BY dp.ProductTopCategoryName, 4 DESC;