SELECT 
    dp.ProductTopCategoryName AS `Product Top Category`,
    SUM(fi.OrderLineProfit) AS `Profit`
FROM Fact_InternetSales fi
JOIN Dim_Product dp ON fi.ProductKey = dp.ProductKey
JOIN Dim_Date dd ON fi.OrderDateKey = dd.DateKey
WHERE dd.CalendarYear = 2021
GROUP BY dp.ProductTopCategoryName
ORDER BY `Profit` DESC;