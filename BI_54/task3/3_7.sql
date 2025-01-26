SELECT 
    dl.Country,
    SUM(fi.OrderLineProfit) AS `Profit`
FROM Fact_InternetSales fi
JOIN Dim_Product dp ON fi.ProductKey = dp.ProductKey
JOIN Dim_Location dl ON fi.ShipToLocationKey = dl.LocationKey
WHERE fi.UnitPrice BETWEEN 1000 AND 2000
GROUP BY dl.Country
ORDER BY `Profit` DESC
LIMIT 3;