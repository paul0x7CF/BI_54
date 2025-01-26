SELECT 
    dl.Region AS `Region`,
    dc.FullName AS `Customer Name`,
    SUM(fi.OrderQty) AS `Quantity Sold`,
    RANK() OVER (ORDER BY SUM(fi.OrderQty) DESC) AS `Rank`
FROM Fact_InternetSales fi
JOIN Dim_Customer dc ON fi.CustomerKey = dc.CustomerKey
JOIN Dim_Location dl ON fi.ShipToLocationKey = dl.LocationKey
WHERE dl.Region = 'Europe'
GROUP BY dc.FullName
ORDER BY `Quantity Sold` DESC
LIMIT 5;